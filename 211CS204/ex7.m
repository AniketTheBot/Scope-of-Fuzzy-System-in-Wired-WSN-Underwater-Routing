
clear;
clc;

fis = mamfis('Name', 'RobotMotionPlanner');

fis = addInput(fis, [1 3], 'Name', 'i1');

fis = addMF(fis, 'i1', 'trimf', [0 1 2], 'Name', 'Low');
fis = addMF(fis, 'i1', 'trimf', [1 2 3], 'Name', 'Medium');
fis = addMF(fis, 'i1', 'trimf', [2 3 4], 'Name', 'High');

fis = addInput(fis, [10 30], 'Name', 'i2');

fis = addMF(fis, 'i2', 'trimf', [0 10 20], 'Name', 'Low');
fis = addMF(fis, 'i2', 'trimf', [10 20 30], 'Name', 'Medium');
fis = addMF(fis, 'i2', 'trimf', [20 30 40], 'Name', 'High');

fis = addOutput(fis, [5 15], 'Name', 'Output');

fis = addMF(fis, 'Output', 'trimf', [0 5 10], 'Name', 'Low');
fis = addMF(fis, 'Output', 'trimf', [5 10 15], 'Name', 'Medium');
fis = addMF(fis, 'Output', 'trimf', [10 15 20], 'Name', 'High');

rule1 = "If i1 is Low and i2 is Low then Output is Low";
rule2 = "If i1 is Low and i2 is Medium then Output is Low";
rule3 = "If i1 is Low and i2 is High then Output is Medium";
rule4 = "If i1 is Medium and i2 is Low then Output is Low";
rule5 = "If i1 is Medium and i2 is Medium then Output is Medium"; 
rule6 = "If i1 is Medium and i2 is High then Output is High";
rule7 = "If i1 is High and i2 is Low then Output is Medium";
rule8 = "If i1 is High and i2 is Medium then Output is High";
rule9 = "If i1 is High and i2 is High then Output is High";

fis = addRule(fis, [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8; rule9]);

i1 = 2;  
i2 = 20;  
output = evalfis(fis, [i1, i2]);

fprintf('For i1 = %.1f and i2 = %.1f, the Output = %.2f\n', i1, i2, output);

figure;
subplot(3, 1, 1);
plotmf(fis, 'input', 1);
title('I1 Membership Functions');

subplot(3, 1, 2);
plotmf(fis, 'input', 2);
title('I2 Membership Functions');

subplot(3, 1, 3);
plotmf(fis, 'output', 1);
title('Output Membership Functions');

i1_values = linspace(1, 3, 50);  
i2_values = linspace(10, 30, 50);  

output_values = zeros(length(i1_values), length(i2_values));

for i = 1:length(i1_values)
    for j = 1:length(i2_values)
        output_values(j, i) = evalfis(fis, [i1_values(i), i2_values(j)]);
    end
end

figure;
surf(i1_values, i2_values, output_values);
xlabel('i1');
ylabel('i2');
zlabel('output');
title('3D Surface Plot of Deviation');
colorbar;  
