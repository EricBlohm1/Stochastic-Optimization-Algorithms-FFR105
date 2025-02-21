%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ant system (AS) for TSP.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfAnts = 50;  %% Changes allowed
alpha = 1.0;        %% Changes allowed
beta = 3.0;         %% Changes allowed
rho = 0.3;          %% Changes allowed
tau0 = 0.1;         %% Changes allowed

targetPathLength = 99.9999999; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To do: Add plot initialization
range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0); % To do: Write the InitializePheromoneLevels. Done
visibility = GetVisibility(cityLocation);                         % To do: write the GetVisibility function. Done

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minimumPathLength = inf;

iIteration = 0;
pathCollection = zeros(numberOfAnts, numberOfCities);
pathLengthCollection = zeros(numberOfAnts,1);

while (minimumPathLength > targetPathLength)
 iIteration = iIteration + 1;

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Generate paths:
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 for k = 1:numberOfAnts
  path = GeneratePath(pheromoneLevel, visibility, alpha, beta);   % To do: Write the GeneratePath function, done
  pathLength = GetPathLength(path,cityLocation);                  % To do: Write the GetPathLength function, done
  if (pathLength < minimumPathLength)
    minimumPathLength = pathLength;
    bestPath = path; % added this
    disp(sprintf('Iteration %d, ant %d: path length = %.5f',iIteration,k,minimumPathLength));
    PlotPath(connection,cityLocation,path);
  end
  pathCollection(k,:) = path;  
  pathLengthCollection(k) = pathLength; 
 end

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Update pheromone levels
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);  % To do: write the ComputeDeltaPheromoneLevels function,done
 pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);          % To do: write the UpdatePheromoneLevels function, done

end





