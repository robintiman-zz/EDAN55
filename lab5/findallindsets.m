function [U, nbrofus] = findallindsets(edgelist, bag)
if isempty(bag)
    U = [];
    nbrofus = 0;
    return;
end

n = size(edgelist);
for i=n(1):-1:1
    n1 = edgelist(i,1);
    n2 = edgelist(i,2);
    check = ismember([n1 n2], bag);
    if check(1) == 0 || check(2) == 0
        edgelist(i,:) = [];
    end
end

U = combinator(2,numel(bag),'p','r')'-1;
for i=1:size(edgelist)
    v1 = edgelist(i,1);
    v2 = edgelist(i,2);
    ind1 = find(v1==bag);
    ind2 = find(v2==bag);
    cols = U([ind1 ind2],:) == 1;
    cols = cols(1,:)==1 & cols(2,:)==1;
    U(:,cols) = [];
end
s = size(U);
nbrofus = s(2);