clear all
close all

i1 = 5;
i2 = 7;
t = 4;
max_int = 5;
[Y1,Y2] = create_matrices(i1,i2,t,max_int);
[ A1,A2,X,alpha1,alpha2 ] = initialization( i1,i2,t );

lambda1 = 0.3;
lambda2 = 0.3;
lambda3 = 0.3;
lambda4 = 0.3;
lambda5 = 0.3;

max_it = 1000;
[A1,A2,X,alpha1,alpha2,error] = mult_up_rules_optimization( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5,max_it);

plot(error,'-r','linewidth',3);
grid on
xlabel('Number of iterations');
ylabel('Value of the objective function')