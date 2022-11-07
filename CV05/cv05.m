%% PTV - CVIČENÍ 5 - VIZUALIZACE DAT

%% 1. Vyzkoušejte si základní práci s grafy (celkem vygenerujete 6 grafů, nezapomeňta na příkaz figure)
% a) vygenerujte vektor 20ti náhodných čísel
clear; close all;
a = randi(100, 20, 1);



% b) vykreslete tento vektor různými způsoby, použijte funkci 
% plot, stem, area (s defaulním nastavením)
figure(1);
plot(a);
title('20 random integers PLOT');
ylabel('y (0-100)');
xlabel('x');

figure(2);
stem(a);
title('20 random integers STEM');

figure(3);
area(a);

title('20 random integers AREA');
% c) spojitý graf (plot) vykreslete také čárkovanou čárou zelené barvy
figure(1);
plot(a, 'g--');
title('20 random numbers PLOT green line dashed');
%    distkrétní graf (stem) vykreslete tak, aby značky byli ve tvaru
%    hvězdy hvězdy oranžové barvy

%    graf plochy (area) vykreslete zelenou barvou
figure(2);
stem(a, 'pentagram', 'color',[0.8500 0.3250 0.0980]);

figure(3);
area(a, 'FaceColor','green')
% d) popište osy grafů, veličiny si zvolte libovolně
Fs = 44100; %samele frequency
Ts = 1/Fs; %frequency to time
T = 2; %time in secods
t = 0:Ts:T; %2 seconds vector
t = t(:); %rotate vector
N = length(t);
f = 4; %frequency
A = 2; %amplitude
phi = 0.23; %phase
time = [0:N-1]*Ts;
time = time(:);
% t = [0:N-1]*Ts; t=t(:);

y = A * sin(2 * pi * f .* t + phi);
figure(4);
plot(time, y);
title('Sinusoidal signal at 4Hz with amplitude 2');
xlabel('Time (seconds)');
ylabel('amplitude * sin(x)')


%% 2. Grafy (celkem 6) z úkolu 1 vykreslete do jednoho okna Figure, využijte funkci 
% subplot. Nezapomeňte na popisky os. Navíc přidejte do titulku každého grafu název použité 
% funkce
figure(5);
subplot(2, 3, 1);
plot(a);
title('20 random integers PLOT');

subplot(2, 3, 2);
stem(a);
title('20 random integers STEM');

subplot(2, 3, 3);
area(a);
title('20 random integers AREA');

subplot(2, 3, 4);
plot(a, 'g--');
title('20 random numbers PLOT green line dashed');

subplot(2, 3, 5);
stem(a, 'pentagram', 'color',[0.8500 0.3250 0.0980]);
title('20 random numbers STEM orange line with stars');

subplot(2, 3, 6);
area(a, 'FaceColor','green')
title('Green area!');
 
%% 3. V grafu znázorněte zastoupnení účastníků mezinárodní konference.
% Na konferenci se dostavilo: 25 čechů (15 mužů a 10 žen), 30 italů (18 mužů a 12 žen), 
% 27 japonců (13 mužů a 14 žen), 14 američanů (10 žen a 4 muži)
% a) V koláčovém grafu znázorněte zastoupení národností. Popište jednotlivá pole.
% b) Ve sloupcovém grafu znázornětě zastoupení národností a v rámci nich počet mužů a žen.
% Na osu x vložte popisky národností, do legendy vložte popisek toho, které barvy odpovídá 
% mužům a ženám.
% c) Oba grafy vykreslete do jednoho Figure.


figure(6);
czechM = 13;
czechF = 14;
italM = 18;
italF = 12;
japM = 13;
japF = 14;
usM = 4;
usF = 10;
total = [czechM + czechF, italF + italM, japF + japM, usF + usM]
labels = {'Czech Republic', 'Italy', 'Japan', 'USA'};
explode = [1 1 1 1];
subplot(2, 1, 1);
pie(total, explode, labels);
title('Participans by country');

xaxis = ["CZ (M/F)"; "IT (M/F)"; "JAP (M/F)"; "USA (M/F)"];
total2 = [czechM czechF; italM italF; japM japF; usM usF];
subplot(2, 1, 2);
bar(total2);
set(gca, 'XTick', 1:length(xaxis), 'XTickLabel', xaxis);
ylabel('People')
title('Participants by Country/Sex');
legend('Male', 'Female');


%% 4. Vyzkouskoušejte si anotaci dat
% a) Vykreslete funkci sin v intervalu 0 až 2*pi.
% b) Za pomoci funkce stem označete pozici jejího maxima (zjsitíte funkcí max)
% c) Maximum označte za pomoci funkce annotation. Označte ho slovním popisem a šipkou ukazující 
% na daný bod.
figure(7);
y2 = 1 * cos(2 * pi * 18 .* t + 2);
y2 = y2 + y;
plot(time, y2);

hold on

[maxVal, maxPos] = max(y2);
maxVal
maxPos
stem(maxVal, maxPos);

hold off

%% 5. Vytvořte elipsoid (funkce elipsoid) a vykreslete ho za pomoci funkce surf. Změňte barevnou škálu na jinou 
% než je defaulně nastavená dle Vaší volby.
figure(8);
[X, Y, Z] = ellipsoid(0,0,0,1.5,1.5,3);
surf(X,Y,Z);
colormap summer;
axis equal

 
%% 6. Pokud je objekt s počáteční teplotou T vložený do tekutiny s teplotou S, dle Newtonova ochlazovacího zákona, 
% dosáhne teploty Tt dle vzorce Tt=S+(T-S)*e^(-k*t), kde k je konstanta závisející na vlastnostech objektu.
% Vytvořte grafy závislosti Tt na čase, pro 1:10 minutu, při počáteční teplotě objektu 100 stupňů a k=0.6
% pro dvě různé teploty okolí: 50 a 20 stupňů.
% Každý graf vykreslete čárou různé šířky, různé barvy a různého typu. Přidejte legendu.

figure(9);
t = 0:0.1:10;
T = 100;
S = 50;
k = 0.6;
Tt = S + (T - S) * exp(-k * t);
plot(t, Tt, 'LineWidth', 2, 'Color', 'red', 'LineStyle', '-');
hold on

S = 20;
Tt = S + (T - S) * exp(-k * t);
plot(t, Tt, 'LineWidth', 2, 'Color', 'blue', 'LineStyle', '-');
hold off

legend('S = 50', 'S = 20');
xlabel('Time');
ylabel('Temperature');
title('Temperature of object in liquid');


%% 7. Vytvořte program, který bude za pomoci for cyklu vykreslovat různě velké čtverce. V každém forc cyklu přidejte 
% hodnotu 0.1 ke všem elementů tak, aby se vždy o tuto hodnotu zvětšil čtverec (počáteční velikost strany je 1)
% a stejně se o tuto hodnotu změnila pozice počátku vykreslení čtverce (počáteční pozice je [1,1]).
% Při spuštění programu se čtverce nebudou vykreslovat najednou, ale postupně, s 0.5 sec pauzou. Nezapomeňte správně 
% nastavit osy grafu.
% 

figure(10);
for i = 0:0.1:1
    rectangle('Position', [1 + i, 1 + i, 1 + i, 1 + i])
    hold on
    axis([0 5 0 5])
    pause(0.5)
end

