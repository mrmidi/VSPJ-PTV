classdef bufferDelayPlugin < audioPlugin

properties
    bpm = 120;
    bps; % beats per second
    spb; % samples per beat
    feedback = 0.5; % feedback gain
    samplerate; % sample rate
    noteLength = 0.5; % eight note
    delayTime; % delay time in samples
    buffer; % delay buffer
end

% constructor

properties (Access = private)
    NSamples = 0; % number of samples in the current block
end

properties(Constant)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('bpm',...
        'DisplayName','BPM',...
        'Mapping',{'lin', 60, 240}),...
        audioPluginParameter('feedback',...
        'DisplayName','Feedback',...
        'Mapping',{'lin', 0, 1}),...
        audioPluginParameter('noteLength',...
        'DisplayName','Note Length',...
        'Mapping',{'lin', 0, 1}));
end

methods
    function p = bufferDelayPlugin
        p.samplerate = getSampleRate(p);
        p.reset;
    end
end

% plugin methods
methods
    function out = process(p,in)
        p.NSamples = size(in,1);
        % process the input signal
        out = in + p.feedback * p.buffer(1:p.NSamples,:);
        % update the buffer
        p.buffer = [p.buffer(p.NSamples+1:end,:); out];
        % %out = in;
        % left = in(:,1) + p.feedback * p.buffer(:,1);
        % right = in(:,2) + p.feedback * p.buffer(:,2);
        % out = in;
        % % update the buffer
        % p.buffer = [p.buffer(2:end); out];
    end
    
    function reset(p)
        % reset the buffer
        p.NSamples = 0;
        p.bps = p.bpm/60;
        p.spb = p.samplerate/p.bps;
        p.delayTime = p.spb * p.noteLength;
        p.buffer = zeros(p.delayTime, 2);
    end
end

end