%choose lead or lag compensation 
C_type = input('Enter lead or lag: ','s');
disp(C_type);
u = input('Enter u: ');
a = input('Enter a: ');
Wcp = input('Enter Wcp: ');
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

%choose open loop
GM_pre_status = input('Enter true if gm pre filter added, false otherwise: ','s');
if strcmp(GM_pre_status,'true')
    L = K*C_1*C*P;
elseif strcmp(GM_pre_status,'false')
    L = K*C*P;
else
    disp('wrong input');
end
display(L);

%check margins
[Gm,Pm,Wcg,Wcp] = margin(L);
fprintf("L:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Gm,Pm,Wcg,Wcp);


%output figure L
figure('Name','L');
subplot(1,2,1);
margin(L);
grid on;grid minor;

subplot(1,2,2);
nichols(L)
grid on;grid minor;