% FILE: makefig15.m (data) for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  2^13;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
beta     =  2;
thetv    =  pi.*[0.02:0.01:0.08,linspace(0.1,0.6,21),linspace(0.61,0.7,21),...
                 linspace(0.71,0.9,15),0.91:0.01:0.98].';

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
[thetv mod]
%%
[thetv./pi mod]
%%