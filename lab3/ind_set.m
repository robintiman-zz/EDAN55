% Import data
data = importdata('g50.in', ' ', 1);
n = str2double(data.textdata);
data = data.data;

R0(data,n)