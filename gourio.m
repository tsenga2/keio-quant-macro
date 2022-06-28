

% Gourio (2008)

% Decision
% Distribution
% Aggregation

clc
clear all
close all

%%% Decision (pen-pencil and VFI)
% Bellman eq: v(z,k) = Z*k^alpha - i + (1/(1+r))*v(z',k')
% capital accumulation: i = k' - (1-delta)*k
% z follows log-normal in log: 
% log(Z') = rho*log(Z) + (1-rho)*mu + sigma*epsilon

alpha = 0.5;
delta = 0.167;
r = 0.04;
rho = 0.55;
mu = 0;
sigma = 0.15;

nk = 100;
kmin = 0.001;
kmax = 20;
kgrid = linspace(kmin,kmax,nk);

nz = 5;

disp('discrete-state approximation to AR1: ')
disp('log(Z) = rho*log(Z) + (1-rho)*mu + sigma*epsilon')
[z,Pie] = tauchen(nz,mu,rho,sigma,2.25);
z
Z = exp(z)
Pie


disp('VFI')
v = zeros(nz,nk);
Tv = ones(nz,nk);
g = zeros(nz,nk);

tol      = 1e-7;

for it=1:1000
    
    ev = Pie*v;

    for i=1:nz
        Zval = Z(i);

        for j=1:nk
            kval = kgrid(j);

            for jj = 1:nk
                kfval = kgrid(jj);
                RHS(jj) = Zval*kval^alpha - kfval ... 
                        + (1-delta)*kval + (1/(1+r))*ev(i,jj);
            end
            [Tv(i,j),argmax] = max(RHS);
            g_vfi(i,j) = kgrid(argmax);
        end
    end
    error = max(max(abs(Tv-v)));
    
    fprintf('iteration %4i with error %9.8f \n',[it, error]);

    if norm(Tv-v,inf)<tol, break, end

    v = Tv;
end

% analytical solution feasible
for i=1:nz
    Zval = Z(i);
    g_hand(i)=((r+delta)/(alpha*(exp(rho*log(Zval) ... 
             + (1-rho)*mu + 0.5*sigma^2))))^(1/(alpha-1));
end

figure('Name','Gourio2008','NumberTitle','off'); 
subplot(2,2,1)
plot(Z,g_vfi, '--o', 'LineWidth',2);
hold on
plot(Z,g_hand,'LineWidth',3);
legend('numerical solution', 'analytical solution')
title('Optimal policy','fontsize',10)

subplot(2,2,2)
mesh(Z, kgrid, v')
title('Value function','fontsize',10)


%%% Distribution
fprintf('\n')
disp('Distribution')
mu = zeros(nz,nk);
mu(1,1) = 1;
munext = zeros(nz,nk);

for it=1:200
    for i = 1:nz 
        for j = 1:nk
            
            muval = mu(i,j);
            
            if muval>0

                [kloc, kweight] = gridlookup(nk,kgrid,g_vfi(i,j));

                for ii = 1:nz
                    munext(ii,kloc) = munext(ii,kloc) ...
                                    + Pie(i,ii)*kweight*muval;
                                
                    munext(ii,kloc+1) = munext(ii,kloc+1) ...
                                      + Pie(i,ii)*(1-kweight)*muval;
                end
            end
        end
    end

    error = max(max(abs(munext-mu)));
    
    if norm(munext-mu,inf)<tol, break, end
    fprintf('iteration %4i with error %9.8f \n',[it, error]);
    
    mu = munext;
    munext = zeros(nz,nk);
end

subplot(2,2,3)
mesh(Z,kgrid,munext')
title('Distribution','fontsize',10)

%%% Aggregation
yagg = 0;
kagg = 0;

for i = 1:nz 
    for j = 1:nk
        muval = mu(i,j);       
        yagg = yagg + muval*Z(i)*kgrid(j)^alpha;
        kagg = kagg + muval*kgrid(j);
    end
end

tfp = exp(log(yagg) - alpha*log(kagg));

fprintf('\n')
fprintf('log(Y) %6.4f log(K) %6.4f log(TFP) %6.4f  ' ...
       ,[log(yagg), log(kagg), log(tfp)]);
fprintf('\n')

% analytical solution feasible
mu = 0;
logy = mu + 0.5*(sigma^2/(1-rho)) + alpha/(1-alpha)*(mu+0.5*sigma^2) ... 
     - alpha/(1-alpha)*log((r+delta)/alpha) ...
     + 0.5*alpha^2*(rho/(1-alpha))^2*(sigma^2/(1-rho^2)) ...
     + (rho^2/(1-alpha))*(sigma^2/(1-rho^2));
 
logk = 1/(1-alpha)*(mu+0.5*sigma^2) - 1/(1-alpha)*log((r+delta)/alpha) ...
     + 0.5*(rho/(1-alpha))^2*(sigma^2/(1-rho^2));

logtfp = mu + 0.5*(sigma^2/(1-rho)) ...
       + (rho^2*alpha)/(1-alpha)*((sigma^2)/(1-rho^2))*0.5;
   
fprintf('log(Y) %6.4f log(K) %6.4f log(TFP) %6.4f  ',[logy, logk, logtfp])


%% Function: (1) tauchen (2) gridlookup
function [Z,Zprob] = tauchen(nZ,a,rho,sigma,m)

Z = zeros(nZ,1);
Zprob = zeros(nZ,nZ);
Z(nZ) = m * sqrt(sigma^2 / (1 - rho^2));
Z(1) = -Z(nZ);
zstep = (Z(nZ) - Z(1)) / (nZ - 1);

for i=2:(nZ-1)
  Z(i) = Z(1) + zstep * (i - 1);
end 

Z = Z + a / (1-rho);

for j = 1:nZ
  for k = 1:nZ
    if k == 1
      Zprob(j,k) = cdf('norm',(Z(1) - a - rho * Z(j) + zstep / 2) / sigma,0,1);
    elseif k == nZ
      Zprob(j,k) = 1 - cdf('norm',(Z(nZ) - a - ... 
                     rho * Z(j) - zstep / 2) / sigma,0,1);
    else
      Zprob(j,k) = ...
            cdf('norm',(Z(k) - a - rho * Z(j) + zstep / 2) / sigma,0,1) - ...
            cdf('norm',(Z(k) - a - rho * Z(j) - zstep / 2) / sigma,0,1);
    end
  end
end

Z = Z';

end



function [ixlow, ixweight] = gridlookup(gridnum,xdist,xval)

    ixhigh = gridnum;
    ixlow = 1;

    distance = 2;

    while (distance > 1)
        ixplace = floor((ixlow + ixhigh)/2);
        ixval = xdist(ixplace);
        %if (ixval >= xval)
        if (ixval > xval)
            ixhigh = ixplace;
        else
            ixlow = ixplace;
        end

        distance = ixhigh - ixlow;
    end

    ixweight = (xdist(ixlow+1) - xval)/(xdist(ixlow+1)-xdist(ixlow));
    if(ixweight < 0)
        ixweight = 0;
    elseif(ixweight > 1)
        ixweight = 1;
    end
end