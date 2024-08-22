% Step 1: Data Preparation
data = [
    5.2 3.6 1.5 0.2;
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
    5.9 3.0 5.1 1.8;
];

% Step 2: Fuzzy C-Means Clustering
num_clusters = 3;
fuzziness = 1.5; % g
epsilon = 0.001; % not taking values other than int
beta = 0.52; % similarity threshhold

[centers, U] = fcm(data, num_clusters, [fuzziness,100,epsilon,beta]);
[~, cluster_indices] = max(U);

% Display results
disp('Cluster Centers:');
disp(centers);
disp('Cluster Indices:');
disp(cluster_indices');

% Define similarity threshold and gamma
gamma = 0.10;

% Calculate entropy for each data point
entropy_values = -sum(U .* log2(U), 1);

% Determine clusters based on entropy and threshold
is_outlier = entropy_values > beta;
outliers = find(is_outlier);

% Display outliers
disp('Outliers based on entropy threshold:');
disp(outliers);

% Display cluster assignments for non-outliers
non_outliers = setdiff(1:size(U,2), outliers);
non_outlier_clusters = cluster_indices(non_outliers);
disp('Clusters for non-outliers:');
disp(non_outlier_clusters);
    