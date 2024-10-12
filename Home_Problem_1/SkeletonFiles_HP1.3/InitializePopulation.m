% assigns random values to all genes, in all chromosomes contained in the population
% function will generate a population of binary chromosomes, in the form of a
% matrix where every row represents one individual

%Initialize chromosomes, which form the first population (i.e first
%generation).
function population = InitializePopulation(populationSize,numberOfGenes)
    population = zeros(populationSize, numberOfGenes);
    
    for i=1:populationSize
        for j=1:numberOfGenes
            s=rand;
            if (s <0.5)
                population(i,j)=0;
            else
                population(i,j)=1;
            end
        end
    end
end
