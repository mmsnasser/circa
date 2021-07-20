% FILE: makefig06.m (right) for CIRCA
% trapezoid (see page 14 in: Tiago Anselmo et al 2020 J. Phys. A: Math.
% Theor. 53, 355201)
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
sigm  =  0.125;  beta = 0.25 ;   L  = 2;
%
v1     =  0;
v2     =  1+tan(sigm*pi)*i;
v3     =  1+(L+tan(beta*pi))*i;
v4     =  L*i;
%
n    =  2^12;
t    = (0:2*pi/n:2*pi-2*pi/n).';
epsv =  linspace(0.0001,0.25,40);
%%
for k=1:length(epsv)
    eps =  epsv(k);
    cent=  (-cot(eps*pi)*L+L*i)/2;
    %
    v   = [v1   v2        v3       v4   ];
    c   = [inf  inf      inf     cent];
    d   = [0    0        0      -1];
    %
    vq    =  v;
    rv(k) =  modplg(v,c,d,vq,n,'b');
end
%%
[epsv' rv']
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
plot(epsv,rv,'b','LineWidth',1.5)
xlabel('$\epsilon$','FontSize',18,'Interpreter','latex');
ylabel('Modulus','FontSize',18,'Interpreter','latex');
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))   
print -depsc trap1eps
%%
