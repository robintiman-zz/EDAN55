function valid = checkcondition(Ui, U, bag, childbag, ci, i)
Ui = Ui(:,ci)'.*childbag;
U = U(:,i)'.*bag;
sec1 = intersect(Ui, bag);
sec2 = intersect(U, childbag);
try 
    valid = sec1 == sec2;
catch
    valid = 0;
end
    