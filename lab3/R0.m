function [x, count] = R0(data, n, count)
count = count + 1;
% Base case
if n == 0
    x = 0;
    return
end

% Check if any vertex is without neighbors. This is this
% case if the sum of its row and column is equal to zero
rowsum = sum(data, 2);
i = find(~rowsum, 1);
if i
    % Delete row and column corresponding to index i
    data = deleteRowAndCol(data,i);
    [derp1, count] = R0(data, n-1, count);
    x = 1 + derp1;
    return
end

% Same logic used here. The vertex of max degree is the
% one with the largest column and row sum
[~,i] = max(rowsum);
% Find and delete neighbors
ngb = find(data(i,:));
ngb = [ngb i];
temp = data;
temp = deleteRowAndCol(temp, ngb);
% Finally, delete the single max vertex only
data = deleteRowAndCol(data, i);

[derp1, count] = R0(temp, n-numel(ngb), count);
[derp2, count] = R0(data, n-1, count);


x = max(1+derp1, derp2);




