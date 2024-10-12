function positions = InitializePostitions(range, numberOfParticles, numberOfVariables);
    x_min = range(1);
    x_max = range(2);
    
    %only x_1, x_2
    x = zeros(numberOfParticles,numberOfVariables);
    
    for i= 1:numberOfParticles
        for j = 1: numberOfVariables
            r=rand;
            x(i,j)=x_min+r*(x_max-x_min);
        end
    end
    positions = x; 
    
end