% vibrato prototype

clear; clc; close all;

% define the parameters of the signal
[in, Fs] = audioread('rhodes.aif');

Ts = 1/Fs; % sampling period
N = length(in); % number of samples

% init delay line
maxDelay = 1000; % maximum delay in samples
buffer = zeros(maxDelay, 2); % delay line buffer

% LFO parameters
f = 4; % frequency of LFO in Hz
depth = 75;

% init output
out = zeros(N, 2);

for n = 1:N
    % calculate delay
    [out(n, : ), buffer] = vibratoEffect(in(n, : ), buffer, Fs, n, depth, f);
end

bothsignals = [in; out];

soundsc(bothsignals, Fs);