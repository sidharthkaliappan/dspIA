clc 
clear

[y ,Fs] = audioread('sp30_train_sn5.wav');
[y1 ,Fs1] = audioread('sp30.wav');

subplot(2,2,1);
plot(y1);
subplot(2,2,2);
plot(y);

x = fft(y);

x1 = fft(y1);

subplot(2,2,3);
plot(x);
subplot(2,2,4);
plot(x1);