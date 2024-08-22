% Define the coordinates of the 10 points
points = [
    0.2, 0.4, 0.6;
    0.4, 0.3, 0.8;
    0.8, 0.2, 0.5;
    0.9, 0.5, 0.4;
    0.6, 0.6, 0.6;
    0.3, 0.4, 0.5;
    0.7, 0.6, 0.5;
    0.2, 0.5, 0.3;
    0.3, 0.6, 0.8;
    0.8, 0.3, 0.1
];

% Number of clusters
numClusters = 3;

% Parameters for Fuzzy C-Means
m = 1.5; % Fuzziness parameter
epsilon = 0.001; % Termination criterion
maxIter = 100; % Maximum number of iterations
beta = 0.5; % Example value for beta
gamma = 0.1; % Example value for gamma (10%)

% Fuzzy C-Means clustering
[centers, U, objFcn] = fcm(points, numClusters, [m maxIter epsilon beta]);

% Display clustering results
disp('Cluster Centers:');
disp(centers);

disp('Membership Matrix:');
disp(U);

% Compute entropy for each cluster
entropy = zeros(numClusters, 1);
for i = 1:numClusters
    clusterMembership = U(i, :);
    % Avoid log(0) by adding a small value to membership values
    clusterMembership = clusterMembership + 1e-10;
    % Calculate entropy
    entropy(i) = -sum(clusterMembership .* log(clusterMembership)) / log(numClusters);
end

disp('Cluster Entropy:');
disp(entropy);

% Compute distances from each point to the cluster centers
dist = zeros(numClusters, size(points, 1));
for i = 1:numClusters
    dist(i, :) = sqrt(sum((points - centers(i, :)).^2, 2)');
end
dist = max(dist, eps); % Avoid division by zero
invDist = 1 ./ dist;
U_new = invDist.^2;
U_new = U_new ./ sum(U_new, 1);

% Determine clusters and outliers based on similarity threshold gamma
similarityThreshold = gamma; % Adjusted based on gamma
outliers = any(U_new < similarityThreshold, 1);
clusters = ~outliers;

disp('Clusters (1 for cluster, 0 for outlier):');
disp(clusters);

disp('Outliers (1 for outlier, 0 for non-outlier):');
disp(outliers);