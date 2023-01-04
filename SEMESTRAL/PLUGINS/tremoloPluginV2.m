classdef tremoloPluginV2 < audioPlugin

properties
    Rate = 1;
    Depth = 1;
    Waveform = 'sine';
end

properties (Constant)
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Rate', 'Mapping',{'log',0.1,10}),...
        audioPluginParameter('Depth', 'Mapping',{'lin',0,1}),...
        audioPluginParameter('Waveform', 'Mapping',{'enum','sine','square'}))
end

properties (Access = private)
    sampleRate = 44100; % Sample rate (default)
    currentPhase = 0; % Current phase of the LFO
    angleChange = 0.1 * (1 / 44100) * 2 * pi; % Angle change per sample
end

methods
    % Constructor
    function plugin = tremoloPluginV2()
        plugin.sampleRate = getSampleRate(plugin);
        plugin.angleChange = plugin.Rate * (1 / plugin.sampleRate) * 2 * pi;
    end

    % Processing method
    function out = process(plugin, in)
        [numSamples, numChannels] = size(in); % Get number of samples and channels
        out = zeros(numSamples, numChannels); % Pre-allocate output

        % Loop through each sample
        for n = 1:numSamples
            % Calculate the LFO value
            if strcmp(plugin.Waveform, 'sine')
                lfo = (plugin.Depth / 2) * sin(plugin.currentPhase) + (1 - plugin.Depth / 2); % Sine wave
            else
                lfo = (plugin.Depth / 2) * sign(sin(plugin.currentPhase)) + (1 - plugin.Depth / 2); % Square wave
            end

            % Apply the LFO to the input
            out(n,:) = in(n,:) * lfo;

            % Update the phase
            plugin.currentPhase = plugin.currentPhase + plugin.angleChange; % Update the phase of the LFO
            if plugin.currentPhase > 2 * pi % Wrap phase if necessary
                plugin.currentPhase = plugin.currentPhase - 2 * pi; % Wrap phase
            end
        end % for

    end % process

        function reset(plugin) % Reset method
            plugin.sampleRate = getSampleRate(plugin);
            plugin.currentPhase = 0;
            plugin.angleChange = plugin.Rate * (1 / plugin.sampleRate) * 2 * pi;
        end % reset

        function set.Rate(plugin, Rate) % Set method for Rate
            Fs = getSampleRate(plugin);
            plugin.Rate = Rate;
            plugin.angleChange = plugin.Rate * (1 / Fs) * 2 * pi;
        end % set.Rate
    end % methods
end % classdef