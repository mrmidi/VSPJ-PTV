function [output] = mfiltr(values, type, windowlength)
%MFILTR Summary of this function goes here
%   Detailed explanation goes here

% c. Proveďte implementaci plovoucího okna pomocí for cyklu. Šířka okna (počet prvků, 
% které okno překrývá) bude dána vstupní proměnnou delkaokna. 
% Plovoucí okno se bude pohybovat po analyzovaném vektoru prvek po prvku. 
% Pozor na přesah okna mimo indexovatelnou oblast vektoru!

output = zeros(length(values));
if type == "mean"
    for i = 1:length(values)
        if i < windowlength
            output(i) = mean(values(1:i));
        else
            output(i) = mean(values(i-windowlength+1:i));
        end
    end
elseif type == "median"
    for i = 1:length(values)
        if i < windowlength
            output(i) = median(values(1:i));
        else
            output(i) = median(values(i-windowlength+1:i));
        end
    end
end

end