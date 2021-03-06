function [A1,A2,X,error] = mult_up_rules_optimization_stiefel( Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3,max_it)
%MULT_UP_RULES_OPTIMIZATION provides the solution which minimize the objective
%function according to the multiplicative update rules 
% taking into account the orthogonality constraint using true gradient on
% STiefel manifold
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%       lambda1 regulrization parameter of A1
%       lambda2 regulrization parameter of A2
%       lambda3 regulrization parameter of X
%       eta size of the descent step
%       max_it maximum number of iterations
%   OUTPUT:
%       A1 i1 x j matrix solution
%       A2 i2 x j matrix solution
%       X j x t matrix solution

error = zeros(1,max_it+1);
error(1) = objective_function(Y1,Y2,A1,A2,X);
for it = 1 : max_it
    [A1,A2,X] = multiplicative_update_stiefel(Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3);
    error(it+1) = objective_function(Y1,Y2,A1,A2,X);
end

end

