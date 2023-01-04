%% ANALÝZA OBRAZU - SEGMENTACE ODLESŇOVÁNÍ 
 
% Vaším úkolem je na základě leteckých snímků Amazonského pralesa
% za posledních 16 let (2000,2004,2008,2012,2016) provést analýzu 
% odlesněné a zalesněné plochy.
% Na fotografiích je odlesněná půda vidět jako světle oranžová barva. 
% Na foto jasně vidíme, že se odlesněná plocha v každém období postupně
% zvětšuje. Abychom to mohli kvantifikovat potřebujeme obraz tzv. segmentovat. 
% Dle toho poté zjistíme přesnou velikost zalesněné a odlesněné plochy v 
% jednotlivých letech.


% a) Načtěte foto pralesa z roku 2000 a 2016. S těmito obrazy budeme
% pracovat.

% load year2000.jpg

for i = 2000:4:2016
    load(['year' num2str(i) '.jpg']);
end




% b) Vizuálně porovnejte foto pralesa z roku 2000 a z roku 2016. Použijte funkci
% imshowpair (místo dvou subplot)


% c) K tomu, aby bylo možné obraz segmentovat ho nejprve potřebujeme převést do
% šedotónové škály. Převeďte obě fotografie.


% d) Zobrazte histogram


% e) Histogram nepokrývá celou škálu možných hodnot. Upravte obraz tak, aby
% byla využita celá škála stupňů šedi. Upravený histogram i obraz zobrazte a
% obraz vizuálně porovnejte s originálním.


% g) Teď je potřeba nalézt práh pro realizaci segmentaci obrazu (a získání
% binárního obrazu. To můžete udělat buď manuálně, nebo využít App "Image
% segmentator". Pokud by výsledek nebyl uspokojivý, můžete zkusit
% vysegmentovat přímo barevný obraz za pomoci App "Color Tresholder".
% Nakonec vyexportujte funkci.


% f) Za pomoci vytvořené funkce prahujte i fotografie z dalších let. Využijte cyklus.
% Zároveň rovnou vypočítejte počet pixelů zalesněné plochy v jednotlivých letech. 


% f) Vypočtěte zalesněnou plochy v km čtverečních. Využijte k tomu měřítko,
% které je zobrazeno na fotografiích.

