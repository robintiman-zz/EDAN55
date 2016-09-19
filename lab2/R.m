function [cut] = R(V)
% Create an array of random ones and zeroes. A one means 
% that the node with the corresponding index is in set A.
r = randi(2, V(1), 1)-1;
cut = 0;
% Iterate through the input vector. 
% If one and only one of the nodes is in set A, then add 
% the weight to the total cutsize
for i=3:3:numel(V)
    if xor(r(V(i)), r(V(i+1)))
        cut = cut + V(i+2);
    end
end