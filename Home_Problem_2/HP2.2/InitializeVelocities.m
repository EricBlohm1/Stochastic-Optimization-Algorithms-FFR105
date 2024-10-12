function velocities = InitializeVelocities(range,numberOfParticles,numberOfVariables,alpha,delta_t); 
    x_min = range(1);
    x_max = range(2);
    
    v = zeros(numberOfParticles,numberOfVariables);
    
    for i= 1:numberOfParticles
        for j = 1:numberOfVariables
            r=rand;
            v(i,j) = (alpha/delta_t)*( (-(x_max-x_min)/2) + r*(x_max-x_min));
        end
    end
    velocities = v;
end