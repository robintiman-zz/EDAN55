file = fopen('medium.txt');
V = fscanf(file, '%d');
totalEdges = zeros(1, V(1));

for i=2:2:numel(V)
    totalEdges(V(i)+1) = totalEdges(V(i)+1) + 1;
    if (V(i) == 19)
        V(i)
    end
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

itr = input('Enter number of iterations: ');
%Simulation
currentNode = 1;
visits = zeros(1,V(1));
visits(1) = 1;
for i=1:itr
    currentNode;
    %Getting bored, jump to new random node
    if (rand < 0.15)
        currentNode = randi(V(1));
    else
        currentNode = calcnext(currentNode, nodes);
    end
    visits(currentNode) = visits(currentNode) + 1;
end

freq = visits/(itr+1)