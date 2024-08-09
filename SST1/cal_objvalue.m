function objvalue = cal_objvalue(pop,thickpredict,nsubergion,minlayer,difthick)
%CAL_OBJVALUE 
L=size(pop,1);      
objvalue = zeros(1,L);
weight=1.563*10^(-6)*0.191*[154940];%Single-layer weight of each subregion.
for index=1:L 
SST = sequence(pop(index,:),minlayer,difthick);
breaksign = 0;
for id = 1:nsubergion 
    th = 2*thickpredict(1,id);
    ququ(id,1) = ququcal(id,th,SST);

    if ququ(id,1) < 1
        while ququ(id,1) < 1  
            th = th+1;
            if th > max(thickpredict)*2+3
                breaksign = 1;
                break
            end
            ququ(id,1) = ququcal(id,th,SST);            
        end
    else    
        while ququ(id,1) >= 1
            th = th-1; 
            if th == size(minlayer,2)-1
               break
            end
            ququ(id,1) = ququcal(id,th,SST);
        end
        th = th+1;
        ququ(id,1) = ququcal(id,th,SST);
    end
    if breaksign == 1
        objvalue(1,index) = 10;%Set a value far greater than the target fitness to penalize that individual
        break
    end
    objvalue(1,index) = objvalue(1,index) + th*weight(1,id)-0.01*ququ(id,1);
end %nsubregion
end %index
end


