
function [objvalue] = cal_objvalue(pop)
L=size(pop,1);       % Number of chromosomes in the initial population.
POP=pop;
chr = size(pop,2)     % Number of genes in one chromosome.
for index=1:L
    pop=POP(index,:);
       Dir = []
       Dir1 = []
       Dir = decode(pop);
   
    F=[36.777  17.513  0 0 0 0   ]  % [Nx Ny Nxy Mx My Mxy] (N/mm & Nmm/mm)
    a = 508 %Length of the x-axis.
    b = 305 %Length of the y-axis.

E1= 141   %Young's moduli-1[GPa]  121   
E2= 9.03           %Ypung's moduli-2[Gpa]   8.6
G12= 4.27         %Shear modules   [Gpa]   4.7
miu12=   0.32     %Poisson’s ratio
t=  0.191;                 %thickness       [mm]  5/4

Nx=F(1,1);
Ny=F(1,2);
Nxy=F(1,3);
Mx=F(1,4);
My=F(1,5);
Mxy=F(1,6);

%%
N=size(Dir,2);           %the number of the layers
T(1,1:N)=t;              
h=sum(T);                %total thickness of the laminate
mech=[E1,E2,G12,miu12];   %mechanical properities
%%
A=zeros(3,3);
B=zeros(3,3);
D=zeros(3,3);
z0=-h/2;
Q0=layer(mech,0);
for i=1:N  % Qi [GPa]
    Qi{1,i}=layer(mech,Dir(1,i));
   z(1,i)=z0+sum(T(1,1:i)); 
   Ti{1,i}=Tr(Dir(1,i));
end  
for i=1:N
   if i==1
       A=Qi{1,i}*(z(1,i)-z0)*1000;
       B=Qi{1,i}*1/2*(z(1,i)^2-z0^2)*1000; 
       D=Qi{1,i}*1/3*(z(1,i)^3-z0^3)*1000;
   else
       A=A+Qi{1,i}*(z(1,i)-z(1,i-1))*1000;
       B=B+Qi{1,i}*1/2*(z(1,i)^2-z(1,i-1)^2)*1000;
       D=D+Qi{1,i}*1/3*(z(1,i)^3-z(1,i-1)^3)*1000;
   end
end  
ABD=[A B;B D];% A[N/mm] /B[N]  D[Nmm]


D11 = D(1,1)
D22 = D(2,2)
D12 = D(1,2)
D66 = D(3,3)

for m = 1:3
    for n = 1:3
% % Critical buckling load factor under biaxial compression.
Nx_1 = pi^2*[D11*(m/a)^4+2*(D12+2*D66)*(m/a)^2*(n/b)^2+D22*(n/b)^4]/[(m/a)^2*Nx+(n/b)^2*Ny]
N(m,n) = Nx_1
    end
end
ququyinzi = min(min(N))
    
    objvalue(index,1) = ququyinzi
    
    if ququyinzi < 1
        objvalue(index,1) = 0.00001

    else ququyinzi>= 1
        for s = 1:length(Dir)-3
            B_Dir = Dir(s:s+3)
            if diff(B_Dir) == 0
                objvalue(index,1) =0.00001
                continue
            else
                objvalue(index,1) = ququyinzi
            end
        end
      
    end
end