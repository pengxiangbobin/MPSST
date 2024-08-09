clear;
clc;
popsize = 100;
plythicknes = 16;
chromlength = plythicknes/2;  
pc = 0.6;%Crossover probability
pm = 0.8;%Mutation probability
pop = initpop(popsize,chromlength);
for i = 1:1000     
    if i==768
        pop(36,:)=[8 6 10 7 11 9 5 0];
    end
    objvalue = cal_objvalue(pop);    
    [~,a]=max(objvalue);            % Save the maximum objvalue
    pop_max=pop(a,:);
    fitvalue = objvalue;
    newpop = selection(pop,fitvalue);    
    newpop = crossoverdis(newpop,pc,chromlength,0);  
    newpop = mutation(newpop,pm,chromlength,0);      
    pop = newpop;                  
    pop(a,:)=pop_max;
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    [bestindividual,bestfit] = best(pop,fitvalue);   %Find the optimal solution
    record(i)=bestfit;                %Plot the best value at each iteration
     record2(i)=mean(fitvalue);       %Plot the average value at each iteration
end
    Dir=decode(bestindividual);
    fprintf('the best Dir is ：\n');
    Dir
    plot(record)
    hold all
    plot(record2)
    fprintf('the best maxstress is  %5.2f\n',bestfit);















