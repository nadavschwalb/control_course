% add pole with pre-filter to get a finite gm
b = 10*Wcp1;
C_1 = tf(b,[1 b]);
display(C_1);

%open loop with finite gm
L_1 = K*C_1*P;
[Gm,Pm,Wcg,Wcp1] = margin(L_1);
fprintf("F*L:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp1);

%output figure L_1
figure('Name','K*C_1*P');
subplot(1,2,1);
margin(L_1);
grid on;grid minor;

subplot(1,2,2);
nichols(L_1)
grid on;grid minor;