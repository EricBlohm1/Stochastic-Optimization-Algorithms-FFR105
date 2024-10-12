function x_pb = UpdateBestParticle(x,x_pb);
        %Calculate f(x_i)
        f_x = EvaluateParticle(x);
        %Calculate f(x_i^pb)
        f_x_pb = EvaluateParticle(x_pb);
        if(f_x < f_x_pb)
            x_pb = x;
        end
end