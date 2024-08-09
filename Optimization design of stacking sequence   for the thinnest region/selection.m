% Selection Operation

% Input variables: pop - population
% fitvalue - fitness values
% Output variable: newpop - selected population

function [newpop] = selection(pop,fitvalue)
[px,py] = size(pop);   %Construct a roulette wheel
totalfit = sum(fitvalue);
p_fitvalue = fitvalue/totalfit;
p_fitvalue = cumsum(p_fitvalue); %Probability summation and sorting. cumsum(A,1) returns the cumulative sum along the first dimension (columns), while cumsum(A,2) returns the cumulative sum along the second dimension (rows)
ms = sort(rand(px,1));              %Sort in ascending order and arrange the randomly generated numbers from 0 to 1.
fitin = 1;
newin = 1;
while newin <= px
    if (ms(newin)) < p_fitvalue(fitin)
        newpop(newin,:) = pop(fitin,:);
        newin = newin + 1;
    else
        fitin = fitin+1;
    end
end