% FILE: makefig12.m (left) for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  2^13;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
v        = [-19/25+21i/25  28/25+69i/50 1  0];
c        = [inf   inf  inf  inf];
d        = [0     0    0    0];
%
mod = modplg(v,c,d,v,n,'u')
%%
[et,etp] =  polygonp(v,n/4);
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(et),imag(et),'b','LineWidth',1.5)
hold on; box on
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([-1 1.5 -0.25  1.5])
set(gca,'FontSize',18)
print -depsc emodplg1fig
%%
