function [xnp] = np(xacwf,b,cr,lt,St,lambda,Lambda,Cla_wf,Cla_t)
%xac,np are per mean chord

c = ((2*cr/3) * (1+lambda + lambda^2)/(1+lambda))./cosd(Lambda);
S = 2*(b/2).*c;
AR= b^2 ./ S;
Lambdarad = Lambda*(pi/180);
e = (1 - 0.045 .* AR.^(.68)).*(1 - .227.*Lambdarad.^(1.615));
Vh = (lt*St)/(S*b);
eps_a = (2.*Cla_wf)./(pi.*e.*AR);
Cla = Cla_wf + (St./S).*Cla_t .* (1-eps_a);
xnp = xacwf + Vh .* (Cla_t./Cla).*(1-eps_a);
Lambda = Lambda'; e = e'; eps_a = eps_a'; Cla = Cla'; xnp = 12*xnp'; c =12*c'; S = 144*S'; AR = AR';
table(Lambda, c, S, AR, e, eps_a, Cla, xnp)
end