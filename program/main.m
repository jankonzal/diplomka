%{
Tento soubor je testovac� m-file. Analyzuje na�ten� audio soubory a
rozpozn�v� v nich �dery.

K rozpozn�n� je t�eba p�ipojit vytr�novan� modely anal�zy hlavn�ch
komponent a metody podp�rn�ch vektor�(PCAModel.mat a SVMModel.mat)
 
%}

%% cistka
clc;
clear all;



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
% cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
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
[WindowID, SegmentID,pocet_segmentu] = okno(sample, fs, 3500, 0.6);        % Segmentace na okna

%% filtrace a v�po�et energi�
fprintf('V�po�et energe...\n');

f = waitbar(0,' ', 'Name', 'V�po�et energe v p�smech');
for i = 1: pocet_segmentu
   [filtrovanySMP] = banka_filtru(sample(WindowID(i,1):WindowID(i,2)));    % Filtrace bankou filtr�
   [E] = energie(filtrovanySMP, sample(WindowID(i,1):WindowID(i,2)));      % V�po�et energi� v p�smech
   SUM_E = [SUM_E E];                                                      % Vektor energi�
   waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
end
delete(f);                                  

%% p�eveden� nahr�vky do prostoru PCA
fprintf('P�eveden� nahr�vky do prostoru PCA...\n');
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do t��d
fprintf('Klasifikace t��d...\n');
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

%% p�i�azen� oken �der�m

clear i;
l=1;
for i = 1:length(SegmentID)
    for j = 1:length(WindowID)
        if  SegmentID(i,1) <= WindowID(j,2)-500 && WindowID(j,1) < SegmentID(i,1)+1000
            SegmentLabels(l) = SVMlabel(j);
            l=l+1;
        end
    end
    if exist('SegmentLabels') 
        modulo = mode(SegmentLabels);                                           % je vybr�n nej�ast�ji analizovan� �der pomoc� modula
        SegLab(i) = modulo;
    end
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
hold on;                                                                   % vykreslen� ob�lky a mez�
ax = gca;
plot(sample);
ax.YLim = [-1.1 1];
clear i;

c = 0;
for i = 1:length(SegmentID)
    switch SegLab(i)                                                        % vyp�e popisek a obarv� �sek dle klasifikoven� t��dy
        case 1                                                              % Snare
            text(SegmentID(i,1), -1.05  , 'Snare', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'r','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','r',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
        case 2                                                             % Kick
            text(SegmentID(i,1), -1.05  , 'Kick', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'g','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','g',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
        case 3                                                             % Hi-Hat
            text(SegmentID(i,1), -1.05  , 'Hi-Hat', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'b','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','b',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
        case 4                                                             % Crash
            text(SegmentID(i,1), -1.05  , 'Crash', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'c','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','c',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
        case 5                                                             % Ride
            text(SegmentID(i,1), -1.05  , 'Ride', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'm','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','m',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
        case 21                                                            % SN+HH
            text(SegmentID(i,1), -1.05  , 'SN+HH', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'y','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','y',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
        case 22                                                            % SN+KICK
            text(SegmentID(i,1), -1.05  , 'Kick+HH', 'Color', 'k');
            area([SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                'k','FaceAlpha',.1,'EdgeAlpha',.1)
            area([SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','k',...
                'FaceAlpha',.1,'EdgeAlpha',.1)
    end    
end
hold off;