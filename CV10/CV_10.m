    %% MATEMATIKA V MATLABU 

%% 1. Opakování práce s maticemi
% a) Vytvořte matici o velikosti 5ř x 7s, která bude obsahovat čísla od 
% 0 do 20. Využijte přitom funkci rand a round. 

X = round(rand(5,7)*20)

% b) Sečtěte všechny prvky v matici X. 
% vyhledejte maximální hodnotu v matici X a určete její pozici.

m = 0;
for i = 1:5
    for j = 1:7
        if X(i,j) > m
            m = X(i,j);
            p = [i j];
        end
        sum = sum + X(i,j);
    end
end
m
p

% c) Vyhledejte prvek s maximální hodnotou v matici X



% d) Vygenerujte vektor od -pi do pi, rozdělený na 100 hodnot. Vypočítejte 
% y1=sin(x).^2 a y2=sin(x.^2) těchto hodnot. Vykreslete graf funkcí a nastavte osu x
% tak, aby byla v jednotkách pi (ne pořadí vzorku).

x = linspace(-pi, pi, 100);
y1 = sin(x).^2;
y2 = sin(x.^2);
plot(x, y1, x, y2);
set(gca, 'XTick', -pi:pi/2:pi);
set(gca, 'XTickLabel', {'-pi', '-pi/2', '0', 'pi/2', 'pi'});
xlabel('x');
ylabel('y');
legend('y1', 'y2');
title('Graf funkci y1=sin(x).^2 a y2=sin(x.^2)');
grid on;

%% 2. Řešení lineárních rovnic
% a) Vyřeště soustavu lineárních rovnic
% 3x + 2y - z = 5
%  x +    + z = 5
% 2x +  y - z = 2

A = [3 2 -1; 1 0 1; 2 1 -1];

b = [5; 5; 2];

x = A\b

 %% 3. Práce s polynomy
% a) Zadejte polynom  2*x^5 - 5*x^4 + 4*x^3 + 3*x^2 - 6*x + 2*x^0 
% (využijte k tomu jenom koeficienty polynomu)

p = [2 -5 4 3 -6 2]

% b) Vyčíslete polynom z bodu a) pro hodnotu x=2 (funkce polyval)

polyval(p, 2)
 
% c) Vyčíslete polynom z bodu a) pro vektor hodnot -2:1:2

polyval(p, -2:1:2)

 
% d) Vypočítejte polynom (rovnici 2*x^5 - 5*x^4 + 4*x^3 + 3*x^2 - 6*x + 2 = 0)
% z bodu a) (funkce roots)

roots(p)


% e) Ověřte výpočet. Aplikujte na výsledek z bodu d) opět funkci roots a zkontrolujte
% zda je výsledkem stejný polynom jako v bodě a)

roots(roots(p))
 
% f) Zadejte polynom r=4*x^3 + 5*x + 2 

r = [4 0 0 5 2]

% g) Vynásobte polynomy p a r (funkce conv (pozn. lze užít i pro filtraci signálů)

conv(p, r)

% h) Vypočítejte kvadratickou rovnici x^2 - 2*x + 2 = 0

q = [1 -2 2]

roots(q)




