
clc;
close all;
clear all;
Fs=44100;%Sampling frequency

a=audioread('cartoon001.wav');%Reading 1st track onto the object 'a'
% sound(a);
%plot(a);

b=audioread('cartoon049.wav');%Reading 2nd track onto the object 'b'
%sound(b);
%plot(b);

c=audioread('cartoon058.wav');%Reading 3rd track onto the object 'c'
%plot(c);

y=[a;b;c];%CONCATENATION(Composite soundtrack formed by concatenating 3 tracks)

%soundsc(y,Fs);%Melody effect on the soundtrack 'y'

% subplot(3,1,1)
% title('Time plot of y');
% plot(y);
% hold on


% THRESHOLDING(HARD)
thr=0.4;
ythard = wthresh(y,'h',thr);
% subplot(3,2,1);
% title('Thresholding output');
plot (ythard);
hold on
%FFT of track before thresholding
nfft=length(y);
nfft2=2.^nextpow2(nfft);
fy=fft(y,nfft2);
fy=fy(1:nfft2/2);
xfft=Fs.*(0:nfft2/2-1)/nfft2;
% subplot(3,1,1);
% plot(xfft,abs(fy/max(fy)));
%FFT of track after thresholding
nfft=length(ythard);
nfft2=2.^nextpow2(nfft);
fy=fft(y,nfft2);
fy=fy(1:nfft2/2);
xfft=Fs.*(0:nfft2/2-1)/nfft2;
% subplot(3,1,2);
% plot(xfft,abs(fy/max(fy)));

%AVERAGING
q=averaging_filter(ythard);
%sound(q);
% subplot(3,4,3);
title('Averaging output');
plot(q);
grid on

