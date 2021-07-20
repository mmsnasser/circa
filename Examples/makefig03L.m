% FILE: makefig03.m (left) for CIRCA
% trapezoid (see page 14 in: Tiago Anselmo et al 2020 J. Phys. A: Math.
% Theor. 53, 355201)
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;addpath ../sc;
L  = 3;
%
v1  =  0;
v2  =  1;
v3  =  1+L*i;
v4  = (L-1)*i;
%
v   = [v1   v2   v3   v4   ];
c   = [inf  inf  inf  inf  ];
d   = [0    0    0    0    ];
%
n   =  2^13;
%
z1 = v1; z2 = v2; z3 = v3; z4 = v4;
vq  = [z1   z2   z3   z4   ];
modn = modplg(v,c,d,vq,n,'b');
%
%
% Find the exact value of the modulus
lam  =  invmu(pi/(2*(2*L-1)));
lamp =  sqrt(1-lam^2);
kap  = (1-2*lam*lamp)/(1+2*lam*lamp);
mode =  pi/(2*mu(kap))
%
rerr =  abs(mode-modn)/mode
%%
options = scmapopt('Tolerance',1e-14); 
p=polygon(v); 
fsc = rectmap(p,[2 3 4 1],options);
prevertsc = get(fsc,'prevert');
vv = (prevertsc+prevertsc(1))./(2*prevertsc(1));
modnsc = imag(vv(2));
%
rerrsc =  abs(mode-modnsc)/mode
%%
[et,etp]=plgsegcirarcp(v,c,d,n/2);
figure
hold on; box on
plot(real(et),imag(et),'b','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([-0.2 1.2 -0.2 3.2])
set(gca,'FontSize',18)
print -depsc trapezoidfig
%%
