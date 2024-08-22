fis = mamfis('Name', 'RobotMotionPlanner');

fis = addInput(fis, [0 2.2], 'Name', 'Object');

fis = addMF(fis, 'Object', 'trimf', [-0.8 0 0.8], 'Name', 'VeryNear');
fis = addMF(fis, 'Object', 'trimf', [0 0.8 1.5], 'Name', 'Near');
fis = addMF(fis, 'Object', 'trimf', [0.8 1.5 2.2], 'Name', 'Far');
fis = addMF(fis, 'Object', 'trimf', [1.5 2.2 3], 'Name', 'VeryFar');

fis = addInput(fis, [-90 90], 'Name', 'Angle');

fis = addMF(fis, 'Angle', 'trimf', [-135 -90 -45], 'Name', 'Left');
fis = addMF(fis, 'Angle', 'trimf', [-90 -45 0], 'Name', 'AheadLeft');
fis = addMF(fis, 'Angle', 'trimf', [-45 0 45], 'Name', 'Ahead');
fis = addMF(fis, 'Angle', 'trimf', [0 45 90], 'Name', 'AheadRight');
fis = addMF(fis, 'Angle', 'trimf', [45 90 135], 'Name', 'Right');

fis = addOutput(fis, [-90 90], 'Name', 'Deviation');

fis = addMF(fis, 'Deviation', 'trimf', [-135 -90 -45], 'Name', 'Left');
fis = addMF(fis, 'Deviation', 'trimf', [-90 -45 0], 'Name', 'AheadLeft');
fis = addMF(fis, 'Deviation', 'trimf', [-45 0 45], 'Name', 'Ahead');
fis = addMF(fis, 'Deviation', 'trimf', [0 45 90], 'Name', 'AheadRight');
fis = addMF(fis, 'Deviation', 'trimf', [45 90 135], 'Name', 'Right');

rule1 = "If Object is VeryNear and Angle is Left then Deviation is Ahead";
rule2 = "If Object is VeryNear and Angle is AheadLeft then Deviation is AheadRight";
rule3 = "If Object is VeryNear and Angle is Ahead then Deviation is AheadLeft";
rule4 = "If Object is VeryNear and Angle is AheadRight then Deviation is AheadLeft";
rule5 = "If Object is VeryNear and Angle is Right then Deviation is Ahead";
rule6 = "If Object is Near and Angle is Left then Deviation is Ahead";
rule7 = "If Object is Near and Angle is AheadLeft then Deviation is Ahead";
rule8 = "If Object is Near and Angle is Ahead then Deviation is Right";
rule9 = "If Object is Near and Angle is AheadRight then Deviation is Ahead";
rule10 = "If Object is Near and Angle is Right then Deviation is Ahead";
rule11 = "If Object is Far and Angle is Left then Deviation is Ahead";
rule12 = "If Object is Far and Angle is AheadLeft then Deviation is Ahead";
rule13 = "If Object is Far and Angle is Ahead then Deviation is AheadRight";
rule14 = "If Object is Far and Angle is AheadRight then Deviation is Ahead";
rule15 = "If Object is Far and Angle is Right then Deviation is Ahead";
rule16 = "If Object is VeryFar and Angle is Left then Deviation is Ahead";
rule17 = "If Object is VeryFar and Angle is AheadLeft then Deviation is Ahead";
rule18 = "If Object is VeryFar and Angle is Ahead then Deviation is Ahead";
rule19 = "If Object is VeryFar and Angle is AheadRight then Deviation is Ahead";
rule20 = "If Object is VeryFar and Angle is Right then Deviation is Ahead";

fis = addRule(fis, [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8; rule9; rule10; rule11; rule12; rule13; rule14; rule15; rule16; rule17; rule18; rule19; rule20]);

object = 2;  
angle = 20;   
deviation = evalfis(fis, [object, angle]);

fprintf('For Object Distance = %.1f and Angle = %.1f, the Deviation = %.2f degrees\n', object, angle, deviation);

figure;
subplot(3, 1, 1);
plotmf(fis, 'input', 1);
title('Object Membership Functions');

subplot(3, 1, 2);
plotmf(fis, 'input', 2);
title('Angle Membership Functions');

subplot(3, 1, 3);
plotmf(fis, 'output', 1);
title('Deviation Membership Functions');

object_values = linspace(0, 2.2, 40);  
angle_values = linspace(-90, 90, 40); 

deviation_values = zeros(length(angle_values), length(object_values));

for i = 1:length(object_values)
    for j = 1:length(angle_values)
        deviation_values(j, i) = evalfis(fis, [object_values(i), angle_values(j)]);
    end
end

figure;
surf(object_values, angle_values, deviation_values);
xlabel('Object');
ylabel('Angle');
zlabel('Deviation');
title('3D Surface Plot of Deviation');
colorbar; 
