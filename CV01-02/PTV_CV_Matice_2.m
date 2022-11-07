%% PTV CVIČENÍ 2 - MATICE, VEKTORY A OPERACE S NIMI

%% 1: Základy práce s maticemi a vektory
% a) Matice a vektory se v Matlabu zadávají za pomoci hranatých závorek
%    [..], řádky se oddělují středníkem ';'
%    - zadejte vektor 'a', obsahující prvky 4,2,8 a matici 'b' o velikosti
%    2x2 obsahující v prvním řádku prvky 2,20 a ve druhém 3,30 
clear;
a = [4 2 8];
b = [2 20; 3 30];

% b) Prvky z matice nebo vektoru se indexují za pomoci kulatých závorek (.),
%    - vyberte třetí prvek z vektoru 'a' a uložte ho do proměnné 'h' a také
%    první prvek druhého řádku matice 'b' a uložte do proměnné 'h2'
h = a(3);

% c) Vynásobte vektor 'a' i matici 'b' hodnotou proměnné 'h' a výsledky
%    uložte do proměnných 'aa' a 'bb'

aa = a * h;
bb = b * h;

% d) Seznamte se s vytvářením vektorů pomocí zápisu s dvojtečkou. Vygenerujte
%    následující vektory:
%    d1=[1 2 3 5 6 7 8 9 10]
%    d2=[0.5 1.5 2.5 3.5 4.5]
%    d3=[4 6 8 10]
%    d4=[20 19.7 19.4 19.1 18.8]

d1 = 1:1:10;
d2 = [0.5:1;4.5];
d3 = 4:2:10;
d4 = 20:-0.3:18.8;


% e) Seznamte se s vytvářením vektorů pomocí funkce linspace(). Generujte
%    tímto způsobem stejné vektory jako v bodě c ('e1'...'e4').

e1 = linspace(1, 10, 10);
e2 = linspace(0.5, 4.5, 5);
e3 = linspace(4,10,4);
e4 = linspace(20, 18.8, 5);

% f) Seznamte se s vytvářením vektorů pomocí funkce logspace(). Vygenerujte
%    následující vektory:
%    f1=[1 10 100 1000]
%    f2=[1000 177.8 31.6 5.6 1]

f1 = logspace(1, 3, 4);
f2 = logspace(3, 0.1, 5);

% f) Vymažte workspace i příkazový řádek

%clear;

%% 2: Různé způsoby generování matic

% a) Seznamte se s vytvářením matic pomocí zápisu s dvojtečkou (využijte
%    znalosti z Cíle 1.c). Vygenerujte následující matice:
%    A1=[1 2 3       A2=[9 8 7
%       4 5 6           6 5 4
%       7 8 9]          3 2 1]

A1 = [1 2 3; 4 5 6; 7 8 9];
A2 = rot90(A1,2);

% b) Seznamte se s vytvářením matic pomocí funkcí zeros() a ones().
% Vygenerujte matici jedniček 'B1' o rozměrech 5x5 a matici nul 'B2' o rozměru 3x8.

B1 = ones(5);
B2 = zeros(3,8);

% c) Pomocí nápovědy zjistěte, jaké typy matic generují funkce rand(), randn()
% a magic(). Každou z funkcí vygenerujte jednu ('D1...'D2'..'D3') matici.

D1 = rand(3);
D2 = rand(3,4);
D3 = magic(9);

% d) Seznamte se s funkcí diag() a vygenerujte s ní následující matice:
%    E1=[5 0 0 E2=[0 1 0 0  E3=[0 0 2
%        0 5 0     0 0 2 0      0 0 0
%        0 0 5]    0 0 0 3      0 0 0]
%                  0 0 0 0]

v = [5 5 5];
E1 = diag(v);
v = [1 2 3];
E2 = diag(v, 1);
E3 = diag(2, 2);

% f) Vymažte workspace i příkazový řádek

%clear;

%% 3: Operace s maticemi

% a) Pomocí příkazového řádku vytvořte prázdnou proměnnou 'a'. Vytvořte
%    proměnnou b=2. Vytvořte řádkový vektor C=[1 2 3]. Vyzkoušejte součet,
%    rozdíl, součin a podíl proměnných 'a' a b, proměnných C a b a obráceně b a C.
%    Zaměřte se především na to, které operace lze a které nelze provádět.

% b) Vygenerujte sloupcový vektor D=[4;5;6] a pokuste se jej sečíst s
%    vektorem 'C'

% C) Vektor D transponujte a výsledek uložte opět do vektoru D. Pokuste se tyto
%    vektory znovu sečíst.

% c) Spojte vektory C a D s využitím názvu těchto proměnných tak, aby vznikly
%    následující proměnné:
%    E=[1 2 3 4 5 6] 
%    F=[1 2 3
%       4 5 6]

% d) Seznamte se s příkazy sum(), mean(), max(), min(). Ověřte si funkci
%    těchto příkazů na vektoru E a matici F. V čem se výsledky na vektorech a
%    maticích od sebe liší?

% e) Seznamte se s příkazy length(), size() a numel(). Ověřte si funkci
%    těchto příkazů na vektoru E a matici F. V čem se výsledky na vektorech a
%    maticích od sebe liší?

% f) Umocněte vektor E na druhou. Umocněte zvlášť každý prvek vektoru E na
%    druhou. Výsledky porovnejte. Totéž vyzkoušejte s maticí F.

% g) Vymažte workspace i příkazový řádek

%% 4: Indexace matic a vektorů
% a) Pomocí příkazu rand() vygenerujte náhodné matice A a B o rozměru
%    3x3. Matice A bude obsahovat čísla větší než 1 a matice 'B' čísla
%    větší než 10.
%!!!!

% b) Vyzkoušejte příkazy indexace a změny hodnot matice:
% A(1,1)
% A([1 3], 1)
% A(2, 3) = 5
% Prohlédněte si výsledky.

% c) V matici A změňte hodnotu prostředního prvku na 100. Z matice C vymažte
% poslední sloupec. V matici B nahraďte poslední řádek nulami.


% d) Vyzkoušejte příkazy logického indexování pro hledání prvků v matici, či vektoru:
% C>=0.5
% C( C>=0.5 )
% C( C<=0.8 & C>0.1)
% C( A~= 1 ) = 0
% Prohlédněte si výsledky, popište rozdíl mezi prvním a druhým příkazem.

% e) Pomocí příkazu rand() Vytvořte náhodný vektor E délky 10 a vynásobte ho 10ti. Pomocí
% logického indexování z něj uložte do vektoru e1 všechna čísla větší než 5,
% do vektoru e2 uložte všechna čísla větší než 2 a zároveň menší než 8 a do
% vektoru e3 uložte všechna čísla větší než 8 a nebo menší než 2.

% f) Pomocí logického indexování nahraďte všechny hodnoty v matici A, které
% jsou rovny 10, hodnotou 0. V matici B nahraďte všechny hodnoty menší nebo
% rovné 5 hodnotou -100. V matici C nahraďte všechny nenulové hodnoty
% hodnotou 10.

% g) Na všechny sudé pozice vektoru E dosaďte hodnotu -1000 a na sudé pozice
% hodnotu 5. První, pátou a desátou pozici poté zcela odstraňte.

% h) Pomocí příkazu randn() vygenerujte náhodnou matici H o rozměru 10x10.
% Do proměnné h1 uložte součet všech kladných čísel této matice. Sečtěte liché
% sloupce matice a výsledek uložte do sloupcového vektoru h2. Sečtěte druhý,
% sedmý a desátý řádek matice a výsledek uložte do řádkového vektoru h3.

% i) Vymažte workspace i příkazový řádek.