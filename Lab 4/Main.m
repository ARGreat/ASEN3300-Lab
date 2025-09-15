clear;
clc;
close all;


%% 4.1 a

%Load variables
load('data/lab04_analysis_signal1.mat');


figure('theme','light'); hold on;
plot(t(1:100),x(1:100));
xlabel("time (sec)")
ylabel("x(t) (volts)")
title("Analysis Singal 1")
legend("x(t) vs time")

%% 4.1 b

fs = 2400;
t = 0:1/fs:1-1/fs;
N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/length(x):fs/2;

figure
plot(freq,pow2db(psdx))
grid on
title("Periodogram Using FFT")
xlabel("Frequency (Hz)")
ylabel("Power/Frequency (dB/Hz)")

saveas(gcf, 'sine_wave_spectrum.png') 