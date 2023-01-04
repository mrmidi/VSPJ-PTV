classdef matlabChorusExample < audioPlugin

%   Copyright 2015-2020 The MathWorks, Inc.

    properties
        Delay = 0.02
    end
        
    properties 
        Depth1 = 0.01 % first modulator depth
        Rate1 = 0.01 % first modulator rate (Hz)
        Depth2 = 0.03 % second modulator depth
        Rate2 = 0.02 % second modulator rate (Hz)
    end
    
    properties        
        WetDryMix = 0.5
    end
    
    properties (Constant)
        % audioPluginInterface manages the number of input/output channels
        % and uses audioPluginParameter to generate plugin UI parameters.
        PluginInterface = audioPluginInterface(...
            'InputChannels',2,...
            'OutputChannels',2,...
            'PluginName','Chorus',...
            'VendorName','',...
            'VendorVersion','3.1.4',...
            'UniqueId','ipsg',...
            audioPluginParameter('Delay','DisplayName','Base delay','Label','s','Mapping',{'lin' 0 0.2}, ...
            'Style', 'rotaryknob', 'Layout', [4 3]),...
            audioPluginParameter('Depth1','DisplayName','Depth 1','Label','','Mapping',{'lin' 0 10}, ...
            'Style', 'vslider', 'Layout', [1 1; 2 1]),...
            audioPluginParameter('Rate1','DisplayName','Rate 1','Label','Hz','Mapping',{'lin' 0 10}, ...
            'Style', 'rotaryknob', 'Layout', [4 1]),...
            audioPluginParameter('Depth2','DisplayName','Depth 2','Label','','Mapping',{'lin' 0 10}, ...
            'Style', 'vslider', 'Layout', [1 2; 2 2]),...
            audioPluginParameter('Rate2','DisplayName','Rate 2','Label','Hz','Mapping',{'lin' 0 10}, ...
            'Style', 'rotaryknob', 'Layout', [4 2]),...
            audioPluginParameter('WetDryMix','DisplayName','Wet/dry mix','Label','','Mapping',{'lin' 0 1}, ...
            'Style', 'rotaryknob', 'Layout', [2 3]), ...
            audioPluginGridLayout('RowHeight', [90 100 20 100 20], ...
            'ColumnWidth', [100 100 100], 'Padding', [10 10 10 30]));
    end
    
    properties (Access = private, Hidden)
        %pFractionalDelay Delay Filter object for fractional delay with
        %linear interpolation
        pFractionalDelay

        %pSine1 and pSine2 Oscillators
        pSine1
        pSine2
        
        %pSR Sample rate
        pSR
    end
    
    methods
        % Constructor
        function obj = Chorus
            fs = getSampleRate(obj);
            
            % Create the modulators
            obj.pSine1 = audioOscillator('Frequency', 0.01,...
                'Amplitude', 0.01, 'SampleRate', fs);
            obj.pSine2 = audioOscillator('Frequency', 0.02,...
                'Amplitude', 0.03, 'SampleRate', fs);
            
            % Create fractional delay
            obj.pFractionalDelay = dsp.VariableFractionalDelay(...
                'MaximumDelay',65000);
        
            obj.pSR = fs;
        end
        
        function set.Depth1(obj, val)
            obj.pSine1.Amplitude = val;
        end
        function val = get.Depth1(obj)
            val = obj.pSine1.Amplitude;
        end
        
        function set.Rate1(obj, val)
            obj.pSine1.Frequency = val;
        end
        function val = get.Rate1(obj)
            val = obj.pSine1.Frequency;
        end
        
        function set.Depth2(obj, val)
            obj.pSine2.Amplitude = val;
        end
        function val = get.Depth2(obj)
            val = obj.pSine2.Amplitude;
        end
        
        function set.Rate2(obj, val)
            obj.pSine2.Frequency = val;
        end
        function val = get.Rate2(obj)
            val = obj.pSine2.Frequency;
        end
        
        function reset(obj)
            % Reset sample rate
            fs = getSampleRate(obj);
            obj.pSR = fs;
            
            % Reset oscillators
            obj.pSine1.SampleRate = fs;
            obj.pSine2.SampleRate = fs;
            reset(obj.pSine1);
            reset(obj.pSine2);
            
            % Reset delay
            reset(obj.pFractionalDelay);  
        end
        
        function out = process(obj, x)
            
            fs = obj.pSR;
            oscillator1 = obj.pSine1;
            oscillator2 = obj.pSine2;
            
            numSamples = size(x,1);

            % Compute the base delay value in samples
            delayInSamples = obj.Delay*fs;
            
            % Set frame size of oscillator objects
            oscillator1.SamplesPerFrame = numSamples;
            oscillator2.SamplesPerFrame = numSamples;
            
            % Create modulated delay vectors
            [d1 , d2] = size(x);

            % Get delayed input
            delayVector = zeros(d1,d2,2);
            delayVector(:,:,1) = repmat(delayInSamples+oscillator1(),1,2);
            delayVector(:,:,2) = repmat(delayInSamples+oscillator2(),1,2);
            y = obj.pFractionalDelay(x,delayVector);

            % Calculating output by adding wet and dry signal in
            % appropriate ratio
            mix = obj.WetDryMix;
            out = ((1-mix).*x) + (mix.*sum(y,3));
        end
    end
end