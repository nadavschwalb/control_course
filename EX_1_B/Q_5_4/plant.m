 %assign P(s)
K = 40;
Num = 1;
DNum = [2 2 0]; 
P = tf(Num,DNum);
[Gm,Pm,Wcg,Wcp] = margin(P);
display(P);
fprintf("P:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);

%output figure P
figure('Name','P');
subplot(1,2,1);
margin(P);
grid on;grid minor;

subplot(1,2,2);
nichols(P);
grid on;grid minor;

[Gm,Pm,Wcg,Wcp] = margin(K*P);
display(K*P);
fprintf("K*P:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);

%output figure K*P
figure('Name','K*P');

subplot(1,2,1);
margin(K*P);
grid on;grid minor;

subplot(1,2,2);
nichols(K*P);
grid on;grid minor;