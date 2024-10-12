% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)
    x = linspace(1, 2.5, 1000);
    
    %Create the function value for all x between 1 and 2.5, used to plot
    %the polynomial.
    y=[];
    for i =1:length(x)
        y(end+1) = GetPolynomialValue(x(i),polynomialCoefficients);
    end
    
    %Get the function value at the iterationValues, used to plot the circle
    %at these points.
    f_IterationValues =[];
    for i=1:length(iterationValues)
        f_IterationValues(end+1) = GetPolynomialValue(iterationValues(i),polynomialCoefficients);
    end
        
    % Create the plot
    figure;
    %plot polynomial
    plot(x, y); 
    hold on;   
    %plot iterationvalues as circles
    plot(iterationValues, f_IterationValues, 'ro');
    hold on  
    %Limit just to match example 2.4
    ylim([7.5 11.5]);
    hold off;
end



