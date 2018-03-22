clc 
clear all;

[y ,Fs] = audioread('sp30_train_sn5.wav');
[y1 ,Fs1] = audioread('sp30.wav');

m = length(y);
n = pow2(nextpow2(m));

y2 = fft(y,n);
f = (0:n-1)*(Fs)/n;
amplitude = abs(y2);
subplot(1,2,1)
plot(f(1:floor(n/2)),amplitude(1:floor(n/2)))
title('Frequency Domain Representation - Unfiltered Sound')
xlabel('Frequency');
ylabel('Amplitude');

y3 = fft(y1,n);
f1 = (0:n-1)*(Fs/n);
amplitude1 = abs(y3);
subplot(1,2,2)
plot(f1(1:floor(n/2)),amplitude1(1:floor(n/2)))
title('Frequency Domain Representation - Unfiltered Sound')
xlabel('Frequency');
ylabel('Amplitude');

[b,a] = butter(5, [400/(Fs/2), 1500/(Fs/2)], 'bandpass');
fOut = filter(b, a, y)
sound(fOut,Fs)

[y4 ,Fs2] = audioread('sp30_restaurant_sn5.wav');
[y5 ,Fs3] = audioread('sp30.wav');

m1 = length(y4);
n1 = pow2(nextpow2(m1));

y6 = fft(y4,n1);
f2 = (0:n1-1)*(Fs2)/n1;
amplitude2 = abs(y6);
subplot(1,2,1)
plot(f2(1:floor(n1/2)),amplitude2(1:floor(n1/2)))
title('Frequency Domain Representation - Unfiltered Sound')
xlabel('Frequency');
ylabel('Amplitude');

y7 = fft(y5,n1);
f3 = (0:n1-1)*(Fs2/n1);
amplitude3 = abs(y7);
subplot(1,2,2)
plot(f3(1:floor(n1/2)),amplitude3(1:floor(n1/2)))
title('Frequency Domain Representation - Unfiltered Sound')
xlabel('Frequency');
ylabel('Amplitude');

[b1,a1] = butter(5, [550/(Fs2/2), 1900/(Fs2/2)], 'bandpass');
fOut1 = filter(b1, a1, y4)
sound(fOut1,Fs2)





