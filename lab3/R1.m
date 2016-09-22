function [x, count] = R1(data, n, count)
count = count + 1;
% Base case
if n == 0
    x = 0;
    return
end

% % Added to R1
rowsum = sum(data, 2);
i = find(rowsum==1,1);
if i
    [data, nbrOfNgbs] = deleteAndFindNgb(data, i);
    [derp1, count] = R1(data, n-nbrOfNgbs, count);
    x = 1 + derp1;
    return
end

% Check if any vertex is without neighbors. This is this
% case if the sum of its row and column is equal to zero
i = find(~rowsum, 1);
if i
    % Delete row and column corresponding to index i
    data = deleteRowAndCol(data,i);
    [derp1, count] = R1(data, n-1, count);
    x = 1 + derp1;
    return
end

% Same logic used here. The vertex of max degree is the
% one with the largest column and row sum
[~,i] = max(rowsum);
% Find and delete neighbors
temp = data;
[temp, nbrOfNgbs] = deleteAndFindNgb(temp,i);
% Finally, delete the single max vertex only
data = deleteRowAndCol(data, i);
[derp1, count] = R1(temp, n-nbrOfNgbs, count);
[derp2, count] = R1(data, n-1, count);
x = max(1+derp1, derp2);




