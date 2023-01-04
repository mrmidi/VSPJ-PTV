% chorus plugin class
classdef chorusPlugin < audioPlugin

properties
    % Plugin properties go here
    Rate = 0.5; % LFO rate (Hz)
    Depth = 5; % amplitude of LFO
    Wet = 100; % wet/dry mix (0-100)
    Predelay = 30 % LFO predelay (ms)


    Samplerate;
    Buffer;
    Maxdelay;
    NSamples = 0;
    Mix;
    WetSig = zeros(1, 2);
    t;
end

properties (Access = private)

end

% interface
properties (Constant, Hidden)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Rate', 'Mapping', {'lin', 0.1, 10}), ...
        audioPluginParameter('Depth', 'Mapping', {'lin', 1, 10}), ...
        audioPluginParameter('Wet', 'Mapping', {'lin', 0, 100}), ...
        audioPluginParameter('Predelay', 'Mapping', {'lin', 1, 100}))
end

methods 
    % plugin constructor

    function p = chorusPlugin()
        p.Samplerate = getSampleRate(p);
        p.Maxdelay = 0.05 * p.Samplerate;
        p.Buffer = zeros(p.Maxdelay, 2);

        %size(p.Buffer)
    end

    function out = process(p, in)
        p.Mix = p.Wet / 100;
        p.NSamples = p.NSamples + 1;

        p.NSamples = p.NSamples + length(in);
        p.t = p.NSamples/p.Samplerate
        %p.t
        lfoMS = p.Depth * sin (2 * pi * p.Rate * p.t) + p.Predelay;
        lfoS = (lfoMS / 1000) * p.Samplerate;


        fracDelay = lfoS;
        intDelay = floor(fracDelay);
        frac = fracDelay - intDelay;

        drySig = in;
        %p.WetSig = (1 - frac) * p.Buffer(intDelay + 1) + (frac) * p.Buffer(intDelay + 2);
        %s1 = (1 - frac) * p.Buffer(intDelay, 1:2);
        %s2 = (frac) * p.Buffer(intDelay + 1, 1:2);

        wetSig = (1-frac)*p.Buffer(intDelay + 1, : ) + (frac)*p.Buffer(intDelay+2, :);
        %p.WetSig = s1 + s2;
        out = p.Mix * wetSig + (1 - p.Mix) * drySig;

        %out = in;

        p.Buffer = [in; p.Buffer(1:end - 1, :)];
        
    end

    function reset(p)
        p.NSamples = 0;
        p.Buffer = zeros(p.Maxdelay, 2);
    end
end

end