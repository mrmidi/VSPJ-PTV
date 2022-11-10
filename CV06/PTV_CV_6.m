
%% 1. Základní analýza dat - výšky a váhy skupiny subjektů

% a) Načtěte soubor parametry.mat

data = load('parametry.mat');

% b) Vytvořte histogram výšky

figure(1);
vyska = data.parametry.heigth;
vaha = data.parametry.weight;
histogram(vyska);

% c) Vytvořte graf závislosti výšky na váze, popište osy názvem parametru a
%  jednotkami. Co graf říká?

figure(2);
plot(vaha, vyska, 'o');
xlabel('Vaha [kg]');
ylabel('Vyska [cm]');
title('Zavislost vahy na vysce');
% Graf ukazuje, ze vaha a vyska jsou kladne korelovane.

% d) Vizualizujte krabicový graf dat váhy. Popište osu y. Co graf říká?

figure(3);
boxplot(vaha);
ylabel('Vaha [kg]');
% Graf ukazuje, ze vaha je normalne rozdeleny.

%% 2. Základní analýza dat - krevní tlak, průměr medián, směrodatná odchylka
% a) Načtěte data Tlak.xlsx 

xlsdata = xlsread('Tlak.xlsx');

% b) Vytvořte histogram pro systolický a diastolický tlak - do jednoho grafu.

figure(4);
histogram(xlsdata(:,1));
hold on;
histogram(xlsdata(:,2));
hold off;
legend('Diastolicky tlak', 'Systolicky tlak');


% c) Vypočtěte medián a průměr pro oba tlaky. 

m1 = median(xlsdata(:,1))
m2 = median(xlsdata(:,2))
m3 = mean(xlsdata(:,1))
m4 = mean(xlsdata(:,2))


% d) Vhodným způsobem průměr i medián zobrazte v grafu

figure(5);
plot(xlsdata(:,1), xlsdata(:,2), 'o');
hold on;
plot(m1, m2, 'r*');
plot(m3, m4, 'g*');
hold off;
legend('Tlaky', 'Medián', 'Průměr');


% e) Vypočtěte směrodatnou odchylku a interkvartilový rozptyl pro oba tlaky

s1 = std(xlsdata(:,1))
s2 = std(xlsdata(:,2))
iqr1 = iqr(xlsdata(:,1))
iqr2 = iqr(xlsdata(:,2))


%% 3. Porovnání skupin dat za použití Boxplotů
% a) Načtěte data 'fisheriris'. Jedná se o data velikosti 4 parametrů okvětních květů 3 typů 
% květin (data možná znáte, velmi často používaná při výuce statistiky). 
% b)Zobrazte boxploty pro 3 typy květin (species) postupně pro všechny 4 parametry.
% Použijte subplot.
% Použijte boxplot typu 'notch' tento boxplot zobrazuje medián hodnot. Pokud se zářez v grafu
% nepřekrývá se zářezem druhého grafu, znamená to, že s 5% pravděpodobností jsou tyto hodnoty
% odlišné a daný parametr může dobře posloužit při klasifikaci dat pro jejich odlišení.
% c) Které květiny se ve kterých parametrech statisticky významně odlišují
% a které ne?


% https://www.mathworks.com/help/stats/classification-example.html
% https://www.mathworks.com/help/stats/compare-grouped-data-using-box-plots.html

% https://en.wikipedia.org/wiki/Iris_flower_data_sethttps://en.wikipedia.org/wiki/Iris_flower_data_set

load fisheriris
figure(6);
subplot(2,2,1);
boxplot(meas(:,1),species,'notch','on');
title('Delka kvetu');
subplot(2,2,2);
boxplot(meas(:,2),species,'notch','on');
title('Sirka kvetu');
subplot(2,2,3);
boxplot(meas(:,3),species,'notch','on');
title('Delka listu');
subplot(2,2,4);
boxplot(meas(:,4),species,'notch','on');
title('Sirka listu');



%% 4. Ukázka - Vizualizace vícerozměrných dat 
% This example shows how to visualize multivariate data using various statistical plots. 
% Many statistical analyses involve only two variables: a predictor variable and a response 
% variable. Such data are easy to visualize using 2D scatter plots, bivariate histograms, 
% boxplots, etc. It's also possible to visualize trivariate data with 3D scatter plots, 
% or 2D scatter plots with a third variable encoded with, for example color. 
% However, many datasets involve a larger number of variables, making direct visualization 
% more difficult. This example explores some of the ways to visualize high-dimensional data 
% in MATLAB.
% 
% In this example, we'll use the carbig dataset, a dataset that contains various measured 
% variables for about 400 automobiles from the 1970's and 1980's. We'll illustrate 
% multivariate visualization using the values for fuel efficiency (in miles per gallon, MPG), 
% acceleration (time from 0-60MPH in sec), engine displacement (in cubic inches), weight, 
% and horsepower. We'll use the number of cylinders to group observations.

load carbig
X = [MPG,Acceleration,Displacement,Weight,Horsepower];
varNames = {'MPG'; 'Acceleration'; 'Displacement'; 'Weight'; 'Horsepower'}; 

figure
gplotmatrix(X,[],Cylinders,['c' 'b' 'm' 'g' 'r'],[],[],false);
text([.08 .24 .43 .66 .83], repmat(-.1,1,5), varNames, 'FontSize',8);
text(repmat(-.12,1,5), [.86 .62 .41 .25 .02], varNames, 'FontSize',8, 'Rotation',90);

%% 4a. Úkol - Vizualizace vícerozměrných dat 
% Načtěte 'carsmall' dataset. Vytvořte matici scatter plot(ů), která bude porovnávat
% každý parametr auta (data carsmall) s každým.
% V každém scatter plotu barevňte odlište skupiny aut dle počtu válců.
% Na diagonálu plot matrix zobrazte histogram pro daný parametr.
% Přidejte titulek grafu.


load carsmall
X = [MPG,Acceleration,Displacement,Weight,Horsepower];
varNames = {'MPG'; 'Acceleration'; 'Displacement'; 'Weight'; 'Horsepower'};
figure(7);
gplotmatrix(X,[],Cylinders,['c' 'b' 'm' 'g' 'r'],[],[],false);
text([.08 .24 .43 .66 .83], repmat(-.1,1,5), varNames, 'FontSize',8);
text(repmat(-.12,1,5), [.86 .62 .41 .25 .02], varNames, 'FontSize',8, 'Rotation',90);
title('Porovnani parametru aut dle poctu valcu');


%% 5. Regresní analýza - proložení dat křivkou
% Načtěte data 'census'. Proložte data (osa x 'cdata', osa y 'pop') křivkou. 
% Najděte vhodný typ proložení (možnosti vyhledejte v nápovědě funkce fit).
load census
f = fit(cdate,pop,'poly2')
figure(8);
plot(f, cdate,pop);
title('Prolozeni dat krivkou');
xlabel('cdate');
ylabel('pop');


%% 6.Interpolace dat
% a) Lineární interpolace
% Níže jsou data průměrných teplot v jednotlivých měsících. Pro březen a listopad 
% ale data chybí.
% Zjistěte (interpolujte) pravděpodobnou průměrnou teplotu v měsíci březnu a listopadu.
% Zobrazte v grafu. Interpolované hodnoty a původní hodnoty barevně odliště.
mesic=[ 1 2 4 5 6 7 8 9 10 12];
teplota=[ 0 1 10 15 18 22 21 16 12 3];

mesic2=[ 1 2 3 4 5 6 7 8 9 10 11 12];
teplota2 = spline(mesic,teplota,mesic2); % quadric spline


figure(9);
plot(mesic,teplota,'o');
hold on;
plot(mesic2,teplota2,'-');
title('Interpolace dat');
xlabel('mesic');
ylabel('teplota');
legend('povodni data','interpolovana data');


%% 7. Převzorkování dat
% V tabulce 'vodivost.mat' jsou data závislosti koncentrace na vodivosti.
% Data ale nejsou ekvidistantně vzorkována (koncentrace se neměnila pravidelně).
% Za pomoci interpolace převzorkujte data tak, aby byla vzorkována pravidelně
% (v praxi potřebné pro další sofistikovanější analýzu). 
 
