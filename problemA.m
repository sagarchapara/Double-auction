function [C_new,D_new] = problemA(B,S,neta,rho,C_min,C_max,D_max)

m = size(B,1);
n = size(B,2);

C = optimvar('x',m,n,'LowerBound',0);     % Electricity demand of charging vehicles
D = optimvar('y',m,n,'LowerBound',0);      % Electricity supply by discharging vehicles

prob = optimproblem;
prob.Objective = fcn2optimexpr(@objective,C,D,B,S);    
prob.Constraints.cons1 = (sum(C,2)*neta >= C_min);            % These are the constraints
prob.Constraints.cons2 = (sum(C,2)*neta <= C_max);            % for the optimisation
prob.Constraints.cons3 = (transpose(sum(D))<=D_max);          % problem. In the paper,
prob.Constraints.cons4 = (rho*D == C);                        % they are written in eqn. (4).


x0.x = zeros(m,n);
x0.y = zeros(m,n);

% ,'PlotFcns',@optimplotfval

options = optimoptions(@fmincon,'MaxFunctionEvaluations',25000);  % Solving the optimisation problem
% options
[solution,fval,exitflag,output] = solve(prob,x0,'Options',options);                  % using inbuilt optimiser.

disp(fval);

C_new = solution.x;
D_new = solution.y;

function y = objective(C,D,B,S)                              % Objective function that has to be optimised. Eqn (10) in the paper.
    y  = -(sum(sum(dot(B,log(C)) - dot(S,D))));
end
end