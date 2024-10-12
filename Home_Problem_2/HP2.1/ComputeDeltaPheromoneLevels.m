function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
    numberOfCities = length(pathCollection);
    numberOfAnts = length(pathLengthCollection);
    delta_tau = zeros(numberOfCities,numberOfCities);
    
    for k = 1:numberOfAnts
        for j = 1:(numberOfCities-1)
            i = j+1;
            node_i = pathCollection(k,i);
            node_j = pathCollection(k,j);
            delta_tau(node_i,node_j) = delta_tau(node_i,node_j) + (1/pathLengthCollection(k));
        end
        node_1 = pathCollection(k,1);
        node_end = pathCollection(k,end);
        delta_tau(node_1,node_end) = delta_tau(node_1,node_end) + (1/pathLengthCollection(k)); 
    end
    deltaPheromoneLevel = delta_tau;
end