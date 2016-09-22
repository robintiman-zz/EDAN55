function [x, count] = R2(data, count)
count = count + 1;

% Base case
if isempty(data)
    x = 0;
    return
end

rowsum = sum(data, 2);

% Added for R2
i = find(rowsum==2,1);
ngb = find(data(i,:));
if i
    data = r2part(data, i, ngb);
    [x1, count] = R2(data, count);
    x = 1 + x1;
    return
end

% % Added for R1
i = find(rowsum==1,1);
if i
    data = deleteAndFindNgb(data, i);
    [x1, count] = R2(data, count);
    x = 1 + x1;
    return
end

% Check if any vertex is without neighbors. This is this
% case if the sum of its row and column is equal to zero
i = find(~rowsum, 1);
if i
    % Delete row and column corresponding to index i
    data = deleteRowAndCol(data,i);
    [x1, count] = R2(data, count);
    x = 1 + x1;
    return
end

% Same logic used here. The vertex of max degree is the
% one with the largest column and row sum
[~,i] = max(rowsum);
% Find and delete neighbors
temp = data;
temp = deleteAndFindNgb(temp,i);
% Finally, delete the single max vertex only
data = deleteRowAndCol(data, i);
[x1, count] = R2(temp, count);
[x2, count] = R2(data, count);
x = max(1+x1, x2);




