% FILE: makefig15.m (data) for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  2^13;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
beta     = 1.25;
thetv    =  pi.*[0.005:0.001:0.008,linspace(0.01,0.55,21),linspace(0.56,0.61,11),...
                 linspace(0.62,0.9,21),0.91:0.01:0.99,0.992:0.001:0.995].';
%
for k=1:length(thetv)
    thet =  thetv(k); 
    v    = [exp(-i*thet) beta*exp(-i*thet) beta*exp(i*thet) exp(i*thet)];
    c    = [inf          0                 inf              0          ];
    d    = [0            1                 0                1          ];
    %
    mod(k,1) = modplg(v,c,d,v,n,'b',0.9*cos(thet));
end
%%
% [thetv./pi mod]
[thetv mod]
%%