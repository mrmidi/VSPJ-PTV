% https://www.mathworks.com/help/audio/gs/convert-matlab-script-to-an-audio-plugin.html

classdef stereoWidthPlugin < audioPlugin % inherits from audioPlugin class properties 

properties (Access = public) % public properties
    Width = 1.5;
end

properties (Constant) % interface
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Width', 'Mapping',{'pow',2, 0, 4}))
end

methods
    function out = process(plugin, in) % process method
        % Define processing here
        mid = (in(:,1) + in(:,2))/2;
        side = (in(:,1) - in(:,2))/2;
        side = side * plugin.Width;
        out = [mid + side, mid - side];
    end

    function reset(plugin) % reset method
        plugin.Width = 1.5;
    end

    function set.Width(plugin, width) % set method
        plugin.Width = width;
    end
end
    
end
