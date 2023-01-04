classdef chorusPluginV4 < audioPlugin

properties
% Plugin parameters
    Depth = 5; % amplitude
    Rate = 0.5; % frequency of LFO in Hz
    Wet = 30; % in percent (0 to 100)
    Predelay = 30; % in ms
end

% interface
properties (Constant, Hidden)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Depth', 'Mapping',{'lin',1,30}),... % 1 to 30 ms
        audioPluginParameter('Rate', 'Mapping',{'lin',0.1,6}),...
        audioPluginParameter('Wet', 'Mapping',{'lin',0,100}),... 
        audioPluginParameter('Predelay', 'Mapping',{'lin',10,50}));
end


properties (Access = private)
    sampleRate = 44100; % default sample rate
    maxDelay = ceil(.05 * 44100); % samples (50 ms)
    DelayLine; % delay line
    DelayLineLength; % length of delay line
    DelayLineIndex; % index into delay line
    %maxDelay = 1000; % samples
    currentPhase = 0; % phase of LFO in radians (-2*pi to 2*pi)
    angleChange; % change in phase per sample
    mix;
end


methods
    % constructor
    function p = chorusPluginV4()
        % initialize delay line
        p.sampleRate = getSampleRate(p);
        p.maxDelay = ceil(.05 * p.sampleRate); % samples
        %disp("maxDelay = " + p.maxDelay);
        p.DelayLine = zeros(p.maxDelay, 2);
        p.DelayLineLength = p.maxDelay;
        p.DelayLineIndex = 1;
        p.mix = p.Wet / 100; % convert to 0 to 1
        p.angleChange = p.Rate * (1 / p.sampleRate) * 2 * pi;
    end % constructor

    % process method
    function out = process(p, in)
        [numSamples, numChannels] = size(in);
        out = zeros(numSamples, numChannels);
        drySig = zeros(numSamples, 2);
        wetSig = zeros(numSamples, 2);
        %size(p.DelayLine)
        len = p.DelayLineLength;
        %[a, b] = size(p.DelayLine);
        %disp("Buffer size = " + a + " x " + b);
        %p.mix = p.Wet / 100; % convert to 0 to 1

        for n = 1:numSamples


            % calculate delay time
            
            lfoMS = p.Depth * sin(p.currentPhase) + p.Predelay; % in ms
            fracDelay = mod(p.DelayLineIndex - lfoMS, len) + 1; % Fractional delay
            intDelay = floor(fracDelay); % Integer delay
            frac = fracDelay - intDelay; % Fractional part of delay


            % calculate delay line indices
            indexC = mod(p.DelayLineIndex - 1, len) + 1; % current index
            nextIndex = mod(intDelay, len) + 1; % next index

            % calculate output
            drySig(n, :) = in(n, :);

            % Debug output
            %disp("intDelay = " + intDelay + ", nextIndex = " + nextIndex + ", frac = " + frac + ", indexC = " + indexC + ", len = " + len);
            
            % calculate wet signal
            wetSig(n, :) = (1 - frac) * p.DelayLine(intDelay, :) + frac * p.DelayLine(nextIndex, :);

            % mix dry and wet signals
            %out(n, :) = (1 - p.mix) * drySig(n, :) + p.mix * wetSig(n, :);
            out(n, :) = (1 - p.mix) * drySig(n, :) + p.mix * wetSig(n, :);

            % update delay line
            p.DelayLine(indexC, :) = in(n, :);

            % update delay line index (circular buffer)
            p.DelayLineIndex = p.DelayLineIndex + 1;
            if p.DelayLineIndex > p.maxDelay
                p.DelayLineIndex = 1;
            end
            % update LFO phase
            p.currentPhase = p.currentPhase + p.angleChange;
            if p.currentPhase > 2 * pi
                p.currentPhase = p.currentPhase - 2 * pi;
            end
        end % for
    end % process

    % reset method
    function reset(p)
        p.sampleRate = getSampleRate(p); % update sample rate
        p.maxDelay = ceil(.05 * p.sampleRate); % samples
        p.DelayLine = zeros(p.maxDelay, 2);
        p.DelayLineIndex = 1;
        p.DelayLineLength = p.maxDelay;
        p.currentPhase = 0;
    end % reset

    % set methods
    function set.Depth(p, value)
        p.Depth = value; % update depth
    end % set.Depth

    function set.Rate(p, value)
        Fs = getSampleRate(p);
        p.Rate = value;
        p.angleChange = p.Rate * (1 / Fs) * 2 * pi; % update angle change per sample
    end % set.Rate

    function set.Wet(p, value)
        p.Wet = value;
        p.mix = p.Wet / 100;
    end % set.Wet

    function set.Predelay(p, value)
        %Fs = getSampleRate(p);
        p.Predelay = value;
        %disp("Predelay = " + p.Predelay);
        %p.maxDelay = ceil(Fs * p.Predelay / 1000); % samples
        %p.DelayLine = zeros(p.maxDelay, 2);
        %disp("maxDelay = " + p.maxDelay);
        %disp("Buffer size: " + size(p.DelayLine));
        %p.DelayLineLength = p.maxDelay;
        %p.DelayLineIndex = 1;
    end % set.Predelay

    




end % methods



end % classdef