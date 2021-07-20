function ta = Findt(a,et)
% Findt.m
% 7-5-2021
% Find the value of the parameter t such that s(t)=a where 0<=a<=2pi
% Here, s(t) is the function delta(t) defined in ***.
% 
n   =   length(et);
tv  =  (0:2*pi/n:2*pi-2*pi/n)';
%
[p,q] = min(abs(a-et));
%
options = optimset('TolX',1e-14);
if p<1e-14
    ta = tv(q);
else
    t0 = tv(q);
    re = real(et-a);
    im = imag(et-a);
    fr = @(t)(tripoly(re,t));
    fi = @(t)(tripoly(im,t));
    if abs(fr(t0))<1e-14
        ta = fzero(fi,t0,optimset('TolX',1e-15)); 
    elseif abs(fi(t0))<1e-14
        ta = fzero(fr,t0,optimset('TolX',1e-15)); 
    else
        tar = fzero(fr,t0,optimset('TolX',1e-15)); 
        tai = fzero(fi,t0,optimset('TolX',1e-15)); 
        if abs(tar-tai)>1e-10
            d  = re.^2+im.^2;
            fd = @(t)(tripoly(d,t));
            ta = fminbnd(fd,tv(q-1),tv(q+1),optimset('TolX',1e-16));
        else
            ta = (tar+tai)/2;
        end
    end
end
%
end