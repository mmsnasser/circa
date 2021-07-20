% FILE: makefig11.m for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n   =  2^13;
%
kv  =  linspace(0.0511,0.7306,10);
kv  =  [0.02787,0.031,0.0345,0.039,0.045,0.052,0.06,0.07,0.09,linspace(0.11,0.7306,20)];
for j=1:length(kv)
    j
    k     =  kv(j);
    bv(j) =  1/mypsi(k);
    b     =  bv(j);
    %
    v        = [1     0    b*i    1+b*i];
    c        = [inf   inf  inf    inf  ];
    d        = [0     0    0      0    ];
    %
    emodn(j,1)  =  modplg(v,c,d,v,n,'u');
    emodex(j,1) =  mu(k)/pi;
    rerr(j,1)   =  abs(emodex(j,1)-emodn(j,1))/emodex(j,1);
end
%%
for j=1:length(kv)
    fprintf('%1.14f \t %1.14f \t %1.14f \t %1.2s \n', bv(j), emodex(j), emodn(j), rerr(j))
end
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
semilogy(bv,rerr,'b','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
xlabel('$b$','FontSize',18,'Interpreter','latex');
ylabel('Relative Error','FontSize',18,'Interpreter','latex');
set(gca,'LooseInset',get(gca,'TightInset'))   
% axis([0 5 1e-15  1e-12])
set(gca,'FontSize',18)
print -depsc emodrecerr
%%
