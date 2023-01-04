classdef chorusPluginV3 < audioPlugin

properties
    predelay = 30; % ms
    rate = 0.5; % Hz
    depth = 5; % amplitude of LFO
    wet = 100; % percent
end

properties (Constant) % Interface
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('predelay', 'DisplayName', 'Predelay', ...
            'Label', 'ms', 'Mapping', {'lin', 0, 100}), ...
        audioPluginParameter('rate', 'DisplayName', 'Rate', ...
            'Label', 'Hz', 'Mapping', {'lin', 0.1, 10}), ...
        audioPluginParameter('depth', 'DisplayName', 'Depth', ...
            'Label', 'ms', 'Mapping', {'lin', 0, 100}), ...
        audioPluginParameter('wet', 'DisplayName', 'Wet', ...
            'Label', '%', 'Mapping', {'lin', 0, 100}));
end

properties (Access = private)
    sampleRate = 48000;
    angleChange = 0;
    currentPhase = 0;
    delayBuffer;
    delayBufferLength;
    delayBufferWriteIndex;
    delayBufferReadIndex;
    preDelaySamples;
    mix;
    NSamples;
    CircularBuffer = zeros(192001, 2);
end

methods
    function plugin = ChorusPluginV3()
        plugin.sampleRate = getSampleRate(plugin);
        % plugin.angleChange = 2*pi*plugin.rate/plugin.sampleRate;
        plugin.angleChange = plugin.rate * (1 / plugin.sampleRate) * 2 * pi;
        plugin.delayBufferLength = ceil(plugin.sampleRate * 0.1) + 1; % 100 ms
        plugin.delayBuffer = zeros(plugin.delayBufferLength, 2); % stereo buffer
        plugin.delayBufferWriteIndex = 1;
        plugin.delayBufferReadIndex = 1;
        plugin.mix = 0.01 * plugin.wet;
        plugin.NSamples = ceil(plugin.sampleRate * plugin.predelay); 
        plugin.preDelaySamples = floor(plugin.sampleRate * 0.001 * plugin.predelay); % convert ms to samples
    end

    function out = process(plugin, in)
        [numSamples, numChannels] = size(in); % size of input block
        out = zeros(numSamples, numChannels); % initialize output block
        wet = zeros(numSamples, numChannels); % initialize wet block

        writeIndex = plugin.delayBufferWriteIndex;
        readIndex = writeIndex - plugin.NSamples;
       % disp("NSamples: " + plugin.NSamples);
       % disp("readIndex: " + readIndex);
        if readIndex <= 0 
           % disp("readIndex <= 0");
            readIndex = readIndex + 192001;
        end
       % disp("writeIndex: " + writeIndex);
       % disp("readIndex: " + readIndex);

        % Loop over samples
        for n = 1:numSamples
            % Write input to delay buffer
            plugin.CircularBuffer(writeIndex,:) = in(n,:);

            % generate LFO
            lfoMS = plugin.depth * sin(plugin.currentPhase) + plugin.predelay;
            lfoSamples = plugin.sampleRate * 0.001 * lfoMS; % convert ms to samples

            fracDelay = lfoSamples;
            intDelay = floor(fracDelay);
            frac = fracDelay - intDelay;

            drySig = in(n,:);
            % wetSig = (1 - frac) * plugin.delayBuffer(readIndex + intDelay,:) + ...
            %     frac * plugin.delayBuffer(readIndex + intDelay + 1,:);

            % readIndex + intDelay
            newReadIndex = readIndex + intDelay;
            if newReadIndex > 192000
                newReadIndex = newReadIndex - 192000;
            end


           % disp("readIndex, intDelay: " + readIndex + ", " + intDelay);
            
            wetSig = (1 - frac) * plugin.CircularBuffer(newReadIndex,:) + ...
            frac * plugin.CircularBuffer(newReadIndex + 1,:);

            out(n,:) = (1 - plugin.mix) * drySig + plugin.mix * wetSig;

            % Update phase
            plugin.currentPhase = plugin.currentPhase + plugin.angleChange;
            if plugin.currentPhase > 2*pi
                plugin.currentPhase = plugin.currentPhase - 2*pi;
            end

            % Update write index
            writeIndex = writeIndex + 1;
            if writeIndex > 192001
                writeIndex = 1;
            end

            % Update read index
            readIndex = readIndex + 1;
            if readIndex > 192000
                readIndex = 1;
            end
           % disp("New readIndex: " + readIndex);

        end % end loop over samples
        plugin.delayBufferWriteIndex = writeIndex;
        plugin.delayBufferReadIndex = readIndex;
    end % end process method

    function reset(plugin)
        plugin.sampleRate = getSampleRate(plugin);
        plugin.angleChange = plugin.rate * (1 / plugin.sampleRate) * 2 * pi;
        plugin.delayBufferLength = ceil(plugin.sampleRate * 0.1); % 100 ms
        plugin.delayBuffer = zeros(plugin.delayBufferLength, 2); % stereo buffer
        plugin.delayBufferWriteIndex = 1;
        plugin.delayBufferReadIndex = 1;
        plugin.mix = 0.01 * plugin.wet;
        plugin.preDelaySamples = ceil(plugin.sampleRate * 0.001 * plugin.predelay); % convert ms to samples
        plugin.NSamples = floor(plugin.sampleRate * 0.001 * plugin.predelay); 
    end

end
end % end classdef