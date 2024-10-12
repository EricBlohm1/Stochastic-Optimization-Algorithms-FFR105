%filtered_best is the current row.
function condition = CheckInterval(filtered_best,epsilon,x1,x2);
     if ((x1 - epsilon < filtered_best(1)) && (filtered_best(1) < x1 + epsilon) ...
            && (x2 - epsilon < filtered_best(2)) && (filtered_best(2) < x2 + epsilon))
        condition = true;
     else
         condition = false;
     end
end