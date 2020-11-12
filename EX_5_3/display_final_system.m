%dispaly open loop nichols
figure('Name',"open loop nichols");
nichols(L);
ngrid;

%display lti of closed loop vs open loop
ltiview(G,Pre*G);