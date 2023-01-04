
%% Ukol 1 Základy práce s obrazy

% a) Načtěte obrazek latemar.jpg (nebo jakoukoliv svoji fotografii) do proměnné obr. 
% Obraz zobrazte za pomoci různých funkcí k tomu určených. Viz přednáška. Do jednoho figure
% zobrazte oba způsoby.
clear all; clear; clc;
img = imread('latemar.jpg');
figure(1);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
image(img);

% b) Převeďte obraz na obraz šedotonový a opět ho zobrazte oběma způsoby. 

gray = rgb2gray(img);
figure(2);
subplot(1,2,1);
imshow(gray);
subplot(1,2,2);
image(gray);

% c) Zobrazte obraz s použitím dvou různých colormap. Tzn. nejprve ho
% musíte převést na indexovaný obraz.

figure(3);
subplot(1,2,1);
imshow(gray, jet(256));
subplot(1,2,2);
imshow(gray, hot(256));




% d) Načtěte obraz corn.tif (z datasetu Maltabu). Převeďte ho na RGB
% formát.

[img, map] = imread('corn.tif');
img = ind2rgb(img, map);


% e) Zesvětlete obraz (je jedno jaký). Zobrazte původní a změněnou verzi.

img_light = img + 0.5;
figure(4);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(img_light);


% f) Ztmavte obraz (je jedno jaký). Zobrazte původní a změněnou verzi.

img_dark = img - 0.5;
figure(5);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(img_dark);

% g) Načtětě obraz clown.mat. Zvyšte kontrast v obraze - 
% použijte funkci imadjust.

clown = load('clown.mat');


figure(6);
subplot(1,2,1);
imshow(clown.X, clown.map);
subplot(1,2,2);
rgb_clown = ind2rgb(clown.X, clown.map);
imshow(imadjust(rgb_clown, [0.2, 0.8], [0, 1]));

% h) Zvyšte kontrast v obraze - použijte funkci contrast.

figure(7);
subplot(1,2,1);
imagesc(clown.X)
newmap1 = contrast(clown.X);
colormap(newmap1)
%imshow(contrast_clown);
clear all; clc; clear;
%% Úkol 2 Filtrace obrazu - náhodný šum

% a) Načtěte obraz saturn.png a zobrazte ho.

saturn = imread('saturn.png');

% b) Převeďte obraz do stupňů šedi.

saturn_gray = rgb2gray(saturn);

% c) Přidejte do obrazu gausovský šum. Použijte funkci imnoise s parametry
% (..,gaussian',0,0.025). Zobrazte originální a zašumněný obraz.

saturn_noise = imnoise(saturn_gray, 'gaussian', 0, 0.025);

figure(8);
subplot(1,2,1);
imshow(saturn_gray);
subplot(1,2,2);
imshow(saturn_noise);


% d) Odstraňte náhodný šum z obrazu, k tomu se hodí Wienerův filtr
% - funkce wiener2.

saturn_wiener = wiener2(saturn_noise);

figure(9);
subplot(1,2,1);
imshow(saturn_noise);
subplot(1,2,2);
imshow(saturn_wiener);


%% Úkol 3 Filtrace obrazu - impulzní šum


% a) Načtěte obraz eight.tif a zobrazte ho.

eight = imread('eight.tif');



% b) Přijdte do obrazu impulzní šum. Ten se vyznačuje mimo jiné tím, že jeho
% hodnoty jsou blízké jednomu z okrajů barevné škály (extrémní).


eight_noise = imnoise(eight, 'salt & pepper', 0.02);


% c) (filter2(fspecial('average',3),J)/255) - jedná se o průměrující filtr. 
% Myslíte, že jsme zvolili správný filtr? Zobrazte výsledek.

eight_average = filter2(fspecial('average',3),eight_noise)/255;

figure(10);
subplot(1,2,1);
imshow(eight_noise);
subplot(1,2,2);
imshow(eight_average);

  
% d) Filtrace není uspokojivá. Pro impulzní rušení se více hodí mediánový
% filtr. Funkce medfilt2. Realizujte filtraci. Zobrazte výsledek.

eight_median = medfilt2(eight_noise);

figure(11);
subplot(1,2,1);
imshow(eight_noise);
subplot(1,2,2);
imshow(eight_median);
