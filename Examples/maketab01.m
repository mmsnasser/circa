% %FILE: maketab01.m for CIRCA
% 16-5-2021 
% Compute the capacity of the quadrilatera (A;r,s,e^(i*sigm),e^(i*beta))
% where A is the half-disk
clc;clear; 
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
coef=[-0.8   0.2   pi/8   pi/3
      -0.5   0.3   pi/6   2*pi/5
      -0.2   0.5   pi/5   pi/2
       0.2   0.6   pi/4   3*pi/5
       0.2   0.8   pi/4   4*pi/5];
%%
tau=@(t)(pi/mu(1/sqrt(1+t)));
mym=@(z)((1+z)/(1-z));
absrat=@(a,b,c,d)abs(a-c)*abs(b-d)/(abs(a-b)*abs(c-d));
myf=@(r,s,a,b)(0.5*tau(absrat(mym(exp(i*b))^2,...
    mym(r)^2,mym(s)^2, mym(exp(i*a))^2)-1));
%%
n =   2^13;
%
v = [-1   1];
c = [inf  0];
d = [0    1];
%%
for k=1:length(coef(:,1))
    %
    z1 = coef(k,1); z2 = coef(k,2); z3 = exp(i*coef(k,3)); z4 = exp(i*coef(k,4));
    vq = [z1,z2,z3,z4];
    modn(k,1) =  modplg(v,c,d,vq,n,'b');
    mode(k,1) =  myf(coef(k,1),coef(k,2),coef(k,3),coef(k,4));
    %
end
rerr = abs(mode-modn)./mode;
%%
for k=1:length(coef(:,1))
    fprintf('%1.14f \t %1.14f \t %1.2s \n', mode(k), modn(k), rerr(k))
end
%%