function x_sb = UpdateSwarmBest(x,x_sb);
    %Calculate f(x_i)
    f_x = EvaluateParticle(x);
    %Calculate f(x_i^sb)
    f_x_sb = EvaluateParticle(x_sb);
    if(f_x < f_x_sb)
        x_sb = x;
    end
end