% phase example

f = 50;

Fs = 44100;

t = 0:1/Fs:1-1/Fs;

t = t'; % make it a column vector

left = sin (2*pi*f.*t);
rignt =  left * -1;
both = [left, rignt];

summed = left + rignt;

% plot the first 100 samples

figure;
subplot(4,1,1);
plot (both(1:100,:));
title('Left and Right Channels');
subplot(4,1,2);
plot (left(1:100));
title('Left Channel');
subplot(4,1,3);
plot (rignt(1:100));
title('Right Channel');
subplot(4,1,4);
plot (summed(1:100));
title('Summed Channels');