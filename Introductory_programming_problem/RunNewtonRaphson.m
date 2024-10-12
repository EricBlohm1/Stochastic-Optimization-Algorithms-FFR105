% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.

function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)
    x = (startingPoint);
    while(true)
        fPrime = DifferentiatePolynomial(polynomialCoefficients, 1);
        fDoublePrime = DifferentiatePolynomial(polynomialCoefficients, 2);
        
        fPrimeValue = GetPolynomialValue(x(end),fPrime);
        fDoublePrimeValue = GetPolynomialValue(x(end),fDoublePrime);
        
        xNext = StepNewtonRaphson(x(end),fPrimeValue,fDoublePrimeValue);
        disp(xNext)
        if (abs(xNext - x(end)) < tolerance)
            iterationValues = x;
            break
        end
        x(end+1) = xNext;
    end
end
