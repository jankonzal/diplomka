%{
Tento soubor je testovac� m-file. Analyzuje na�ten� audio soubory a
rozpozn�v� v nich �dery.

K rozpozn�n� je t�eba p�ipojit vytr�novan� modely anal�zy hlavn�ch
komponent a metody podp�rn�ch vektor�(PCAModel.mat a SVMModel.mat)
 
%}

%% cistka
clc;
clear all;
close all;


%% definice prom�nn�ch
%kontinu�ln� re�im 
SegmentOFF =0;    %nahr�vka [0]/ jeden sampl [1]                                                        

%% na�ten� klasifika�n�ho a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');
%% automatick� na�ten� souboru
fprintf('Na��t�n� soubor�...\n');
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
 cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% cesta = 'C:\Users\Honza\Documents\samply\01.wav';
if exist('cesta')                                                          % Existujeli cesta na�te soubor
    [sample, fs] = audioread(cesta);
    info = audioinfo(cesta);
    filename = '08.wav';
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

clear pathname;
%% segmentace nahr�vky
fprintf('Segmentace sampl�...\n');
[WindowID,pocet_oken, SegmentID,pocet_segmentu] = okno(sample, fs, 3500, 0.6, SegmentOFF);        % Segmentace na okna
                                
%% klasifikace
 f = waitbar(0,' ', 'Name', 'V�po�et energe v p�smech');                    %na��t�n�
clear i;
l=1;
if SegmentOFF == 1                                                          % vypnut� kontinu�ln�ho re�imu
    pocet_segmentu = 1;
    clear SegmentID;
    SegmentID(1,1) = 1;
    SegmentID(1,2) = length(sample);
end
for i = 1:pocet_segmentu
    for j = 1:length(WindowID)
        if  SegmentID(i,1) <= WindowID(j,2)-2000 && WindowID(j,1) < SegmentID(i,1)+2000 % V�ber oken pt��c�ch do �deru
            [filtrovanySMP] = banka_filtru(sample(WindowID(j,1):WindowID(j,2)));    % Filtrace bankou filtr�
            [E] = energie(filtrovanySMP, sample(WindowID(i,1):WindowID(i,2)));      % V�po�et energi� v p�smech
            [pcaTranformed] = data2pca(E', PCAModel.PCAmu, PCAModel.PCAcoeff);      % PCA okna
            [SVMlabel,NegLoss ,SVMscore,q] = predict(SVMModel,pcaTranformed);       %SVM okna
            SegmentLabels(l) = SVMlabel;                                            % vybran� label okna
            SegmentStat(l,:) = q;                                                   %pravd�podobnost p��slu�nosti okna 
            l=l+1;
            
        end
    end
    if exist('SegmentLabels') 
        modulo = mode(SegmentLabels);                                           % v�b�r dle nej�ast�j��cho v�skytu
        SegLab(i) = modulo;
        for w = 1:length(SVMModel.Prior)
            procento(w) = mean(SegmentStat(:,w));                               % ulo�en� pr�m�ru procenu�ln� p��slu�nosti t��dy
        end
        SegStat(i,:) = procento*100;                                            % p�epo�et na procenta
        waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));        % na��t�n�
    end
    clear SegmentLabels; 
    l=1;
end
clear j;
clear l;
clear q;
clear w;
clear filtrovanySMP;
clear modulo;
clear pcaTranformed; 
delete(f);
%% v�sledky - grafick� zobrazn�
fprintf('Zpracov�n� v�sledk�...\n');
clear i;

for i = 1:pocet_segmentu                                                    % v�b�r t��dy dle procentu�ln� p��slu�nosti                                                    
   [M,index] = max(SegStat(i,:));
   SegStatLab(i) = index;
end
clear ax;
% uitable
fig = uifigure('Name', 'V�sledky','Position',[100 100 1050 680]);
%% tabulka pravd�podobnost p��slu�nosti t��dy
pravdeposobnost = uipanel(fig,'Title','(2) Pravd�podobnost p��slu�nosti �deru do t��dy [%]','Position',[20 100 700 265]);
uit = uitable('Parent',pravdeposobnost,'Position',[0 0 700 250]);
t = array2table(round(SegStat));
uit.Data = t;
uit.ColumnName = {'Snare','Kick','Hi-Hat','Crash','Ride','Snare + Hi-Hat', 'Kick + Hi-Hat'};
uit.RowName = 1:pocet_segmentu;


%% �asov� pr�b�h samplu
dt = 1/fs;
time = (0 :dt: (length(sample)*dt)-dt);
% Create TabGroup
graf = uipanel(fig,'Title','(1) �asov� pr�b�h sign�lu','Position',[20 370 1025 310]);
TabGroup = uitabgroup(graf);
TabGroup.Position = [0 0 1025 250];
% Create Tab

Tab1 = uitab(TabGroup);
Tab1.Title = 'Pravd�podobnost p��slu�nosti';
        % uiaxes
        ax = uiaxes('Parent',Tab1, 'Position',[10 10 1010 200]);
        hold(ax,'on');
        ax.Box = 'on';
        ax.YLim = [-1.1 1];
        plot(ax,sample);
        xlabel(ax,'t');
        ylabel(ax,'s (t)');
        clear i;
        c = 0;
        for i = 1:pocet_segmentu
            switch SegStatLab(i)                                                        % vyp�e popisek a obarv� �sek dle klasifikoven� t��dy
                case 1                                                              % Snare
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'r','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','r',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Snare'}; 
                case 2                                                             % Kick
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'g','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','g',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Kick'}; 
                case 3                                                             % Hi-Hat
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'b','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','b',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Hi-Hat'}; 
                case 4                                                             % Crash
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'c','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','c',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Crash'};
                case 5                                                             % Ride
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'm','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','m',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Ride'};
                case 6                                                            % SN+HH
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'y','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','y',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Snare + Hi-Hat'};
                case 7                                                            % KICK+HH
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'k','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ax,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','k',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Kick + Hi-Hat'};
            end    
        end
Tab2 = uitab(TabGroup);
Tab2.Title = 'V�b�r podle nej�ast�j��ho v�skytu';
% uiaxes
        ay = uiaxes('Parent',Tab2,'Position',[10 10 1010 200]);
        hold(ay,'on');
        ay.Box = 'on';
        ay.YLim = [-1.1 1];
        plot(ay,sample);
        xlabel(ay,'t');
        ylabel(ay,'s (t)');
        clear i;
        c = 0;
        for i = 1:pocet_segmentu
            switch SegLab(i)                                                        % vyp�e popisek a obarv� �sek dle klasifikoven� t��dy
                case 1                                                              % Snare
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'r','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','r',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Snare'}; 
                case 2                                                             % Kick
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'g','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','g',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Kick'}; 
                case 3                                                             % Hi-Hat
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'b','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','b',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Hi-Hat'}; 
                case 4                                                             % Crash
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'c','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','c',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Crash'};
                case 5                                                             % Ride
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'm','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','m',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Ride'};
                case 6                                                            % SN+HH
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'y','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','y',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Snare + Hi-Hat'};
                case 7                                                            % KICK+HH
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'k','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','k',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    %TextLabel(i) = {'Kick + Hi-Hat'};
            end    
        end
        clear c;
%% legenda naho�e
LegendaSnare = uilabel(graf);
            LegendaSnare.Position = [0 260 60 22];
            LegendaSnare.Text = 'Snare';
            LegendaSnare.HorizontalAlignment = 'center';
            LegendaSnare.BackgroundColor = [1 0.898 0.898];
LegendaKick = uilabel(graf);
            LegendaKick.Position = [63 260 60 22];
            LegendaKick.Text = 'Kick';
            LegendaKick.HorizontalAlignment = 'center';
            LegendaKick.BackgroundColor = [0.898 1 0.898];
LegendaHiHat = uilabel(graf);
            LegendaHiHat.Position = [126 260 85 22];
            LegendaHiHat.Text = 'Hi-Hat (close)';
            LegendaHiHat.HorizontalAlignment = 'center';
            LegendaHiHat.BackgroundColor = [0.898 0.898 1];
LegendaCrash = uilabel(graf);
            LegendaCrash.Position = [214 260 60 22];
            LegendaCrash.Text = 'Crash';
            LegendaCrash.HorizontalAlignment = 'center';
            LegendaCrash.BackgroundColor = [0.898 1 1];
LegendaRide = uilabel(graf);
            LegendaRide.Position = [277 260 60 22];
            LegendaRide.Text = 'Ride';
            LegendaRide.HorizontalAlignment = 'center';
            LegendaRide.BackgroundColor = [1 0.898 1];
LegendaSnHh = uilabel(graf);
            LegendaSnHh.Position = [340 260 120 22];
            LegendaSnHh.Text = 'Snare + Hi-Hat (close)';
            LegendaSnHh.HorizontalAlignment = 'center';
            LegendaSnHh.BackgroundColor = [1 1 0.898];
LegendaSnK = uilabel(graf);
            LegendaSnK.Position = [463 260 120 22];
            LegendaSnK.Text = 'Kick + Hi-Hat (close)';
            LegendaSnK.HorizontalAlignment = 'center';
            LegendaSnK.BackgroundColor = [0.898 0.898 0.898];

FileText = sprintf('Sample: %s',filename);
LegendaFILE = uilabel(graf);
            LegendaFILE.Position = [625 260 300 22];
            LegendaFILE.Text = FileText;
            LegendaFILE.HorizontalAlignment = 'left';

LegendaFILE = uilabel(fig);
            LegendaFILE.Position = [20 60 600 22];
            LegendaFILE.Text = '1 - Zobrazen� �asov�ho pr�b�hu vstupn� nahr�vky s vyzna�en�mi rozpoznan�mi �dery.';
            LegendaFILE.HorizontalAlignment = 'left';
            
LegendaFILE = uilabel(fig);
            LegendaFILE.Position = [20 40 600 22];
            LegendaFILE.Text = '2 - Pravd�podobnost p��slu�nosti nezn�m�ho �deru do jednostliv�ch t��d v procentech.';
            LegendaFILE.HorizontalAlignment = 'left';
            
LegendaFILE = uilabel(fig);
            LegendaFILE.Position = [20 20 600 22];
            LegendaFILE.Text = '3 - P�i�azen� t��dy a �asov� zna�ky �der�.';
            LegendaFILE.HorizontalAlignment = 'left';
            
%% tabulka - �asov� zna�ky labely �der�
cas = uipanel(fig,'Title','(3) T�idy a �asov� zna�ky [vzorek]','Position',[725 100 320 265]);
uit2 = uitable('Parent',cas,'Position',[0 0 290 250]);
Tab2Data = [TextLabel' num2cell(SegmentID)];
uit2.Data = Tab2Data;
uit2.ColumnName = {'T��da','Za��tek','Konec'};
uit2.RowName = 1:pocet_segmentu;
