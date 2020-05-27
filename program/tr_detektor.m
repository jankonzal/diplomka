function [segmentID] = tr_detektor(okno,GrafOn,delta)
% 
%  Tato funkce je detektor transientù, slouží k hledání zaèátkù a koncù úderù.
%  
%  Vstupními  parametry jsou úsek zvukového signálu, požadavek na grafické
%  zobrazení 1/0, a posun o který má být k ukazateli úderu pøipsán,
%  respektive èas zaèátku okna. Poukd není èas zaèátku okna zadán je poèítáno
%  od nuly.
% 
%  Výstupním parametrem jous ukazatele zaèátkù a koncù úderù.
% 

%% Definice promìnných
prah = 0.03;                                                               % rozhodovací úroveò
PrahPlot = prah * ones(1, length(okno));                                   % promìnná pro vykreslení prahu
j = 1;                                                                     % iterace
k = 1;
t = 1;
start = 0;
stop = 0;
segmentID = [0 0];                                                         
ochrana = 0;

%% Diferenèní filtrace

for i = 1:length(okno)
    if i==1;
    DifFilter(i) = okno(i);
    else
    DifFilter(i) = okno(i)-okno(i-1);
    end
end
%DifFilter = DifFilter.*DifFilter;                                          %kvadrát diferenèního filtru
%% Obálka
[up] = envelope(DifFilter, 900,'rms');

%% segmentace pøíznakù
for i = 1: length(okno)
    if ochrana < 1                                                          % ochranný interval pøi zápisu
        if up(i) > prah                                                     % nad prahem
            stop = 1;
            if start == 1
                 if exist('delta')                                          % zápis hodnoty
                    segmentID(k,1) = i+delta;                               % existuje poèáteèní èas?

                 else
                     segmentID(k,1) = i;

                 end  
                 ochrana = 30;
                k = k+1;
                start = 0;
            end
        else
            start = 1;
            if stop == 1
                 if exist('delta')                                          % to stejné jen pro sestup pod rozhodovací úroveò
                    segmentID(t,2) = i+delta;

                 else
                     segmentID(t,2) = i;

                 end
                 ochrana = 30;
                 t = t+1;
                 stop = 0;
            end
        end
    end
    ochrana = ochrana-1;
end
k=k-1;
%% vykreslení
% figure;
% subplot(3,1,1);
% plot(okno);
% ax = gca;
% ax.YLim = [-1 1];
% subplot(3, 1, 2);
% plot(DifFilter);
% bx = gca;
% bx.YLim = [-0.25 0.25];
% subplot(3,1,3);
% plot(DifFilter);
% hold on;
% plot(up);
% plot(PrahPlot);
% hold off;
% bx = gca;
% bx.YLim = [0 0.1];

if GrafOn == 1                                                              % zobrazení prùchodù rozhodovací úrovní
   dt = 1/44100;
   time = (0 :dt: (length(DifFilter)*dt)-dt);
   figure;
   plot(time,DifFilter);
   hold on;
   plot(time, up); 
   plot(time,PrahPlot);
   bx = gca;
   bx.YLim = [-0.4 0.4];
   bx.XLim = [0 3.5];
   ylabel ('S(t)');
   xlabel ('t');
   
   hold off;
   

end


end