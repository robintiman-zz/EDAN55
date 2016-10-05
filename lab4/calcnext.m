function node = calcnext(current, nodes)
elem = numel(nodes{current});
if (elem == 0)
    node = current;
    return
end
node = nodes{current}(randi(elem));