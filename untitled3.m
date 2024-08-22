
zeta = 1;    
xm = 0;      

x = linspace(-10, 10, 1000);

u1_x = 1 ./ (1 + exp(zeta * (xm - x)));

figure;
plot(x, u1_x, 'LineWidth', 2);
xlabel('x');
ylabel('u_1(x)');
title('Plot of u_1(x) = 1 / (1 + e^{\zeta(x_m - x)})');
grid on;

hold on;
plot([xm xm], [0 1], '--r');
text(xm, 0.5, sprintf(' x_m = %d', xm), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
