%% PTV CVIČENÍ 1 - Seznámení s Matlabem

%% 1. Seznamte se s prostředím Matlabu
% Workspace, command window, editor, current folder ...
% Home, Plots, Apps, Editor
% Znak % slouží pro komentáře, které se nespouští

%% 2. Seznamte se s nápovědou, nastavením a nastavte cestu k pracovnímu adresáři
% a) Otevřete nápovědu, vyhledejte funkci sin, pročtěte si co vše je zde
% uvedeno

% b) Vytvořte si v počítači složku PTV

% c) Uložte tento skript jako PTV_CV_1_vypracovani do vaší složky (Save -> Save as)

% d) Nastave Current folder do vaší složky (nutné pro spuštění vytvořeného
%    skriptu, Matlab "vidí" jen tyto soubory)

% e) Pokud chceme pracovat se soubory, které nejsou v Current folder,
%    musíme složku přidat do vyhledávacího prostoru Matlabu -
%    např: addpath('D:\Moje\Desktop')

% f) Nastavení prostředí - Např. změna velikosti písma: Záložka HOME -> Preferences -> Fonts

%% 3. Použití command window (cw), základní příkazy
% a) cw funguje jako kalkulačka - zadejte do cw příkaz 3+3
% b) K přiřazení hodnoty do proměné se používá "=". Uložte hodnotu 2 do proměnné a, a hodnotu 7 do proměnné b
% c) Sečtěte proměnou a a b a uložte ji do proměnné c, sledujte work space,
%    kde vidíte vytvořené proměnné
% d) Proměnou c odmocněte, příkaz pro to vyhledejte v nápovědě
% e) Proměnou c vynásobte 5 a uložte do proměnné d, za příkaz umístěte
%    středník, sledujte co je jinak (v budoucnu, při tvorbě delších programů a funkcí středník používejte za
%    jakýmikoliv příkazy, jinak dojde k významnému zpomalení programu)
% f) Zapište výraz c==d, sledujte, co bude výsledkem

%% 4. Další dovednosti
% a) Vyhledejte nápovědu k příkazům clc, clear all a přikazy použijte
% b) Vygerujte vektor příkazem r=1:10000000 - dojde k dlouhému vypisování hodnot,
%    použijte zkratku ctrl+C čímž proces přerušíte (velmi užitečné pokud
%    program zacyklíte atd)

%% 5. Práce se skriptem
% a) Zapiště úkoly z bodu 3b, 3c níže (přímo do tohoto skriptu),  umístěte
%    za každý středník, skript spusťte za pomoci klávesy F5 nebo tlačítka Run, sledujte workspace
clear;
a = 2;
b = 7;
c = a + b;

% b) přidejte příkazy m=a+b, n=a+m, a disp(n), sledujte co se stane

m = a + b;
n = a + m;
disp(n);

% c) Na první řádek skriptu zadejte příkaz pro vymazání všech proměnných.
%    Pomocí šipky pod tlačítkem Run vložte na první řádek Breakpoint a skript
%    spustťe, pomocí "Step" vedle tlačitka run spouštějte řádek po řádku a
%    sledujte work space

%% 6. Ukládání proměnných
% a) uložte proměnou m, pomocí příkazu save
file = "variables.mat";
save(file, "m")

% b) vymažte workspace (úkol 5a) a proměnou m znovu načtěte (load)
clear;
file = "variables.mat";
load(file, "m");
% c) uložte hodnotu proměnné m do proměnné "moje" a uložte ji do složky pod
%    názvem "mojeM"
moje = m;
file = "mojeM";
save(file, "moje");

%% 7. Vytvořte algoritmus pro výpočet obsahu a obvodu trojúhelníku
% Definujte jednotlivé délky stran
% Správně zapište vzorec pro výpočet obvodu a výsledek uložte do proměnné „o"
% Správně zapište vzorec pro výpočet obsahu a výsledek uložte do proměnné „S"
% clear;
a = 4;
b = 13;
c = 15;
o = a + b + c;
s = o / 2;
S = sqrt(s * (s - a) * (s - b) * (s - c));

