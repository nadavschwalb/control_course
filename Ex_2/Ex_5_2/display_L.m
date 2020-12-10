function display_L(L,Name)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[Gm,Pm,Wcg,Wcp] = margin(L);
display(L);
fprintf("%s:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Name,Gm,Pm,Wcg,Wcp);

%output figure 
figure('Name',Name);

subplot(1,2,1);
margin(L);
grid on;grid minor;

subplot(1,2,2);
nichols(L);
grid on;grid minor;
end

