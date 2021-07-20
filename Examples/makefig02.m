% %FILE: makefig02.m for CIRCA
% 16-5-2021 
% Compute the capacity of the quadrilatera (A;r,s,e^(i*sigm),e^(i*beta))
% where A is the half-disk
clc;clear; 
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
z1 = -0.5; z2 = 0.7; z3 = exp(i*0.25*pi); z4 = exp(i*0.6*pi);
vq = [z1,z2,z3,z4];
%
tau=@(t)(pi/mu(1/sqrt(1+t)));
mym=@(z)((1+z)/(1-z));
absrat=@(a,b,c,d)abs(a-c)*abs(b-d)/(abs(a-b)*abs(c-d));
myf=@(r,s,a,b)(0.5*tau(absrat(mym(b)^2,mym(r)^2,mym(s)^2,mym(a)^2)-1));
%
n =  2^12;
v = [-1   1];
c = [inf  0];
d = [0    1];
%
modn = modplg(v,c,d,vq,n,'b')
mode  =  myf(z1,z2,z3,z4)
err   =  abs(mode-modn)
%%
[et,etp]=plgsegcirarcp(v,c,d,n/2);
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
%%
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
axis([-1.1 1.1 -0.1 1.1])
print -depsc cfig03
%%
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
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.5;
ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
axis([-1.1 1.1 -1.1 1.1])
set(gca,'LooseInset',get(gca,'TightInset'))
%%