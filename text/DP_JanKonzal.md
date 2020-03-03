TITULNÍ STRANA BAKALÁŘSKÉ/DIPLOMOVÉ PRÁCE - VLOŽÍ SE NA TUTO POZICI

Pozn.: Titulní strana se generuje v informačním systému. Obsahuje nové
logo VUT, název práce, atd.

ZADÁNÍ BAKALÁŘSKÉ/DIPLOMOVÉ PRÁCE -- VLOŽÍ SE NA TUTO POZICI

Pozn.: Do tištěné verze závěrečné práce se vkládá originál zadání. Tedy
dokument opatřený razítkem a podpisem předsedou oborové rady. V případě,
že je požadován druhý výtisk bakalářské/diplomové práce, vkládá se do
něj černobílá kopie tohoto dokumentu.

V elektronické verzi dokumentu se vkládá naskenovaný originál zadání.

[Poznámka:]{.underline}

**Červeným písmem je uvedeno, co má být napsáno resp. Aktualizováno!!**

Abstrakt

Do tohoto odstavce bude zapsán výtah (abstrakt) práce v českém jazyce.
Abstrakt by měl obsahovat shrnutí celé závěrečné práce na cca 10
řádcích.

Klíčová slova

Zde budou zapsána jednotlivá klíčová slova v českém jazyce, oddělená
čárkami. Doporučený počet klíčových slov je 5.

Abstract

Do tohoto odstavce bude zapsán výtah (abstrakt) práce v anglickém
jazyce. Jedná se o překlad abstraktu v českém jazyce.

Keywords

Zde budou zapsána jednotlivá klíčová slova v anglickém jazyce oddělená
čárkami. Jedná se o překlad klíčových slov v českém jazyce.

Bibliografická citace:

MAKSANT, J. Fuzzy Petriho sítě pro expertní systémy. Brno: Vysoké učení
technické v Brně, Fakulta elektrotechniky a komunikačních technologií,
2018. 85s. Vedoucí diplomové práce byl doc. Ing. Václav Jirsík, CSc.

Pozn.: Bibliografická citace je generována informačním systémem.

Prohlášení

„Prohlašuji, že svou diplomovou (bakalářskou) práci na téma Xxxxxxx
yyyyyyyyy zzzzzzz jsem vypracoval samostatně pod vedením vedoucí/ho
diplomové (bakalářské) práce a s použitím odborné literatury a dalších
informačních zdrojů, které jsou všechny citovány v práci a uvedeny v
seznamu literatury na konci práce.

Jako autor uvedené diplomové (bakalářské) práce dále prohlašuji, že
v souvislosti s vytvořením této diplomové (bakalářské) práce jsem
neporušil autorská práva třetích osob, zejména jsem nezasáhl nedovoleným
způsobem do cizích autorských práv osobnostních a jsem si plně vědom
následků porušení ustanovení § 11 a následujících autorského zákona č.
121/2000 Sb., včetně možných trestněprávních důsledků vyplývajících
z ustanovení části druhé, hlavy VI. díl 4 Trestního zákoníku č. 40/2009
Sb.

V Brně dne: **10. května 2018** ..............................

podpis autora

Poděkování (nepovinné)

*V této sekci je možné uvést poděkování vedoucímu práce a těm, kteří
poskytli odbornou pomoc (externí zadavatel, konzultant, apod.). Příklad
poděkování:*

Děkuji vedoucímu diplomové (bakalářské) práce Prof. Ing. Jiřímu
Novotnému, CSc. za účinnou metodickou, pedagogickou a odbornou pomoc a
další cenné rady při zpracování mé diplomové práce.

V Brně dne: **10. května 2018** ..............................

podpis autora

**Obsah**

[1. Úvod 12](#úvod)

[2. Bicí souprava 14](#bicí-souprava)

[2.1 Techniky hry 14](#techniky-hry)

[2.2 Notový zápis 14](#notový-zápis)

[3. Zpracování vstupního signálu 15](#zpracování-vstupního-signálu)

[3.1 Frekvenční analýza 15](#section)

[3.2 Číslicové filtry 16](#číslicové-filtry)

[3.2.1 FIR, IIR filtry a jejich vlastnosti
17](#fir-iir-filtry-a-jejich-vlastnosti)

[3.2.2 Návrh IIR filtru 18](#návrh-iir-filtru)

[3.2.3 Banky filtrů 18](#banky-filtrů)

[4. Analýza hlavních komponent 20](#analýza-hlavních-komponent)

[4.1 Princip 20](#princip)

[4.1.1 Kovarianční matice 20](#kovarianční-matice)

[5. Struktura závěrečné práce 28](#struktura-závěrečné-práce)

[6. Několik formálních doporučení 29](#několik-formálních-doporučení)

[6.1 Psaní textů 29](#psaní-textů)

[6.2 Tabulky a grafy 29](#tabulky-a-grafy)

[6.3 Vkládání obrázků 29](#vkládání-obrázků)

[6.4 Psaní rovnic v textu 30](#psaní-rovnic-v-textu)

[6.5 Informace k šabloně 30](#informace-k-šabloně)

[7. Příklad 30](#příklad)

[7.1 Příklad 30](#příklad-1)

[7.1.1 Příklad 30](#příklad-2)

[7.1.1.1 Příklad 31](#příklad-3)

[8. Nikdy to nebude naprosto dokonalé
32](#nikdy-to-nebude-naprosto-dokonalé)

[9. Typografické a jazykové zásady 33](#typografické-a-jazykové-zásady)

[9.1 Co je to normovaná stránka? 34](#co-je-to-normovaná-stránka)

[10. Závěr 36](#závěr)

Pozn.: Obsah se v rámci této šablony generuje automaticky z nadpisů 1-4
úrovně a nečíslované nadpisy. Pro jeho aktualizaci stačí kliknout pravým
tlačítkem na vytvořený obsah a vybrat položku „Aktualizovat pole"
-\>„Celá tabulka".

Seznam symbolů a zkratek

**Zkratky:**

FEKT ... Fakulta elektrotechniky a komunikačních technologií

VUT ... Vysoké učení technické v Brně

**Symboly:**

U ... napětí \[Ω\]

I ... proud \[A\]

***Pozn.: V této části by měly být uvedeny všechny zkratky použité v
textu a všechny symboly použité v rovnicích.***

Seznam obrázků

[Obr. 2.1: Bicí souprava \[8\] 14](#_Ref32488810)

[Obr. 3.1: Aproximace dolní propusti 17](#_Ref32488931)

[Obr. 3.2: Modulová frekvenční charakteristika banky filtrů
19](#_Ref33221695)

[Obr. 5.1 Vložený obrázek \[2\] 30](#_Toc508016372)

[Obr. 6.1: Příklad popisu obrázku 31](#_Toc31919765)

Pozn.: Seznam obrázků se v rámci této šablony generuje automaticky
z vložených titulků. Pro jeho aktualizaci stačí kliknout pravým
tlačítkem na vytvořený Seznam obrázků a vybrat položku „Aktualizovat
pole" -\>„Celá tabulka". Všechny položky formátované zmíněným stylem se
přidají do seznamu.

***!!! Pokud závěrečná práce neobsahuje obrázky, tuto kapitolu
smažte.!!!***

Seznam tabulek

[Tabulka 4‑1 Příklad popisu tabulky 31](#_Toc508096142)

Pozn.: Seznam tabulek se v rámci této šablony generuje automaticky
z vložených titulků. Pro jeho aktualizaci stačí kliknout pravým
tlačítkem na vytvořený obsah a vybrat položku „Aktualizovat pole"
-\>„Celá tabulka". Všechny položky formátované zmíněným stylem se
přidají do seznamu.

***!!! Pokud závěrečná práce neobsahuje tabulky, tuto kapitolu
smažte.!!!***

Úvod
====

Bicí souprava
=============

Bicí souprava je sestava bubnů a činelů, její velikost a složení nejsou
dány. Záleží na preferencích hráče a také hudebním žánru. Na obrázku
(obr. 2.1) je vidět typická základní bicí souprava. Číslem jedna je
označen velký buben (Bass Drum), pod číslem dvě je označen kotel (Floor
Tom), číslo tři je malý buben (Snare), číslo čtyři jsou tomy, nebo také
přechody (Tom Tom). Zbývají činely ty nemají pro svoje názvy české
ekvivalenty, proto se používají názvy anglické, vpravo pod číslem pět se
nachází Hi -- Hat česky hovorově „hajtka". Zbývající dva činely jsou
vpravo Crash a vlevo Ride. Souprava může být menší nebo i mnohem větší.
Záleží na vkusu hráče a hudebním žánru.

![](media/image1.png){width="3.905511811023622in"
height="3.1496062992125986in"}

[]{#_Ref32488810 .anchor}Obr. 2.1: Bicí souprava \[8\]

Počtem bubnů a činelů však rozmanitost zvuků bicí soupravy nekončí. Malý
buben může být při hře „zapnut" nebo „vypnut". Tím se označuje, zdali
jsou nataženy struny na spodní bláně malého bubnu nebo ne. Na malý buben
se dá hrát takzvaně „přes ráfek". To je technika, kdy hráč paličkou
neudeří do blány bubnu, ale na jeho okraj. Hi - Hat může být otevřená
nebo uzavřená, pomocí pedálu. U činelů obecně se může hrát na jejich
kraj, nebo střed.

Techniky hry
------------

Notový zápis 
------------

Zpracování vstupního signálu
============================

Vstupním signálem je již smíchaná digitální zvuková nahrávka bicí
soupravy určená k hledání spouštěčů. Zvuky jednotlivých bubnů a činelů
jsou snímány mikrofony. Spojité signály *f(t)* z jednotlivých mikrofonů
jsou pomocí analogově číslicových převodníků převedeny na diskrétní
signál *f~n~* *=* *f(t~n~)* *=* *f(nT),* kde T je perioda vzorkování.
Omezením diskrétního zpracování signálů je limit rozsahu zpracovávaných
kmitočtů do poloviny vzorkovacího kmitočtu, a počet kvantovacích úrovní.
\[17\] Následně jsou signály smíchány a exportovány jako zvukové
soubory. Vstupní signál, musí být co nejvíce zjednodušen, aby jeho
následná analýza byla co nejméně výpočetně náročná a tím i dostatečně
rychlá. Jedná se tedy o odstranění redundance. Nejdříve bude signál
rozdělen na časové úseky. Zde se nabízí dvě možná řešení, a to
segmentace plovoucím oknem, nebo dělení na vzorky celých úderů. Jedno
z těchto řešení bude vybráno na základě toho, zdali bude možné signál
klasifikovat pouze na základě úseků vybraných plovoucím oknem, nebo bude
nutné pro klasifikaci použít úsek celého úderu. Klasifikačními parametry
byly, zvoleny energie signálu počítány pro frekvenční pásma. Na základě
této volby, bude signál rozdělen na frekvenční pásma pomocí banky
filtrů, a pro jednotlivé pásma budou spočteny příslušné energie signálu.

  -- --------------------------------- --
     $$\sum_{}^{}\left| \right|^{}$$   
  -- --------------------------------- --

Číslicové filtry 
----------------

Číslicové filtry jsou obdobou filtrů analogových a používají se pro
digitalizované signály, jako algoritmy, které ze vstupní posloupnosti
*x*\[*n*\] vytvoří požadovanou výstupní posloupnost *y*\[*n*\]. I přes
určitou paralelu k analogovým filtrům mají odlišné vlastnosti.
Frekvenční charakteristiky, kterých nešlo pomocí analogových obvodů
dosáhnout. Vlastnosti filtrů se mění pomocí jejich koeficientů, nemají
na ně vliv okolní podmínky, jako například teplota nebo stárnutí
kapacitorů. Vlastnosti digitálního filtru lze kdykoli upravit, není
třeba změna zapojení. Digitální filtry mohou zpracovávat i nízké
kmitočty, na rozdíl od analogových, kde je jejich realizace pro nízké
kmitočty náročná.. Analogové filtry dosahují útlumu 60 až 70 dB, u
číslicových filtrů charakteristiku určuje pouze délka slova. Nevýhodou
může být delší čas pro zpracování. \[2\]

Funkce číslicových filtrů popisuje diferenční rovnice, která vyjadřuje
závislost mezi posloupnostmi a jejich diferencemi. *Z* transformací
(3.1) *x*\[*n*\] známé posloupnosti a *y*\[*n*\] hledaného řešení
diferenční rovnice, dostaneme obraz X(*z*) a obraz partikulárního řešení
Y(*z*).

  -- ---------------------------------------------------------------------------- -------
     $$F\left( z \right) = \sum_{n = 0}^{+ \infty}{x\lbrack n\rbrack z^{- n}}$$   (3.1)
  -- ---------------------------------------------------------------------------- -------

Jejich podílem vzniká přenosová funkce číslicového filtru vztah (3.2).
\[1\]

  -- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
     $$H\left( z \right) = \ \frac{Y(z)}{X(z)} = \ \frac{b_{0} + b_{1}z + b_{2}z^{2} + \ldots + b_{r}z^{r}}{a_{0} + a_{1}z + a_{2}z^{2} + \ldots + a_{r}z^{r}}$$   (3.2)
  -- ------------------------------------------------------------------------------------------------------------------------------------------------------------- -------

Přenosová funkce filtru může být také vyjádřena pomocí nulových bodů a
pólů vztah (3.3).

  -- ------------------------------------------------------------- -------
     $$\left( \right)\frac{\prod_{}^{}{_{}}}{\prod_{}^{}{_{}}}$$   (3.3)
  -- ------------------------------------------------------------- -------

Nulové body *z~0~* získáme porovnáním jmenovatele přenosové funkce (3.2)
s nulou, tedy řešením rovnice Y(*z*) = 0. Póly *z~x~* získáme,
položíme-li jmenovatele přenosové funkce rovno nule, tedy řešením
rovnice X(*z*) = 0. \[1\]

Impulsní charakteristiku odvodíme položením jmenovatele jedné tedy
X(*z*) = 1, což je obraz jednotkového impulsu. Který je definován jako
x\[0\] = 1, x\[n\] = 0 pro n ≠ 0. Dostáváme rovnost H(*z*) = Y(*z*).
V tuto chvíli je H(*z*) obrazem impulsní charakteristiky filtru.

  -- ---------------------------------------- -------
     $$^{}\left\{ \left( \right) \right\}$$   (3.4)
  -- ---------------------------------------- -------

Zpětnou *Z* transformací (3.4) získáme impulsní odezvu ℎ\[𝑛\] (3.5).
\[1\]

  -- ------------------------------------------------------ -------
     $$h\left\lbrack n \right\rbrack = Z^{- 1}\{ H(z)\}$$   (3.5)
  -- ------------------------------------------------------ -------

Filtr, u kterého platí *h*\[*n*\] *= 0* pro *n* *\<* *0* a *n* *≥* *N*
nazýváme filtr s nekonečnou impulsní odezvou (IIR, Infinite Impulse
Response). Dalším druhem číslicových filtrů jsou filtry s konečnou
impulsní odezvou (FIR , Finite Impulse Response). \[1, 2\]

Návrh filtru vychází z ideální analogové dolní propusti, která má
v propustném pásmu modul roven jedné a v nepropustném pásmu se hodnota
modulu rovná nule. Aby se takovýto ideální průběh přiblížil skutečnému
analogovému filtru, je třeba jeho průběh aproximovat. Tím dojde
k rozšíření přechodového pásma a zvlnění modulové frekvenční
charakteristiky. Zde budou uvedeny čtyři tyto aproximační funkce, vybírá
se z nich na základě požadavku na zvlnění frekvenční modulové
charakteristiky. Butterworthova aproximace obsahuje pouze póly, modulem
filtru je monotónně klesající funkce. Kmitočtová charakteristika je
hladká, nemá žádné zvlnění, za cenu nejmenší strmosti přechodového
pásma. Čebyševova aproximace 1. typu má také pouze póly, dojde ke
zvlnění propustného pásma modulové frekvenční charakteristiky.
Čebyševova aproximace 2. typu obsahuje nulové body i póly, modulová
frekvenční charakteristika se zvlní v nepropustném pásmu. Elliptická
(Cauerova) aproximace má nulové body i póly, vyznačuje se největší
strmostí přechodového pásma. Ke zvlnění modulové frekvenční
charakteristiky dojde jak v propustném, tak v nepropustném pásmu. Na
obrázku (obr. 3.1) jsou vidět jednotlivé aproximační funkce pro filtr
typu dolní propust. \[1, 2\]

![](media/image2.emf){width="4.728301618547682in"
height="3.543307086614173in"}

[]{#_Ref32488931 .anchor}Obr. 3.1: Aproximace dolní propusti

### FIR, IIR filtry a jejich vlastnosti

Číslicové filtry se dělí do dvou základních skupin, a to s konečnou
impulsní odezvou (FIR) a s nekonečnou impulsní odezvou (IIR).

Výhodou FIR je lineární fázová charakteristika, díky ní nemají fázové
zkreslení v celém kmitočtovém pásmu. Jsou nerekurzivní, není tedy třeba
při výpočtu vyšetřovat jejích stabilitu. Mají obecně menší citlivost na
kvantizační šum. Oproti IIR jsou výpočetně náročnější. To je způsobeno
vyšším řádem FIR filtru při stejném zadání jako pro IIR. Vyšší řád sebou
nese vyšší počet koeficientů, kde musí být uloženo více stavových
veličin. Mají tedy větší nároky na paměť, a výpočetní čas. \[1, 17\]

Při realizaci IIR systému je nutné použít struktury se zpětnými vazbami.
Stabilita systému je dána polohou pólů. Aby byl systém stabilní musí
ležet uvnitř jednotkové kružnice v rovině *z*. IIR filtry jsou citlivé
na nepřesnost vzniklou číslicovou realizací, proto se stabilita na
konkrétní realizaci ověřuje. \[17\] Pro IIR filtry lze najít
ekvivalentní analogový filtr. Tyto filtry nemají lineární fázovou
charakteristiku, proto způsobují fázové zkreslení. Výhodou je nižší řád
přenosové funkce, díky kterému se snižuje potřebný procesní čas. \[1\]
Aby mohl být filtr používán v reálném čase, musí být dosaženo jeho
kauzality. Podmínka kauzality je dána vztahem (3.5).

  -- ----------------------------------------------------- -------
     $$h\left\lbrack n \right\rbrack = 0\ \ pro\ n < 0$$   (3.5)
  -- ----------------------------------------------------- -------

Systém je tedy kauzální jsou-li všechny vzorky n \< 0 impulzní odezvy
h\[n\] rovny nule. \[2\]

Z uvedených vlastností vyplývá, že FIR filtry se využívají v aplikacích,
kde zaleží na fázovém zkreslení, není třeba vysokých strmostí pro
přechod do nepropustného pásma frekvenční charakteristiky a nezáleží
příliš na délce a náročnosti výpočtu. Naopak v aplikacích, které
vyžadují vysokou strmost, krátký procesní čas, je vhodné použít filtr
typu IIR. IIR filtry nemohou být navrženy s lineární fázovou
charakteristikou v celém frekvenčním rozsahu. Avšak lze se v úzkém
kmitočtovém pásmu lineární fázové charakteristice přiblížit. Proto se
používají pro realizaci filtrů s po částech konstantní frekvenční
charakteristikou (horní propust, dolní propust, pásmová zádrž, nebo
pásmová propust). Což může být pro zpracování zvukových signálů
dostačující. \[1\] Na základě těchto skutečností byla pro frekvenční
dělení vstupního signálu vybrána realizace IIR filtrů.

### Návrh IIR filtru

IIR filtry jsou podobné analogovým filtrům, a jejich návrh lze provést
pomocí transformace analogových prototypů do číslicové oblasti. Při
transformaci dochází k převodu roviny *w* do roviny *z. * Použitá
transformace musí splňovat tyto požadavky:

-   Póly přenosové funkce z levé strany v rovině *w* musí být
    transformovány dovnitř jednotkové kružnice v rovině *z*. Tedy
    stabilní analogový filtr musí být transformován na stabilní
    číslicový filtr.

-   Základní kmitočtové vlastnosti musí být po transformaci zachovány.

    Nejčastěji bývá využita bilineární transformace (3.6). \[1\]

  -- ---------------------------------------- -------
     $$w = \frac{2}{T}\frac{z - 1}{z + 1}$$   (3.6)
  -- ---------------------------------------- -------

A zpětná bilineární transformace podle vztahu (3.7). \[1, 2, 17\]

  -- --------------------------------------------------- -------
     $$z = \ \frac{\frac{2}{T} + w}{\frac{2}{T} - w}$$   (3.7)
  -- --------------------------------------------------- -------

Bilineární transformace zobrazí imaginární osu v komplexní rovině *w* do
jednotkové kružnice v komplexní rovině *z*. Tím je splněna první
podmínka. Splnění druhé podmínky dosáhneme vyšetření zobrazení
kmitočtové osy (3.8). \[1, 17\]

  -- --------------------------------------------- -------
     $$\frac{\frac{}{}_{}}{\frac{}{}_{}}^{_{}}$$   (3.8)
  -- --------------------------------------------- -------

Kde ω~d~ jsou kmitočty v diskrétním systému a ω~a~ jsou kmitočty
v analogovém systému. Při transformaci dochází ke zkreslení frekvenční
osy, a to z důvodu převodu nekonečné analogové frekvenční osy na
konečnou diskrétní osu. Vztah mezi kmitočty v analogovém systému ω~a~ a
kmitočty v číslicovém systému je dán vztahem (3.9). \[1, 17\]

  -- ------------------------------ -------
     $$_{}\frac{}{}\frac{_{}}{}$$   (3.9)
  -- ------------------------------ -------

V Matlabu se IIR filtry realizují za pomoci funkcí, které jsou rozdělené
podle charakteru filtru. Jsou to funkce butter, cheby1, cheby2 a ellip.
Každá z těchto funkcí vrací přímo koeficienty přenosové funkce nebo
nulové body, póly a zesílení. Pro filtry vyššího řádu než čtvrtého, je
v dokumentaci pro Matlab, \[5\] doporučeno používat jako výstup
rozložení nulových bodů a pólu, nikoli přímo koeficienty filtru.
Vzhledem k zaokrouhlení by mohlo dojít k nestabilitě systému. V tabulce
(tab. 3.1) jsou uvedeny vstupní parametry pro jednotlivé funkce.

Tab. 3.1: Vstupní parametry funkcí pro realizaci IIR filtrů

  vstupní parametry                   názvy funkcí                     
  ----------------------------------- -------------- -------- -------- -------
                                      butter         cheby1   cheby2   ellip
  řád filtru                          ✓              ✓        ✓        ✓
  mezní frekvence                     ✓              ✓        ✓        ✓
  tip filtru                          ✓              ✓        ✓        ✓
  velikost zvlnění \[dB\]                            ✓                 ✓
  útlum v nepropustném pásmu \[dB\]                           ✓        ✓

Pokud je mezní frekvence definována dvouprvkovým vektorem funkce,
vytvoří pásmovou propust nebo pásmovou zádrž, kde první prvek vektoru je
dolní mezní frekvence, a druhým prvkem je horní mezní frekvence. Mezní
kmitočet může nabývat hodnot 0 až 1, kde hodnota 1 představuje polovinu
vzorkovacího kmitočtu. \[5\]

### Banky filtrů

  -- --------------------- --
     $$_{}\sqrt[]{}_{}$$   
  -- --------------------- --

  -- --------------------- --
     $$_{}\sqrt[]{}_{}$$   
  -- --------------------- --

  -- --------------------------------------------- --
     $$_{}\frac{_{}}{\sqrt[]{}}_{}_{}\sqrt[]{}$$   
  -- --------------------------------------------- --

Pro rozdělení signálu na jednotlivé frekvenční pásma bude použita banka
filtrů. V tuto chvíli není jasné, na kolik frekvenčních pásem bude třeba
signál rozdělit, aby mohly být jednotlivé údery správně klasifikovány.
Pro začátek bude banka filtrů nastavena na základě fyziologie lidského
sluchu. Později bude experimentálně určen počet potřebných frekvenčních
pásem pro správnou klasifikaci signálu.

Podle Harvey Fletchrea je-li tón maskován bílím šumem, na maskování se
podílí jen určité pásmo spektra, které leží v okolí maskovaného tónu.
Rozsah toho pásma se nazývá šířka kritického pásma. V lidském sluchovém
ústrojí šířka kritického pásma odpovídá konstantní vzdálenosti na
bazilární membráně. Eberhard Zwicker na základě svých psycho akustických
měření stanovil jednotlivým pásmům jejích střední kmitočty a šířky
pásma. Pro aproximaci šířky kritického pásma podle Eberhard Zwicker
se používá banka třetino-oktávových filtrů. \[6, 7, 18\]

Střední kmitočty oktávových a zlomko-oktávových filtrů se počítají dle
vztahu (3.11) pro lichý počet pásem na oktávu a podle vztahu (3.12) pro
sudý počet pásem na oktávu. \[6\]

  -- ------------------------ --------
     $$_{}^{\frac{}{}}_{}$$   (3.11)
  -- ------------------------ --------

  -- ------------------------ --------
     $$_{}^{\frac{}{}}_{}$$   (3.12)
  -- ------------------------ --------

Šířka pásma se spočítá dle vztahu (3.13).

  -- ------------------------- --------
     $_{}_{}_{}^{\frac{}{}}$   (3.13)
  -- ------------------------- --------

Kde G = 10^3/10^, f~ref~ = 1 kHz, n je počet pásem na oktávu a x je
pořadí filtru. \[6\] Jako počáteční realizace banky filtrů, byla zvolena
banka třetino-oktávových filtrů. Na obrázku (obr. 3.2) je znázorněna
modulová frekvenční charakteristika banky třetino-oktávových filtrů
realizovaná v Matlabu. Pro názornost je zobrazena v rozsahu 100 až 400
Hz.

![](media/image3.emf){width="4.732283464566929in"
height="3.543307086614173in"}

[]{#_Ref33221695 .anchor}Obr. 3.2: Modulová frekvenční charakteristika
banky filtrů

Analýza hlavních komponent
==========================

Analýza hlavních komponent (PCA, principal component analysis) je jednou
z nejpoužívanějších metod pro analýzu vícerozměrných dat. Využívá se
k redukci dimenzionality dat. Metoda může být popsána jako lineární
transformace vstupních proměnných na nové nekorelované, ty nazýváme
hlavními komponentami. Hlavní komponenty jsou na sobě nezávislé a jsou
seřazeny podle variance. První jsou komponenty s vysokým rozptylem.
Komponenty s nízkým rozptylem nejsou pro další analýzu použity, tím
dojde k redukci dat neboli odstranění Redundance. Toto může být využito
ke grafickému znázornění vícerozměrných dat, k čemuž se používají první
dvě nebo tři hlavní komponenty. První hlavní komponenta bývá v některých
případech využita jako komplexní ukazatel, tedy rozložení dat je
vyjádřeno pouze první hlavní komponentou. Často bývá metoda hlavních
komponent součástí komplexnější analýzy dat. \[11, 12, 13\]

Princip
-------

Cílem metody hlavních komponent je transformace vstupních parametrů do
menšího počtu latentních výstupních proměnných. Výstupní proměnné
označované jako hlavní komponenty mají vhodnější vlastnosti pro další
analýzu. Jejich počet je menší než před PCA, popisují téměř přesné
rozložení původních znaků, jsou vzájemně nekorelované. \[11\]

Pro jednoduchost si představme objekty rozmístěny ve dvourozměrném
prostoru popsány souřadnicemi *X* a *Y* (obr. 4.1).

![](media/image4.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.1: Objekty v prostoru souřadnic X a Y

Pootáčením souřadného systému je nalezen nový prostor, který lépe
popisuje rozložení objektů. Takovýto nový prostor má nové souřadnice
*X~2~* a *Y~2~*, ty jsou dány lineární kombinací původních souřadnic *X,
Y*.

![](media/image5.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.2: Objekty zobrazeny v novém prostoru X2 a Y2

Jsou-li objekty rozloženy na přímce, po nalezení nového prostoru, dojde
k popisu jejich rozložení pomocí pouze jedné souřadnice. Toto je hlavní
princip redukce dimenzí prostoru. K popisu rozložení objektů pomocí
jedné nové souřadnice zpravidla nedochází. Proto je hledán nový prostor,
kde je rozložení objektů co nejpřesněji popsané, v co nejmenším počtu
souřadnic, tak aby souřadnice, které mají malý vliv na rozložení
objektů, mohly být zanedbány. Matematický popis této skutečnosti je
odchylka všech bodů od redukované reprezentace, popsaná minimální
střední kvadratickou odchylkou.

  -- ------------------------------------- -------
     $$_{}^{}\left\|_{}_{} \right\|^{}$$   (4.1)
  -- ------------------------------------- -------

Kde x~k~ je původní reprezentace a y~k~ redukovaná reprezentace. Analýza
dat pomocí metody hlavních komponent se počítá nejčastěji dvěma postupy,
a to pro kovarianční matici nebo matici korelačních koeficientů. \[9,
10, 11, 12\]

### Kovarianční matice

Analýza hlavních komponent s kovarianční maticí se někdy nazývá též
centrovaná PCA. Vstupní parametry jsou centrovány (4.2), (4.3). Počátek
nového souřadného systému je posunut do centroidu objektů. Vzdálenosti
mezi objekty se s převodem do nového souřadného systému nemění. Součet
vlastních hodnot kovarianční matice je roven součtu rozptylů proměnných.

  -- --------------------------------------------------------------- -------
     $$^{}\frac{}{}\sum_{}^{}\left\|_{} \right\|^{}\sum_{}^{}_{}$$   (4.2)
  -- --------------------------------------------------------------- -------

Kde λ~i~ jsou vlastní čísla. Tato metoda výpočtu PCA se hodí pro data,
která jsou ve stejných jednotkách. Nebo pro data v rozdílných
jednotkách, které lze přepočítat na stejné číselné reprezentace. \[9\]

### Matice korelační koeficientů

Vstupní data, jsou normalizována na jednotkový rozptyl a nulový průměr.
Součet hodnot matice korelačních koeficientů je roven počtu proměnných.
Počet proměnných určuje řád korelační matice. Počátek nového souřadného
systému je opět posunut do centroidu objektů. Po normalizaci původních
proměnných na jednotkový rozptyl, vzdálenosti mezi objekty již nejsou
závislé na jednotkách, v kterých byly naměřeny. Tato metoda se hodí pro
data vyjádřená ve zcela rozdílných jednotkách, a nelze je vyjádřit ve
stejné číselné škále. \[9, 10\]

Výběr počtu hlavních komponent
------------------------------

Po výpočtu PCA je vytvořen nový prostor daný hlavními
komponentami.Hlavní komponenty jsou seřazeny podle velikosti části
rozptylu, v nich obsaženém. Nyní je třeba z množiny hlavních komponent
vybrat několik s nejnižšími pořadovými čísly, tak aby mohlo být
dostatečně popsáno rozložení dat. Obecně je dobré brát v úvahu jen
komponenty, které mají vlastní hodnoty vyšší, než je průměr všech
vlastních hodnot. Vlastní hodnota λ~i~ udává rozptyl v dané hlavní
komponentě. \[9\]

Pokud je využita metoda s korelační maticí, tak se nejčastěji ke
stanovení počtu hlavních komponent používá Kaiserovo kritérium. \[9\]
Toto kritérium předpokládá užití hlavních komponent s vlastní hodnotou
větší než 1. Součet vlastních hodnot je roven počtu vstupních
proměnných. Nemá tedy cenu uvažovat komponenty, které mají vlastní
hodnotu menší než 1. \[9\]

Je-li použita kovarianční matice, součet vlastních hodnot se rovná
součtu rozptylu vstupních proměnných. U této metody můžeme využít hlavní
komponenty s vlastní hodnotou vyšší, než je průměr všech vlastních
hodnot. \[9\]

Obecnou možností výběru počtu hlavních komponent může být grafické
zobrazení jejich vlastních hodnot. Toto zobrazení se nazývá indexový
graf úpatí vlastních čísel (Scree Plot) (Obr. 4.1).

![](media/image6.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.3 Indexový graf úpatí vlastních čísel

Jedná se o graf závislosti vlastních hodnot na hlavních komponentách.
Počet hlavních komponent z grafu odečteme tak, že sledujeme pokles
vlastních hodnot, když se tento pokles zmírní a křivka se „ohne",
odečteme pořadí příslušné poslední komponenty. V příkladu na obr. 4.1 by
byly použity první tři hlavní komponenty. \[9, 11, 13\]

Další metodou může být výběr komponent, které dohromady vyjadřují 90 až
99 % celkového rozptylu. \[13\]

Výpočet PCA
-----------

Nejpoužívanějším algoritmem pro výpočet hlavních komponent je rozklad na
singulární hodnoty (SVD -- Singula Value Decomposition). Tento
algoritmus je založen na Karhunenově -- Loèvově transformaci, a zaručuje
globální optimum. \[12\] Dále je uveden postup výpočtu analýzy hlavních
komponent pomocí algoritmu SVD.

Nejdříve je potřeba vstupní data uspořádat do matice **X**, kde řádky
jsou jednotlivé body měření a sloupce měřené veličiny. \[14, 15\]

V dalším bodě probíhá centrování dat. Nejprve se z vektorů **x~1~, ...,
x~K~** vypočte pomocí vztahu (4.1) průměr. \[10\]

  -- ---------------------------------------------- -------
     $$\mu = \frac{1}{K}\ \sum_{k = 1}^{K}x_{k}$$   (4.2)
  -- ---------------------------------------------- -------

Centrovaný vektor z matice **X** se vypočítá pomocí vztahu (4.2),
z těchto vektorů je složena centrovaná matice **X~C~**~.~ \[10\]

  -- ------------------------------------- -------
     $${\bar{x}}_{K} = \ x_{K} - \ \mu$$   (4.3)
  -- ------------------------------------- -------

  -- -------------------------------------- --
     $$\frac{}{}\sqrt{\sum_{}^{}_{}^{}}$$   
  -- -------------------------------------- --

Následně se vypočítá kovarianční matice **C**. Obsahem této matice jsou
prvky s indexy *i, j* což jsou kovariance *i*-té a *j*-té složky
původních dat **X**. Kovariance se spočítá na základě vztahu (4.4),
jednotlivé kovariance jsou uspořádány do kovarianční matice **C**. \[10,
11, 13\]

  -- ----------------------------------------------------------------------------------------------- -------
     $$C\left( x \right) = \ \frac{1}{K}\sum_{k = 1}^{K}{{x\bar{}}_{k} \bullet}{x\bar{}}_{k}^{T}$$   (4.4)
  -- ----------------------------------------------------------------------------------------------- -------

Nyní se vypočítají vlastní čísla (eigenvalues) a vlastní vektory
(eigenvectors) kovarianční matice **C**. Vlastní čísla *λ~i~* jsou spolu
s příslušnými vlastními vektory **V~i~** seřazeny podle velikosti, od
největších k nejmenším. Z vlastních vektorů se složí transformační
matice T. Jednotlivé vlastní vektory **V~i~** jsou v matici **T** řazeny
sestupně podle vlastních čísel *λ~i~* ve sloupcích. Prvky vlastních
vektorů jsou váhy původních proměnných. Tyto váhy udávají pozici objektů
v novém souřadném systému. Vlastní vektory **V~i~** jsou získány řešením
rovnice (4.5). \[10, 13, 14, 15\]

  -- ---------------------------------------------- -------
     $$\left( C - \lambda_{i}I \right)V_{i} = 0$$   (4.5)
  -- ---------------------------------------------- -------

Kde **(C -- λ~i~I)** je charakteristická rovnice pro výpočet vlastních
hodnot *λ~i~* Vlastní hodnoty jsou získány řešením rovnice (4.6). \[10,
11, 13\]

  -- ------------------------------ -------
     $$\left|_{} \right|_{} = 0$$   (4.6)
  -- ------------------------------ -------

Kde $\left|_{} \right|$**(C-λ\_i I)** je determinantem charakteristické
rovnice. Vlastní hodnoty jsou rozptylem odpovídající příslušným hlavním
komponentám. \[10, 13\]

Nyní se vybírá počet hlavních komponent (vlastních vektorů), podle
některého z kritérií uvedených v kapitole 4.2. Počet vybraných komponent
*n* se vloží do nové transformační matice **T~n~**. Podle vybraných
hlavních komponent jsou původní data promítnuta do nového prostoru.
\[14, 15\]

Na závěr je vypočtena matice **Y** podle vztahu (4.7), která obsahuje
původní data promítnutá do nového prostou s *n* dimenzemi. \[10, 13, 14,
15\]

  -- ------------------------------- -------
     $$Y = {X_{C} \bullet T}_{n}$$   (4.7)
  -- ------------------------------- -------

Kde Xc je centrovaná matice vstupních dat.

Výstupy PCA
-----------

Výstupy důležité pro interpretaci výsledků PCA - jsou vlastní hodnoty,
komponentní váhy, komponentní skóre a grafy vyjadřující tyto hodnoty.
\[9\]

**Vlastní hodnoty** vyjadřují podíl rozptylu rozložení původních dat
v hlavní komponentě, udávají tedy význam dané hlavní komponenty pro
vyjádření rozložení dat. Číselná hodnota není důležitá, důležitý je
procentuální podíl v dané hlavní komponentě z celkového součtu vlastních
hodnot všech hlavních komponent. \[9, 13\]

**Komponentní váhy** představují míru vzájemné korelace mezi původními
proměnnými a hlavními komponentami. Znázorňují, jak velký vliv mají
původní proměnné na hlavní komponenty. \[13\] **Graf komponentních vah
(Plot Components Weights)** zobrazuje původní proměnné v ordinačním
prostoru (Obr. 4.**2**). Proměnné (v1,2,3,4) představující původní
proměnné. Mohou být zobrazené pomocí vektorů vycházejících z počátku
souřadného systému. Délka vektoru znázorňuje velikost vlivu proměnné.
Úhel mezi proměnnou a hlavní komponentou vyjadřuje jejich vzájemnou
korelaci. \[9, 13\]

![](media/image7.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.4: Graf komponentních vah

Čím menší úhel mezi hlavní komponentou a vektorem proměnné je, tím více
proměnná komponentu ovlivňuje. Korelace mezi proměnnými je dána kosinem
úhlu mezi vektory daných proměnných. Vzdálenost mezi proměnnými
zobrazuje jejich vzájemnou korelaci. \[9, 13\]

**Komponentní skóre** obsahuje souřadnice původních objektů v prostoru
hlavních komponent. \[13\]

**Graf komponentního skóre (Scatterplot)** zobrazuje původní objekty
v ordinačním prostoru. Objekty jsou znázorněny jako body, jejichž pozici
určuje komponentní skóre. Na obrázku je vidět příklad ordinačního
diagramu objektů (Obr. 4.3). \[9, 13\]

![](media/image8.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.5: Graf komponentního skóre

Tento graf slouží k nalezení podobných objektů, které v prostoru
hlavních komponent leží blízko sebe. Nebo také objektů silně odlišných,
tedy odlehlých od ostatních. Rozložení objektů v prostoru hlavních
komponent se dá dále využít pro třídění dat pomocí shlukovacích metod.
Objekty vzdálené od počátku jsou extrémy, naopak objekty umístěné blízko
počátku, jsou objekty obvyklými. \[13\]

**Dvojný graf (Biplot)** je grafem, který spojuje graf komponentních vah
a komponentního skóre. Existují dva typy biplotů. Dělí se podle
standardizace vlastních vektorů. Prvním je biplot vzdáleností (distance
biplot). Délky vlastních vektorů jsou standardizovány na jednotkovou
délku. Pozice objektů v grafu mají rozptyl roven vlastnímu číslu.
Euklidovské vzdálenosti v PCA prostoru jsou aproximací euklidovských
vzdáleností v původním prostoru, euklidovské vzdálenosti tedy lze
interpretovat. Délka vektorů původních proměnných určuje jejich
příspěvek k definici daného prostoru. Úhly mezi vektory znázorňující
původní proměnné, nelze nijak interpretovat. Druhou variantou je biplot
korelací (correlation biplot). Délky vlastních vektorů standardizuje na
druhou mocninu z vlastních čísel a pozice objektů mají jednotkový
rozptyl. Euklidovské vzdálenosti v prostoru PCA nelze interpretovat,
nejsou totiž aproximací euklidovských vzdáleností v původním prostoru.
Délky vektorů původních proměnných popisují jejich směrodatnou odchylku.
Úhly mezi vektory původních proměnných zobrazují jejich vzájemnou
korelaci. \[9, 13\]

Příklad výpočtu
---------------

Pro názornost je v této kapitole uveden příklad analýzy hlavních
komponent. Jedná se o srovnání parametrů bezdrátových sluchátek. I když
není soubor dat příliš rozsáhlý, bylo by obtížné z něj vyvodit nějaké
poznatky, nebo jej názorně graficky zobrazit, a to hlavně proto, že data
obsahují šest proměnných (šest parametrů). Jednotlivé typy sluchátek
budeme považovat za objekty a jejich parametry za proměnné. Takovýto
soubor dat má tedy šest dimenzí a nelze graficky vynést. Ke zpřehlednění
dat využijeme analýzu hlavních komponent.

Tab. 4.1: Srovnání parametrů bezdrátových sluchátek

  Sluchátka               cena   citlivost   impedance   výdrž baterie   nabíjení   hmotnost
  ----------------------- ------ ----------- ----------- --------------- ---------- ----------
                          Kč     dB/mW       Ω           hod.            hod.       g
  Sony WH-1000XM3         8500   104,5       47          38              3          255
  Marshall Major III      2500   97          32          30              3          178
  Niceboy HIVE            850    100         32          13              2,5        115
  Beats by Dr.Dre Solo3   5000   102         16          40              2          215
  JBL Tune 500BT          1350   24          32          16              2          155
  Apple AirPods PRO       7300   105         32          4,5             0,3        11
  Niceboy HIVE Podsie     950    110         16          3,5             2          9
  QCY T1C                 600    180         32          4               2          70
  Apple AirPods           4500   95          16          5               0,4        16
  Niceboy HIVE Pods       1700   92          32          3               2          80
  Fixed Steel             700    42          32          6               1,5        33

Nejprve jsou data vložena do matice vstupních dat a následně vypočteny
průměry jednotlivých parametrů. (4.1) Pomocí nich je vypočtena
centrovaná matice. (4.2) Na obrázku (obr. 4.4) jsou vidět centrované
hodnoty pro Cenu a Citlivost.

![](media/image9.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.6: Centrované hodnoty pro Cenu a Citlivost (červené křížky
zobrazují jednotlivé typy sluchátek v prostoru prvních dvou parametrů)

Dále se vypočte kovarianční matice (4.4), ze které jsou získány vlastní
vektory a vlastní hodnoty, tedy hlavní komponenty a jejich váhy.

Tab. 4.2: Tabulka hodnot vlastních čísel

  Hlavní komponenta   Vlastní číslo λ~i~ \[-\]   Vlastní číslo \[%\]
  ------------------- -------------------------- ---------------------
  PC1                 7,946 ∙ 10^6^              99,89
  PC2                 6,824 ∙ 10^3^              0,086
  PC3                 1,516∙ 10^3^               0,019
  PC4                 9,005 ∙ 10^1^              0,001
  PC5                 9,978                      1,255 ∙ 10^-4^
  PC6                 0,126                      1,578 ∙ 10^-6^

Vlastní čísla slouží k určení počtu hlavních komponent, které budou
využity pro interpretaci dat. Na grafu úpatí vlastních čísel (obr. 4.5)
je vidět, že ke zlomu úpatí dochází po druhé hlavní komponentě PC2.
Budou tedy využity první dvě hlavní komponenty PC1 a PC2.

![](media/image10.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.7: Indexový graf úpatí vlastních čísel

Hlavní komponenty PC3, PC4, PC5 a PC6 budou zanedbány, protože jejich
popis rozložení objektů má velmi malý význam. V tabulce (tab. 4.3) jsou
uvedeny vypočtené vlastní vektory. Hodnoty, v nich obsažené, jsou váhy
určující korelaci mezi původními proměnnými a hlavními komponentami.

Tab. 4.3: Tabulka komponentních vah

  proměnná        V~1~              V~2~     V~3~     V~4~              V~5~     V~6~
  --------------- ----------------- -------- -------- ----------------- -------- ----------------
  cena            0,1               -0,011   -0,002   -1,841 ∙ 10^-5^   -0,001   2,077 ∙ 10^-4^
  citlivost       0,001             -0,072   0,998    0,009             0,009    -0,005
  impedance       8,633 ∙ 10^-4^    0,044    -0,008   0,928             0,369    -0,029
  výdrž baterie   0,003             0,142    0,005    -0,372            0,917    -0,033
  nabíjení        -5,684 ∙ 10^-5^   0,009    0,005    0,015             0,041    0,1
  hmotnost        0,011             0,986    0,072    0,013             -0,148   -0,003

V další tabulce (tab. 4.4) jsou hodnoty koeficientů hlavních komponent,
neboli komponentní skóre jednotlivých typů sluchátek.

Tab. 4.4: Tabulka komponentního skóre

  Index   Sluchátka               PC1      PC2    PC3   PC4   PC5     PC6
  ------- ----------------------- -------- ------ ----- ----- ------- ------
  1       Sony WH-1000XM3         5 415    94     8     10    0,1     0,4
  2       Marshall Major III      -585     82     8     -2    5       0,1
  3       Niceboy HIVE            -2 236   35     10    4     0,2     0,1
  4       Beats by Dr.Dre Solo3   1 915    92     10    -20   -0,04   -0,4
  5       JBL Tune 500BT          -1 736   75     -64   3     -4      -0,2
  6       Apple AirPods PRO       4 212    -139   -6    6     1       -0,2
  7       Niceboy HIVE Podsie     -2 137   -73    12    -11   0,1     0,8
  8       QCY T1C                 -2 487   -13    87    7     -0,5    -0,4
  9       Apple AirPods           1 413    -103   -10   -9    -2      -0,2
  10      Niceboy HIVE Pods       -1 387   -9     -2    7     -5      0,2
  11      Fixed Steel             -2 387   -41    -54   5     6       -0,2

Z uvedených hodnot v (tab. 4.3) je vynesen graf komponentních vah (obr.
4.6). Graf zobrazuje původní proměnné v prostoru první a druhé hlavní
komponenty (PC1 a PC2). Z uvedeného grafu je možné vyčíst, že hmotnost a
cena se zásadně liší od zbývajících parametrů.

![](media/image11.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.8: Graf komponentních vah

Je možné říci, že cena koreluje s první hlavní komponentou, kdežto
zbývající parametry více korelují s druhou hlavní komponentou. Největší
vliv na první hlavní komponentu měla cena, na druhou hlavní komponentu
měla nejvyšší vliv hmotnost.

Rozptylový diagram komponentního skóre je vidět na obrázku (obr. 4.7).
Body zobrazují jednotlivé objekty (sluchátka) v prostoru první a druhé
komponenty. Čísla odpovídají indexům sluchátek v tabulce (tab. 4.4).
Sluchátka značek Marshall, Niceboy, JBL, QCY, Fixed si jsou podobná a
tvoří shluk. Osamocené sluchátka jako Apple AirPods PRO a Sony
WH-1000XM3 se vymykají. Můžeme také říci, že jejich vlastnosti nejsou
v uvedeném výčtu typické.

![](media/image12.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.9: Rozptylový diagram komponentního skóre

Posledním zobrazením výstupu analýzy hlavních komponent je dvoj graf
(biplot). Spojuje zobrazení komponentních vah a komponentního skóre do
jednoho zobrazení (obr. 4.8). U dvoj grafu se sleduje vzdálenost mezi
proměnnými a objekty. Jedná se o dvojgraf korelací, pozice objektů (typů
sluchátek) mají jednotkový rozptyl.

![](media/image13.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 4.10: Dvojný graf

Kdyby byl objekt ve stejném bodě jako proměnná, nebo byl v její
blízkosti, znamenalo by to vzájemnou interakci mezi danou proměnnou a
blízkým objektem. Interakce může sloužit interpretaci objektů. \[13\]
V tomto případě si jsou velice blízko sluchátka Sony a cena. To může
naznačovat, že u sluchátek Sony je cena zásadním parametrem. Tyto
sluchátka jsou v uvedeném přehledu nejdražší (ab. .1t3).

Klasifikace dat
===============

Po snížení dimenze dat pomocí analýzy hlavních komponent, budou
vypočtené energie signálu klasifikovány do tříd, které budou
představovat jednotlivé bubny nebo činely. Klasifikační metody hledají
vzájemnou podobnost mezi objekty. Klasifikace dat se také někdy označuje
jako strojové učení (machine learning). Pomocí klasifikačních metod je
možné jeden objekt přiřadit do existující třídy, nebo množinu objektů
rozdělit na několik klasifikačních tříd. \[13\] Rozdělení objektů do
tříd může být pro provedeno pomocí následujících způsobů:

-   Klasifikace pomocí diskriminačních funkcí

-   Klasifikace pomocí minimální vzdálenosti od etalonů tříd

-   Klasifikace pomocí hraničních ploch

    **Klasifikace pomocí diskriminačních funkcí** je založen na výpočtu
    míry příslušnosti daného objektu k dané klasifikační třídě. Objekt
    je přiřazen do té klasifikační třídy, pro kterou byla vypočtena
    největší míra příslušnosti. \[10, 12\]

    **Klasifikace pomocí minimální vzdálenosti od etalonů tříd**
    přiřazuje objekty do klasifikačních tříd na základě výpočtu
    vzdálenosti daného objektu od etalonu dané třídy. Etalon je
    reprezentativní objekt dané třídy. Počet etalonů není dán, může být
    jeden například centroid, nebo to také mohou být všechny objekty
    přiřazeny dané třídě. \[10, 12\]

    **Klasifikace pomocí hraničních ploch** využívá hranic definovaných
    tak, aby v prostoru oddělovaly jednotlivé třídy. Objekt umístěný
    v daném hraničním prostoru je přidělen dané třídě. \[10, 12\]

Výběr klasifikační metody
-------------------------

Pro výběr vhodné klasifikační metody byl proveden pokus na vzorku
trénovacích dat. Bylo použito celkem 427 nahrávek. Konkrétně 221
nahrávek malého bubnu, 102 nahrávek velkého bubnu, a 104 nahrávek
hi-hat. Tyto nahrávky byly filtrovány třetino-oktávovou bankou filtrů, a
následně spočteny energie v jednotlivých pásmech. Dále byla provedena
analýza hlavních komponent. Na data v novém prostoru pěti prvních
hlavních komponent byly aplikovány, klasifikační algoritmy. Na obrázku
(obr. 5.1), je znázorněno rozložení trénovacích nahrávek v prostoru
prvních dvou hlavních komponent.

![](media/image14.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 5.1: Trénovací nahrávky v prostoru prvních dvou hlavních komponent

Pro test byly vybrány tři klasifikační metody a to k-průměrů,
hierarchické shlukování a metoda podpůrných vektorů.

![](media/image15.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 5.2: Klasifikace trénovacích nahrávek metodou k-průměrů

![](media/image16.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 5.3: Klasifikace trénovacích nahrávek metodou hierarchické
shlukování

Na obrázku (obr. 5.2) je znázorněn výsledek klasifikace pomocí metody
k-průměrů a na obrázku (obr. 5.3) je znázorněn výsledek klasifikace
pomocí metody hierarchického shlukování. Z obrázků vyplývá, že oběma
metodám činí potíže osamocené objekty, a z objektů v levém dolním rohu
vytvoří jeden shluk.

Lepších výsledků bylo dosaženo pomocí metody podpůrných vektorů, které
je možné vidět na (obr. 5.4).

![](media/image17.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 5.4: Klasifikace trénovacích nahrávek metodou podpůrných vektorů

Třída 1 odpovídá rozložení nahrávek malého bubnu, třída 2 odpovídá
rozložení nahrávek velkého bubnu, a 3. třída odpovídá nahrávkám hi-hat.

Na základě výsledků toho testu, byla vybrána metoda podpůrných vektorů.

Metoda podpůrných vektorů
-------------------------

Metoda podpůrných vektorů (SVM, suppoort vector machine) je jedním
z nejpoužívanějších klasifikačních algoritmů. \[12\] Jedná se o typ
strojového učení s učitelem (supervised learning), tedy data jsou
klasifikovány na základě trénovací množiny známých dat. \[10\]

Jsou-li třídy lineárně separovatelné existuje množina hranic, podle
kterých může být prostor rozdělen tak, aby na jedné straně hranice byly
pouze objekty patřící do jedné třídy a na druhé straně hranice pouze
objekty patřící do druhé třídy. Na obrázku (obr. 5.1) je uveden příklad
několika hranic. Algoritmus podpůrných vektoru hledá hranici, která
představuje nejrobustnější rozdělení nových testovacích objektů. Tedy
hranici, která je stejně vzdálené od objektů první i druhé třidy. Na
obrázku (obr. 5.1) je tato hranice zobrazena plnou čarou. \[10, 12\]

![](media/image18.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 5.5: Příklad množiny hranic u separabilních tříd SVM

Kritériem pro nalezení optimální hranice je vytvoření co nejširšího
tolerančního pásma mezi hranicí a oběma třídami v množině trénovacích
dat. Hranice je definovaná vztahem (5.1). \[12\]

  -- -------------------------------------------- -------
     $$h\left( x \right) = w^{T}x_{k} + w_{0}$$   (5.1)
  -- -------------------------------------------- -------

Kde vektor **w** udává orientaci hranice a **w~0\ ~**její polohu**, x**
je prvkem, který má být klasifikován.

  -- --------------------------------------------- -------
     $$w^{T}x_{k} + w_{0}\left\{ \begin{matrix}    (5.2)
      > 0\ pro\ všechna\ x\ v\ první\ třídě\  \\   
      < 0\ pro\ všechna\ x\ v\ druhé\ třídě \\     
     \end{matrix} \right.\ $$                      
  -- --------------------------------------------- -------

Objekt **x** bude přiřazen do jedné ze dvou tříd na základě výsledku
vztahu (5.2). \[10, 19\]

  -- -------------------------------------------------------- -------
     $$d = \frac{\left| h(x) \right|}{\left\| w \right\|}$$   (5.3)
  -- -------------------------------------------------------- -------

Vzdálenost bodu od hranice je dána vztahem (5.3). Je-li výsledek funkce
*h(x)* v nejbližším bodě první klasifikační třídy roven +1 a -1
v nejbližším bodě druhé klasifikační třídy, je šířka tolerančního pásma
definována dle vztahu (5.4).

  -- ------------------------------------------------------------------------------------------------ -------
     $$\frac{1}{\left\| w \right\|} + \frac{1}{\left\| w \right\|} = \frac{2}{\left\| w \right\|}$$   (5.4)
  -- ------------------------------------------------------------------------------------------------ -------

Z toho vyplývá definice kritéria pro stanovení hranice (5.5), kde je
hledáno minimum funkce.

  -- ---------------------------------------------------------------- -------
     $$J\left( w,w_{0} \right) = \frac{\left\| w \right\|^{2}}{2}$$   (5.5)
  -- ---------------------------------------------------------------- -------

Za podmínky (5.6).

  -- -------------------------------------------------------------------------------------------------- -------
     $$y_{k} \bullet \left( w^{T}x_{k} + w_{0} \right) \geq 1,\ pro\ všechma\ x\ trénovací\ množiny$$   (5.6)
  -- -------------------------------------------------------------------------------------------------- -------

Kde **y~k~ = 1** pro první třídu a **y~k~ = -1** pro druhou třídu. \[10,
12, 19\]

Jsou-li klasifikační třídy lineárně neseparovatelné podmínka (5.6)
nemůže platit pro všechny objekty trénovací množiny. Příklad takových to
tříd je uveden na obrázku (obr. 5.2). Je vidět, že některé objekty jsou
již v tolerančním pásmu, a dokonce i za hranící a budou špatně
klasifikovány.

![](media/image19.emf){width="4.728301618547682in"
height="3.543307086614173in"}

Obr. 5.6: Lineárně neseparovatelné třídy

Někdy také může být výhodnější vytvořit robustnější klasifikátor
s širším tolerančním pásmem za cenu špatné klasifikace několika málo
objektů. Klasifikátory s úzkým tolerančním pásmem nemusí správně třídit
nové testovací objekty. \[12\]

Kritérium (5.6) je tedy upraveno. Zavadí se nová proměnná ξ~k~, nazývaná
relaxační (slack variable) pro kterou platí:

-   je-li objekt mimo toleranční pásma **ξ~k~ = 0**

-   leží-li objekt uvnitř tolerančního pásma a je správně klasifikován
    **0 \< ξ~k~ ≤ 1**

-   nachází-li se objekt na druhé straně hranice a je špatně vyhodnocen
    pak **ξ~k ~\> 1**

    Podmínka je tedy nově definována jako (5.7).

  -- ---------------------------------------------------------------------- -------
     $$y_{k} \bullet \left( w^{T}x_{k} + w_{0} \right) \geq 1 - \xi_{k}$$   (5.7)
  -- ---------------------------------------------------------------------- -------

Při optimalizaci není teď bráno v úvahu jen co nejširší toleranční
pásmo, ale také co nejmenší počet objektů, pro které platí **ξ~k~ \>
0**. \[10, 12\]

Struktura závěrečné práce
=========================

Celkově je možné závěrečné práce rozčlenit do několika základních částí:

-   **Úvod** -- slouží k uvedení čtenáře do problematiky řešeného
    problému. Doporučený rozsah je cca 1 strana.

-   **Teorie/literární rešerže** -- jedna nebo více kapitol s teorií,
    která byla použita při řešení zadaného problému

-   **Vlastní řešení problému** -- nejdůležitější část závěrečné práce
    zaměřená na vlastní řešení zadání a tedy na vlastní práci řešitele.
    V této části jsou uvedeny např. výsledky měření, výpočtů a jejich
    vyhodnocení. Popsané použité postupy.

-   **Závěr --** shrnutí dosažených výsledků, použitých metod a návrh
    dalšího pokračování při řešení dané problematiky.

Několik formálních doporučení
=============================

Psaní textů
-----------

Při psaní textu je vhodné dodržovat několik formálních pravidel:

-   Všechny kapitoly označené nadpisy úrovně 1 by měly začínat na
    samostatné stránce

-   V odsazení textu by neměly být velké mezery -- např. ¾ stránky volné

Tabulky a grafy
---------------

Popisky k tabulkám se ve Wordu vkládají jako „Titulky" v referencích.

-   

Tab. 6.1 Tabulka naměřených hodnot

  **U \[V\]**   10
  ------------- ----
  **I\[A\]**    5

-   

Vkládání obrázků
----------------

Obrázky by měly být jasné, jednoduše čitelné. Pozor na skenované
obrázky, jejich kvalita bývá nevalná, vhodnější je daný obrázek
překreslit. Popisky k obrázkům se ve Wordu vkládají jako „Titulky"
v referencích.

!!! Pokud je obrázek převzatý, je nutné uvést ODKAZ NA PŘÍSLUŠNÝ
ZDROJ!!!!

![fekt - náhodný ilustrační
obrázek](media/image20.jpeg){width="1.34375in"
height="1.0729166666666667in"}

[]{#_Toc508016372 .anchor}Obr. 7.1 Vložený obrázek \[2\]

Psaní rovnic v textu
--------------------

Rovnice se do dokumentu vkládají pomocí „Vložit"-\> „Objekt" a výběru
„Editor rovnic". Všechny rovnice v dokumentu musí být očíslovány, aby
bylo možné se v textu na ně odkazovat.

Formát zápisu by měl odpovídat matematickým standardům (např. násobení
značit tečkou, ne hvězdičkou apod.). Označení rovnice (na příkladu
„5.1") se vkládá přes „Vložit titulek" v referencích. Jako typ titulku
zvolte „Rovnice". Všechny rovnice uvedené v textu by měly být číslované
a měl by na ně být uveden odkaz v textu.

Příklad zápisu rovnice:

(6.1)

kde q je vektor posunutí pro N stupňů volnosti, je vektor sil působících
ve stupních volnosti, \[M\] je hmotnostní matice, \[C\] je matice
tlumení a \[K\] je matice tuhosti.

Informace k šabloně
-------------------

V šabloně pro Word (v tomto souboru) jsou definované následující styly:

+-----------------+------------------------+------------------------+
| **Název stylu** | **Použití**            | **Příklad**            |
+=================+========================+========================+
| Nadpis 1        | Nadpis 1. úrovně       | Příklad {#příklad}     |
|                 |                        | =======                |
+-----------------+------------------------+------------------------+
| Nadpis 2        | Nadpis 2. úrovně       | Příklad {#příklad-1}   |
|                 |                        | -------                |
+-----------------+------------------------+------------------------+
| Nadpis 3        | Nadpis 3. úrovně       | ##                     |
|                 |                        | # Příklad {#příklad-2} |
+-----------------+------------------------+------------------------+
| Nadpis 4        | Nadpis 4. úrovně       | ###                    |
|                 |                        | # Příklad {#příklad-3} |
+-----------------+------------------------+------------------------+
| Nadpis neč.     | Nečíslovaný nadpis     | Příklad                |
+-----------------+------------------------+------------------------+
| Literatura      | Styl pro zápis použité | 1.  Příklad            |
|                 | literatury             |                        |
+-----------------+------------------------+------------------------+
| Přílohy         | Nadpisy příloh         | #####                  |
|                 |                        | # Příklad {#příklad-4} |
+-----------------+------------------------+------------------------+
| BP/DP normální  | Psaní normálního textu | Příklad Příklad        |
|                 | v odstavcích           | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
|                 |                        | Příklad Příklad        |
+-----------------+------------------------+------------------------+

Pro vkládání popisů tabulek, obrázků a označení rovnic jsou definované
následující titulky:

  **Název titulku**   **Použití**          **Příklad**
  ------------------- -------------------- ------------------------------------------------------------
  Tabulka             Popisování tabulek   []{#_Toc508096142 .anchor}Tabulka 2 Příklad popisu tabulky
  Obr.                Popisování obrázků   []{#_Toc31919765 .anchor}Obr. 8.1: Příklad popisu obrázku
  Rov.                Číslování rovnic     (7.1)

Titulky se vkládají do textu pomocí tzv. „Referencí". Zvolíte příslušný
panel a zvolíte funkci „Vložit titulek". V zobrazeném okně zvolíte
příslušný typ titulku a doplníte ho popisem tabulky/obrázku.

Nikdy to nebude naprosto dokonalé
=================================

Když jsme už napsali vše, o čem jsme přemýšleli, uděláme si den nebo dva
dny volna\
a pak si přečteme sami rukopis znovu. Uděláme ještě poslední úpravy a
skončíme. Jsme si vědomi toho, že vždy zůstane něco nedokončeno, vždy
existuje lepší způsob, jak něco vysvětlit, ale každá etapa úprav musí
být konečná.

 Typografické a jazykové zásady
==============================

Při tisku odborného textu typu *technická zpráva* (anglicky *technical
report*), ke kterému patří například i text kvalifikačních prací, se
často volí formát A4 a často se tiskne pouze po jedné straně papíru. V
takovém případě volte levý okraj všech stránek o něco větší než pravý --
v tomto místě budou papíry svázány a technologie vazby si tento
požadavek vynucuje. Při vazbě s pevným hřbetem by se levý okraj měl
dělat o něco širší pro tlusté svazky, protože se stránky budou hůře
rozevírat a levý okraj se tak bude oku méně odhalovat.

Horní a spodní okraj volte stejně veliký, případně potištěnou část
posuňte mírně nahoru (horní okraj menší než dolní). Počítejte s tím, že
při vazbě budou okraje mírně oříznuty.

Pro sazbu na stránku formátu A4 je vhodné používat pro základní text
písmo stupně (velikosti) 12 bodů. Volte šířku sazby 15 až 16 cm a výšku
22 až 23 cm (včetně případných hlaviček a patiček). Proklad mezi řádky
se volí 120 % stupně použitého základního písma, což je optimální
hodnota pro rychlost čtení souvislého textu. V případě použití systému
LaTeX ponecháme implicitní nastavení. Při psaní kvalifikační práce se
řiďte příslušnými závaznými požadavky.

Stupeň písma u nadpisů různé úrovně volíme podle standardních
typografických pravidel. Pro všechny uvedené druhy nadpisů se obvykle
používá polotučné nebo tučné písmo (jednotně buď všude polotučné nebo
všude tučné). Proklad se volí tak, aby se následující text běžných
odstavců sázel pokud možno na *pevný rejstřík*, to znamená jakoby na
linky s předem definovanou a pevnou roztečí.

Uspořádání jednotlivých částí textu musí být přehledné a logické. Je
třeba odlišit názvy kapitol a podkapitol -- píšeme je malými písmeny
kromě velkých začátečních písmen. U jednotlivých odstavců textu
odsazujeme první řádek odstavce asi o jeden až dva čtverčíky (vždy o
stejnou, předem zvolenou hodnotu), tedy přibližně o dvě šířky velkého
písmene M základního textu. Poslední řádek předchozího odstavce a první
řádek následujícího odstavce se v takovém případě neoddělují svislou
mezerou. Proklad mezi těmito řádky je stejný jako proklad mezi řádky
uvnitř odstavce.

Při vkládání obrázků volte jejich rozměry tak, aby nepřesáhly oblast, do
které se tiskne text (tj. okraje textu ze všech stran). Pro velké
obrázky vyčleňte samostatnou stránku. Obrázky nebo tabulky o rozměrech
větších než A4 umístěte do písemné zprávy formou skládanky všité do
přílohy nebo vložené do záložek na zadní desce.

Obrázky i tabulky musí být pořadově očíslovány. Číslování se volí buď
průběžné v rámci celého textu, nebo -- což bývá praktičtější -- průběžné
v rámci kapitoly.\
V druhém případě se číslo tabulky nebo obrázku skládá z čísla kapitoly a
čísla obrázku/tabulky v rámci kapitoly -- čísla jsou oddělena tečkou.
Čísla podkapitol nemají na číslování obrázků a tabulek žádný vliv.

Tabulky a obrázky používají své vlastní nezávislé číselné řady. Z toho
vyplývá, že v odkazech uvnitř textu musíme kromě čísla udat i informaci
o tom, zda se jedná\
o obrázek či tabulku (například \"*\... viz tabulka 2.7 \...*\").
Dodržování této zásady je ostatně velmi přirozené.

Pro odkazy na stránky, na čísla kapitol a podkapitol, na čísla obrázků a
tabulek\
a v dalších podobných příkladech využíváme speciálních prostředků DTP
programu, které zajistí vygenerování správného čísla i v případě, že se
text posune díky změnám samotného textu nebo díky úpravě parametrů
sazby.

Rovnice, na které se budeme v textu odvolávat, opatříme pořadovými čísly
při pravém okraji příslušného řádku. Tato pořadová čísla se píší v
kulatých závorkách. Číslování rovnic může být průběžné v textu nebo v
jednotlivých kapitolách.

Jste-li na pochybách při sazbě matematického textu, snažte se dodržet
způsob sazby definovaný systémem LaTeX. Obsahuje-li vaše práce velké
množství matematických formulí, doporučujeme dát přednost použití
systému LaTeX.

Mezeru neděláme tam, kde se spojují číslice s písmeny v jedno slovo nebo
v jeden znak -- například *25krát*.

Členící (interpunkční) znaménka tečka, čárka, středník, dvojtečka,
otazník\
a vykřičník, jakož i uzavírací závorky a uvozovky se přimykají k
předcházejícímu slovu bez mezery. Mezera se dělá až za nimi. To se ovšem
netýká desetinné čárky (nebo desetinné tečky). Otevírací závorka a
přední uvozovky se přimykají k následujícímu slovu a mezera se vynechává
před nimi - (takto) a \"takto\".

Lomítko se píše bez mezer. Například školní rok 2001/2002.

Pravidla pro psaní zkratek jsou uvedena v \[2\]. I z jiných důvodů je
vhodné, abyste tuto knihu měli po ruce.

Co je to normovaná stránka?
---------------------------

Pojem *normovaná stránka* se vztahuje k posuzování objemu práce, nikoliv
k počtu vytištěných listů. Z historického hlediska jde o počet stránek
rukopisu, který se psal psacím strojem na speciální předtištěné
formuláře při dodržení průměrné délky řádku\
60 znaků a při 30 řádcích na stránku rukopisu. Vzhledem k zápisu
korekturních značek se používalo řádkování 2 (ob jeden řádek). Tyto
údaje (počet znaků na řádek, počet řádků a proklad mezi nimi) se nijak
nevztahují ke konečnému vytištěnému výsledku. Používají se pouze pro
posouzení rozsahu. Jednou normovanou stránkou se tedy rozumí 60 × 30 =
1800 znaků. Obrázky zařazené do textu se započítávají do rozsahu písemné
práce odhadem jako množství textu, které by ve výsledném dokumentu
potisklo stejně velkou plochu.

Orientační rozsah práce v normostranách lze v programu Microsoft Word
zjistit pomocí funkce *Počet slov* v menu *Nástroje*, když hodnotu
*Znaky (včetně mezer)* vydělíte konstantou 1800. Do rozsahu práce se
započítává pouze text uvedený v jádru práce. Části jako abstrakt,
klíčová slova, prohlášení, obsah, literatura nebo přílohy se do rozsahu
práce nepočítají. Je proto nutné nejdříve označit jádro práce a teprve
pak si nechat spočítat počet znaků. Přibližný rozsah obrázků odhadnete
ručně. Podobně lze postupovat i při použití OpenOffice. Při použití
systému LaTeX pro sazbu je situace trochu složitější. Pro hrubý odhad
počtu normostran lze využít součet velikostí zdrojových souborů práce
podělený konstantou cca 2000 (normálně bychom dělili konstantou 1800,
jenže ve zdrojových souborech jsou i vyznačovací příkazy, které se do
rozsahu nepočítají). Pro přesnější odhad lze pak vyextrahovat holý text
z PDF (např. metodou cut-and-paste nebo *Save as Text\...*) a jeho
velikost podělit konstantou 1800.

 Závěr
=====

Závěrečná kapitola obsahuje zhodnocení dosažených výsledků se
zdůrazněním vlastního přínosu studenta. Povinně se zde objeví i
zhodnocení z pohledu dalšího vývoje projektu, student uvede náměty
vycházející ze zkušeností s řešeným projektem\
a uvede rovněž návaznosti na právě dokončené projekty.

Doporučený rozsah je na jednu stranu.

Literatura

1.  SMÉKAL, Z. a SYSEL, P. Číslicové filtry. Elektronická skripta FEKT
    VUT v Brně. 2004, 130 s.

```{=html}
<!-- -->
```
2.  SMÉKAL, Z. (2009). Číslicové zpracování signálů. Vysoké Učení
    Technické v Brně, Fakulta elektrotechniky a komunikačních
    technologií, 208.

3.  JURA, Pavel. Signály a systémy: Část 3: Diskrétní signály a
    diskrétní systémy \[online\]. 3. Brno, 2017 \[cit. 2020-02-03\].
    Dostupné z: https://www.vutbr.cz/www\_base/priloha.php?dpid=151106

4.  JURA, Pavel. *Signály a systémy: Část 1: Spojité signály*
    \[online\]. 3. Brno, 2017 \[cit. 2020-02-03\]. Dostupné z:
    https://www.vutbr.cz/www\_base/priloha.php?dpid=147534

5.  MATLAB Documentation. *MathWorks* \[online\]. The MathWorks, 2020
    \[cit. 2020-02-03\]. Dostupné z:
    https://www.mathworks.com/help/matlab/index.html

6.  SCHIMMEL, Jiří. *Akustika a zvukové systémy.: Učební text*
    \[online\]. Brno, 2018 \[cit. 2020-02-03\]. Dostupné z:
    https://www.vutbr.cz/www\_base/priloha.php?dpid=185282

7.  SCHIMMEL, Jiří. *Elektroakustika*. Brno: Vysoké učení technické v
    Brně, 2013. ISBN 978-80-214-4716-5.

8.  Drum kit illustration. In: *Wikipedia: the free encyclopedia*
    \[online\]. San Francisco (CA): Wikimedia Foundation, 2001- \[cit.
    2020-02-05\]. Dostupné z:
    https://commons.wikimedia.org/wiki/File:Drum\_kit\_illustration\_edit.png

9.  HARUŠTIAKOVÁ, Danka. *Vícerozměrné statistické metody v biologii*.
    Brno: Akademické nakladatelství CERM, 2012. ISBN 978-80-7204-791-8.

10. HOLČÍK, Jiří. *Analýza a klasifikace dat*. Brno: Akademické
    nakladatelství CERM, 2012. ISBN 978-80-7204-793-2.

11. MELOUN, Milan a Jiří MILITKÝ. *Statistická analýza experimentálních
    dat*. Vyd. 2., upr. a rozš. Praha: Academia, 2004. ISBN
    80-200-1254-0.

12. HOLČÍK, Jiří, KOMENDA, Martin (eds.) a kol. Matematická biologie:
    e-learningová učebnice \[online\]. 1. vydání. Brno: Masarykova
    univerzita, 2015. ISBN 978-80-210-8095-9.

13. MELOUN, Milan a Jiří MILITKÝ. *Kompendium statistického zpracování
    dat*. Praha: Karolinum, 2012. ISBN 978-80-246-2196-8.

14. SMITH, Lindsay. *A tutorial on Principal Components Analysis*
    \[online\]. 2002, 27 \[cit. 2020-01-31\]. Dostupné z:
    https://ourarchive.otago.ac.nz/bitstream/handle/10523/7534/OUCS-2002-12.pdf

15. ŠEMBERA, Jan. *Aplikace analýzy hlavních komponent pro redukci
    dimenze transportne-reakcního problému* \[online\]. , 13 \[cit.
    2020-01-31\]. Dostupné z:
    https://math.fce.vutbr.cz/\~pribyl/workshop\_2007/prispevky/Sembera.pdf

16. RICHARDSON, Mark. *Principal Component Analysis* \[online\]. 2009, ,
    23 \[cit. 2020-02-14\]. Dostupné z:
    http://www.dsc.ufcg.edu.br/\~hmg/disciplinas/posgraduacao/rn-copin-2014.3/material/SignalProcPCA.pdf

17. JAN, Jiří. *Číslicová filtrace, analýza a restaurace signálů*. 2.
    upr. a rozš. vyd. Brno: VUTIUM, 2002. ISBN 80-214-1558-4.

18. SYROVÝ, Václav. *Hudební akustika*. 3., dopl. vyd. V Praze: Akademie
    múzických umění, 2013. Akustická knihovna Zvukového studia Hudební
    fakulty AMU. ISBN 978-80-7331-297-8.

19. ABE, Shigeo. *Support vector machines for pattern classification*.
    2nd ed. London: Springer, 2010. ISBN 18-499-6097-6.

*Pozn.: Pro vytváření citací ve formátu dle ČSN ISO 690 je možné využít
webové stránky: http://www.citace.com/*

Seznam příloh

[Příloha 1 - Příklad 31](#příklad-4)

[Příloha 2 - Tabulka naměřených hodnot 40](#tabulka-naměřených-hodnot)

[Příloha 3 - gfdfg **Chyba! Záložka není definována.**](#_Toc508036310)

[Příloha 4 - Naměřené průběhy - grafy 41](#naměřené-průběhy---grafy)

Samotná část příloh je tvořena dvěma částmi „Seznamem příloh" a
jednotlivými přílohami označenými „Příloha 1", „Příloha 2" až „Příloha
n". Do příloh se dávají např. manuály, zdrojové kódy, rozsáhlé tabulky
s naměřenými hodnotami, grafy apod. V případě, že taková data nejsou
součástí práce, není třeba kapitoly uvádět vůbec.

Pokud je rozsah přílohy příliš velký (např. příliš velký počet tabulek,
nebo mnoho stránek zdrojového kódu), do seznamu příloh lze uvést např.
větu: „Příloha 1 -- Zdrojový kód programu je uložen na přiloženém CD".
V takovém případě musí být závěrečná práce doplněna CD, na kterém jsou
příslušná data uložena a jasně označena.

###### Tabulka naměřených hodnot

######  {#section-1 .list-paragraph}

###### Naměřené průběhy - grafy
