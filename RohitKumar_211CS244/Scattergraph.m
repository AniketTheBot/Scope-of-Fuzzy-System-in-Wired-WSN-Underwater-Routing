% Given Data
X = [0.2, 0.4, 0.8, 0.9, 0.6, 0.3, 0.7, 0.2, 0.3, 0.8];
Y = [0.4, 0.3, 0.2, 0.5, 0.6, 0.4, 0.6, 0.5, 0.6, 0.3];
Z = [0.6, 0.8, 0.5, 0.4, 0.6, 0.5, 0.5, 0.3, 0.8, 0.1];

% Plotting the 3D scatter plot
figure;
scatter3(X, Y, Z, 'filled');


xlabel('X-coordinate');
ylabel('Y-coordinate');
zlabel('Z-coordinate');

title('3D Scatter Plot of Given Points');

grid on;

xlim([0 1]);
ylim([0 1]);
zlim([0 1]);
