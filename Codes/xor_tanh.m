% xor_tanh.m
clear; clc; close all;

X = [0 0; 0 1; 1 0; 1 1]';
Y = [0; 1; 1; 0]';

n_hidden = 2;  % Change to 2 or 3

rng(42);
W1 = randn(n_hidden, 2);
W2 = randn(1, n_hidden);
b1 = randn(n_hidden, 1) * 0.1;
b2 = 0;

eta = 0.5;
epochs = 2000;
errors = zeros(epochs, 1);

for epoch = 1:epochs
    total_error = 0;
    
    for i = 1:4
        x = X(:, i);
        y_target = Y(i);
        
        z1 = W1 * x + b1;
        h = tanh(z1);
        z2 = W2 * h + b2;
        y = 1 / (1 + exp(-z2));
        
        error = 0.5 * (y - y_target)^2;
        total_error = total_error + error;
        
        delta2 = (y - y_target) * y * (1 - y);
        delta1 = (W2' * delta2) .* (1 - h.^2);
        
        W2 = W2 - eta * delta2 * h';
        b2 = b2 - eta * delta2;
        W1 = W1 - eta * delta1 * x';
        b1 = b1 - eta * delta1;
    end
    
    errors(epoch) = total_error / 4;
    
    if mod(epoch, 100) == 0
        fprintf('Epoch %d: Error = %.6f\n', epoch, errors(epoch));
    end
end

fprintf('\nFinal results:\n');
for i = 1:4
    x = X(:, i);
    z1 = W1 * x + b1;
    h = tanh(z1);
    z2 = W2 * h + b2;
    y = 1 / (1 + exp(-z2));
    fprintf('(%d,%d) -> %.3f (target: %d)\n', x(1), x(2), y, Y(i));
end

figure('Name', 'tanh Activation Results');

subplot(1, 2, 1);
plot(errors, 'LineWidth', 2);
xlabel('Epoch');
ylabel('Mean Squared Error');
title('学習曲線 (tanh)');
grid on;

subplot(1, 2, 2);
[x1_grid, x2_grid] = meshgrid(linspace(-0.5, 1.5, 100), linspace(-0.5, 1.5, 100));
z_grid = zeros(size(x1_grid));

for i = 1:numel(x1_grid)
    x_test = [x1_grid(i); x2_grid(i)];
    z1 = W1 * x_test + b1;
    h = tanh(z1);
    z2 = W2 * h + b2;
    z_grid(i) = 1 / (1 + exp(-z2));
end

contourf(x1_grid, x2_grid, z_grid, 20);
colorbar;
hold on;
contour(x1_grid, x2_grid, z_grid, [0.5 0.5], 'k-', 'LineWidth', 2);
plot([0, 1], [0, 1], 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot([0, 1], [1, 0], 'bs', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
xlabel('x_1');
ylabel('x_2');
title('Decision Boundary (tanh)');
axis([-0.5 1.5 -0.5 1.5]);