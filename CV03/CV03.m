%% CVIČENÍ 3 - DALŠÍ DATOVÉ TYPY A OPERACE S NIMI

% Vyzkoušejte si práci s růůznými datovými typy - využijte infomrací
% uvedených v přednášce a nápovědy 

%% 1: Buňkového pole (cell)
%   a) Pomocí funkce cell() Vytvořte prázdné buňkové pole A, které bude mít
%     rozměr 3x1.

A = cell(3,1)

%   b) Na pozici 1,1 v buňce A uložte libovolnou matici.
mtrx = magic(3);
A{1} = (mtrx);

%   c) Na pozici 2,1 uložte řetězec znaků 'I love Matlab'.

A{2} = 'I love Matlab';

%   d) Na pozici 3,1 uložte prázdné buňkové pole o rozměru 1x1, které
%     následně naplníte vektorem od 1 do 10.

pole = linspace(1,10,10);
A{3} = pole;

%   e) Ověřte všechny provedené úkoly ve workspace i v příkazovém řádku.
% 
%   f) Z buňkového pole A extrahujte řetězec znaků 'I love Matlab': 
%      a Uložte jej do proměnné "a" typu char a Uložte jej do proměnné "b" typu cell.

a = A{2};
b = cellstr(a);

%   g) Do proměnné "c" typu double uložte první řádek z matice uložené v
%     buňkovém poli A.

c = A{1}(1,:)

%   h) Do proměnné d typu double uložte 5. prvek z vektoru čísel od 1 od
%     10 uloženém v buňkovém poli A.  


%% 2: Tabulka (table)   
%      a) Vytvořte tabulku s názvem Pacienti 
%         použijte funkci "table" a vytvořte z níže definovaných proměnných 
%         (sloupce tabulky) tabulku 

         LastName = ["Novák";"Bureš";"Novotný";"Diaz";"Zelený"];
         Age = [38;43;38;40;49];
         Smoker = [true;false;true;false;true];
         Weight = [71;69;64;67;64];
         Height = [176;163;131;133;119];
         BloodPressure = [124 93; 109 77; 125 83; 117 75; 122 80];
      
pacienti = table(LastName, Age, Smoker, Height, Weight, BloodPressure);
pacienti

%      b) Prohlédněte si tabulku rozkliknutím ve work space i v příkazovém řádku
% 
%      C) Přidejte do tabulky sloupec BMI a uložte do něj hodnoty BMI
       
BMI = zeros(length(LastName),1);
for i = 1:length(LastName)
   BMI(i) = Weight(i) / (Height(i) / 100)^2;
end

pacienti.BMI = BMI;
pacienti


%      d) Extrahujte výšku pana Nováky za použití závorek (uložte do proměnné V1) a poté  
%         za použití "tečky" (V2)

V1 = pacienti(1, "Height")

%% 3: Strukurované pole (structure)
%     
%     a) Stáhněte si soubor myMovies.mat a pomocí funkce load()
%     soubor načtěte do workspace. Otevřete proměnnou myMovies a ověřte, zda-li
%     strukturované pole odpovídá navrženému schématu (modře je znázorněna ukázka
%     uložených dat):

load("myMovies.mat");

%     b) Seznamte se s funkcí fieldnames(). Zjistěte, jaká pole struktura obsahuje.
%     
%     c) Postupně vyzkoušejte následující příkazy pro vnoření do strukturovaného pole pomocí
%     tečkové notace (výstupy porovnejte):
%     myMovies.ratings
%     myMovies(3).ratings
%     myMovies(3).ratings(1,2)
%     
%     d) U filmu Zelená míle změňte počet ocenění (pole academyAward) na 5

myMovies(1).info.academyAward = 5;

%     e) Do příkazové řádky vypište největší hodnotu z posledních 3 známek u filmu
%     Mlčení jehňátek.

%     f) Seznamte se s funkcí isfield(). Zjistěte, zda-li v proměnné myMovies
%     existuje pole avgRating. Pokud ne, pole pro každý záznam (film) zvlášť
%     vytvořte, a uložte do něj průměrnou hodnotu z pole ratings.
%myMovies(1).

[dunno, numCols] = size(myMovies)
avgRating = zeros(numCols, 1);
for i = 1:numCols
    myMovies(i).avgRatings = mean(myMovies(i).ratings);
end

%     g) Vytvořte proměnnou nazevPole a uložte do ní řetězec 'ratings'. Využijte
%     dynamického vnoření pomocí proměnné nazevPole pro zápis nové známky

nazevPole = 'ratings';


%     h) filmu Babovřesky (za poslední hodnotu v matici):
%     myMovies(3).(nazevPole)(...) = ...
%     



%     i) U filmu Mlčení jehňátek změňte žánrovou položku 'Drama' na 'Komedie'.
%     U filmu Zelená míle zcela odstraňte poslední dvě položky žánru. V čem a
%     proč se liší syntaxe příkazů u obou úkolů?

myMovies(2).genre(3) = cellstr('Komedie');

%     j) Seznamte se s funkcí rmfield(). Ze struktury zcela odstraňte pole
%     avgRating. Výsledek zkontrolujte ve workspace.

myMovies = rmfield(myMovies, 'avgRatings');

%     k) Ze struktury myMovies zcela odstraňte záznam posledního filmu.

myMovies(3) = [];

%     l) Ve struktuře myMovies vytvořte nový záznam pro film dle vašeho výběru.
  
name = 'Test';
genre = cell(1);
genre(1, 1) = cellstr('komedie'); genre(1, 2) = cellstr('drama');
ratings = randi(10,1,15)
%struct('123', 222; 'awef', "aaa")
data = struct('year', 1999, 'length', 113, 'director', 'Steven Spielberg', 'academyAward', 9)

myMovies(3).genre = genre;
myMovies(3).name = name;
myMovies(3).ratings = ratings;
myMovies(3).info = data;

%myMovies(3) = {'Test'};



%     bonus) Vyzkoušejte tvorbu struktury s proměnným názvem pole - pole se bude nazývat dle aktuálního dne a času
%     Vyzkoušejte příkazy:
%     currentDate = datestr(now,'mmmmdd');
%     myStruct.(currentDate) = [1,2,3]
%     Pokuste se zjistit jak dosáhnout toho, aby se místo názvu měsíce i data zapsal také čas               
%     Pozn. Tento bonusový úkol nemusíte vypracovat, jen pro prohloubení
%     znalostí :)
 


