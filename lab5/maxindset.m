T = importdata('eppstein.td', ' ', 1);
G = importdata('eppstein.gr', ' ', 1);
%%
w = str2double(T.textdata{1,4})-1;
nbrofbags = str2double(T.textdata{1,3});

enbr = (size(T.textdata)-(nbrofbags+1));
treepairs = zeros(enbr(1), 2);
treepairs(:,1) = str2double(T.textdata(nbrofbags+2:end, 1));
treepairs(:,2) = T.data(nbrofbags+1:end, 1);
% Sort the treepairs in ascending order
[treepairs(:,1), I] = sort(treepairs(:,1), 1);
treepairs(:,2) = treepairs(I, 2);

% Traverse post-order, meaning that first we traverse the left
% subtree and then the right, and finally the root last.
root = 1;
children = findchildren(treepairs, root, nbrofbags);
% w(U) is the total weight of nodes of the independent set U

bags = T.data(1:nbrofbags, 2:end);
edgelist = G.data;
% For here
for t=1:nbrofbags
    % t = chosen node
    bag = bags(t,:);
    U = findallindsets(edgelist, bag);
    table = zeros(1,2^(w+1));
    wu = sum(U);
    if isempty(children{t})
        % t is a leaf
        nbrofus = size(U);
        for i=1:nbrofus(2)
            table(i) = wu(i);
        end
    else
        % t is not a leaf
        for i=1:nbrofus(2)
            child = children{t};
            for d = 1:numel(child)
                
            end
            table(i) = wu(i) + max() 
        end
    end
end



