function [data, nbrOfNbgs] = deleteAndFindNgb(data, root)
ngb = find(data(root,:));
[data, nbrOfNbgs] = deleteNgb(data, root, ngb);