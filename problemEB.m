function B = problemEB(C,neta,tau,C_min,STO)
m = size(C,1);
n = size(C,2);
B = zeros(m,n);
sum_C = sum(C,2)*neta;
for i = 1:m
    B(i,:) =  (neta*tau*C(i,:))/(STO(i)*(sum_C(i) - C_min(i) + 1));           % Problem EB. Eqn (13) in the paper.
end
end