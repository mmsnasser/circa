function x=invmu(y)
% invmu.m
% Compute the inverse normalized quotient of elliptic integrals;  mu^-1(r);
% where m(r)=(pi/2)*K'(r)/K(r)
% See Equation (5.1) in: G. D. Anderson, M. K. Vamanamurthy, and M.
% Vuorinen: Conformal invariants, inequalities and quasiconformal maps.  
% J. Wiley, 1997.
%
% 
q    =  exp(-2*y);
x    = (theta23(2,0,q,1e-16)/theta23(3,0,q,1e-16)).^2;
end