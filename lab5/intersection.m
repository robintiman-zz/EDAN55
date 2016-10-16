function sec = intersection(Ui, U, childbag, bag, ci, i)
if (size(Ui) > 1)
    Ui = Ui(:,ci)'.*childbag;
end

if (size(U) > 1)
    U = U(:,i)'.*bag;
end

sec = intersect(Ui, U);
