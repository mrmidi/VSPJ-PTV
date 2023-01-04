function [out, buffer] = vibratoEffect(in, buffer, Fs, n, depth, rate)

    t = (n-1)/Fs;
    lfo = (depth / 2) * sin(2 * pi * rate * t) + depth;

    len = length(buffer);

    indexC = mod(n-1, len) + 1; % Current index

    fracDelay = mod(n-lfo-1, len) + 1; % Fractional delay
    intDelay = floor(fracDelay); % Integer delay
    frac = fracDelay - intDelay; % Fractional part

    nextSamp = mod(intDelay, len) + 1; % Next sample

    out = (1 - frac) *  buffer(intDelay, :) + frac * buffer(nextSamp, :);

    buffer(indexC, :) = in; % Update buffer

end