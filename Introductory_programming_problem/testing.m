

%f_prime = DifferentiatePolynomial(polyCoeff, 1);
%f_double_prime = DifferentiatePolynomial(polyCoeff, 2);
%f_triple_prime = DifferentiatePolynomial(polyCoeff, 3);
%f_quadruple_prime = DifferentiatePolynomial(polyCoeff, 4);

% 10 * -2*2 - 2^2 + 2^3 = 10-4-4+8 = 10, ok!
%polynomialCoefficients = [10 -2 -1 1];
polynomialCoefficients = [10];
startingPoint = 2;
tolerance = 0.0001;
iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance);



