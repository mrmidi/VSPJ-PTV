% g) Vytvořte další skript "znamkovani" novém skriptu vytvořte program pro určení
% známky dle bodového hodnocení viz. schéma v přednášce
% 

x = 77; % znamka

if x >= 90
    disp('A');
elseif x >= 80
    disp('B');
elseif x >= 70
    disp('C');
elseif x >= 60
    disp('D');
else
    disp('F');
end 

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