% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)

    x = xStart;
    
    while (true)
        gradF = ComputeGradient(x,mu);
        if(norm(gradF) < gradientTolerance)
            break
        end
        
        x = x - eta*gradF;
        
    end

