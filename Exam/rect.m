% a) Vytvořte funkci pro výpočet obsahu nebo obvodu obdélníku.
% Vstupními parametry funkce budou: délky stran (a,b) a parametr určující 
% co funkce vypočítá - obvod ('O') nebo obsah ('S').
% Výstup bude jedna hodnota, dle toho, co si uživatel zvolí (nazvěte libovolně).
% Pozn. Funkci zapište sem do skritpu, nezakládejte nový skrip jak je jinak pro
% funkci samozřejmě nutné - při kontrole si překopíruji.

function [out] = rect(a,b,co)
    if co == 'O'
        out = 2*a + 2*b;
    elseif co == 'S'
        out = a*b;
    else
        out = 'Nespravny vstup';
    end
end