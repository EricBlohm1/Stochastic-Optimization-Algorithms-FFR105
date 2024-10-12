
function v = UpdateVelocities(v,x,x_pb,x_sb,c1,c2,delta_t,w,v_max);
    for i = 1:length(v)
        q= rand;
        r=rand;
        for j =1:length(v(1,:))
            term1= w*v(i,j);
            term2= c1*q*((x_pb(i,j)-x(i,j))/delta_t);
            term3= c2*r*((x_sb(j)-x(i,j))/delta_t);
            v(i,j) = term1 + term2 + term3;
            %restrict velocities
            if(v(i,j) > v_max)
                v(i,j) = v_max;
            elseif (v(i,j) < -v_max)
                v(i,j) = -v_max;
            end
        end
    end
end