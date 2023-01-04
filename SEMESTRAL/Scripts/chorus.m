% chorus effect prototype 

% read audio

[in, Fs] = audioread('rhodes.aif');

maxDelay = ceil(0.05*Fs); % maximum delay in samples (50 ms)

buffer = zeros(maxDelay, 2); % delay buffer
rate = 0.5; % delay rate (Hz) (LFO)
depth = 5; % amplitude of LFO
predelay = 30; % ms

wet = 30; % wet/dry mix (percent)

N = length(in); % number of samples
out = zeros(N, 2); % output buffer

for n = 1:N
    [out(n, :), buffer] = chorusEffect(in(n, : ), buffer, Fs, n, ...
        depth, rate, predelay, wet);
end

bothsignals = [in; out];

soundsc(bothsignals, Fs);
