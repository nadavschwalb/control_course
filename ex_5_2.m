K = 20;
Num = 1;
DNum = [1 2 0];
L = tf(K*Num,DNum);
[Gm,Pm,Wcg,Wcp] = margin(L);
display(L);
display([Gm,Pm,Wcg,Wcp]);
bodeplot(L);
b = 10*Wcp;
F = tf(b,[1 b]);
display(F);
[Gm,Pm,Wcg,Wcp] = margin(F*L);
display([Gm,Pm,Wcg,Wcp]);
%ltiview(L,F*L);
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
ltiview(L,F*L,F*L*C);
[Gm,Pm,Wcg,Wcp] = margin(F*L*C);
display([Gm,Pm,Wcg,Wcp]);
    
    