function y = dischargingConvergence(set,idx)
itr = size(set);

y = [];

for i = 1:itr
    temp = cell2mat(set(i));
    y(i) = mean(temp(20,idx));
end

% y

plot(y);

end