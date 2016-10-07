function set = findallindsets(edgelist, bag)
n = size(edgelist);
for i=n(1):-1:1
    n1 = edgelist(i,1);
    n2 = edgelist(i,2);
    check = ismember([n1 n2], bag);
    if check(1) == 0 || check(2) == 0
        edgelist(i,:) = [];
    end
end

sz = max(edgelist(:));
A = sparse(edgelist(:,1), edgelist(:,2), 1, sz, sz);
A = full(A);
A = A + A';
set = BK_MaxIS(A);