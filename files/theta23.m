function y = theta23(kind, z , q , tol)
% theta23.m
% computes the theta functions; only for theta_2 and theta_3 where z=0
% and q is a positive real number.
%
nmax = max(ceil(log(tol)/log(q)),20);
s=0;
if ( kind == 2)
    for j=nmax:-1:0
        s =s+q^((j+1/2)^2);
    end
    s = 2*s;
end
if ( kind == 3)
   for j=nmax:-1:1
     s =s+q^(j^2);
   end
   s = 1+2*s;
end
y = s;
end