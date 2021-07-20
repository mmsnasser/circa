% FILE: makefig17.m for CIRCA
% 22-5-2021
% This example is a numerical implementation of the Theorem 6.1 in:
% Philip R. Brown & R. Michael Porter, Numerical Conformal Mapping to 
% One-Tooth Gear-Shaped Domains and Applications, Comput. Methods Funct. 
% Theory 16 (2016), 319-345.
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  2^13;
t        = (0:2*pi/n:2*pi-2*pi/n)';
thet     =  pi/4;
beta     =  1.5;
%%
% Let A be the annular rectangle with inner radius 1 and outer radius
% beta^2 (see Fig 9 in the above reference). 
% Here, we compute the conformal module of the exterior domain (unbounded)
% A* = (C U {inf})\ cl(A)
% 
vu        = [exp(-i*thet) beta^2*exp(-i*thet) beta^2*exp(i*thet) exp(i*thet)];
cu        = [inf          0           inf     0];
du        = [0            -1          0       1];
modG      = modplg(vu,cu,du,vu,n,'u',-0.5*(1+beta^2));
%%
[etu,etup] =  plgsegcirarcp(vu,cu,du,n/4);
figure
plot(real(etu),imag(etu),'b','LineWidth',1.5)
hold on; box on; axis equal
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
%%
% Here, we compute the module of the gear domain (bounded) with gear angle
% gama and gear ratio beta
% 
vg        = [exp(-i*thet) beta*exp(-i*thet) beta*exp(i*thet) exp(i*thet)  ];
cg        = [inf          0                 inf              0];
dg        = [0            1                 0                1];
modD     = modplg(vg,cg,dg,vg,n,'b');
% 
% By Theorem 6.1 in the above reference, we should have modAst=modG/2
err      = abs(modG-modD/2);
%
fprintf('%1.14f \t %1.14f \t %1.2s \n', modG, modD, err)
%
[etb,etbp] =  plgsegcirarcp(vg,cg,dg,n/4);
figure
plot(real(etb),imag(etb),'b','LineWidth',1.5)
hold on; box on; axis equal
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
%%
[etu,etup] =  plgsegcirarcp(vu,cu,du,n/4);
[etb,etbp] =  plgsegcirarcp(vg,cg,dg,n/4);
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
% 
plot(real(etu),imag(etu),'b','LineWidth',1.5)
hold on; box on; axis equal
plot(real(etb),imag(etb),'b','LineWidth',1.5)
plot(real(vu),imag(vu),'ob','MarkerFaceColor','b')
plot(real(vg),imag(vg),'ob','MarkerFaceColor','b')
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
%
text(-1.75,0,'$G$','FontSize',20)
text(-0.25,0,'$D$','FontSize',20)
%
text(cos(thet)-0.1,sin(thet)-0.25,'$e^{i\theta}$','FontSize',20)
text(cos(thet)-0.1,-sin(thet)+0.2,'$e^{-i\theta}$','FontSize',20)
%
text(beta*cos(thet)+0.15,beta*sin(thet)+0.0,'$\beta e^{i\theta}$','FontSize',20)
text(beta*cos(thet)+0.15,-beta*sin(thet)+0.0,'$\beta e^{-i\theta}$','FontSize',20)
%
text(beta^2*cos(thet)-0.05,beta^2*sin(thet)+0.2,'$\beta^2 e^{i\theta}$','FontSize',20)
text(beta^2*cos(thet)-0.10,-beta^2*sin(thet)-0.25,'$\beta^2 e^{-i\theta}$','FontSize',20)
%
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis([-2.5 2.5 -2.5 2.5])
print -depsc figrecann
%%