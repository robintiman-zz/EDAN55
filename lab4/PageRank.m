file = fopen('p2p.txt');
V = fscanf(file, '%d');
n = V(1);
nodes = preparegraph(V);

% Part 1
current = 1;
visits = zeros(1, n);
visits(1) = 1;
itr = 0;
d = 1;
now = 1;
while (d > 0.00001)
    % Getting bored, jump to new random node
    if (rand < 0.15)
        current = randi(n);
    else
        current = calcnext(current, nodes);
    end
    visits(current) = visits(current) + 1;
    itr = itr + 1;
    prev = now;
    now = visits/itr;
    d = max(abs(prev - now));
end
[freq, i] = sort(visits/(itr));
Disp(freq, i)

% Part 2
[H, D] = hypermatrix(nodes);
onesmatrix = ones(n, n);
alpha = 0.85;
p = ones(1, n)/n;
P = alpha*(H + D) + ((1-alpha)/n)*onesmatrix;
r = 10000;
p1 = zeros(1, n);
p1(1,:) = sum(p);
H = sparse(H);
for i=1:r
    p = alpha*p*H + alpha*p*D + ((1-alpha)/n)*p1;
end
Disp(p)
