function newpop = crossoverdis(pop,pc,minlayer,difthick)
%CROSSOVERDIS 
[px,py] = size(pop);
newpop = pop;
for i =1:2:px-1
    if (rand<pc)     
        const = 0;
        while const ==0
            for py_n=1:py
                if rand<0.5
                newpop(i,py_n)=pop(i+1,py_n);
                end
            end
            const = constraint(newpop(i,:),minlayer,difthick);
        end
    end
end
end
