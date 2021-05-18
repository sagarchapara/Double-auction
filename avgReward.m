function y = avgReward(set,l1)
itr = size(set);

disp(itr);

m = size(cell2mat(set(1)));

disp(m);

rmin = rand(m(2),1) + 1 ;


y = [];
for i = 1:itr(2)
    sellers = cell2mat(set(i));
    temp = sellers.^2;
    temp = sum(temp);
    temp = temp/(4*l1);
    temp = transpose(temp) + rmin;
    y = [y temp];
end

y = mean(y);


plot(y ,'red');
end