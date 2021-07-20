% FILE: makefig09.m (right) for CIRCA
% 16-5-2021 (new version)
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
QuadM = [];
for kk=1:8
    for jj=kk+1:kk+5        
        for mm=jj+1:jj+5
            if mm>15 | mm-kk>6
                break;
            end
            for nn=mm+1:mm+5
                if nn>15 | nn-kk>7
                    break;
                end
                iv1 = kk;
                iv2 = jj; 
                if iv2>8
                    iv2 = iv2-8;
                end
                iv3 = mm;
                if iv3>8
                    iv3=iv3-8;
                end
                iv4 = nn;
                if iv4>8
                    iv4=iv4-8;
                end
                QuadM=[QuadM;[iv1 iv2 iv3 iv4]];
            end
        end
    end
end
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
%
res = [QuadM modQ modQrc errrc]
%%
for k=1:mL
    fprintf('%d \t %d \t %d \t %d \t %1.14f \t %1.14f \t %1.2s \n', ...
             QuadM(k,1),QuadM(k,2),QuadM(k,3),QuadM(k,4),modQ(k), modQrc(k),errrc(k))
end
%%
figure
semilogy(1:mL,errrc,'b','LineWidth',1.5)
hold on; box on
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis([1 mL 0.5e-16 0.2e-13])
xticks([0:40:280])
print -depsc  figLarcerr
%%