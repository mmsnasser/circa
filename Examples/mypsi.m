function a = mypsi(k)
% Compute the function psi in Eq. (), page 4 in:
% HRV, Computation of exterior moduli of quadrilaterals, ETNA, 40 (2013),
% pp. 436-451
% 
[K ,E ] = ellipke(k^2,1e-15);
[Kp,Ep] = ellipke(1-k^2,1e-15);
% 
a = 2*(E-(1-k)*K)/(Ep-k*Kp);
end
