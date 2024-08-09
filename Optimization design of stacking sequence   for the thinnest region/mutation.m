%% Mutation Operation
% Input variables: pop - population
%                  pm - mutation probability
% Output variable: newpop - population after mutation

function [newpop] = mutation(pop,pm,minlayer,difthick)
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

        newpop(i,mpoint) = fix(12*rand);
        const = constraint(newpop(i,:),minlayer,difthick);
        end
    else
        newpop(i,:) = pop(i,:);
    end
end
