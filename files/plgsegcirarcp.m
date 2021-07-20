function   [et,etp]=plgsegcirarcp(ver,cent,dir,ns)
% plgsegcirarcp.m
% Nasser, April 29, 2021
% This function compute the discretization of the parametrization of a
% polygon with mixed of segments and circular arcs sides
% 
% WARNING: we should not have cusp!
% 
% where
% ver: the vertices of the polygon 
% cent: the center of the arcs (for segments, cent=inf)
% dir: dir=1 for coutnerclockwise oriented circular arc, dir=-1 for 
% clockwise oriented circular arc, dir=0 for gegments
% ns: is the number of graded points on each side of the polygon. The total
% 
% The graded mesh points are computed by the function "deltw.m".
% 
% 
% 
m  =  length(cent); % number of vertices
p  =  3; %  grading parameter
n  =  m*ns; % total number of graded points on the whole polygon
t  = (0:2*pi/n:2*pi-2*pi/n).';
[s,sp] =  deltw(t,m,p);
for j=1:m
    sv{j}  =  s((j-1)*n/m+1:j*n/m);
    svp{j} =  sp((j-1)*n/m+1:j*n/m);
end
%
ver(m+1) = ver(1);
for k=1:m
    ang{k}    = angle([ver(k)-cent(k),ver(k+1)-cent(k)]);
    if dir(k)>0 & (ang{k}(2)<ang{k}(1))
        ang{k}(2)=ang{k}(2)+2*pi;
    elseif dir(k)<0 & (ang{k}(1)<ang{k}(2))
        ang{k}(1)=ang{k}(1)+2*pi;
    end    
end
for k=1:m
    if dir(k)==0
        et (1+(k-1)*n/m:k*n/m,1)= ver(k)+(m/(2*pi))*(ver(k+1)-ver(k)).*(sv{k}-sv{k}(1));
        etp(1+(k-1)*n/m:k*n/m,1)= (m/(2*pi))*(ver(k+1)-ver(k)).*svp{k};
    else
        rad(k) =  abs(ver(k)-cent(k));
        alp(k) =  ang{k}(1);
        bet(k) =  ang{k}(2);
        thet   = (m*(bet(k)-alp(k))/(2*pi)).*s(1+(k-1)*n/m:k*n/m)+k*alp(k)-(k-1)*bet(k);
        thetp  = (m*(bet(k)-alp(k))/(2*pi)).*sp(1+(k-1)*n/m:k*n/m);
        et (1+(k-1)*n/m:k*n/m,1)= cent(k)+rad(k).*exp(i.*thet);
        etp(1+(k-1)*n/m:k*n/m,1)= rad(k).*exp(i.*thet).*(i.*thetp);
    end
end
%
end