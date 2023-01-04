% clear all

clear;clc;close all;

% read audio file rhodes.aif

[x,fs] = audioread('rhodes.aif');

Ts = 1/fs; % sampling period
N = length(x); % number of samples
t = (0:N-1)*Ts; % time vector
t = t(:); % make column vector

% tremolo parameters
depth = 70; % depth of modulation in % [0,100]
rate = 3; % modulation rate in Hz
amp = 0.5 * (depth/100); % amplitude of modulation
offset = 1 - amp; % offset of modulation

% synthesis parameters
f = rate; % frequency of sine wave
w = 2*pi*f; % angular frequency of sine wave
phi = 0; % initial phase of sine wave
sw = sin(w.*t + phi); % sine wave

% tremolo

mod = amp * sw + offset; % modulation signal

% apply modulation to audio signal
y = x .* mod;

bothsignals = [x; y];

% play stignals

soundsc(bothsignals,fs);

% plot signals

figure(1)
subplot(2,1,1)
plot(t,x)
title('Original Signal')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(t,y)
title('Tremolo Signal')
xlabel('Time (s)')
ylabel('Amplitude')
