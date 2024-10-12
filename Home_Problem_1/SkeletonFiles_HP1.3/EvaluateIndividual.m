% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x)
    g1 = (1.5 - x(1)+ x(1)*x(2))^2;
    g2 = (2.25 - x(1) + x(1)*x(2)^2)^2;
    g3 = (2.625 - x(1) + x(1)*x(2)^3)^2;
    
    g_value =  g1 + g2 + g3; 
    
    % fitness = (g(x_1,x_2)+1)^(-1) from problem description
    fitness = 1/(g_value+1);
