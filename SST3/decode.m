function Dir=decode(layercode)
chr = size(layercode,2);
for i = 1:1:chr
    if layercode(1,i) == 0 
            a = 0 ;                      
    elseif  layercode(1,i) == 1 
            a = 15;
     elseif  layercode(1,i) == 2
            a = -15;
     elseif  layercode(1,i) == 3 
            a = 30   ;        
     elseif  layercode(1,i) == 4 
            a = -30   ;
    elseif  layercode(1,i) == 5 
            a = 45    ;
    elseif  layercode(1,i) == 6
            a = -45    ;
    elseif  layercode(1,i) == 7 
            a = 60    ;
    elseif  layercode(1,i) == 8 
            a = -60    ;
    elseif  layercode(1,i) == 9 
            a = 75    ;
    elseif  layercode(1,i) == 10 
            a = -75  ;
    elseif  layercode(1,i) == 11 
            a = 90     ;   
    end
     Dir(1,i) = a;
end



