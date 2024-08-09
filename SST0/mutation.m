%% Mutation Operation
% Input variables: pop - parent population
% pm - mutation probability
% Output variable: newpop - population after mutation

function [newpop] = mutation(pop,pm,difthick,midsingle,minthick,minlayer)
[px,py] = size(pop);
newpop = ones(size(pop));
for i = 1:px
    if (rand < pm)
        const = 0;
        while const==0
        mpoint = round(rand*py);
        if mpoint <= 0
            mpoint = 1;
        end
        newpop(i,:) = pop(i,:);
        if mpoint <= difthick
            newpop(i,mpoint) = fix(12*rand);
        else
            newpop(i,mpoint) = fix((fix((minthick*2-midsingle)/2)+mpoint-difthick-2)*rand)+1;
        end
            const = constraint(newpop(i,:),minlayer,difthick);
        end
    else
        newpop(i,:) = pop(i,:);
    end
end
