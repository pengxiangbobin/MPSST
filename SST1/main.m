clear;
clc;
popsize =100;
minlayer = [-60	-75 -45	-75	60	90	75	45	0];%stacking sequence of the thinnest subregion
thickpredict = [12];%Prediction of thickness, represented by half of the thickness
nsubergion = size(thickpredict,2);
midsingle = 0;%0 represents a double layer in the middle, while 1 represents a single layer
minthick = size(minlayer,2);
difthick = max(thickpredict)-minthick+2;%The difference in thickness between the thickest and thinnest layers
pc = 0.6;%Crossover probability
pm = 0.8;%Mutation probability
if mod(minthick,2) == 1
    difthick =difthick+1;
end
pop = initpop(popsize,difthick,minthick,midsingle,minlayer);
SST = sequence(pop(1,:),minlayer,difthick);%Construct SST
for xunhuan = 1:1000     
    objvalue = cal_objvalue(pop,thickpredict,nsubergion,minlayer,difthick);   
    [~,a]=min(objvalue);           %Save the minimum fitness value
    pop_max=pop(a,:);
    fitvalue = objvalue;
    newpop = selection(pop,fitvalue);   
    newpop = crossoverdis(newpop,pc,minlayer,difthick);  
    newpop = mutation(newpop,pm,difthick,midsingle,minthick,minlayer);   
    pop = newpop;               
    pop(a,:)=pop_max;
    objvalue = cal_objvalue(pop,thickpredict,nsubergion,minlayer,difthick);
    fitvalue = objvalue;
    [bestindividual,bestfit] = best(pop,fitvalue);    %Find the optimal solution
    [thickdistribution,bestobjvalue,ququ] = thickmatch(bestindividual,thickpredict,nsubergion,minlayer,difthick);
    fitvalue
    thickdistribution
    totalthick = sum(thickdistribution)
    ququ
    bestobjvalue
    xunhuan
     record(xunhuan)=bestfit;               %Plot the optimal value at each iteration
    record2(xunhuan)=mean(fitvalue);       %Plot the average value at each iteration  
end
    bestfit
    plot(record)
    hold all
    plot(record2)
    SST = sequence(bestindividual,minlayer,difthick)
    fprintf('the best maxstress is  %5.2f\n',bestfit);
    
   