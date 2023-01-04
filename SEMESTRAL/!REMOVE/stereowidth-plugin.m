% https://www.mathworks.com/help/audio/gs/convert-matlab-script-to-an-audio-plugin.html

classdef stereoWidth < audioPlugin % inherits from audioPlugin class properties 


properties (Constant) % constant properties
    PluginInterface = audioPluginInterface(...
        audioPluginParameter('Width', ...
        'Mapping', {'pow', 2, 0, 4}))
end

methods
    function plugin = process(plugin, in) % process method
        % Define processing here
        mid = (in(:,1) + in(:,2))/2;
        side = (in(:,1) - in(:,2))/2;
        side = side * plugin.Width;
        out = [mid + side   mid - side];
    end
end
    
end
