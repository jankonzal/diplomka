%% cistka
clc;
clear all;
close all;


%% definice prom�nn�ch
SUM_E = [];                                                                % Definice pole energii

%% na�ten� klasifika�n�ho a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');

%% automatick� na�ten� souboru
fprintf('Na��t�n� soubor�...\n');
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
 cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% cesta = 'C:\Users\Honza\Documents\samply\sn\on\Snr-01 48.wav';
if exist('cesta')                                                          % Existujeli cesta na�te soubor
    [sample, fs] = audioread(cesta);
    info = audioinfo(cesta);
end

%% ru�n� proch�zen� 
if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*',...
        'V�echny soubory'},...
        'Vyber zvukov� soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                                                      % zmon�n� samplu


%% segmentace nahr�vky
fprintf('Segmentace sampl�...\n');
[WindowID, SegmentID,pocet_segmentu] = okno(sample,fs);                       % Segmentace na jednotliv� �dery

%% filtrace a v�po�et energi�
fprintf('V�po�et energe...\n');

f = waitbar(0,' ', 'Name', 'V�po�et energe v p�smech');
for i = 1: pocet_segmentu
   [filtrovanySMP] = banka_filtru(sample(WindowID(i,1):WindowID(i,2)));% Filtrace bankou filtr�
   [E] = energie(filtrovanySMP, sample(WindowID(i,1):WindowID(i,2))); % V�po�et energi� v p�smech
   SUM_E = [SUM_E E];
   waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
end
delete(f);                                  

%% p�eveden� nahr�vky do prostoru PCA
fprintf('P�eveden� nahr�vky do prostoru PCA...\n');
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do t��d
fprintf('Klasifikace t��d...\n');
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

%% seskupen� segment�

clear i;
l=1;
for i = 1:length(SegmentID)
    for j = 1:length(WindowID)
        if  SegmentID(i,1) <= WindowID(j,1) && WindowID(j,1) < SegmentID(i,2)
            SegmentLabels(l) = SVMlabel(j);
            l=l+1;
        end
    end
    modulo = mode(SegmentLabels);
    SegLab(i) = modulo;
    clear SegmentLabels; 
    l=1;
end
%% v�sledky
% cellID = num2cell(SegID);
% 
% vysledek =[SegLab cellID];
% 
% uit=uitable(figure,'Data',vysledek);
figure;
hold on;                                  % vykreslen� ob�lky a mez�
ax = gca;
plot(sample);
ax.YLim = [-1.1 1];
clear i;

c = 0;
for i = 1:length(SegmentID)
%   plot ([SegID(i,1) SegID(i,1)], [-0.2 0.2],'r');
%   plot ([SegID(i,2) SegID(i,2)], [-0.2 0.2],'g');

    %text(SegmentID(i,1), -1.05  , SegmentID(i,1), 'Color', 'k')
    switch SegLab(i)
        case 1
            text(SegmentID(i,1), -1.05  , 'Snare', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor','r','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','r','FaceAlpha',.1,'EdgeAlpha',.1)
        case 2
            text(SegmentID(i,1), -1.05  , 'Kick', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor','g','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','g','FaceAlpha',.1,'EdgeAlpha',.1)
        case 3
            text(SegmentID(i,1), -1.05  , 'Hi-Hat', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor','b','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','b','FaceAlpha',.1,'EdgeAlpha',.1)
    end    
end

hold off;
% for i = 1:k
%     sound(sample(SegID(i,1):SegID(i,2)),48000);
%     pause;
% end