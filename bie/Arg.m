function  y   =   Arg (z,alp)
%This function compute the angle of z such that alp<=angle(z)<alp+2*pi
%
%
%%
if (nargin == 1)
    alp=0;
end
%%
[n,m] =  size(z);
gamg  =  angle(z);
for k=1:n
    for j=1:m
        while (gamg(k,j)<alp | gamg(k,j)>=2*pi+alp)
            gamg(k,j) = gamg(k,j)+sign(alp-gamg(k,j))*2*pi;
        end
    end
end
%%
y  =  gamg;
end