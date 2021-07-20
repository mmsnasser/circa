% FILE: maketab05.m (right) for CIRCA
% 
clear
addpath ../bie;addpath ../fmm;addpath ../files;
%
n        =  2^13;
t        = (0:2*pi/n:2*pi-2*pi/n)';
%
v        = [-3/25+21i/25  42/25+4i 1  0];
c        = [inf   inf  inf  inf];
d        = [0     0    0    0];
%
format long g
mod = modplg(v,c,d,v,n,'u')
%%
