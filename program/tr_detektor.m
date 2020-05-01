function [segmentID] = tr_detektor(okno,GrafOn,delta)
%{
 Tato funkce je detektor transient�, slou�� k hled�n� za��tk� a konc� �der�.
 
 Vstupn�mi  parametry jsou �sek zvukov�ho sign�lu, po�adavek na grafick�
 zobrazen� 1/0, a posun o kter� m� b�t k ukazateli �deru p�ips�n,
 respektive �as za��tku okna. Poukd nen� �as za��tku okna zad�n je po��t�no
 od nuly.

 V�stupn�m parametrem jous ukazatele za��tk� a konc� �der�.
%}

% clc;
% clear all;
% close all;
% % na�ten� souboru
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\sn\on\Snr-01 48.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% if exist('cesta')
%     [sample, fs] = audioread(cesta);
%     info = audioinfo(cesta);
% end
% if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
%                                             
%     [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*',...
%         'V�echny soubory'},'Vyber zvukov� soubor');
%     [sample, fs] = audioread( fullfile( pathname, filename));
%             info = audioinfo(fullfile( pathname, filename));
%     
% end
% okno = sample(:,1);                                                       % zmon�n� samplu

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
%DifFilter = DifFilter.*DifFilter;
%% Ob�lka
[up] = envelope(DifFilter, 900,'rms');

%% segmentace p��znak�
for i = 1: length(okno)
    if ochrana < 1                                                                        % ochrann� interval p�i z�pisu
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
   figure;
   plot(DifFilter);
   hold on;
   plot(up); 
   plot(PrahPlot);
   hold off;
   

end


end