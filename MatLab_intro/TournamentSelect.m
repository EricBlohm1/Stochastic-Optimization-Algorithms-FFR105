%  chooses the (index of the) better
%of two randomly selected individuals with the probability given by the tournament
%selection parameter ptour (set to 0.75 above). With probability 1 − ptour the (index
%of the) worse of the two individuals is selected

function iSelected = TournamentSelect(fitness, pTournament)

    populationSize = size(fitness,1);
    iTmp1 = 1 + fix(rand*populationSize);
    iTmp2 = 1 + fix(rand*populationSize);

    r = rand;
 
    if (r < pTournament)
        if (fitness(iTmp1) > fitness(iTmp2))
            iSelected = iTmp1;
        else
            iSelected = iTmp2;
        end
    else
        if (fitness(iTmp1) > fitness(iTmp2))
            iSelected = iTmp2;
        else
            iSelected = iTmp1;
        end
    end

end