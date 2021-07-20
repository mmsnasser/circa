% FILE: makefig04.m (left) for CIRCA
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;addpath ../sc;
%
a   =  1.25;
b   =  2;
%
v1  =  i;
v2  =  0;
v3  =  b;
v4  =  a+i;
%
v   = [v1   v2   v3   v4   ];
c   = [inf  inf  inf  inf  ];
d   = [0    0    0    0    ];
%
n    =  2^12;
%
z1   = v1; z2 = v2; z3 = v3; z4 = v4;
vq   = [z1   z2   z3   z4   ];
modn = 2*modplg(v,c,d,vq,n,'b')
%
options = scmapopt('Tolerance',1e-14); 
p=polygon(v); 
fsc = rectmap(p,[2 3 4 1],options);
prevertsc = get(fsc,'prevert');
vv = (prevertsc+prevertsc(1))./(2*prevertsc(1));
modsc = 2*imag(vv(2))
%
% Find the exact value of the modulus
if b==a+1
    lam  =  invmu(pi/(2*(2*a+1)));
    lamp =  sqrt(1-lam^2);
    kap  = (1-2*lam*lamp)/(1+2*lam*lamp);
    mode =  pi/(mu(kap));
    rerr =  abs(mode-modn)/mode
    rerrsc =  abs(mode-modsc)/mode
end
%%
vc   = [-a+i    -b        b       a+i   ];
[etc,etpc] =  polygonp(vc,n/4);
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
plot(real(etc),imag(etc),'b','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([-b-0.2 b+0.2 -0.2 1.2])
xticks([-2 -1.25 0 1.25 2])
xticklabels({'$-b$','$-a$','$0$','$a$','$b$'})
yticks([0 1])
yticklabels({'$0$','$1$'})
print -depsc trapsym
%%
