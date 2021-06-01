clc;
clear;
rng(2)         %Seed

m = 35;        % Number of buyers
n = 45;        % Number of sellers

B = randi([1 10],m,n);       % Prices bid by buyers
S = randi([1 10],m,n);       % Prices bid by sellers; different from the paper: a row corresponds to seller and column to buyer in the paper
B_prev = zeros(m,n);
S_prev = zeros(m,n);

C_min = randi([5 10],m,1);    % Minimum electricity demand of charging vehicle
C_max = randi([12 18],m,1);   % Maximum electricity demand of charging vehicle
D_max = randi([10 20],n,1);   % Maximum electricity supply of discharging vehicle

%Constants
epsi = 0.001;                % Convergence criterion parameter
neta  = 0.8;                 % Average charging efficiency
rho = 0.9;                   % Average electricity transmission efficiency
tau = 0.5;                   % Constant
l1 = 0.01;                   % Cost factor 1
l2 = 0.015;                  % Cost factor 2
STO = randi([1 5],m,1);      % Energy state before charging

%Social Welfare
sw = zeros(20,1);

%Algorithm
flag = 1;                   % Convergence checker variable
t = 1;

charging  = {};
discharging = {};
buyer = {};
seller = {};
while flag == 1
    [C, D] = problemA(B,S,neta,rho,C_min,C_max,D_max); % Problem A solved to get C and D from initial B and S 
    charging = [charging;C];
    discharging = [discharging;D];
    sw(t) = socialWelfare(C,D,neta,tau,STO,C_min,l1,l2);
    B_prev = B;                                                  % Placeholder variable to store value of B
    S_prev = S;                                                  % Placeholder variable to store value of S
    B = problemEB(C,neta,tau,C_min,STO);                         % Problem EB solved to get new B
    S = problemES(D,l1,l2);                                      % Problem ES solved to get new S
    buyer = [buyer;B];
    seller = [seller;S];
    RDB = mean2((abs(B - B_prev))./B);                           % RDB calculation for convergence check
    RDS = mean2((abs(S - S_prev))./S);                           % RDS calculation for convergence check
    disp(t)
    t = t+1;
    if (RDB<epsi) && (RDS<epsi)                                  % Convergence check
        flag = 0;                                                % If converged, our algorithm has finished
    end
end


avgPayment(buyer);
hold on;
avgReward(seller,l1);





%C, D, B, S are final results
