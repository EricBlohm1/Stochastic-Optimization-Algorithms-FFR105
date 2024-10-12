% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)
    if (isempty(polynomialCoefficients) || derivativeOrder == 0)
        derivativeCoefficients = polynomialCoefficients;
        return
    end
    
    for k = 1:derivativeOrder
        for i = 1:length(polynomialCoefficients)
            polynomialCoefficients(i) = polynomialCoefficients(i)*(i-1);
        end
        %remove first element of polynomialCoefficients, always 0 after
        %derivation. 
        polynomialCoefficients = polynomialCoefficients(2:end);
    end
    derivativeCoefficients = polynomialCoefficients;
end

