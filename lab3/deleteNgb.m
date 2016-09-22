function [data, nbrOfNbgs] = deleteNgb(data, root, ngb)
ngb = [root ngb];
data = deleteRowAndCol(data,ngb);
nbrOfNbgs = numel(ngb);