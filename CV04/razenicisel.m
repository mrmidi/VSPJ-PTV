% 
%% Cíl 2: Návrh algoritmu pro seřazení sekvence 3 čísel
% a) Vytvořte skript s názvem razeni3cisel.m

% 
% b) Do proměnné randNum vygenerujte pomocí funkce randi() vektor tří náhodných
% čísel od 1 do 100.
% 

% size = 3; % size of random numbers vector

%disp('Enter length of vector:')

size = input("Enter length of the vector: ")
direction = input("Choose the sorting order (1 ascending, 2 - descending. Default is ascending: ");
if isempty(direction)
    direction = 1
end

%randNum = rand(size, 1);

randNum = randi(100, 1, size);
randNum = randNum(:)

% c) Pomocí větvení doplňte skript o algoritmus, který seřadí čísla ve vektoru randNum
% vzestupně podle velikosti (doporučujeme začít vývojovým diagramem).
% 

% B U B L E     S O R T

sortedNum = zeros(size);  % resulting vector
for i = 1:size
    for j = 1:size - i
        %disp(randNum(i));
        if direction == 1
          if randNum(j) > randNum(j + 1)
              %disp(i);
              disp('changing numbers');
              temp = randNum(j);
              randNum(j) = randNum(j + 1);
              randNum(j + 1) = temp;
          end
        else
             if randNum(j) < randNum(j + 1)
                %disp(i);
                temp = randNum(j);
                randNum(j) = randNum(j + 1);
                randNum(j + 1) = temp;
             end   
          
        end
    end
end

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

myMatrix = magic(4);
result = prohledovani(myMatrix);


% % Cíl 4
% Vytvořte funkci, která bude sloužit k vytoření matice, a následnému sečtení prkvů stejným 
% způsobem jako v úkolu 3. Jde jen o to, abychom nejprve nemuseli vyvářet matici mimo funkci, 
% ale matici jsme vytvořili rovnou při volání funkce. (Tzn. vytvoříte novou funkci, která
% bude pouze vytvářet matici (magic) o zvolené veliskosti a následně si tato funkce zavolá 
% funkci "prohledavani" z úkolu 3).
% Nakonec vyzkoušejte vložení obou funkcí do jednoho skriptu a ověřte, zda to funguje. (Toto
% není nutné odevzdávat).