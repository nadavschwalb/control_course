% add pole with pre-filter to get a finite gm
b = 10*Wcp;
C_1 = tf(b,[1 b]);
display(C_1);

%open loop with finite gm
L_1 = K*C_1*P;
[Gm,Pm,Wcg,Wcp] = margin(L_1);
fprintf("F*L:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);
figure(2);
margin(L_1);