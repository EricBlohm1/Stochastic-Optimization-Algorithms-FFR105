%only works for 2 variables.
function particle = EvaluateParticle(x);
        term1 = ((x(1)^2) + x(2) - 11)^2;
        term2= (x(1) + x(2)^2 - 7)^2;
        particle = term1+term2;
end