function x = mu (r)
% mu.m
% Compute the normalized quotient of elliptic integrals mu(r) where
% m(r)=(pi/2)*K'(r)/K(r)
% See Equation (5.1) in: G. D. Anderson, M. K. Vamanamurthy, and M.
% Vuorinen: Conformal invariants, inequalities and quasiconformal maps.  
% J. Wiley, 1997.
%
% To obtaine accurate values of mu(r) using the MATLAB function ellipk.m, 
% we use MATLAB symbolic computation 
%     
if r>0.9
    % If r>0.9, we use the formula (5.4) in the above book
    rp = sqrt(1-r^2);
    rr = (1-rp)/(1+rp);
    x  = 0.5*mu(rr);
elseif r<0.1
    % If r<0.1, we use the third formula in (5.2) in the above book
    x=2*mu(2*sqrt(r)/(1+r));
else
    [K,~]  = ellipke(r^2);
    [Kp,~] = ellipke(1-r^2);
    x= (pi/2)*Kp/K;
end