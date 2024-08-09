%% Selection of the Best Fitness Function

% Input variables: pop - population
%                  fitvalue - population fitness
% Output variables: bestindividual - best individual
%                   bestfit - best fitness value
function [bestindividual bestfit] = best(pop,fitvalue)
[px,py] = size(pop);
bestindividual = pop(1,:);
bestfit = fitvalue(1);
for i = 2:px-1                  
    if fitvalue(i) > bestfit
        bestindividual = pop(i,:);
        bestfit = fitvalue(i);
    end
end