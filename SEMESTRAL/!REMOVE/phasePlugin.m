% make class from tremolo.m

classdef phasePlugin < audioPlugin

properties
    depth = 50;
    rate = 3; % Hz = 3 * 60 = 180 bpm

end

properties (Access = private)
    % Private
    t = 0; % time
    samplerate;
    NSamples = 0; % number of samples
end

properties (Constant)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('depth', 'Mapping',{'lin',0,100}),...
        audioPluginParameter('rate', 'Mapping',{'lin',0,10}))
    
end

methods
    function p = phasePlugin()
        p.samplerate = getSampleRate(p);
    end

    function out = process(p,in)
        %size(in)
        %length(in)
        % get the t value of sample
        p.NSamples = p.NSamples + length(in);
        sampcount = p.NSamples;
        sampcount
        p.t = p.NSamples/p.samplerate;
        
        depth = p.depth/100;
        rate = p.rate;
        amp = 0.5*depth;
        offset = 1-amp;
        w = 2*pi*rate;
        mod = amp*sin(w*p.t)+offset;
        out = in*mod;
    end
end

end