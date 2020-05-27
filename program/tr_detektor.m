function [segmentID] = tr_detektor(okno,GrafOn,delta)
% 
%  Tato funkce je detektor transient�, slou�� k hled�n� za��tk� a konc� �der�.
%  
%  Vstupn�mi  parametry jsou �sek zvukov�ho sign�lu, po�adavek na grafick�
%  zobrazen� 1/0, a posun o kter� m� b�t k ukazateli �deru p�ips�n,
%  respektive �as za��tku okna. Poukd nen� �as za��tku okna zad�n je po��t�no
%  od nuly.
% 
%  V�stupn�m parametrem jous ukazatele za��tk� a konc� �der�.
% 

%% Definice prom�nn�ch
prah = 0.03;                                                               % rozhodovac� �rove�
PrahPlot = prah * ones(1, length(okno));                                   % prom�nn� pro vykreslen� prahu
j = 1;                                                                     % iterace
k = 1;
t = 1;
start = 0;
stop = 0;
segmentID = [0 0];                                                         
ochrana = 0;

%% Diferen�n� filtrace

for i = 1:length(okno)
    if i==1;
    DifFilter(i) = okno(i);
    else
    DifFilter(i) = okno(i)-okno(i-1);
    end
end
%DifFilter = DifFilter.*DifFilter;                                          %kvadr�t diferen�n�ho filtru
%% Ob�lka
[up] = envelope(DifFilter, 900,'rms');

%% segmentace p��znak�
for i = 1: length(okno)
    if ochrana < 1                                                          % ochrann� interval p�i z�pisu
        if up(i) > prah                                                     % nad prahem
            stop = 1;
            if start == 1
                 if exist('delta')                                          % z�pis hodnoty
                    segmentID(k,1) = i+delta;                               % existuje po��te�n� �as?

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
                 if exist('delta')                                          % to stejn� jen pro sestup pod rozhodovac� �rove�
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
%% vykreslen�
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

if GrafOn == 1                                                              % zobrazen� pr�chod� rozhodovac� �rovn�
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