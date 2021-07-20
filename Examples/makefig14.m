% FILE: makefig14.m for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  3*2^12;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
thet     =  pi/6;   beta  = 1.5;
v        = [exp(-i*thet)  beta*exp(-i*thet)  beta*exp(i*thet)  exp(i*thet)];
c        = [inf               0              inf           0              ];
d        = [0                 1              0             1              ];
m        =  length(v);
%
[et,etp] =  plgsegcirarcp(v,c,d,n/m);
alpha    =  0;
[zet,zetp,c,S,~] = mapdisk(et,etp,n,alpha,'b');
wv = zet(1:n/m:end);
%%
for k=1:10
    crcw{k} = ((k-0.1)/10).*exp(i*linspace(0,2*pi,1000));
    crcz{k} = fcau(zet,zetp,et,crcw{k});
end
%%
for k=1:10
    crvz{k} = ((k-0.1)/10).*exp(i*linspace(0,2*pi,1000));
    crvw{k} = fcau(et,etp,zet,crvz{k});
end
for k=11:15
    crvz{k} = ((k-0.1)/10).*exp(i*linspace(-pi/6+1e-6,pi/6-1e-6,1000));
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
for k=1:10
    plot(real(crcz{k}),imag(crcz{k}),'r','LineWidth',1.0);
end
for j=1:m
    plot(real(v(j)),imag(v(j)),'sk','MarkerFaceColor',cmap(j,:));
end
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))   
xticks(-1.0:0.5:1.5)
set(gca,'FontSize',18)
axis([-1.25 1.75 -1.5  1.5])
print -depsc gearfig1t
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(zet),imag(zet),'b','LineWidth',1.5)
hold on; box on
for k=1:15
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
print -depsc gearfigd1t
%%