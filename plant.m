 %assign P(s)
K = 20;
Num = 1;
DNum = [1 2 0]; 
P = tf(Num,DNum);
[Gm,Pm,Wcg,Wcp] = margin(P);
display(P);
fprintf("P:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);
figure(1);
margin(P);

[Gm,Pm,Wcg,Wcp] = margin(K*P);
display(K*P);
fprintf("K*P:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);
figure(2);
margin(K*P);