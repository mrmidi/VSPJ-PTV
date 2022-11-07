%% Cíl 1: Větvení programu pomocí podmínky if
% a) Vytvořte skript s názvem ukazka_if.m.
% b) Prostudujte syntaxi příkazů if - end. Do proměnné 'a' vygenerujte náhodné
% číslo v rozsahu 0 až 1. Pomocí větvení vytvořte jednoduchý program, který
% vypíše do příkazového řádku větu: ‘a je větší než 0.8’, ale jen v případě, že to
% bude pravda. Jinak program nic nevykoná.
% 

a = rand;
if a > 0.8
    disp('a je větší než 0.8');
end



% c) Seznamte se ze strukturou příkazu if - else - end. Program upravte tak, že
% pokud bude a větší než 0.8 napište větu: ‘a je větší než 0.8’ a v opačném
% případě ‘a je menší než 0.8’.
% 

if a > 0.8
    disp('a je větší než 0.8');
else
    disp('a je menší než 0.8');
end



% d) Seznamte se ze strukturou příkazu if - elseif - else - end. Program
% upravte tak, že pokud bude 'a' menší než 0.2 napište větu: 'a je menší než
% 0.2’, pokud bude a mezi 0.2 a 0.8 napište větu: ‘a je mezi 0.2 a 0.8’ a pokud
% bude a větší než 0.8 napište větu: ‘a je větší než 0.8’.
% 

if a > 0.8
    disp('a je větší než 0.8');
elseif a < 0.2
    disp('a je menší než 0.2');
else
    disp('a je mezi 0.2 a 0.8');
end

% g) Vytvořte další skript "znamkovani" novém skriptu vytvořte program pro určení
% známky dle bodového hodnocení viz. schéma v přednášce
% 



% 
%% Cíl 2: Návrh algoritmu pro seřazení sekvence 3 čísel
% a) Vytvořte skript s názvem razeni3cisel.m.
% 
% b) Do proměnné randNum vygenerujte pomocí funkce randi() vektor tří náhodných
% čísel od 1 do 100.
% 
% c) Pomocí větvení doplňte skript o algoritmus, který seřadí čísla ve vektoru randNum
% vzestupně podle velikosti (doporučujeme začít vývojovým diagramem).
% 
% d) Na začátku skriptu použijte příkaz 'input', jehož výstup uložte do proměnné
% typ, pro to, aby uživatel mohl zvolit zda chce čísla seřadit vzestupně nebo 
% sestupně (vzestupne, sestupne)
% 
% e) Rozšiřte skript o variantu algoritmu z bodu c), který bude tentokrát řadit vstupní
% posloupnost sestupně.
% 
% f). Na základě obsahu proměnné sortType proveďte vhodnou úpravu obou algoritmů z
% bodu c) a e). Pokud bude proměnná sortType obsahovat řetězec 'vzestupne',
% algoritmus provede vzestupné seřazení vektoru randNum. Pokud v proměnné
% sortType bude řetězec 'sestupne', algoritmus provede sestupné seřazení vektoru.
% Pokud proměnná bude obsahovat jiný textový řetězec, program vypíše textovou zprávu
% 'Neznámá metoda řazení.'
% g. Program spusťte s krokováním a zkontrolujte jeho běh.
% 
% 
%% Cíl 3
% a) Vytvořte funkci s názvem prohledavani, jejíž vstupem bude matice A (pro vyzkoušení si 
% vygenerujte matici příkazem magic), která postupně prohledá všechny prvky matice.
% Využijte dvojitého forcyklu. Funkce sečte všechny prvky matice, mimo prvků na sestupné 
% diagonále - v tomto případě se využijte příkazu 'continue'. 

% % Cíl 4
% Vytvořte funkci, která bude sloužit k vytoření matice, a následnému sečtení prkvů stejným 
% způsobem jako v úkolu 3. Jde jen o to, abychom nejprve nemuseli vyvářet matici mimo funkci, 
% ale matici jsme vytvořili rovnou při volání funkce. (Tzn. vytvoříte novou funkci, která
% bude pouze vytvářet matici (magic) o zvolené veliskosti a následně si tato funkce zavolá 
% funkci "prohledavani" z úkolu 3).
% Nakonec vyzkoušejte vložení obou funkcí do jednoho skriptu a ověřte, zda to funguje. (Toto
% není nutné odevzdávat).