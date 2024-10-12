function node = GetNode(L_T, pheromoneLevel, visibility, alpha, beta);
    %j in the algorithm
    current = L_T(end);

    % visibility is n x n for TSP
    numberOfCities = length(visibility);

    denominator = 0;
    %For node not in tabu list
    for l = 1:numberOfCities
        if ~ismember(l,L_T)
            denominator = denominator + (pheromoneLevel(l,current)^alpha)*(visibility(l,current)^beta);
        end
    end
    
    %compute all probabilities from current to each node i. Save in list.
    probabilities = zeros(1,numberOfCities);
    for i =1:numberOfCities  
        if ~ismember(i,L_T)
            nominator = (pheromoneLevel(i,current)^alpha) * (visibility(i,current)^beta);
            p = nominator / denominator;  
            probabilities(1,i) = p;
        end
    end
    
    %cumulative probability list, similar to roulette wheel
    % put zeros on the indicies we have already visited.
    latestNonZeroIndex = 1;
    for i = 2:length(probabilities)
        if(ismember(i, L_T))
            probabilities(1,i) = 0;
        else
            probabilities(1,i)= probabilities(1,i) + probabilities(1,latestNonZeroIndex);
            latestNonZeroIndex = i;
        end  
    end
    
    r = rand;
    for i =1:numberOfCities
        if r < probabilities(1,i)
            node = i;
            return
        end
    end
end
