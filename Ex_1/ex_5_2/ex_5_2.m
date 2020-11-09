%assign P(s)
K = 20;
Num = 1;
DNum = [1 2 0]; 
MaxMag = 2.5;
P = tf(Num,DNum);
[Gm,Pm,Wcg,Wcp] = margin(K*P);
display(K*P);
fprintf("L:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);
figure(1);
bodeplot(K*P);
% add pole with pre-filter to get a finite gm
b = 10*Wcp;
C_1 = tf(b,[1 b]);
display(C_1);

%open loop with finite gm
L_1 = K*C_1*P;
[Gm,Pm,Wcg,Wcp] = margin(L_1);
fprintf("F*L:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);
figure(2);
bodeplot(L_1);

%choose lead or lag compensation 
C_type = input('Enter lead or lag: ','s');
disp(C_type);
u = input('Enter u: ');
a = input('Enter a: ');
tau = u/Wcp;
disp("tau:");
disp(tau);
if strcmp(C_type,'lag')
    C = tf([tau 1],[a*tau 1]);
elseif strcmp(C_type,'lead')
    C = tf([a*tau 1],[tau 1]);
else
    disp('wrong input');
end
display(C);

%C controller
C = K*C_1*C;
%L new open loop
L = C*P;
%check margins
[Gm,Pm,Wcg,Wcp] = margin(L);
fprintf("F*L*C:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);
figure(3);
bodeplot(L);

%closed loop feedback system
G = feedback(C*P,1);
display(G);

%find closed loop gain peak
[gpeak,fpeak] = getPeakGain(G);
figure(4);
bodeplot(G);
gpeak = mag2db(gpeak);
fprintf("gain peak: %f, freaquency peak %f\n",gpeak,fpeak);

%find d of pre-filter to fix closed loop gain
syms d;
fprintf("mag diff %f-%f= %f\n",MaxMag,gpeak,MaxMag - gpeak);
eqn = d/sqrt(d^2 + fpeak^2) == db2mag(MaxMag-gpeak);
d = single(solve(eqn,d));
fprintf("d: %f\n",d);
Pre = tf(d,[1 d]);
display(Pre);

[gpeak,fpeak] = getPeakGain(Pre*G);
figure(5);
bodeplot(Pre*G);
gpeak = mag2db(gpeak);
fprintf("gain peak: %f, freaquency peak %f\n",gpeak,fpeak);

