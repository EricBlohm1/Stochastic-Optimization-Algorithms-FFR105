%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Penalty method for minimizing
%
% (x1-1)^2 + 2(x2-2)^2, s.t.
%
% x1^2 + x2^2 - 1 <= 0.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The values below are suggestions - you may experiment with
% other values of eta and other (increasing) sequences of the
% µ parameter (muValues).



muValues = [1 10 100 1000];
eta = 0.0001;
xStart =  [1 2];
gradientTolerance = 1E-6;

%used to check convergence
x1_values = [];
x2_values = [];

for i = 1:length(muValues)
 mu = muValues(i);
 x = RunGradientDescent(xStart,mu,eta,gradientTolerance); 
 
 x1_values(end + 1) = x(1);
 x2_values(end + 1) = x(2);

 
 sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(1),x(2),mu)
end

%plot x values as a function of mu to check convergence.
figure;
plot(muValues,x1_values,'-o');
hold on
plot(muValues,x2_values,'-o');
drawnow;
ylabel('x values');
xlabel('mu values');
ylim([0, 1.3])
legend('x1','x2');
hold off;






