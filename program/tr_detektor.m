function [segmentID] = tr_detektor(okno,GrafOn,delta)
% clc;
% clear all;
% close all;
% % naètení souboru
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
% if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otevøe se dialog pro naèteni zvukoveho souboru 
%                                             
%     [filename, pathname] = uigetfile({'*.wav','Zvukové soubory wav';'*.*',...
%         'Všechny soubory'},'Vyber zvukový soubor');
%     [sample, fs] = audioread( fullfile( pathname, filename));
%             info = audioinfo(fullfile( pathname, filename));
%     
% end
% okno = sample(:,1);                                                       % zmonìní samplu

%% Definice promìnných
prah = 0.01;
PrahPlot = prah * ones(1, length(okno)); 
j = 1;                                                                     % iterace
k = 1;
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

squared = DifFilter.*DifFilter;
%% Limiter
dRL = limiter(-30);
squared = dRL(squared);
%% Obálka
[up] = envelope(DifFilter, 2000, 'rms');

%% segmentace pøíznakù
for i = 1: length(okno)                                                                   
    if ochrana ==0
        if up(i) > prah
            stop = 1;
            if start == 1
                 if exist('delta')
                    segmentID(k,1) = i+delta;

                 else
                     segmentID(k,1) = i;

                 end
                 ochrana = 40;
                k = k+1;
                start = 0;
            end
        else
            start = 1;
            if stop == 1
                 if exist('delta')
                    segmentID(k,2) = i+delta;

                 else
                     segmentID(k,2) = i;

                 end
                 ochrana = 40;
                 k = k+1;
                 stop = 0;
            end
        end
        orchana = ochrana-1;
    end
end
k=k-1;
%% vykreslení
% figure(1);
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
if GrafOn == 1
   figure(2);
   plot(DifFilter);
   hold on;
   plot(up); 
   plot(PrahPlot);
   hold off;
   bx = gca;
   bx.YLim = [0 0.05];
end


end