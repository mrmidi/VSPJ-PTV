% chorus plugin refactor
classdef chorusPluginV2 < audioPlugin

properties
    % Plugin properties go here
    Rate = 0.6;
    Depth = 5;
    Predelay = 30;
    Wet = 50;
end

properties (Access = private)
    Maxdelay;
    Buffer;
    Samplerate;
    Mix;
    NSamples = 0;
    pos = 1;
    preDelaySamples = 0;
end

% plugin parameters

properties (Constant, Hidden)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Rate', 'Mapping', {'lin', 0.1, 5}),...
        audioPluginParameter('Depth', 'Mapping', {'lin', 0.1, 10}),...
        audioPluginParameter('Predelay', 'Mapping', {'lin', 0.1, 100}),...
        audioPluginParameter('Wet', 'Mapping', {'lin', 0, 100}));
        % timer
       
end

% Plugin methods

% constructor
methods
    function p = chorusPluginV2()
        p.Samplerate = getSampleRate(p);
        p.reset;
    end
end

% Chorus process method
methods
    function out = process(p, in)
        %p.Maxdelay = round(p.Samplerate * 0.05);
        out = zeros(size(in));
        
        p.Mix = 0.01 * p.Wet; % wet mix
        writeIndex = p.pos;
        readIndex = writeIndex - p.preDelaySamples;

        %readIndex = writeIndex - p.Maxdelay;

        if (readIndex <= 0)
            readIndex
            readIndex = readIndex + p.Maxdelay;
        end
        %readIndex
        for i = 1:size(in, 1)
            % buffer = [in ; buffer(1:end-1, : )]; 
            p.Buffer(writeIndex, :) = in(i, :);
            % samples
            p.NSamples = p.NSamples + 1;
            t = (p.NSamples - 1) / p.Samplerate;

            % chorus
            lfoMS = p.Depth * sin(2 * pi * p.Rate * t) + p.Predelay;
            lfoS = (lfoMS / 1000) * p.Samplerate;

            fracDelay = lfoS;
            intDelay = floor(fracDelay);
            frac = fracDelay - intDelay;
            %readIndex
%             if (readIndex >= p.Maxdelay)
%                 readIndex = 1;
%             end
% 
%             if (readIndex < 1)
%                 readIndex = readIndex + p.Maxdelay;
%             end

            %readIndex



            %readIndex
            writeIndex = writeIndex + 1;
            if (writeIndex >= p.Maxdelay)
                writeIndex = 1;
            end
            drySig = in(i, :);
            wetSig = (1 - frac) * p.Buffer(readIndex, :) + frac * p.Buffer(readIndex, :);

            readIndex = readIndex + 1;
            if (readIndex > p.Maxdelay)
                readIndex = 1;
            end
            if (readIndex < 1)
                readIndex = readIndex + p.Maxdelay;
            end

            out(i, :) = p.Mix * wetSig + (1 - p.Mix) * drySig;
            p.pos = writeIndex;
        end
    end

    function reset(p)
        p.Maxdelay = ceil(p.Samplerate * 0.05);
        p.Buffer = zeros(p.Maxdelay, 2);
        p.Mix = 0.01 * p.Wet;
        p.NSamples = 0;
        p.pos = 1;
        p.preDelaySamples = floor(p.Predelay * p.Samplerate / 1000);

    end
end



end