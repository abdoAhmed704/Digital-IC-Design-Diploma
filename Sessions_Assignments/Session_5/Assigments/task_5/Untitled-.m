clc; clear; close all;

% Define M values (x-axis)
M = linspace(0.1, 5, 100);

% Given constants
H = 1; % H = 1 μm
M_H_ratio = M / H;

% Define capacitances
Cpp = 3 - 1.5 * exp(-0.5 * M); % Example approximation of Cpp behavior
Cc = exp(-M/1.5); % Example approximation of Cc behavior
Ctotal = Cpp + 2 * Cc;

% Plot the capacitances
figure; % Open a new figure window
hold on;
plot(M, Cpp, 'b', 'LineWidth', 2); % Plot Cpp
plot(M, 2 * Cc, 'r', 'LineWidth', 2); % Plot 2Cc
plot(M, Ctotal, 'k', 'LineWidth', 2); % Plot Ctotal

% Highlight M/H = 1.75 point
xline(1.75, '-r', 'M/H = 1.75', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right', 'LineWidth', 1.5);

% Labels and legend
xlabel('M (μm)');
ylabel('Capacitance (pf/cm)');
title('Coupling Capacitance vs. M');
legend('Cpp', '2Cc', 'Ctotal', 'Location', 'NorthWest');
grid on;
hold off;

% Dense rules: 本节将通过以下方式进行测试：
figure;

% Define M/td values (log scale for better visualization)
M_td = logspace(-1,1,100); % from 0.1 to 10

% Define height ratios
H_td_1 = 1;

% Define Wfd values (log scale for better visualization)
W_d = logspace(-1,1,100); % from 0.1 to 10

% Define height ratios
W_td_1 = 1;
W_td_05 = 0.5;

% Define capacitance components
Op = W_td_1; % Assume parallel plate capacitance scales linearly with Wfd
Gf = W_td_1 + 0.2; % assume Gf is a constant fraction of Wfd
C_total_HU = Op + 3 * Gf; % Total capacitance for Wfd = 1
C_total_NB5 = Op; % For Wfd = 0.5, only Op matters

% Plot the capacitance curves
loglog(W_d, C_total_HU, 'k-', 'LineWidth', 2); hold on;
loglog(W_d, C_total_NB5, 'k--', 'LineWidth', 2);

% Add reference lines at Wfd = 1.5
xline(1.5, 'r-', 'LineWidth', 1.5);
yline(2 * Gf + 1.5, 'r+', 'LineWidth', 1.5);

% Labels and legends
xlabel('W_d', 'FontSize', 14);
ylabel('Capacitance (pf/cm)', 'FontSize', 14);
title('Fringe and Parallel Plate Capacitance', 'FontSize', 14);
legend('C_{op} + 2C_c (W_d = 1)', 'C_{op} (W_d = 0.5)', 'Location', 'NorthWest');

grid on;
set(gca, 'FontSize', 12);