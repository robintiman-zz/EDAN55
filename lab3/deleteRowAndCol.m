function [data] = deleteRowAndCol(data, i)
data(i,:) = [];
data(:,i) = [];