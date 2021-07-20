% FILE: maketab06.m for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  6*2^10;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
v        = [exp(i*pi/5) 0.75*exp(i*pi/5) 0.75*exp(3i*pi/5) 1.25*exp(3i*pi/5) 1.25*exp(3i*pi/2) exp(3i*pi/2)];
c        = [inf         0                inf                0                  inf               0           ];
d        = [0           1                0                  1                  0                 1           ];
m        =  length(v);
%
[et,etp] =  plgsegcirarcp(v,c,d,n/m);
alpha    =  0;
[zet,zetp,c,S,~] = mapdisk(et,etp,n,alpha,'b');
format long g
wv = zet(1:n/m:end)
%%
