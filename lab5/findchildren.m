function children = findchildren(treepairs, parents, n)
children = cell(1, n);
parents = zeros(1,n-1);
parents(1) = root;
for i=1:numel(treepairs)
    p1 = treepairs(i);
    p2 = treepairs(p1+1);
    % Check to see if parent is part of root
    if find(parents==p1)
        parents = [parents p1];
        % Add the child to all roots
        children{parents} = [children{parents} treepairs(p2)];
    elseif find(parents==p2)
        parents = [parents p1];
            
end