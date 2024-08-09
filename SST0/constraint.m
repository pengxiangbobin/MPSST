function const = constraint(individual,minlayer,difthick)
%CONSTRAINT 计算个体是否满足约束，连续/角度差
%   0表示不满足
%[popa,popu] = disassemble(individual,difthick);
SST = sequence(individual,minlayer,difthick);
const = 1;
for i=1:size(SST,2)
    Dir = SST{1,i};
    [L,val]=longrun(Dir);
    targetElements1=[-45 ,0 ,45 ,90];
    % 初始化结果变量
frequencies1 = zeros(size(targetElements1));
indices1 = zeros(size(targetElements1));

% 遍历每个目标元素并计算出现次数和频率
for k = 1:numel(targetElements1)
    targetElement = targetElements1(k);
    counts = 0;
    for j = 1:numel(Dir)
        if Dir(j) == targetElement
            counts = counts + 1;
        end
    end
    frequencies1(k) = counts/size(Dir,2);
end   
   targetElements2=[15 -15 30 -30 45 -45 60 -60 75 -75];
    % 初始化结果变量
frequencies2 = zeros(size(targetElements2));
indices2 = zeros(size(targetElements2)); 
    for k = 1:numel(targetElements2)
    targetElement = targetElements2(k);
    counts = 0;
    for j = 1:numel(Dir)
        if Dir(j) == targetElement
            counts = counts + 1;
        end
    end
    frequencies2(k) = counts;
end  
cond1 = abs(frequencies2(1,1)-frequencies2(1,2));
cond2 = abs(frequencies2(1,3)-frequencies2(1,4));
cond3 = abs(frequencies2(1,5)-frequencies2(1,6));
cond4 = abs(frequencies2(1,7)-frequencies2(1,8));
cond5 = abs(frequencies2(1,9)-frequencies2(1,10));
satisfiedCount = cond1 + cond2 + cond3 + cond4 + cond5;
   


    if max (L) > 4||ismember(1,ismember([120 105 90 75 60 -60 -75 -90 -105 -120],diff(Dir)))==1%|| any(frequencies1 < 0.1)||satisfiedCount>1%连续铺层数不超过4，最大角度差不超过45（多材料）,4种铺层不能少于10%，
    const = 0;
    break
    end
end
end

