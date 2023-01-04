function [out, buffer] = chorusEffect(in, buffer, fs, n, depth, rate, predelay, wet)

% CHORUSEFFECT - Chorus effect

% calculate time in seconds for the current sample
t = (n - 1) / fs;
lfoMS = depth * sin (2 * pi * rate * t) + predelay; % calculate LFO in milliseconds
lfoS = (lfoMS / 1000) * fs; % convert to samples

% wet-dry mix
mixPercent = wet; % percentage of wet signal (0 = only dry, 100 = wet)
mix = mixPercent / 100; % convert to decimal

fracDelay = lfoS; % fractional delay
intDelay = floor(fracDelay); % integer delay
frac = fracDelay - intDelay; % fractional part of delay
% 
% fracDelay
% intDelay

% store current sample in buffer
drySig = in;
%wetSig = (1 - frac) * buffer(intDelay,  : ) + (frac) * buffer(intDelay + 1, : );
wetSig = (1-frac)*buffer(intDelay, : ) + (frac)*buffer(intDelay+1, :);

% blend dry and wet signals
out = (1 - mix) * drySig + mix * wetSig;

% update buffer

buffer = [in ; buffer(1:end-1, : )]; 

% buffer = [in, buffer(1:end - 1)];

end

% “wetSig = (1-frac)*buffer(intDelay,1) + (frac)*buffer(intDelay+1,1);”
