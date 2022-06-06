
clc
clear all
close all


f = fred
startdate = '01/01/1954';
enddate = '01/01/2019';

d1 = fetch(f,'GCE',startdate,enddate)   
d2 = fetch(f,'GPDI',startdate,enddate) 
d3 = fetch(f,'NETEXP',startdate,enddate)
d4 = fetch(f,'PCEC',startdate,enddate)    

q = d1.Data(:,1);

g = d1.Data(:,2);
i = d2.Data(:,2);
nex = d3.Data(:,2);
c = d4.Data(:,2);

figure
subplot(2,2,1);
plot(q, g)
datetick('x', 'yyyy-qq')
ylabel('Billions of Dollars')
xlabel('Time')
grid on

subplot(2,2,2);
plot(q, i)
datetick('x', 'yyyy-qq')
ylabel('Billions of Dollars')
xlabel('Time')
grid on

subplot(2,2,3);
plot(q, nex)
datetick('x', 'yyyy-qq')
ylabel('Billions of Dollars')
xlabel('Time')
grid on

subplot(2,2,4);
plot(q, c)
datetick('x', 'yyyy-qq')
ylabel('Billions of Dollars')
xlabel('Time')
grid on;



%%
realGDP = fetch(f,'GDPCA',startdate,enddate)      %Real Gross Domestic Product
year = realGDP.Data(:,1);
y = realGDP.Data(:,2);


figure
plot(year, log(y))
datetick('x', 'yyyy')
ylabel('Log of real GDP (billions of chained 2012 dollars)')
xlabel('')
grid on

[trend, cycle] = hpfilter(log(y), 1600);

% compute sd(y) (from detrended series)
ysd = std(cycle)*100;

disp(['Percent standard deviation of detrended log real GDP: ', num2str(ysd),'.']); disp(' ')

figure
subplot(2,1,1);
plot(year, trend,'b')
datetick('x', 'yyyy')
xlabel('Time')
title('Trend components')
grid on

subplot(2,1,2);
plot(year, cycle,'r')
datetick('x', 'yyyy')
xlabel('Time')
title('Cyclical components')
grid on;


