T = importdata('BidiakisCube.td', ' ', 1);
G = importdata('BidiakisCube.gr', ' ', 1);
% Importdata don't work perfectly for every graph. It assumes that every
% row has the same amount of columns.
r = find(~any(~isnan(T.data), 2));
if r
    r = sort(r, 1, 'descend')';
    s = size(T.data);
    T.data(:, s(2)+1) = NaN;
    for i = r
        numb = str2double(T.textdata{i+1});
        T.data(i-1, s(2)+1) = numb;
        T.textdata(i+1) = [];
    end
    T.data(r, :) = [];
end

%%
split = strsplit(T.textdata{1});
w = str2double(split(4))-1;
nbrofbags = str2double(split(3));

enbr = size(T.textdata)-(nbrofbags+1);
treepairs = zeros(enbr(1), 2);
treepairs(:,1) = str2double(T.textdata(nbrofbags+2:end, 1));
treepairs(:,2) = T.data(nbrofbags+1:end, 1);
% Sort the treepairs in ascending order
[treepairs(:,1), I] = sort(treepairs(:,1), 1);
treepairs(:,2) = treepairs(I, 2);

root = 1;
children = findchildren(treepairs, root, nbrofbags);
% w(U) is the total weight of nodes of the independent set U

order = calcorder(children, root);
bags = T.data(1:nbrofbags, 2:end);
edgelist = G.data;
ftu = cell(1, nbrofbags);
us = cell(1, nbrofbags);
for t=order
    % t = chosen node
    bag = bags(t,:);
    bag(isnan(bag)) = [];
    [U, nbrofus] = findallindsets(edgelist, bag);
    us{t} = U;
    table = zeros(1,2^(w+1));
    wu = sum(U);
    if isempty(children{t})
        % t is a leaf
        for i=1:nbrofus
            table(i) = wu(i);
        end
        ftu{t} = table;
    else
        % t is not a leaf
        for i=1:nbrofus
            child = children{t};
            s = 0;
            for d = 1:numel(child)
                Ui = us{child(d)};
                nbrofchildus = size(Ui);
                childftu = ftu{child(d)};
                maxval = 0;
                for c = 1:nbrofchildus(2)
                    childbag = bags(child(d),:);
                    childbag(isnan(childbag)) = [];
                    intsec = intersection(Ui, U, childbag, bag, c, i);
                    if checkcondition(Ui, U, bag, childbag, c, i)
                        wchild = nnz(intsec);
                        maxval = max(maxval, childftu(c) - wchild);
                    end
                end
                s = s + maxval;
            end
            table(i) = wu(i) + s;
        end
        ftu{t} = table;
    end
end

max(ftu{1})




