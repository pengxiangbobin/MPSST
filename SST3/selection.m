% Selection Operation
% Input variables: pop - initial population
% Output variable: newpop - population after selection

function [newpop] = selection(pop,fitvalue)
[px,py] = size(pop);   %Roulette wheel selection
totalfit = sum(1 ./ fitvalue);
p_fitvalue = (1 ./ fitvalue)/totalfit;
p_fitvalue = cumsum(p_fitvalue); %Probability summation and sorting cumsum(A,1) returns the cumulative sum along the first dimension (columns), cumsum(A,2) returns the cumulative sum along the second dimension (rows).
ms = sort(rand(1,px));              %Sort in ascending order and arrange the randomly generated numbers from 0 to 1
fitin = 1;
newin = 1;
while newin <= px && fitin <= px
    if (ms(newin)) < p_fitvalue(fitin)
        newpop(newin,:) = pop(fitin,:);
        newin = newin + 1;
    else
        fitin = fitin+1;
    end
end