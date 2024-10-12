% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)
    %variable names from problem 1.3 a)
    m = length(chromosome);
    n = numberOfVariables;
    %k: number of genes used per variable
    k = m/n;
    % row vector in matlab
    x = zeros(1,n);
    for i = 1:n
        x_tmp = 0;
        for j = 1:k
            x_tmp = x_tmp + 2^(-j)*chromosome(j+k*(i-1));
        end
        x(i) = -maximumVariableValue + 2*maximumVariableValue * x_tmp/(1-2^(-k));
    end
end
