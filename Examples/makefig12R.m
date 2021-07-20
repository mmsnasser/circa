% FILE: makefig12.m (right) for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  2^13;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
v        = [-3/25+21i/25  42/25+4i 1  0];
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
axis([-0.5 2.0 -0.5  4.5])
set(gca,'FontSize',18)
print -depsc emodplg2fig
%%
