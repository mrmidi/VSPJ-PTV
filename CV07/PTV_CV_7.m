%% PTV 7 - Základy zpracování signálu

%% Úkol 1 - Filtrace v časové oblasti 
% Úkolem je vytvořit filtr, který bude realizovat mediánový nebo průměrující filtr, 
% sloužící k vyhlazení signálu.
% Nejprve budete muset vytvořit tzv. plovoucí okno (v obrazovém pojetí se lze
% setkat také s pojmem maska).
% Plovoucí okno použijeme pro realizaci mediánového (průměrujícího filtru).
% Poznámka: Plovoucí okno nám umožňuje provádět statistické a další výpočty v
% lokálně omezené oblasti, a vyhledávat tak např. diagnosticky zajímavé objekty v signálu. Plovoucí
% okno se pohybuje po analyzovaném vektoru či matici (obvykle s posunem 1 prvek na cyklus).
% Výpočty jsou pak prováděny pouze pro prvky v takto vymezené oblasti.
% Zpravidla si vystačíme pouze s indexem prostředního prvku okna a
% vhodně upravenou hodnotou délky okna – levý i pravý okraj jsou od prostředního prvku stejně
% vzdáleny, a to právě o hodnotu n = (delkaOkna - 1)/2 (Pokud je vstupem liché číslo, což
% většinou z praktických důvodů požadujeme).


% a. Vytvořte funkci mfiltr(). Funkce bude mít vstup "vstup" (vektor hodnot), typ filtru "typ"
% a "delkaokna". Výstupem funkce bude proměnná "vystup" (opět vektor čísel).



% c. Proveďte implementaci plovoucího okna pomocí for cyklu. Šířka okna (počet prvků, 
% které okno překrývá) bude dána vstupní proměnnou delkaokna. 
% Plovoucí okno se bude pohybovat po analyzovaném vektoru prvek po prvku. 
% Pozor na přesah okna mimo indexovatelnou oblast vektoru!

% d. Dle hodnoty proměnné typ (median, prumer) provedte odpovidajici
% vypocet pro prvky ktere se prave nachazeji uvnitr okna.
% Výsledek uložte do vektoru vystup na pozici, která odpovídá aktuálnímu indexu prostředního 
% prvku okna.

% e. Vytvořte testovací skript. Stáhněte z e-learningu soubor ecg250_50_drift.mat a ve skriptu
% jej načtěte. Ze skriptu zavolejte funkci mfiltr() a proveďte filtraci
% různými typy filtrů s různou délkou oken. Pokuste se signál co nejlépe
% vyhladit tak, aby zůstalo zachováno co nejvíce užitečné informace. Výsledky společně s
% původním signálem zobrazte (použijte subplot)

data = load("ekg250_50_drift.mat");
vstup = data.x;
vystup = mfiltr(vstup, "mean", 5);
vystup2 = mfiltr(vstup, "median", 5);
vystup3 = mfiltr(vstup, "mean", 15);
vystup4 = mfiltr(vstup, "median", 15);

figure(1);
subplot(2,2,1);
plot(vstup);
title("Puvodni signal");
subplot(2,2,2);
plot(vystup);
title("Median 5");
subplot(2,2,3);
plot(vystup2);
title("Prumer 5");
subplot(2,2,4);
plot(vystup3);
title("Median 15");


%% Úkol 2 Filtrace ve frekvenční oblasti
% Vytvořte filtr pro zvýraznění QRS komplexu. Energie QRS komplexu se
% odráží v pásmu 10-20Hz. Vzorkovací frekvence signálu je 250 Hz.

Fs = 250; % vzorkovaci frekvence
Fnyq = Fs/2; % Nyquistova frekvence
Fqrs = 10; % frekvence QRS komplexu
Fqrs2 = 20; % frekvence QRS komplexu





% a. Navrhněte filtr - použijte FIR filtr, řádu 8 s mezními
% frekvencemi 10 a 20 Hz

fil = fir1(8, [Fqrs/Fnyq Fqrs2/Fnyq]);

% b. Realizujte filtraci. Příkaz filtfilt. Filtrujte signál
% ecg250_50_drift.mat.

result = filtfilt(fil, 1, vstup);

% c. Vykreslete signál před a po filtraci

figure(2);
subplot(2,1,1);
plot(vstup);
title("Puvodni signal");
subplot(2,1,2);
plot(result);
title("Filtrace");


% d. Vykreslete frekvenční charakteristiku filtru.

figure(3);
freqz(fil);