
clear all;
clc;

%%%%%%%%%%%%%%%%%%
% Set parameters %
%%%%%%%%%%%%%%%%%%
numberOfParticles = 40;
numberOfVariables = 2;
delta_t = 1; %from page 122
alpha = 1; %from page 122
c1 = 2;
c2 = 2;
w= 1.4; % start
beta = 0.99; %constant factor to decrease w
range = [-5,5];
v_max=range(1,2);
numberOfIterations = 250; % guess, from example 5.2
numberOfRuns = 400; %from tests



best_particles = [];

for r= 1:numberOfRuns
    %%%%%%%%%%%%%%%%%%
    % Initialization %
    %%%%%%%%%%%%%%%%%%
    x = InitializePostitions(range, numberOfParticles,numberOfVariables);
    v = InitializeVelocities(range,numberOfParticles,numberOfVariables,alpha,delta_t);
    % initially set some values
    x_pb = x;
    x_sb = x(1,:);
    
    for iIteration = 1:numberOfIterations
        %maintain lower bound
        w = w*beta;
        if w < 0.3
            w = 0.3;
        end

        for i = 1:numberOfParticles     
            x_pb(i,:) = UpdateBestParticle(x(i,:),x_pb(i,:));
            x_sb = UpdateSwarmBest(x(i,:),x_sb);
        end
        
        f_x_sb = EvaluateParticle(x_sb);
        best_particles(end+1,:) = [x_sb(1),x_sb(2),f_x_sb];
        
        
        v = UpdateVelocities(v,x,x_pb,x_sb,c1,c2,delta_t,w,v_max);
        x = UpdatePositions(x,v,delta_t);   
    end
end


%% Plot %%
x1= linspace(-5,5,100);
x2= linspace(-5,5,100);
[X1,X2] = meshgrid(x1,x2);

Z = zeros(100,100);
for i =1:length(Z)
    for j =1:length(Z)
        Z(i,j) = EvaluateParticle([X1(i,j),X2(i,j)]);
    end
end

contourf(X1,X2,Z,50);
colorbar;
xlabel('x_1');
ylabel('x_2');


% filter out the best values, based on a tolerance, to find
tolerance = 0.01;
filtered_best = [];
for i= 1:length(best_particles)
    if best_particles(i,3) < tolerance
        filtered_best(end+1,:)= best_particles(i,:);
    end
end


% use this to see approximate points. Used later when choosing interval.
%hold on;
%plot(filtered_best(:, 1), filtered_best(:, 2), 'r*', 'MarkerSize', 10, 'LineWidth', 2);
%hold off;


%from filtering and plotting, i have found approximate positions.
% now i can filter again, based on function value, around these approximate
% 4 positions. Using an interval.
particles1 = [];
particles2 = [];
particles3 = [];
particles4 = [];
epsilon = 0.15;

%now separate the 4 points into arrays
for i = 1:length(filtered_best)
    %check that current point is within an interval of a found point. 
    if CheckInterval(filtered_best(i,:),epsilon,-2.8,3.1)
       particles1(end+1,:) = filtered_best(i,:);
    elseif CheckInterval(filtered_best(i,:),epsilon, 2.95,1.95)
        particles2(end+1,:) = filtered_best(i,:);
    elseif CheckInterval(filtered_best(i,:),epsilon, -3.7,-3.2)
        particles3(end+1,:) = filtered_best(i,:);
    elseif CheckInterval(filtered_best(i,:),epsilon, 3.5,-1.8)
        particles4(end+1,:) = filtered_best(i,:);
    end
end   
    
%sort based on function value, and append the best particle (first
%element after sorting) to the absolute best list.
absolute_best = [];
for i = 1:4

    if i == 1
        sorted = sortrows(particles1,3);
        absolute_best(end+1,:) = sorted(1,:);
    elseif i == 2
        sorted = sortrows(particles2,3);
        absolute_best(end+1,:) = sorted(1,:);
    elseif i == 3
        sorted = sortrows(particles3,3);
        absolute_best(end+1,:) = sorted(1,:);
    elseif i == 4
        sorted = sortrows(particles4,3);
        absolute_best(end+1,:) = sorted(1,:);  
    end
end
    

hold on;
plot(absolute_best(:, 1), absolute_best(:, 2), 'r*', 'MarkerSize', 10, 'LineWidth', 2);
% Adding text annotations
for i = 1:size(absolute_best, 1)
    text(absolute_best(i, 1), absolute_best(i, 2), sprintf('(%0.3f, %0.3f)', absolute_best(i, 1), absolute_best(i, 2)), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'FontSize',10, 'Color', 'white');
end
hold off;
    
    
    