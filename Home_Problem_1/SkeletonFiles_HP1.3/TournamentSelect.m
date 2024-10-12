function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    populationSize = size(fitnessList,2);
    iTmp = zeros(1,tournamentSize);
    
    %randomly select j individuals from the population, iTmp contains their
    %indexes.
    for j=1:tournamentSize
        iTmp(j)= 1 + fix(rand*populationSize);
    end
    
    %Create the pairs of fitness values with corresponding index.
    pairs = zeros(2,tournamentSize);
    for i =1:tournamentSize
        pairs(1,i) = fitnessList(iTmp(i));
        pairs(2,i) = iTmp(i);
    end    
    
    % Sort the pairs matrix based on fitness values, and save the
    % corresponding indexes in sortIdx (i.e the indexes they had before sorting)
    [~, sortIdx] = sort(pairs(1,:),'descend'); 

    % Reorder the index row based on the sorted fitness values, such the
    % that the pairs are maintained after sorting. 
    pairs = pairs(:, sortIdx);

    
    %using algorithm from slide 28, lecture 5, and page 50 in the book. 
    while(~isempty(pairs))
        r = rand;
        if (r < tournamentProbability)
            %fittest individual index is at the first position in the second row
            %of "pairs"
            selectedIndividualIndex = pairs(2,1);
            return
        else
            %slice off first column of the matrix, i.e remove fittest
            %individual
            pairs = pairs(:,2:end);
        end
        %last individual
        if(size(pairs,2) == 1)
            selectedIndividualIndex = pairs(2,1);
            return
        end
    end
end
