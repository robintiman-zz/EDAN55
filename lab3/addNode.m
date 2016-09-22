function data = addNode(data, edges)
s = size(data);
data(s(1)+1, 1) = 0;
data(1, s(1)+1) = 0;
data(s(1)+1, edges) = 1;
data(edges, s(1)+1) = 1;
