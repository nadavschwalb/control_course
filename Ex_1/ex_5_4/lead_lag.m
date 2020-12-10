function transfer = lead_lag(u , a, wco, type)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tau = u/wco;
fprintf("tau = %f\n",tau);
if strcmp(type,'lag') 
    C = tf([tau 1],[a*tau 1]);
elseif strcmp(type,'lead')
    C = tf([a*tau 1],[tau 1]);
else
    disp('wrong input');
end
display(C);
transfer = C;

end

