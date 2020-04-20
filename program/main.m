%{
Tento soubor je testovací m-file. Analyzuje naètené audio soubory a
rozpoznává v nich údery.

K rozpoznání je tøeba pøipojit vytrénované modely analýzy hlavních
komponent a metody podpùrných vektorù(PCAModel.mat a SVMModel.mat)
 
%}

%% cistka
clc;
clear all;



%% definice promìnných
SUM_E = [];                                                                % Definice pole energii

%% naètení klasifikaèního a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');
%% automatické naètení souboru
fprintf('Naèítání souborù...\n');
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% cesta = 'C:\Users\Honza\Documents\samply\sn\on\Snr-01 48.wav';
if exist('cesta')                                                          % Existujeli cesta naète soubor
    [sample, fs] = audioread(cesta);
    info = audioinfo(cesta);
end

%% ruèní procházení 
if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otevøe se dialog pro naèteni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukové soubory wav';'*.*',...
        'Všechny soubory'},...
        'Vyber zvukový soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                                                      % zmonìní samplu


%% segmentace nahrávky
fprintf('Segmentace samplù...\n');
[WindowID, SegmentID,pocet_segmentu] = okno(sample, fs, 3500, 0.6);        % Segmentace na okna

%% filtrace a výpoèet energií
fprintf('Výpoèet energe...\n');

f = waitbar(0,' ', 'Name', 'Výpoèet energe v pásmech');
for i = 1: pocet_segmentu
   [filtrovanySMP] = banka_filtru(sample(WindowID(i,1):WindowID(i,2)));    % Filtrace bankou filtrù
   [E] = energie(filtrovanySMP, sample(WindowID(i,1):WindowID(i,2)));      % Výpoèet energií v pásmech
   SUM_E = [SUM_E E];                                                      % Vektor energií
   waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
end
delete(f);                                  

%% pøevedení nahrávky do prostoru PCA
fprintf('Pøevedení nahrávky do prostoru PCA...\n');
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do tøíd
fprintf('Klasifikace tøíd...\n');
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

%% pøiøazení oken úderùm

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
        modulo = mode(SegmentLabels);                                           % je vybrán nejèastìji analizovaný úder pomocí modula
        SegLab(i) = modulo;
    end
    clear SegmentLabels; 
    l=1;
end
%% výsledky
% cellID = num2cell(SegID);
% 
% vysledek =[SegLab cellID];
% 
% uit=uitable(figure,'Data',vysledek);

figure;
hold on;                                                                   % vykreslení obálky a mezí
ax = gca;
plot(sample);
ax.YLim = [-1.1 1];
clear i;

c = 0;
for i = 1:length(SegmentID)
    switch SegLab(i)                                                        % vypíše popisek a obarví úsek dle klasifikovené tøídy
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