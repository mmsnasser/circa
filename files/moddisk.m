function r = moddisk(z1,z2,z3,z4)
% moddisk.m
% 15-5-2021
% This function compute the exact modulus of the quadrilateral
% (D;z_1,z_2,z_3,z_4) where D is the unit disk and z_1,z_2,z_3,z_4 are four
% points on the boundary in counterclockwise.
% We use the analytic formula in Eq. (2.6.1) in: Papamichael, 
% Stylianopoulos, Numerical Conformal Mapping.
% 
cr  = @(a,b,c,d)(abs(a-c)*abs(b-d)/(abs(a-b)*abs(c-d)));
k   =  cr(z1,z2,z3,z4);
r   =  2*mu(1/sqrt(k))/pi;
end