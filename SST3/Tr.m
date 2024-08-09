function [T]=Tr(a)   % transformation and angle
m=cosd(a);
n=sind(a);
T=[m^2 n^2 2*m*n;
    n^2 m^2 -2*m*n;
    -m*n m*n m^2-n^2];
end