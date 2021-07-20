% FILE: makefig05.m for CIRCA
% 16-5-2021 (new version)
clc; clear
addpath ../bie;addpath ../fmm;addpath ../files;
[xv,yv]  =  meshgrid(linspace(1,3,41)); 
zv       =  xv+i*yv;
n        =  2^13;
%%
[mv,nv] = size(zv);
for k=1:mv
    for j=1:nv
        a  = real(zv(k,j))
        b  = imag(zv(k,j))
        v1 = i; v2 = 0; v3 = b; v4 = a+i;
        %
        v   = [v1   v2   v3   v4   ];
        c   = [inf  inf  inf  inf  ];
        d   = [0    0    0    0    ];
        %
        z1   = v1; z2 = v2; z3 = v3; z4 = v4;
        vq   = [z1   z2   z3   z4   ];
        %
        modn(k,j) =  2*modplg(v,c,d,vq,n,'b');
        %
        % Using SC Toolbox
        options = scmapopt('Tolerance',1e-14); 
        p=polygon(v); 
        fsc = rectmap(p,[2 3 4 1],options);
        prevertsc = get(fsc,'prevert');
        vv = (prevertsc+prevertsc(1))./(2*prevertsc(1));
        modsc(k,j) = 2*imag(vv(2));
        %
    end
    %
end
%%
modn
modsc
abs(modn-modsc)
% save('x_pt.mat', 'xv', '-ascii', '-double');
% save('y_pt.mat', 'yv', '-ascii', '-double');
% save('modn_pt.mat', 'modn', '-ascii', '-double');
% save('modsc_pt.mat', 'modsc', '-ascii', '-double');
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
cntv  =  [0:0.25:10];
[cnt1,cnt2] = contour(xv,yv,modn,cntv,'b','LineWidth',1.5);
clabel(cnt1,cnt2,'labelspacing',600,'FontSize',18,'Interpreter','latex');
% hold on; box on
axis equal
axis([1  3  1  3])
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
xlabel('$a$','FontSize',18,'Interpreter','latex');
ylabel('$b$','FontSize',18,'Interpreter','latex');
set(gca,'FontSize',18)
% clabel(cnt1, 'manual','FontSize',18,'Color','k')
set(gca,'LooseInset',get(gca,'TightInset'))   
axis([1  3  1  3])
print -depsc trapsyun
%%
figure
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
surf(xv,yv,abs(modsc-modn));
colormap hsv
shading interp
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
xlabel('$a$','FontSize',18,'Interpreter','latex');
ylabel('$b$','FontSize',18,'Interpreter','latex');
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))   
print -depsc trapsyuerr
%%