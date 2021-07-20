function   mod = modplg(v,c,d,vq,n,type,a)
% 30-04-2021
% This function compute the modulus of a polygonal or a circular arc
% polygonal domain with "L" vertices.
% r = Mod(G,vq(1),vq(2),vq(3),vq(4)), 
% i.e., the vertix "vq(1)" is mapped onto 0
%       the vertix "vq(2)" is mapped onto 1
%       the vertix "vq(3)" is mapped onto 1+r*i
%       the vertix "vq(4)" is mapped onto r*i
%
% Here: a=alpha for bounded domain and a=z1 for unbounded domain
%
[et,etp]=plgsegcirarcp(v,c,d,n/length(v));
if( nargin == 6 ) 
    if type=='b' 
        a      = FindAlpha(et,v,vq);
    elseif type=='u' 
        a  = FindAlpha(et(end:-1:1),v(end:-1:1),vq(end:-1:1));
    end
end
if type=='b'
    [zet,zetp,~,St] = mapdisk(et,etp,n,a,'b');
elseif type=='u' 
    [zet,zetp,~,St] = mapdisk(et,etp,n,a,'u');
end
%
figure(101)
hold on; box on
plot(real(et),imag(et),'b','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
axis equal
plot(real(a),imag(a),'pr')
set(gca,'LooseInset',get(gca,'TightInset'))   
drawnow
%%

%%
t    = (0:2*pi/n:2*pi-2*pi/n)';
ht1  =  Findt(vq(1),et);
St1  =  tripoly(St-t,ht1)+ht1;
w1   =  exp(i*St1);
ht2  =  Findt(vq(2),et);
St2  =  tripoly(St-t,ht2)+ht2;
w2   =  exp(i*St2);
ht3  =  Findt(vq(3),et);
St3  =  tripoly(St-t,ht3)+ht3;
w3   =  exp(i*St3);
ht4  =  Findt(vq(4),et);
St4  =  tripoly(St-t,ht4)+ht4;
w4   =  exp(i*St4);
%%
mod   =  moddisk(w1,w2,w3,w4);
%%
%
end