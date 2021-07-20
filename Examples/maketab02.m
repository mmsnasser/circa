% FILE: maketab02.m for CIRCA
% 16-5-2021 
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
v   = [-1+3i -1+i -1-i  1-i  3-i  3+i  1+i  1+3i];
c   = [inf    inf  inf  inf  inf  inf  inf  inf];
d   = [0      0    0    0    0    0    0    0  ];
% 
% This code compute Mod(G,ver1,ver2,ver3,ver4) "where ver1 must be v(1)"
% We choose a vector perim=[k1,k2,k3,k4] where 1=A, 2=B, 3=C, 4=D, 5=E, 6=F
% 
L        =  length(v);
n        =  L*2^10; 
%
QuadM = [1 3 5 6   sqrt(3)
         5 6 7 8   sqrt(3)
         1 3 5 7   1
         8 4 6 7   pi/(2*mu(1/2))
         8 1 3 6   pi/(2*mu(sqrt(4*sqrt(3)-6)))
         8 1 5 6   pi/(2*mu(2*sqrt(14*sqrt(3)-24)))
         8 2 4 6   pi/(2*mu(2*sqrt(2)/3))
         ];
[mL,~] = size(QuadM)
%
for k=1:mL
    k
    perim  =  QuadM(k,1:4);
    perimrc = perim;
    perimrc(1)=[]; perimrc(end+1)=perim(1);
    %
    vq          =  v(perim);
    modQ(k,1)   =  modplg(v,c,d,vq,n,'b');
    vqrc        =  v(perimrc);
    modQrc(k,1)   =  modplg(v,c,d,vqrc,n,'b');
    %
    rerr(k,1)   =  abs(QuadM(k,5)-modQ(k,1))/QuadM(k,5);
    err         =  abs(1-modQ(k,1)*modQrc(k,1))
    err(err==0) =  1.1e-16;
    errrc(k,1)  =  err;
end
%%
for k=1:mL
    fprintf('%d \t %d \t %d \t %d \t %1.14f \t %1.14f \t %1.2s \t %1.2s \n', ...
             QuadM(k,1),QuadM(k,2),QuadM(k,3),QuadM(k,4),modQ(k),QuadM(k,5),rerr(k),errrc(k))
end
%%
