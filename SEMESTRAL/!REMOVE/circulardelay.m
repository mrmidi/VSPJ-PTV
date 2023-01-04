clear; clc; close;

% load rhodes.aif

[x, Fs] = audioread('rhodes.aif');

buffer = zeros(192001, 2);

% number of samples in the buffer

N = length(x);
out = zeros(N, 2);

% set up the delay line

delay = 0.5 * Fs;

% set up the feedback gain

gain = 0.5;

% set up the allpass filter

a = 0.5;

% set up the delay line

buffer = zeros(delay, 2);

for n = 1:N

    [out(n, :), buffer] = circularBuffer(x(n, :), buffer, delay, n);
end
