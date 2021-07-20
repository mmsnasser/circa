% FILE: maketab04.m for CIRCA
% 16-5-2021 
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
v   = [-2-2i 0.4-2i  1.4-2i  2-2i  2+0.8i  -0.6+0.8i  -2-0.6i];
c   = [inf   0.9-2i  inf     inf   inf      -2+0.8i    inf   ];
d   = [0    -1       0       0     0        -1         0  ];
% 
% This code compute Mod(G,ver1,ver2,ver3,ver4) "where ver1 must be v(1)"
% We choose a vector perim=[k1,k2,k3,k4] where 1=A, 2=B, 3=C, 4=D, 5=E, 6=F
% 
L        =  length(v);
n        =  L*2^10; 
%
QuadM = [];
for kk=1:7
    for jj=kk+1:kk+4        
        for mm=jj+1:jj+4
            if mm>13 | mm-kk>5
                break;
            end
            for nn=mm+1:mm+4
                if nn>13 | nn-kk>6
                    break;
                end
                iv1 = kk;
                iv2 = jj; 
                if iv2>7
                    iv2 = iv2-7;
                end
                iv3 = mm;
                if iv3>7
                    iv3=iv3-7;
                end
                iv4 = nn;
                if iv4>7
                    iv4=iv4-7;
                end
                QuadM=[QuadM;[iv1 iv2 iv3 iv4]];
            end
        end
    end
end
[mL,~] = size(QuadM)
%
for k=1:10%mL
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
    err         =  abs(1-modQ(k,1)*modQrc(k,1))
    err(err==0) =  1.1e-16;
    errrc(k,1)  =  err;
end
%%
for k=1:10%mL
    fprintf('%d \t %d \t %d \t %d \t %1.14f  \n', ...
             QuadM(k,1),QuadM(k,2),QuadM(k,3),QuadM(k,4),modQ(k))
end
%%