% Import data
itr = 10;
n = zeros(itr,1);
count = zeros(itr,1);
x = zeros(itr,1);

for j = 0:itr-1
    fil = strcat('g', num2str(30+j*10), '.in')
    data = importdata(fil, ' ', 1);
    n(j+1) = str2double(data.textdata);
    data = data.data;
    [x(j+1), count(j+1)] = R2(data,0);
end


figure
plot(n, log(count))