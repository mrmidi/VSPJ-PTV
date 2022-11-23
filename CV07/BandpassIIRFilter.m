classdef BandpassIIRFilter < audiopluginexample.private.SecondOrderIIRFilter
%BandpassIIRFilter Bandpass second-order IIR filter
%  Second-order bandpass IIR filter with tunable center frequency and Q
%  factor. 
%
%  This audio plug-in inherits from SecondOrderIIRFilter which does most
%  of the heavy lifting.
%
% See also: audiopluginexample.LowpassIIRFilter,
% audiopluginexample.HighpassIIRFilter
 
%   Copyright 2016-2020 The MathWorks, Inc.

 
    %#codegen 
    properties 
        % Center frequency in Hz
        CenterFrequency = 20;  
    end
    properties (Constant)
        % Define the plugin interface
        PluginInterface = audioPluginInterface( ...
            'PluginName','Bandpass IIR Filter',...
            audioPluginParameter('CenterFrequency', ...
            'DisplayName',  'Center Frequency', ...
            'Label',  'Hz', ...
            'Mapping', { 'log', 20, 20000}, ...
            'Style', 'rotaryknob', 'Layout', [1 1]),...
             audioPluginParameter('Q', ...
            'DisplayName',  'Q', ...            
            'Mapping', { 'log', 0.01, 200}, ...
            'Style', 'rotaryknob', 'Layout', [1 2]), ...
            audioPluginGridLayout('RowHeight',[100 20], ...
            'Padding', [10 10 10 30]), ...
            'BackgroundImage', audiopluginexample.private.mwatlogo);        
    end
    methods
        function plugin = BandpassIIRFilter            
            % Call superclass constructor
            plugin = plugin@audiopluginexample.private.SecondOrderIIRFilter;
        end
        function set.CenterFrequency(plugin,Fc)
            plugin.f0  = Fc;
        end
        function val = get.CenterFrequency(plugin)
            val =  plugin.f0;
        end

    end
    
    methods (Access = protected)
        function num = calculateNum(~,alpha,norm,~)
            num = alpha*norm * [1 0 -1];
        end
        function str = visualTitle(~)
            str = 'Bandpass Filter';
        end
    end
  
end