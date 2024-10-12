function pathLength = GetPathLength(path,cityLocation);
    pathLength = 0;
    for i= 2:length(cityLocation)
        term1 = (cityLocation(path(i),1)-cityLocation(path(i-1),1))^2;
        term2 = (cityLocation(path(i),2)-cityLocation(path(i-1),2))^2;
        distance = sqrt(term1 + term2);
        pathLength = pathLength + distance;
    end
    term1 = (cityLocation(path(end),1)-cityLocation(path(1),1))^2;
    term2 = (cityLocation(path(end),2)-cityLocation(path(1),2))^2;
    distance = sqrt(term1 + term2);
    pathLength = pathLength + distance;
end
        