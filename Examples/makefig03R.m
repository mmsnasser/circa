% FILE: makefig03.m (right) for CIRCA
% trapezoid (see page 14 in: Tiago Anselmo et al 2020 J. Phys. A: Math.
% Theor. 53, 355201)
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;addpath ../sc;
Lv  =  linspace(1.02,5,41)'; 
n   =  2^13;
%%
for k=1:length(Lv)
    L  = Lv(k);
    v1 = 0; v2 = 1; v3 = 1+L*i; v4 = (L-1)*i;
    v   = [v1   v2   v3   v4   ];
    c   = [inf  inf  inf  inf  ];
    d   = [0    0    0    0    ];
    %
    z1 = v1; z2 = v2; z3 = v3; z4 = v4;
    vq  = [z1   z2   z3   z4   ];
    %
    modn(k,1) =  modplg(v,c,d,vq,n,'b');
    %
    % Find the exact value of the modulus
    lam  =  invmu(pi/(2*(2*L-1)));
    lamp =  sqrt(1-lam^2);
    kap  = (1-2*lam*lamp)/(1+2*lam*lamp);
    mode(k,1) =  pi/(2*mu(kap));
    %
    rerr(k,1) =  abs(mode(k,1)-modn(k,1))/mode(k,1);
    %
    options = scmapopt('Tolerance',1e-14); 
    p=polygon(v); 
    fsc = rectmap(p,[2 3 4 1],options);
    prevertsc = get(fsc,'prevert');
    vv = (prevertsc+prevertsc(1))./(2*prevertsc(1));
    modsc(k,1) = imag(vv(2));
    rerrsc(k,1) =  abs(mode(k,1)-modsc(k,1))/mode(k,1);
    %
end
%%
for k=1:length(Lv)
    fprintf('%1.14f \t %1.14f \t %1.2s \n', mode(k), modn(k), rerr(k))
end
n
for k=1:length(Lv)
    fprintf('%1.14f \t %1.14f \t %1.2s \n', mode(k), modsc(k), rerrsc(k))
end
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
semilogy(Lv,rerr,'--b','LineWidth',1.5)
hold on; box on
semilogy(Lv,rerrsc,'-.r','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
xlabel('$L$','FontSize',18,'Interpreter','latex');
ylabel('Relative Error','FontSize',18,'Interpreter','latex');
legend({'Our Method','SC Toolbox'},...
    'Location','northwest','Interpreter','latex')
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([1 5 1e-16  1e-4])
set(gca,'FontSize',18)
print -depsc trapezoiderr
%%