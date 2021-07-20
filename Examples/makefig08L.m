% FILE: makefig08.m (left) for CIRCA
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
[et,etp]=plgsegcirarcp(v,c,d,n/4);
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(et),imag(et),'b','LineWidth',1.5)
hold on; box on
plot(real(v),imag(v),'ok','LineWidth',1.5,'MarkerFaceColor','k')
text(real(v(1)),imag(v(1))+0.25,'$v_1$','FontSize',20)
text(real(v(2))-0.4,imag(v(2))+0.20,'$v_2$','FontSize',20)
text(real(v(3)),imag(v(3))-0.2,'$v_3$','FontSize',20)
text(real(v(4)),imag(v(4))-0.2,'$v_4$','FontSize',20)
text(real(v(5)),imag(v(5))-0.2,'$v_5$','FontSize',20)
text(real(v(6)),imag(v(6))+0.25,'$v_6$','FontSize',20)
text(real(v(7))+0.05,imag(v(7))+0.25,'$v_7$','FontSize',20)
text(real(v(8)),imag(v(8))+0.2,'$v_8$','FontSize',20)

grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([-1.5 3.5 -1.5 3.5])
print -depsc cfig01
%
