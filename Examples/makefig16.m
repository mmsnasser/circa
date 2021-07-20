% FILE: makefig16.m for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  3*2^12;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
coef     = [exp(i*pi/6)           0         1
            exp(i*pi/2)           inf       0
            2*exp(i*pi/2)         0         1
            2*exp(3i*pi/4)        inf       0
            1.5*exp(3i*pi/4)      0         1
            1.5*exp(i*pi)         inf       0
            1.25*exp(i*pi)        0         1
            1.25*exp(3i*pi/2)     inf       0
            0.75*exp(3i*pi/2)     0         1
            0.75*exp(11i*pi/6)    inf       0
            1.75*exp(11i*pi/6)    0         1
            1.75*exp(i*pi/6)      inf       0
            ];
%
v        = coef(:,1);
c        = coef(:,2);
d        = coef(:,3);
m        =  length(v);
%
[et,etp] =  plgsegcirarcp(v,c,d,n/m);
alpha    =  0;
[zet,zetp,c,S,~] = mapdisk(et,etp,n,alpha,'b');
wv = zet(1:n/m:end);
%
for k=1:10
    crcw{k} = ((k-0.1)/10).*exp(i*linspace(0,2*pi,2000));
    crcz{k} = fcau(zet,zetp,et,crcw{k});
end
%%
for k=1:20
    cv      =  [];
    cv      = ((k-0.1)/10).*exp(i*linspace(0,2*pi,1000));
    in = []; on = [];
    [in,on] = inpolygon(real(cv),imag(cv),real(et),imag(et)); 
    cv(on)  = NaN+i*NaN;
    cv(~in) = NaN+i*NaN;
    crvz{k} = cv;
    cv      = cv(abs(cv)>0);
    cvw     = fcau(et,etp,zet,cv);
    crvw{k} = (1+i)*NaN(size(crvz{k}));
    crvw{k}(abs(crvz{k})>0) = cvw;
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
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))   
xticks(-1.5:1:1.5)
axis([-1.75 2 -1.5  2.25])
print -depsc gearfig12t
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(zet),imag(zet),'b','LineWidth',1.5)
hold on; box on
for k=1:20
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
print -depsc gearfigd12t
%%