function nodes = preparegraph(V) 
totalEdges = zeros(1, V(1));
for i=2:2:numel(V)
    totalEdges(V(i)+1) = totalEdges(V(i)+1) + 1;
end

nodes = cell(V(1), 1);
count = 1;
tempNode = 0;
for i=2:2:numel(V)
    index = V(i) + 1;
    if (index ~= tempNode)
        count = 1;
    end
    
    if (isempty(nodes{index}))
        nodes{index} = zeros(1, totalEdges(index));
    end
    nodes{index}(count) = V(i+1) + 1;
    tempNode = index;
    count = count + 1;
end