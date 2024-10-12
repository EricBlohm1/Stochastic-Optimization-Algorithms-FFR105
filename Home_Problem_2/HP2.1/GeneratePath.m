function path = GeneratePath(pheromoneLevel, visibility, alpha, beta);

    node_start = randi([1, length(visibility)]);
    %in TSP S = tabu
    L_T = []; %zeros(1,length(visibility)) ;  
    L_T = [L_T;node_start];
    
    for i = 2:length(visibility)
        node = GetNode(L_T,pheromoneLevel, visibility, alpha, beta);
        L_T(end+1) = node; 
    end
    path = L_T;
end