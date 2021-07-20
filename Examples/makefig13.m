% FILE: makefig13.m for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  6*2^10;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
v        = [exp(i*pi/5) 0.75*exp(i*pi/5) 0.75*exp(3i*pi/5) 1.25*exp(3i*pi/5) 1.25*exp(3i*pi/2) exp(3i*pi/2)];
c        = [inf         0                inf                0                  inf               0           ];
d        = [0           1                0                  1                  0                 1           ];
m        =  length(v);
%
[et,etp] =  plgsegcirarcp(v,c,d,n/m);
alpha    =  0;
[zet,zetp,c,S,~] = mapdisk(et,etp,n,alpha,'b');
wv = zet(1:n/m:end);
%%
crcw{1} = 0.30.*exp(i*linspace(0,2*pi,100));
crcw{2} = 0.45.*exp(i*linspace(0,2*pi,100));
crcw{3} = 0.60.*exp(i*linspace(0,2*pi,100));
crcw{4} = 0.75.*exp(i*linspace(0,2*pi,100));
crcw{5} = 0.90.*exp(i*linspace(0,2*pi,100));
for k=1:5
    crcz{k} = fcau(zet,zetp,et,crcw{k});
end
%%
crvz{1} = 0.19.*exp(i*linspace(0,2*pi,100));
crvz{2} = 0.56.*exp(i*linspace(0,2*pi,100));
crvz{3} = 0.88.*exp(i*linspace(3*pi/5+1e-6,2*pi+pi/5-1e-6,100));
crvz{4} = 1.13.*exp(i*linspace(3*pi/5+1e-6,3*pi/2-1e-6,100));
for k=1:4
    crvw{k} = fcau(et,etp,zet,crvz{k});
end
%%
figure
colormap prism;
cmap=colormap;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(et),imag(et),'b','LineWidth',1.5)
hold on; box on
for k=1:5
    plot(real(crcz{k}),imag(crcz{k}),'r','LineWidth',1.0);
end
for j=1:m
    plot(real(v(j)),imag(v(j)),'sk','MarkerFaceColor',cmap(j,:));
end
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
axis equal
axis([-1.5 1.5 -1.5  1.5])
set(gca,'LooseInset',get(gca,'TightInset'))   
xticks(-1.5:1:1.5)
set(gca,'FontSize',18)
print -depsc gearfigg6
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(zet),imag(zet),'b','LineWidth',1.5)
hold on; box on
for k=1:4
    plot(real(crvw{k}),imag(crvw{k}),'r','LineWidth',1.0);
end
for j=1:m
    plot(real(wv(j)),imag(wv(j)),'sk','MarkerFaceColor',cmap(j,:));
end
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))   
axis equal
axis([-1.2 1.2 -1.2  1.2])
print -depsc gearfigdg6
%%