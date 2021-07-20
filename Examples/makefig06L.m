% FILE: makefig06.m (left) for CIRCA
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
sigm  =  0.125;  beta = 0.25 ; eps = 0.25;  L  = 2;
%
v1     =  0;
v2     =  1+tan(sigm*pi)*i;
v3     =  1+(L+tan(beta*pi))*i;
v4     =  L*i;
%
de     = -(L/2)*tan(pi*eps/2);
cent   =  (-cot(eps*pi)*L+L*i)/2;
%
v      = [v1   v2   v3   v4  ];
c      = [inf  inf  inf  cent];
d      = [0    0    0    -1  ];
%
n      =  2^12;
% 
vq     =  v;
%
modn   =  modplg(v,c,d,vq,n,'b');
%%
vq2    = [v2   v3   v4  v1];
modn2  = modplg(v,c,d,vq2,n,'b');
%%
1-modn*modn2
%%
[et,etp]=plgsegcirarcp(v,c,d,n/4);
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(et),imag(et),'b','LineWidth',1.5)
hold on; box on
grid on; grid('minor')
plot([0 1.0],[0 0],'--k','LineWidth',1.0)
plot([0 1.0],[2 2],'--k','LineWidth',1.0)
plot([0 0],[0 1.0],'--k','LineWidth',1.0)
plot([0 0.8],[0 0.8],'--k','LineWidth',1.0)
arc1 =  0.5.*exp(i.*linspace(0,sigm*pi,100));
plot(real(arc1),imag(arc1),'k','LineWidth',0.5)
arc2 =  2i+0.5.*exp(i.*linspace(0,beta*pi,100));
plot(real(arc2),imag(arc2),'k','LineWidth',0.5)
arc3 =  0.5.*exp(i.*linspace(pi/2-eps*pi,pi/2,100));
plot(real(arc3),imag(arc3),'k','LineWidth',0.5)
text(0.5025,0.125,'$\sigma\pi$','FontSize',18)
text(0.5025,2.25,'$\beta\pi$','FontSize',18)
text(0.075,0.575,'$\epsilon\pi$','FontSize',18)
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([-0.2 1.2 -0.2 3.19])
xticks([0 1])
xticklabels({'0','1'})
yticks([0 2])
yticklabels({'0','L'})
print -depsc trap1
%%
% figure
% hold on; box on
% plot(real(et),imag(et),'b','LineWidth',1.5)
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
% set(gca,'FontSize',18)
% axis equal
% set(gca,'LooseInset',get(gca,'TightInset'))   
% axis([-0.2 1.2 -0.2 3.2])
% set(gca,'FontSize',18)
% print -depsc trap1
%%
