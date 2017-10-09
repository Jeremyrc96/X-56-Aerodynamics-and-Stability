function [] = Vtailrudder(tau, zetav, dr, lv, S, b, Sv, Sr, Vv, Cl_av)
%Function intended to aid in the calculations regarding to trimming the
%plane via rudder and performing manuvers with rudder. 

%Definitions
Cn = 2*N/(rho*V^2*S*b);
Clv = 2*Yv/(rho*Vvt^2 *Sv);
Cnr = -Vv*zetav*(Yr)/(rho*Vvt^2 *Sv);

%Rudder angles
%drmax = ???

%tau is the flap effectiveness parameter
%It is a function of (rudder area)/(verticaltail area)
Clv_dr = Cl_av*tau;

%sidewash sigma
alphav = Beta*sigma;
Cl_v = Cl_av*alphav;

%Vertical tail coefficients
Cnv = Vv*zetav*Cl_av*(alphav);
Cnv_B = Vv*zetav*Cl_av*(1+sigma_B);

%Rudder Contribution coefficients
Cn_dr = -zetav*Vv*Clv_dr;
Cnr = Cn_dr*dr;

%Asymmetric Propulsion

end

