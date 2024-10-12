%  uses the genes in the first half of the chromosomes to obtain a value of
%x(1) in the range [0,1], and the remaining genes to obtain a value of x(2) in the same
%range. x(1) and x(2) are then rescaled to the interval [-variableRange,variableRange]
%(see also Eq. (3.2) in the course book, p. 41)

%Note that the DecodeChromosome function is by no means general: It assumes
%that the number of genes is even, and that only two variables are to be generated.
%However, it is easy to modify this function, so that it can generate any number
%of variables, defining each variable using a given number of genes.
function x = DecodeChromosome(chromosome,variableRange)

    nGenes = size(chromosome,2);
    nHalf = fix(nGenes/2);
    
    x(1) = 0.0;
    for j=1:nHalf
            x(1)=x(1) + chromosome(j)*2^(-j);
    end
    x(1) = -variableRange + 2*variableRange*x(1)/(1 - 2^(-nHalf));

    x(2) = 0.0;
    for j = 1:nHalf
        x(2) = x(2) + chromosome(j+nHalf)*2^(-j);
    end
    x(2) = -variableRange + 2*variableRange*x(2)/(1 - 2^(-nHalf));
end
