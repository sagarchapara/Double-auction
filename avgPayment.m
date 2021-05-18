function y = avgPayment(set)
itr = size(set);

y = [];
for i = 1:itr
    buyers = cell2mat(set(i));
    temp = sum(buyers,2);  %sum of all bij over j (here j is column so sum should be along row)
    y = [y temp];  % appending this column matrix to previous matrix
end


y = mean(y)  %mean of all buyers payi's for a given iteration (so sum should be along column) 


plot(y,'blue');

end

