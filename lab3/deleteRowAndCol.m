function [data] = deleteRowAndCol(data, i)
i = fliplr(i);
data(i,:) = [];
data(:,i) = [];