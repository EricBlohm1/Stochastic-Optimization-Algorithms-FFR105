function visibility = GetVisibility(cityLocation);
    numberOfCities = length(cityLocation);
    
    %on position ij we will have the distance from city i to city j, thus
    %we need 50x50 matrix.
    visibility = zeros(numberOfCities,numberOfCities);
    
    for i=1:numberOfCities
        for j = 1:numberOfCities
            if(i == j)
                visibility(i,j) = 0;
            else
                term1 = (cityLocation(i,1)-cityLocation(j,1))^2;
                term2 = (cityLocation(i,2)-cityLocation(j,2))^2;
                distance = sqrt(term1 + term2);
                visibility(i,j) = 1/distance;
            end
        end
    end