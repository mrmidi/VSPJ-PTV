%  This is a plugin for the Audio Plugin Interface (API) that implements a AM Modultaion tremolo
classdef tremoloPlugin < audioPlugin

%  Properties
properties
    %  Frequency of the tremolo
    Frequency = 2;
    %  Depth of the tremolo
    Depth = 50;
    %  Waveform of the tremolo
    Waveform = 'Sine';
    samplerate;
    n = 0;
    buffer;
end

%  Plugin control parameters

properties (Constant)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Frequency',...
            'DisplayName','Frequency',...
            'Mapping',{'lin',0,20}),...
        audioPluginParameter('Depth',...
            'DisplayName','Depth',...
            'Mapping',{'lin',1,100}),...
        audioPluginParameter('Waveform',...
            'DisplayName','Waveform',...
            'Mapping',{'enum','Sine','Triangle','Square'}));
end

methods

    % Constructor
    function p = tremoloPlugin
        %  Set the sample rate
        p.samplerate = getSampleRate(p);
        
    end
    
    %  Process method
    function out = process(p,in)
        
        
        buffer = zeros(size(in));
        out = zeros(size(in));
        
        t = p.n-1 / p.samplerate;

        depth = p.Depth * 0.1; % percent to decimal
        amp = 0.5 * depth;
        offset = 1 - amp;
        
        for i = 1:length(in)

            p.n = p.n + 1;


            mod = amp * sin(2*pi*p.Frequency*t) + offset;

            buffer(i,:) = in(i,:) * mod;

        end

        out = buffer;
        

        %  Create a time vector
%        t = (0:length(in)-1)' / p.samplerate;
        %  Create a modulation signal
%         switch p.Waveform
%             case 'Sine'
%                 mod = sin(2*pi*p.Frequency*t);
%             case 'Triangle'
%                 mod = sawtooth(2*pi*p.Frequency*t,0.5);
%             case 'Square'
%                 mod = sawtooth(2*pi*p.Frequency*t,0.5);
%                 mod(mod>0) = 1;
%                 mod(mod<0) = -1;
%             default
%                 mod = sin(2*pi*p.Frequency*t);
%         end 
        %  Apply the modulation
        % mod = sin(2*pi*p.Frequency*t);
        % out = [in(:,1).*(1+p.Depth*mod) in(:,2).*(1+p.Depth*mod)];
        %out = in.*(1+p.Depth*mod);
    end
end

end