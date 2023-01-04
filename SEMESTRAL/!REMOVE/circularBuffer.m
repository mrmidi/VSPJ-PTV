function [out, buffer] = circularBuffer(in, buffer, delay, n)

% CIRCULARBUFFER - Circular buffer
% delay - samples of delay
% n - current sample number used to calculate the delay

% Determine the index of the delayed sample
len = length(buffer);
indexC = mod(n-1, len) + 1; % Current index
indexD = mod(n-delay-1, len) + 1; % Delayed index

out = buffer(indexD); % Output delayed sample
buffer(indexC, :) = in; % Update buffer

end