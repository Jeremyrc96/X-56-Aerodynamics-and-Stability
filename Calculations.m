Lambda = [22,25,30,32,34,35,36,38,40];
[n,xacwf] = ac(112,8,1,Lambda);
[n2,xact] = ac(30,9,(1/3),23.5);
lt = 50.5 + xact - xacwf;
St = 2*(30/2).*(9+6)/2;
Cla_wf = .0201;
Cla_t = 3.3417*(pi/180);
xnp = np((xacwf/12),(112/12),(8/12),(lt/12),(St/144),1,Lambda,Cla_wf,Cla_t);