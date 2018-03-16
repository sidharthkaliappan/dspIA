clc 
clear

[y ,Fs] = audioread('sp30_train_sn5.wav');
[y1 ,Fs1] = audioread('sp30.wav');

sample_period = 1/Fs;
m = length(y);
n = pow2(nextpow2(m));

y2 = fft(y,n);
f = (0:n-1)*(Fs/n);
amplitude = abs(y2)/n;
subplot(1,2,1)
plot(f(1:floor(n/2)),amplitude(1:floor(n/2)))
title('Frequency Domain Representation - Unfiltered Sound')
xlabel('Frequency');
ylabel('Amplitude');



y3 = fft(y1,n);
f1 = (0:n-1)*(Fs/n);
amplitude1 = abs(y3)/n;
subplot(1,2,2)
plot(f1(1:floor(n/2)),amplitude1(1:floor(n/2)))
title('Frequency Domain Representation - Unfiltered Sound')
xlabel('Frequency');
ylabel('Amplitude');

[b,a] = butter(5, [400/(Fs/2), 750/(Fs/2)], 'bandpass');
fOut = filter(b, a, y);


%sound(fOut,Fs)
%sound(y,Fs1);
sound(y1,Fs1)



% subplot(2,2,1);
% plot(y1);
% subplot(2,2,2);
% plot(y);

% x = fft(y);
% 
% x1 = fft(y1);
% 
% subplot(2,2,3);
% stem(x);
% subplot(2,2,4);
% stem(x1);


