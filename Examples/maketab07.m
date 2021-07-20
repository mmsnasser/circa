% FILE: maketab07.m for CIRCA
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
format long g
wv = zet(1:n/m:end)
%%
