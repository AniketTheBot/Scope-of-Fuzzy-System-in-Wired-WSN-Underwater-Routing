% Define the dataset
data = [5.2 3.6 1.5 0.2;
        4.9 3.1 1.5 0.2;
        4.7 3.2 1.3 0.2;
        4.6 3.4 1.4 0.3;
        5.4 3.7 1.5 0.2;
        5.2 3.5 1.5 0.2;
        5.2 3.4 1.4 0.2;
        4.7 3.2 1.6 0.2;
        5.5 4.2 1.4 0.2;
        4.5 2.3 1.3 0.3;
        5.2 3.9 1.9 0.5;
        4.8 3.0 1.4 0.3;
        5.7 2.5 5.0 2.0;
        5.8 2.8 5.1 2.4;
        6.1 3.0 4.9 1.8;
        7.9 3.8 6.4 2.0;
        6.3 3.4 5.6 2.4;
        6.4 3.1 5.5 1.8;
        6.3 3.5 5.5 2.4;
        5.9 3.0 5.1 1.8];

% Set parameters for Fuzzy C-Means clustering
fuzziness = 1.5;
max_iter = 100; % Maximum number of iterations
epsilon = 0.001; % Termination criterion
num_clusters = 3; % Number of clusters

% Perform Fuzzy C-Means clustering
[center, U, obj_fcn] = fcm(data, num_clusters, [fuzziness max_iter epsilon ]);

% Display the cluster centers
disp('Cluster Centers:');
disp(center);

% Determine the cluster for each data point
maxU = max(U);
cluster_assignments = zeros(size(U,2),1);
for i = 1:size(U,2)
    cluster_assignments(i) = find(U(:,i) == maxU(i));
end

% Display cluster assignments for each data point
disp('Cluster Assignments:');
disp(cluster_assignments);