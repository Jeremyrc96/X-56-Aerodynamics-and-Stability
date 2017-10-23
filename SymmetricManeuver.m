function [L,P,D,f] = SymmetricManeuver(W,S,c,n,V,lac,iw,z_t)
%Symmetric Maneuver Calculate Lift, Tail Load, Drag, and forward inertial
%force on an aircraft subjected to loading factor n and speed V
%   This function serves to understand the type of loading our wing and
%   tail will experience during various loading factors n and speeds V.
%   W - Weight
%   S - Projected Wing Area
%   c - mean aerodynamic chord
%   n - Load factor
%   lac - cg to ac of tail
%   iw - incidence of wing
%   z_t - Tail height above cg
%   Written by: Jeremy Correa
%
% EXAMPLE: [L,P,D,f] = SymmetricManeuver(26,900,8.2,5,63,3,2,5)
%These values in the example dont correspond to x-56 values 
rho = .002377; %slu/ft^3

CLnew = 0;
%First we neglect the tail load on the plane for our first approximation
L = n*W;
CL = L/(.5*rho*V^2*S);
%Load files containing xflr5 wing data. This data should include Cl,Cd,Cm
%vs alpha data
M = dlmread('T1-40_4 kt-Panel.txt');
CLv = M(:,3);
CDv = M(:,6);
CMv = M(:,9);
av = M(:,1);

%Develop method of finding and return matrix indices.


    diff = CLv - CL; q = abs(diff);
    mini = min(q);
    index = find(q == mini);
    a = av(index); Cm = CMv(index);


l = lac*cosd(a - iw) + z_t*sind(a - iw); %moment arm

while ((CLnew - CL) ~= 0)
if CLnew ~= 0, CL = CLnew; end
CLnew = n*W/(.5*rho*V^2*S) - (c/l)*Cm;
    diff = CLnew - CLv; q = abs(diff);
    mini = min(q);
    index = find(q == mini);
    a = av(index); Cm = CMv(index);
l = lac*cosd(a - iw) + z_t*sind(a - iw);
end

%Now we have iterated towards values of CL that correspond to our symmetric
%maneuver
CL = CLv(index);
CD = CDv(index);
CM = CMv(index);
alph = av(index);
%Forces
L = .5*rho*V^2*S*CL; %Lift
P = n*W - L; %Tail Load
D = .5*rho*V^2*S*CD; %Drag
f = D; %Forward Inertial force


end

