%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Define more runs here (pMut < 0.02) ...

format long;
averages = zeros(1,10);
medians = zeros(1,10);
stds = zeros(1,10);
mutationProbabilities = zeros(1,10);
mutationProbability = 0;

 
for m = 1:10
    % said in instruction to include p_mut =0
    if(m == 1)
        mutationProbability = 0;
    else
        %how much to increase mutation probability each iteration
        stepLength = (1/numberOfGenes);
        %Stated from lecture slides that p_mut is at most "a few times
        %1/numberOfGenes". That is why the stepLength is small. 
        start = (1/numberOfGenes);
        mutationProbability = start + stepLength*(m-2);
    end
    mutationProbabilities(m) = mutationProbability;
    
    sprintf('Mutation rate = %0.5f', mutationProbability)
    maximumFitnessList002 = zeros(numberOfRuns,1);
    for i = 1:numberOfRuns 
     [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
     sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
      maximumFitnessList002(i,1) = maximumFitness;
    end


    % ... and here (pMut > 0.02)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Summary of results
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Add more results summaries here (pMut < 0.02) ...

    average002 = mean(maximumFitnessList002);
    averages(m) = average002; 
    
    median002 = median(maximumFitnessList002);
    medians(m) = median002;
    
    std002 = sqrt(var(maximumFitnessList002));
    stds(m) = std002;
    sprintf('PMut = %0.10f: Median: %0.10f, Average: %0.10f, STD: %0.10f', mutationProbability, median002, average002, std002)

    

    % ... and here (pMut > 0.02)
end

% Plot the updated data
figure(1);
plot(mutationProbabilities, medians, '-o', 'LineWidth', 2);
xlabel('Mutation Probability (p_{mut})');
ylabel('Fitness Value');
title('Fitness Value as a Function of Mutation Probability');
xlim([-0.2 0.4])
grid on;