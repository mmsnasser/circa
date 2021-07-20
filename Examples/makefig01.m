% %FILE: makefig01.m for CIRCA
% 6-5-2021
% Compute the capacity of the quadrilatera (A;r,s,e^(i*sigm),e^(i*beta))
% where A is the half-disk
clc;clear; 
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
n =  2^10;
v = [0    2    2+2i   2i ];
c = [1-i  1+i  inf    inf];
d = [-1   1    0      0  ];
%
z1 = 1+(sqrt(2)-1)*i;  z2 = 1+sqrt(2)+i;  z3 = 1.5+2i;  z4 = 1.5i;
vq = [z1,z2,z3,z4];
mod = modplg(v,c,d,vq,n,'b');
%%

%%
[et,etp]=plgsegcirarcp(v,c,d,n/4);
figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(et),imag(et),'k','LineWidth',1.5)
hold on
plot(real(z1),imag(z1),'ok','LineWidth',1.5,'MarkerSize',10)
plot(real(z2),imag(z2),'pk','LineWidth',1.5,'MarkerSize',10)
plot(real(z3),imag(z3),'dk','LineWidth',1.5,'MarkerSize',10)
plot(real(z4),imag(z4),'sk','LineWidth',1.5,'MarkerSize',10)
text(real(z1)+0.03,imag(z1)-0.08,'$z_1$','FontSize',20)
text(real(z2)-0.20,imag(z2)+0.08,'$z_2$','FontSize',20)
text(real(z3)+0.02,imag(z3)-0.07,'$z_3$','FontSize',20)
text(real(z4)+0.05,imag(z4)+0.06,'$z_4$','FontSize',20)
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.5;
ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))
axis([-0.2 2.6 -0.1 2.1])
print -depsc plgmixD1
%%
alpha      = FindAlpha(et,v,vq);
[zet,zetp,~,St] = mapdisk(et,etp,n,alpha,'b');
t    = (0:2*pi/n:2*pi-2*pi/n)';
ht1  =  Findt(vq(1),et);
St1  =  tripoly(St-t,ht1)+ht1;
w1   =  exp(i*St1);
ht2  =  Findt(vq(2),et);
St2  =  tripoly(St-t,ht2)+ht2;
w2   =  exp(i*St2);
ht3  =  Findt(vq(3),et);
St3  =  tripoly(St-t,ht3)+ht3;
w3   =  exp(i*St3);
ht4  =  Findt(vq(4),et);
St4  =  tripoly(St-t,ht4)+ht4;
w4   =  exp(i*St4);
figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(real(zet),imag(zet),'k','LineWidth',1.5)
hold on
plot(real(w1),imag(w1),'ok','LineWidth',1.5,'MarkerSize',10)
plot(real(w2),imag(w2),'pk','LineWidth',1.5,'MarkerSize',10)
plot(real(w3),imag(w3),'dk','LineWidth',1.5,'MarkerSize',10)
plot(real(w4),imag(w4),'sk','LineWidth',1.5,'MarkerSize',10)
text(real(w1)+0.05,imag(w1)+0.05,'$w_1$','FontSize',20)
text(real(w2)-0.22,imag(w2)+0.06,'$w_2$','FontSize',20)
text(real(w3)+0.05,imag(w3)+0.05,'$w_3$','FontSize',20)
text(real(w4)+0.05,imag(w4)+0.00,'$w_4$','FontSize',20)
% plot(0,1.09,'+k','LineWidth',0.5,'MarkerSize',10)
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.5;
ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))
axis([-1.4 1.4 -1.075 1.075])
print -depsc plgmixDD1
%%