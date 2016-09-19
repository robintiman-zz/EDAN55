% Read from file 
file = fopen('matching_1000.txt');
V = fscanf(file, '%d');

% Do n iterations
n = 100;
res = zeros(n,1);
for i=1:n
    res(i) = R(V);
end

% Plot and display result
histogram(res);

max(res)
avg = mean(res);
per = avg/500*100;
fprintf('Average: %d \nPercentage of OPT: %d \n', avg, per) 