%% 2. Základy práce s pokročilejšími matematickými funkcemi

% a) Vytvořte symbolické proměnné x, y

x = sym('x');
y = sym('y');

% b) Vypočítejte sin(x) a vykreslete výsledek (funkce fplot)

fplot(sin(x), [-2*pi, 2*pi]);

% c) Vypočítejte derivaci sin(x) (funkce diff)

diff(sin(x))

% d) Vypočítejte integrál sin(x) (funkce int)

int(sin(x))

% e) Rozšiřte výraz (x-1)(x+1) (fukce expand)

expand((x-1)*(x+1))

% f) Vynásobte funkci z bodu e) 4 a poté ho zjednodušte (funkce factor)

factor(4*expand((x-1)*(x+1)))

% g) Dosaďte do funkce z bodu f) za x hodnotu 5 a vypočítejte (funkce subs)

subs(factor(4*expand((x-1)*(x+1))), x, 5)

% h) Vypište jakoukoliv funkci "jako na papíře" (funkce pretty)

pretty(sin(x))
 
% i) Za pomoci funkce solve vypočítejte rovnici x^2 + 2y^2 + 5 = 0

solution = solve(x^2 + 2*y^2 + 5 == 0, x, y)

% j) Za pomoci funkce solve vypočítejte soustavu nerovnic. Výsledek bude obsahovat parametr, nezapomeňte
% zadat na vstup funkce nastavení 'ReturnConditions',true.
% x + 1 > 0
% y > 0
% x^2 + 2*y^2 + x*y < 1

solution = solve(x + 1 > 0, y > 0, x^2 + 2*y^2 + x*y < 1, x, y, 'ReturnConditions',true)

%% 3. Určete maximum a minimum funkce u.

% Vyšetřete lokální extrémy funkce
% u= x^3 + 3x^2 + y^2 + z^2 + 12xy + 15x + 14y +4z +17

z = sym('z')

u = x^3 + 3*x^2 + y^2 + z^2 + 12*x*y + 15*x + 14*y + 4*z + 17

extr1 = diff(u, x)

extr2 = diff(u, y)

extr3 = diff(u, z)

% a) Určetě všechny první parciální derivace

pd1 = diff(u, x)
pd2 = diff(u, y)
pd3 = diff(u, z)

% b) Určetě stacionární body (vypočítejte soustavu rovnic vzniklou
% sestavením parciálních derivací u)

solution = solve(pd1 == 0, pd2 == 0, pd3 == 0, x, y, z, 'ReturnConditions',true)

% c) Vypočítejte druhé parciální derivace (bude jich 6)

pd11 = diff(u, x, x)
pd12 = diff(u, x, y)
pd13 = diff(u, x, z)
pd22 = diff(u, y, y)
pd23 = diff(u, y, z)
pd33 = diff(u, z, z)

% d) Sestavte matice z druhých parciálních derivací pro jednotlivé stacionární 
% body a určete jejich determinanty. 

H1 = [pd11, pd12, pd13; pd12, pd22, pd23; pd13, pd23, pd33]

det1 = det(H1)


% e) Určete lokální maximum a minumum.

m = min(u)
