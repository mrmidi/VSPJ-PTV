% multitap delay prototype

% clear all

clear all; close all; clc;
% load rhodes.aif

[x, Fs] = audioread('rhodes.aif');

bPM = 120; % BPM of the beat

bPS = bPM/60; % Beats per second

sPB = 1/bPS; % Seconds per beat


% whole = 4, half = 2, quarter = 1, eighth = 0.5, sixteenth = 0.25
noteLength = 0.5; % Length of each note in beats

% calculate delay times in seconds
delayTime1 = sPB * noteLength;

% convert to samples
d = fix(delayTime1 * Fs); % delay in samples, rounded down

b = 0.75; % feedback gain (amp of delayed signal)

a = -0.75; % feedback gain (amp of delayed signal)

N = length(x); % length of input signal
y = zeros(N, 2); % initialize output signal

% loop through input signal
for n = 1:N
    if n > d
        y(n, :) = x(n) + b * y(n-d, : ); % out = in + feedback * delayed signal
        %y(n, :) = y(n, :) + (-a) * y(n-d, : ); % out = in + feedback * delayed signal
        %y(n) = x(n) + b * y(n-d); % out = in + feedback * delayed signal
    else % if n <= d
        y(n, : ) = x(n, : ); % out = in
    end
end

bothsignals = [x; y];

% play the original and the delayed signal
soundsc(bothsignals, Fs);

% plot the original and the delayed signal

subplot(2,1,1);
plot(x);
title('Original Signal');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
plot(y);
title('Delayed Signal');
xlabel('Samples');
ylabel('Amplitude');
