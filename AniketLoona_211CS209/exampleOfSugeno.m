% Create a Sugeno FIS
fis = sugfis('Name', 'Takagi-Sugeno FIS');

% Define the input I1 (Low, Medium, High)
fis = addInput(fis, [0 15], 'Name', 'I1');
fis = addMF(fis, 'I1', 'trapmf', [0 0 5 10], 'Name', 'LW');
fis = addMF(fis, 'I1', 'trimf', [5 10 15], 'Name', 'M');
fis = addMF(fis, 'I1', 'trapmf', [10 15 15 15], 'Name', 'H');

% Define the input I2 (Near, Far, Very Far)
fis = addInput(fis, [0 3], 'Name', 'I2');
fis = addMF(fis, 'I2', 'trapmf', [0 0 1 2], 'Name', 'NR');
fis = addMF(fis, 'I2', 'trimf', [1 2 3], 'Name', 'FR');
fis = addMF(fis, 'I2', 'trapmf', [2 3 3 3], 'Name', 'VFR');

% Define the output y (for each rule)
fis = addOutput(fis, [-20 20], 'Name', 'Output');

% Add output membership functions (linear equations with bias term)
fis = addMF(fis, 'Output', 'linear', [1 1 0], 'Name', 'y1');  % 1*I1 + 1*I2 + 0
fis = addMF(fis, 'Output', 'linear', [1 2 0], 'Name', 'y2');  % 1*I1 + 2*I2 + 0
fis = addMF(fis, 'Output', 'linear', [1 3 0], 'Name', 'y3');  % 1*I1 + 3*I2 + 0
fis = addMF(fis, 'Output', 'linear', [2 1 0], 'Name', 'y4');  % 2*I1 + 1*I2 + 0
fis = addMF(fis, 'Output', 'linear', [2 2 0], 'Name', 'y5');  % 2*I1 + 2*I2 + 0
fis = addMF(fis, 'Output', 'linear', [2 3 0], 'Name', 'y6');  % 2*I1 + 3*I2 + 0
fis = addMF(fis, 'Output', 'linear', [3 1 0], 'Name', 'y7');  % 3*I1 + 1*I2 + 0
fis = addMF(fis, 'Output', 'linear', [3 2 0], 'Name', 'y8');  % 3*I1 + 2*I2 + 0
fis = addMF(fis, 'Output', 'linear', [3 3 0], 'Name', 'y9');  % 3*I1 + 3*I2 + 0

% Define the rules
ruleList = [
    1 1 1 1 1;
    1 2 2 1 1;
    1 3 3 1 1;
    2 1 4 1 1;
    2 2 5 1 1;
    2 3 6 1 1;
    3 1 7 1 1;
    3 2 8 1 1;
    3 3 9 1 1;
    ];

% Add the rules to the FIS
fis = addRule(fis, ruleList);

% Evaluate the FIS for the input values I1 = 6.0, I2 = 2.2
input_values = [6.0 2.2];
output = evalfis(fis, input_values);

% Display the output
disp(['The output of the FLC for I1 = 6.0 and I2 = 2.2 is: ' num2str(output)]);
