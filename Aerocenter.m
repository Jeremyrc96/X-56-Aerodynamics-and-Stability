function [n,z] = ac(b,cr,lambda,Lambda)
cm = ((2*cr/3) * (1+lambda + lambda^2)/(1+lambda))./cosd(Lambda);
n = (b/6) * (1+2*lambda)/(1+lambda);
z = (.25*cm) + n.*tand(Lambda);
xac = z'; Lambda = Lambda'; cm = cm';
if (length(Lambda) > 1)
table(Lambda, cm, xac)
end
end