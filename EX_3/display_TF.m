function display_TF(TF,Name)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[Gm,Pm,Wcg,Wcp] = margin(TF);
display(TF);
fprintf("%s:\n GM: %f, PM %f, Wcg: %f, Wcp: %f\n",Name,Gm,Pm,Wcg,Wcp);

%output figure 
figure('Name',Name);

subplot(1,2,1);
margin(TF);
grid on;grid minor;

subplot(1,2,2);
nichols(TF);
grid on;grid minor;
end

