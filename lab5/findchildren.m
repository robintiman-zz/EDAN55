function children = findchildren(treepairs, root, n)
children = cell(1, n);
parent = zeros(1,n);
j = 1;
parent(1) = root;
while j < n
    p1 = treepairs(j,1);
    p2 = treepairs(j,2);
    % Check to see if parent is part of root
    if find(parent==p1)
        % Add the child to all roots
        children{p1} = [children{p1} p2];
        parent(j+1) = p2;
    elseif find(parent==p2)
        % Same here
        children{p2} = [children{p2} p1];
        parent(j+1) = p1;
    end
    j = j + 1;
end