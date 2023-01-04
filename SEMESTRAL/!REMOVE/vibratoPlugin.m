classdef vibratoPlugin < audioPlugin

%VibratoPlugin Audio effect plugin for vibrato effect

properties
    rate = 4; % Rate (Hz)
    depth = 75;
end


% interface
properties (Constant)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('rate',...
        'DisplayName','Rate',...
        'Mapping',{'lin',0,10}),...
        audioPluginParameter('depth',...
        'DisplayName','Depth',...
        'Mapping',{'lin',0,100}));
end

properties (Access = private)
    Fs; % Sample rate
    DelayLine; % Delay line
    DelayLineLength; % Delay line length
    DelayLineIndex; % Delay line index
    maxDelay = 1000; % Maximum delay (samples)
    currentPhase = 0; % Current phase in radians (-2 * pi to 2 * pi)
    angleChange = 0.1 * (1 / 44100) * 2 * pi; % Angle change per sample
end

methods
    % constructor
    function p = vibratoPlugin()
        % Initialize delay line
        p.Fs = getSampleRate(p);
        p.DelayLine = zeros(p.maxDelay, 2);
        p.DelayLineIndex = 1;
        p.angleChange = p.rate * (1 / p.Fs) * 2 * pi;
        p.DelayLineLength = p.maxDelay;
    end

    % process
    function out = process(p, in)
        depth = p.depth; % Depth
        [numSamples, numChannels] = size(in); % Get number of samples and channels
        out = zeros(numSamples, numChannels); % Initialize output

        % Loop through samples
        for n = 1:numSamples 


            % Get LFO
            lfo = (depth / 2) * sin(p.currentPhase) + depth; % LFO
            len = p.DelayLineLength; % Delay line length

            indexC = mod(p.DelayLineIndex - 1, len) + 1; % Current index
            if indexC == 0 % check for index 0 (not allowed)
                disp("indexC: " + indexC);
            end


            % Get delay time
            fracDelay = mod(p.DelayLineIndex - lfo, len) + 1; % Fractional delay
            intDelay = floor(fracDelay); % Integer part of delay
            frac = fracDelay - intDelay; % Fractional part of delay

            nextIndex = mod(intDelay, len) + 1; % Next index    


            %disp("indexC: " + indexC + " intDelay: " + intDelay + " nextIndex: " + nextIndex + " frac: " + frac);
            out(n, :) = (1 - frac) * p.DelayLine(intDelay, :) + frac * p.DelayLine(nextIndex, :);

            % update delay line
            p.DelayLine(indexC, :) = in(n, :);


            p.DelayLineIndex = p.DelayLineIndex + 1;
            if p.DelayLineIndex > p.maxDelay
                p.DelayLineIndex = 1;
            end

            % Update phase

            p.currentPhase = p.currentPhase + p.angleChange;
            if p.currentPhase > 2 * pi
                p.currentPhase = p.currentPhase - 2 * pi;
            end
        end % for
    end % process

    % reset
    function reset(p)
        % Reset delay line
        p.DelayLine = zeros(p.maxDelay, 2);
        p.DelayLineIndex = 1;
        p.currentPhase = 0;
        Fs = getSampleRate(p);
        p.angleChange = p.rate * (1 / Fs) * 2 * pi;
        p.DelayLineLength = p.maxDelay;
    end % reset

    % set.rate
    function set.rate(p, rate)
        p.rate = rate;
        Fs = getSampleRate(p);
        p.angleChange = p.rate * (1 / Fs) * 2 * pi;
    end % set.rate

    % set.depth
    function set.depth(p, depth)
        p.depth = depth;
        Fs = getSampleRate(p);
        p.angleChange = p.rate * (1 / Fs) * 2 * pi;
    end % set.depth



end % methods



end % classdef