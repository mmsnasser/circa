% FILE: makefig07.m for CIRCA
% trapezoid (see page 14 in: Tiago Anselmo et al 2020 J. Phys. A: Math.
% Theor. 53, 355201)
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
esp   =  0;  beta = 0.25 ;   L  = 2;
%
v1     =  0;
v3     =  1+(L+tan(beta*pi))*i;
v4     =  L*i;
%
n      =  2^12;
t      = (0:2*pi/n:2*pi-2*pi/n).';
sigmv  =  linspace(0,0.25,40)';
%%
for k=1:length(sigmv)
    sigm =  sigmv(k);
    %
    v2     =  1+tan(sigm*pi)*i;
    v   = [v1   v2    v3    v4   ];
    c   = [inf  inf   inf   inf];
    d   = [0    0     0     0];
    %
    vq  =  v;
    modn(k,1) =   modplg(v,c,d,vq,n,'b');
    %
    hL = L+(1/pi)*(psi(0.5+beta)+psi(0.5-sigm)-2*psi(0.5));
    t0 = 16*exp(-pi*hL)*(1-8*(1+4*sigm*beta)*exp(-pi*hL)+4*(11+4*sigm^2+...
     4*beta^2+128*sigm*beta+304*sigm^2*beta^2)*exp(-2*pi*hL));
    kap = sqrt(t0);
    modc(k,1) =  2*mu(kap)/pi;
end
%%
[sigmv modn modc]
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
semilogy(sigmv,abs(modn-modc),'b','LineWidth',1.5)
hold on; box on
xlabel('$\sigma$','FontSize',18,'Interpreter','latex');
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([0 0.25 1e-8 1e-4])
print -depsc trap2eps
%%
