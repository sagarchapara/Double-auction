function y = chargingConvergence(set,idx)
itr = size(set);

y = [];

for i = 1:itr
    temp = cell2mat(set(i));
    y(i) = mean(temp(idx,20));
end

% y

plot(y);

end