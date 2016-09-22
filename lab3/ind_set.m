% Import data
itr = 6;
n = zeros(itr,1);
count = zeros(itr,1);
x = zeros(itr,1);

data = importdata('g40.in', ' ', 1);
n = str2double(data.textdata);
data = data.data;
[x, count] = R2(data,0);

% for j = 0:itr-1
%     fil = strcat('g', num2str(30+1*10), '.in')
%     data = importdata(fil, ' ', 1);
%     n(j+1) = str2double(data.textdata);
%     data = data.data;
%     [x(j+1), count(j+1)] = R2(data,0);
% end


figure
plot(n, log(count))