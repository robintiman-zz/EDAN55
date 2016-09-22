function data = r2part(data, i, ngb)
if  data(ngb(1), ngb(2))
    data = deleteNgb(data, i, ngb);
    return
else
    ngb_w = find(data(ngb(1),:));
    ngb_u = find(data(ngb(2),:));
    edges = [ngb_u ngb_w];
    edges = unique(edges);
    ind = find(edges==i,1);
    edges(ind) = [];
    data = addNode(data, edges);
    data = deleteNgb(data,i, ngb);
    return
end