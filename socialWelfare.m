function res = socialWelfare(C,D,neta,tau,STO,C_min,l1,l2)

w = tau./STO;
m = size(C,1);
n = size(C,2);
sum_C = sum(C,2)*neta;
sum_D = sum(D);
sum_D2 = sum(D.^2);

U = zeros(m,1);
for i=1:m
    U(i) = w(i)*log(sum_C(i) - C_min(i) + 1);
end

L = zeros(n,1);
for j=1:n
    L(j) = l1*sum_D2(j) + l2*sum_D(j);
end

res = sum(U) - sum(L);
end