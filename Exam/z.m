%% PTV - Zápočet 21.12.2022 - Předtermín

% Úkoly vypracujte přímo do tohoto skriptu. Doporučuji si v průběhu práce
% úkoly, které již máte hotové, zakomentovat. 

%% 1. Práce s maticemi a logické indexování

% a) Vytvořte matici C o velikosti 5x5 obsahující čísla od jedné do 20ti. 

C = randi(20,5);

% b) Vytvořte matici A o velikosti 5x5 obsahující celá čísla od 1 do 25ti.

A = randi(25,5);

% c) Z matice C vyberte pouze prvky, které jsou větší než 10.

C1 = C(C>10)

% d) V matici C nahraďte prvky, které jsou menší než prvky na stejné pozici
% v matici A, nulou.

for i = 1:5
    for j = 1:5
        if C(i,j) < A(i,j)
            C(i,j) = 0;
        end
    end
end

C5 = C;
%% 2. Tvorba funkcí

% a) Vytvořte funkci pro výpočet obsahu nebo obvodu obdélníku.
% Vstupními parametry funkce budou: délky stran (a,b) a parametr určující 
% co funkce vypočítá - obvod ('O') nebo obsah ('S').
% Výstup bude jedna hodnota, dle toho, co si uživatel zvolí (nazvěte libovolně).
% Pozn. Funkci zapište sem do skritpu, nezakládejte nový skrip jak je jinak pro
% funkci samozřejmě nutné - při kontrole si překopíruji.


% test = rect(2, 3, 'S')
% function [out] = rect(a,b,co)
%     if co == 'O'
%         out = 2*a + 2*b;
%     elseif co == 'S'
%         out = a*b;
%     else
%         out = 'Nespravny vstup';
%     end
% end

%% 3. Výpočet fyzikální úlohy a tvorba grafů

% Pokud je objekt s počáteční teplotou T vložený do tekutiny s teplotou S, 
% dle Newtonova ochlazovacího zákona, dosáhne teploty Tt dle vzorce Tt=S+(T-S)*e^(-k*t), 
% kde k je konstanta závisející na vlastnostech objektu.
% 
% a) Naprogramujte výpočet závislosti Tt na čase, pro 1:10 minutu, při počáteční 
% teplotě objektu 100 stupňů a k=0.75 pro dvě různé teploty tekutiny (S): 50 a 20 stupňů.


Tt = zeros(1,10);
T = 100;
k = 0.75;
for i = 1:10
    Tt(i) = 50 + (T-50)*exp(-k*i);
end

Tt20 = zeros(1,10);
T = 100;
k = 0.75;
for i = 1:10
    Tt20(i) = 20 + (T-20)*exp(-k*i);
end

% b) Vykreslete graf pro každou z teplot různou barvou a různým typem čáry.
% Graf pro teplotu 50stupňů vykreslete červeně a čárkovaně, pro 20stupňů
% modře a plnou tlustou čarou. Přidejte legendu a popište osy.

figure(1);

plot(Tt,'r--');
hold on;
plot(Tt20,'b-','LineWidth',2);
hold off;

legend('50','20');
xlabel('Cas [min]');
ylabel('Teplota [stupne]');
title('Zavislost teploty na case');


%% 4. Interpolace dat
% a) Níže jsou data teplot změřených každou hodinu během dne. 
% V 5, 10, a 15 hodin data změřená nejsou.
% Za pomoci předdefinované funkce zjistěte (interpolujte) pravděpodobnou teplotu 
% v 5, 10 a 15 hodin.
% b) Data zobrazte v v grafu. Interpolované hodnoty a původní hodnoty barevně odliště.

hodina=[ 1 2 3 4 6 7 8 9 11 12 13 14 16 17 18 19 20 21 22 23 24];
teplota=[ 11 10 8 8 9 10 12 15 17 18 22 22 21 20 18 17 16 15 12 12 11];

in_hod = [5 10 15];
%in_temp = interp1(hodina,teplota,in_hod); % linear interpolation

s_temp = spline(hodina,teplota,in_hod); % cubic spline inerpolation

figure(2);
plot(hodina,teplota,'b-');
hold on;
plot(in_hod,s_temp,'r*--');
hold off;

legend('Puvodni','Interpolovane');
xlabel('Hodina');
ylabel('Teplota [stupne]');
title('Zavislost teploty na case');



%% 5. Práce s obrazy
% Načtěte obraz coins.png
% a) Zobrazte histogram obrazu

A = imread('coins.png');

figure(3);
imhist(A);

% b) Upravte histogram tak, aby byly v obraze využity všechny stupně šedi

B = histeq(A);

figure(4);
imhist(B);

figure(5);
subplot(1,2,1);
imshow(A);
subplot(1,2,2);
imshow(B);


% c) Jednoduchou metodou (funkce, logické indexování, aplikace) prahujte
% (segmentujte) obraz tak, abyste dosáhli toho, že budou mince bílé a
% pozadí černé (artefakty a nepřesnosti, např. bílé tečky v pozadí atd,
% neřešte).

C = B > 100; % 100 je prah pro segmentaci obrazu (mince jsou bile, pozadi cerne)

figure(6);
imshow(C);

