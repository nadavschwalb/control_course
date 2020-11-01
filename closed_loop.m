%closed loop feedback system
G = feedback(L,1);
display(G);

%find closed loop gain peak
[gpeak,fpeak] = getPeakGain(G);
figure(4);
bodeplot(G);
gpeak = mag2db(gpeak); %convert to db
fprintf("gain peak: %f, freaquency peak %f\n",gpeak,fpeak);

%find d of pre-filter to fix closed loop gain
npeak = 0.8*gpeak; %npeak is in db
fprintf("lower peak from %fdb to %fdb by %fdb\n",gpeak,npeak,npeak-gpeak);
peak_diff = db2mag(npeak-gpeak);

%solve for d of pre filter
syms d;
eqn = d/sqrt(d^2+fpeak^2) == db2mag(npeak-gpeak);
d = single(solve(eqn,d)); 
fprintf("d: %f\n",d);
Pre = tf(d,[1 d]);
display(Pre);
%check closed loop with prefilter
[gpeak,fpeak] = getPeakGain(Pre*G);
gpeak = mag2db(gpeak); %convert to db
figure(5);
bodeplot(Pre*G);

fprintf("desired peak: %f,new peak: %f freaquency peak %f\n",npeak,gpeak,fpeak);