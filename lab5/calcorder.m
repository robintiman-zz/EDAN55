% Calculates the iteration in post order 
function order = calcorder(children, root)
childtemp = children;
order = zeros(1, numel(children));
parent = cell(1, numel(children));
index = 1;
node = root;
while index <= numel(children)
    if isempty(childtemp{node})
        order(index) = node;
        index = index + 1;
        node = parent{node};
    else
        root = node;
        temp = childtemp{node};
        node = temp(1);
        temp(1) = [];
        childtemp{root} = temp;
        if root ~= node
            parent{node} = root;
        end
    end
end