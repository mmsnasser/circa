% FILE: maketab03.m for CIRCA
% 16-5-2021 
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
eps =  1/3;  
v   = [-1+3i -1+i -1-i  1-i  3-i  3+i  1+i  1+3i];
d   = [ 1      1   -1   -1   -1   1    -1   1  ];
%
L        =  length(v);
vc     =  v; vc(end+1) = vc(1);
for k=1:L
    c(k) = (vc(k+1)+vc(k)+d(k)*i*cot(eps)*(vc(k+1)-vc(k)))/2;
end
%
n  =  L*2^10;
%%
% We choose a vector perim=[k1,k2,k3,k4] where 1=A, 2=B, 3=C, 4=D, 5=E, 6=F
% 
QuadM = [1 3 5 6   
         5 6 7 8   
         1 3 5 7   
         8 4 6 7   
         8 1 3 6   
         8 1 5 6  
         8 2 4 6   
         ];
[mL,~] = size(QuadM)
%%
[mL,~] = size(QuadM);
for k=1:mL
    k
    perim  =  QuadM(k,:);
    perimrc = perim;
    perimrc(1)=[]; perimrc(end+1)=perim(1);
    %
    vq          =  v(perim);
    modQ(k,1)   =  modplg(v,c,d,vq,n,'b');
    vqrc        =  v(perimrc);
    modQrc(k,1) =  modplg(v,c,d,vqrc,n,'b');
    %
    err         = abs(1-modQ(k,1)*modQrc(k,1))
    err(err==0) =  1.1e-16;
    errrc(k,1)  =  err;
end
%%
for k=1:mL
    fprintf('%d \t %d \t %d \t %d \t %1.14f  \n', ...
             QuadM(k,1),QuadM(k,2),QuadM(k,3),QuadM(k,4),modQ(k))
end
%%
