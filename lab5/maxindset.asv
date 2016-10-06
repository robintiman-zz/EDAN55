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
children = cell(1, nbrofbags);
for i = 1:2:enbr(1)
    children{i} = [children{i} treepairs(i+1)];
end

% w(U) is the total weight of nodes of the independent set U
