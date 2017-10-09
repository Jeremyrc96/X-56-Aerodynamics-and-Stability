function [] = Elevator(tau, zeta, de, S, St, Vh, W, Cl_a, Cl_at, Cmo, Cm_a)
%Function intended to aid in the calculations regarding to trimming the
%plane with elevator and performing manuvers with elevator. 

%Elevator angles
%CL of plane when elevator is fully deflected
%demax = ???

%tau is the flap effectiveness parameter
%It is a function of (elevator area)/(tail area)
Cl_tde = Cl_at*tau;

%Change in lift
Cl_de = (St/S)*zeta*Cl_tde;
%Change in Cl = Cl_de*de
CL = Cl_a*alpha + Cl_de*de;

%Change in pitching moment
Cm_de = - Vh*zeta*Cl_tde;
%Change in Cm = Cm_de*de
Cm = Cmo + Cm_a*alpha + Cm_de*de;


%In the air if we want to trim the aircraft
%Cm = 0
Cltrim = 2*W/(rho*V^2*S);

%Elevator deflection angle to trim
detrim = -(Cmo+Cl_a + Cm_a*Cltrim)/(Cm_de*Cl_a-Cm_a*Cl_de);
%Similarly we can find the angle of attack for our vehicle at trim
atrim = (Cltrim-Cl_de*detrim)/Cl_a;

end

