T_D = 1/(1+L);
T_D1 = P/(1+L);

display(T_D);
display(T_D1);

figure('Name','T_D');
bodeplot(T_D);
grid on; grid minor;
[num,den] = tfdata(T_D);
syms s
t_sym = poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s);
latex(t_sym)
figure('Name','T_D1');
bodeplot(T_D1);
grid on; grid minor;
t_sym = poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s);
latex(t_sym)

ltiview(T_D,T_D1);

