function alpha = FindAlpha2(et,ver,vq)
% 30-4-2021
% to compute a suitable interior point in a ploygon
% 
d1 = abs(ver(1)-ver(2));
for k=1:length(ver)-1
    for j=k+1:length(ver)
        if d1>abs(ver(k)-ver(j))
            d1 = abs(ver(k)-ver(j));
        end
    end
end
d = 0.5*d1;
%
a = mean(vq);
if ( isInteriorPoint(a,et,d) )
    if min(abs(et-a))>=d
        alpha = a;
        return;
    end        
end
%
if ( isInteriorPoint(-a,et,d) )
    if min(abs(et+a))>=d
        alpha = -a;
        return;
    end        
end
%
n          =  length(et);
m          =  length(ver);
[dis,ind]  =  min(abs(et-a));
b          =  et(ind);
ver(end+1) =  ver(1);
L          =  floor(ind*m/n)+1; 
vec        =  i*(ver(L+1)-ver(L))/abs(ver(L+1)-ver(L));
%
if ( isInteriorPoint(a,et,d) )
    alpha = a;
    alpha = ImproveAlpha(alpha,d,vec);
else
    alpha = b+0.05*d*vec;
    alpha = ImproveAlpha(alpha,d,vec);
end
%
%
% 
%
function alpha = ImproveAlpha(alpha,d,vec)
% This function improve the value of alpha be chosing another value that 
% is far from the boundary of the polygon
alpha1 = alpha+0.05*d*vec; alpha2 = alpha-0.05*d*vec;
r = min(abs(et-alpha)); r1 = min(abs(et-alpha1)); r2= min(abs(et-alpha2));
if (r>=r1) & (r>=r2)
    return;
end
if r<r1
    c = 1; 
else
    c = -1;
end
for k=1:50
    alpha1   =  alpha+0.05*c*d*vec;
    r = min(abs(et-alpha)); r1 = min(abs(et-alpha1));
    if r>r1
        break;
    end
    alpha = alpha1;
%     figure(101);
%     plot(real(alpha),imag(alpha),'sk')
end
if ( isInteriorPoint(alpha,et,d) )
    return;
else
    error('No interior point "alpha or z1" found by this method. Choose "alpha or z1" manualy.')
end
end
% 
% 
function out = isInteriorPoint(aa,gamma,d)
%ISINTERIORPOINT   Check if a is in the interior of gamma.
gamma = [gamma; gamma(1)];                      % Last point = first point.
argchange = unwrap(angle(gamma-aa));             % Continuous arg(f) along gamma.
winding = (argchange(end)-argchange(1))/(2*pi); % Change of Argument.
out = ( abs(winding) > 0.5 );
if min(abs(gamma-aa))<0.01*d;
    out = 0;
end
end
%
end
