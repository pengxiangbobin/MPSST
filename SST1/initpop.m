function pop = initpop(popsize,difthick,minthick,midsingle,minlayer)

if mod(minthick,2) == 1%The initial number of layers is odd, and the first inserted layer has already been defined
    popa = zeros(popsize,difthick);
    popu = zeros(popsize,difthick);


for i = 1:popsize
  
    const = 0;
    while const == 0
    angdif = 1;
    while angdif == 1
    popa(i,1)=9;%input the new layer defined based on balance

    popu(i,1)=fix((minthick-1)*rand)+1;
    newlayer = layerupdate(minlayer,i,1,popa,popu);
    angdif=ismember(1,ismember([120 105 90 75 60 -60 -75 -90 -105 -120],diff(newlayer)));
    end

for j = 1:difthick/2 
    flag1 = 0;
    constj =0;
    while constj ==0
        innercounter = 1;
     if flag1 ==1
        break
    end
    angdif = 1;        
    randompostive = randi(2);
            if randompostive == 1
            numbers = [1, 3, 5, 7, 9];  
            while angdif == 1
                innercounter = innercounter+1;
                if innercounter == 100
                    flag1 =1 ;
                    break
                end
            angel = numbers(randi(numel(numbers))); 
            popa(i,2*j)=angel;
            popu(i,2*j)=fix((minthick+2*j-2)*rand)+1;
            if j~=difthick/2
            popa(i,2*j+1)=angel+1;
            popu(i,2*j+1)=fix((minthick+2*j-1)*rand)+1;
            newlayer = layerupdate(minlayer,i,2*j+1,popa,popu);
            end
            if j==difthick/2
                newlayer = layerupdate(minlayer,i,difthick,popa,popu);
            end
            angdif=ismember(1,ismember([120 105 90 75 60 -60 -75 -90 -105 -120],diff(newlayer)));
            end

            else
            numbers = [2, 4, 6, 8, 10]; 
            while angdif == 1
                innercounter = innercounter+1;
                if innercounter == 100
                    flag1 =1 ;
                    break
                end
            angel = numbers(randi(numel(numbers))); 
            popa(i,2*j)=angel;
            popu(i,2*j)=fix((minthick+2*j-3)*rand)+1;

            if j~=difthick/2
            popa(i,2*j+1)=angel+1;
            popu(i,2*j+1)=fix((minthick+2*j-1)*rand)+1;
            newlayer = layerupdate(minlayer,i,2*j+1,popa,popu);
            end
            if j==difthick/2
                newlayer = layerupdate(minlayer,i,difthick,popa,popu);
            end
            angdif=ismember(1,ismember([120 105 90 75 60 -60 -75 -90 -105 -120],diff(newlayer)));
            end
            end

    individual = [popa(i,1:2*j) popu(i,1:2*j)];
    constj = constraint(individual,minlayer,2*j);
    end
end
    individual = [popa(i,:) popu(i,:)]
    const = constraint(individual,minlayer,difthick)
    end
    individual
    newlayer = layerupdate(minlayer,i,difthick,popa,popu)
end





else
 
for i = 1:popsize
    const = 0;
    while const == 0
for j = 1:difthick/2 
     flag1 = 0;
   
    constj =0;
    while constj ==0
         innercounter = 1;
     if flag1 ==1
        break
    end
    angdif = 1;        
    randompostive = randi(2);
            if randompostive == 1
            numbers = [1, 3, 5, 7, 9]; 
            while angdif == 1
                innercounter = innercounter+1;
                if innercounter == 100
                    flag1 =1 ;
                    break
                end
            angel = numbers(randi(numel(numbers))); 
            popa(i,2*j-1)=angel;
            popu(i,2*j-1)=fix((minthick+2*j-3)*rand)+1;

            popa(i,2*j)=angel+1;
            popu(i,2*j)=fix((minthick+2*j-2)*rand)+1;
            newlayer = layerupdate(minlayer,i,2*j,popa,popu);
            
            angdif=ismember(1,ismember([120 105 90 75 60 -60 -75 -90 -105 -120],diff(newlayer)));
            end


            else
            numbers = [2, 4, 6, 8, 10]; 
            while angdif == 1
                innercounter = innercounter+1;
                if innercounter == 100
                    flag1 =1 ;
                    break
                end
            angel = numbers(randi(numel(numbers))); 
            popa(i,2*j-1)=angel;
            popu(i,2*j-1)=fix((minthick+2*j-3)*rand)+1;

            popa(i,2*j)=angel+1;
            popu(i,2*j)=fix((minthick+2*j-2)*rand)+1;
            newlayer = layerupdate(minlayer,i,2*j,popa,popu);
            
            angdif=ismember(1,ismember([120 105 90 75 60 -60 -75 -90 -105 -120],diff(newlayer)));
            end
            end

    individual = [popa(i,1:2*j) popu(i,1:2*j)];
    constj = constraint(individual,minlayer,2*j);
    end
end




    individual = [popa(i,:) popu(i,:)]
    const = constraint(individual,minlayer,difthick)
    end
    individual
end
     
end
pop = [popa popu];
end

