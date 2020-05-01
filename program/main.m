%% cistka
clc;
clear all;
close all;


%% definice prom�nn�ch
%kontinu�ln� re�im / d�vka
SegmentOFF = 0;                                                             

%% na�ten� klasifika�n�ho a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');

%% automatick� na�ten� souboru
fprintf('Na��t�n� soubor�...\n');
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
<<<<<<< HEAD
<<<<<<< HEAD
% cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% cesta = 'C:\Users\Honza\Documents\samply\01.wav';
=======
=======
>>>>>>> parent of c361f40... rozšíření na dvoj údery
 cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% cesta = 'C:\Users\Honza\Documents\samply\sn\on\Snr-01 48.wav';
>>>>>>> parent of c361f40... rozšíření na dvoj údery
if exist('cesta')                                                          % Existujeli cesta na�te soubor
    [sample, fs] = audioread(cesta);
    info = audioinfo(cesta);
    filename = 'nezname';
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
<<<<<<< HEAD
<<<<<<< HEAD
[WindowID,pocet_oken, SegmentID,pocet_segmentu] = okno(sample, fs, 3500, 0.6);        % Segmentace na okna
                                
%% p�i�azen� oken �der�m
 f = waitbar(0,' ', 'Name', 'V�po�et energe v p�smech');
=======
=======
>>>>>>> parent of c361f40... rozšíření na dvoj údery
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

>>>>>>> parent of c361f40... rozšíření na dvoj údery
clear i;
l=1;
if SegmentOFF == 1
    pocet_segmentu = 1;
    clear SegmentID;
    SegmentID(1,1) = 1;
    SegmentID(1,2) = length(sample);
end
for i = 1:pocet_segmentu
    for j = 1:length(WindowID)
<<<<<<< HEAD
<<<<<<< HEAD
        if  SegmentID(i,1) <= WindowID(j,2)-2000 && WindowID(j,1) < SegmentID(i,1)+2000
            [filtrovanySMP] = banka_filtru(sample(WindowID(j,1):WindowID(j,2)));    % Filtrace bankou filtr�
            [E] = energie(filtrovanySMP, sample(WindowID(i,1):WindowID(i,2)));      % V�po�et energi� v p�smech
            [pcaTranformed] = data2pca(E', PCAModel.PCAmu, PCAModel.PCAcoeff);
            [SVMlabel,NegLoss ,SVMscore,q] = predict(SVMModel,pcaTranformed);
            SegmentLabels(l) = SVMlabel;
            SegmentStat(l,:) = q;
=======
=======
>>>>>>> parent of c361f40... rozšíření na dvoj údery
        if  SegmentID(i,1) <= WindowID(j,1) && WindowID(j,1) < SegmentID(i,2)
            SegmentLabels(l) = SVMlabel(j);
>>>>>>> parent of c361f40... rozšíření na dvoj údery
            l=l+1;
            
        end
    end
<<<<<<< HEAD
<<<<<<< HEAD
    if exist('SegmentLabels') 
        modulo = mode(SegmentLabels);                                           % je vybr�n nej�ast�ji analizovan� �der pomoc� modula
        SegLab(i) = modulo;
        for w = 1:length(SVMModel.Prior)
            procento(w) = mean(SegmentStat(:,w));
        end
        SegStat(i,:) = procento*100;
        waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
    end
=======
    modulo = mode(SegmentLabels);
    SegLab(i) = modulo;
>>>>>>> parent of c361f40... rozšíření na dvoj údery
=======
    modulo = mode(SegmentLabels);
    SegLab(i) = modulo;
>>>>>>> parent of c361f40... rozšíření na dvoj údery
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
%% v�sledky
<<<<<<< HEAD
fprintf('Zpracov�n� v�sledk�...\n');
clear i;

for i = 1:pocet_segmentu
   [M,index] = max(SegStat(i,:));
   SegStatLab(i) = index;
end
%% v�sledky
clear ax;
% uitable
fig = uifigure('Name', 'V�sledky','Position',[100 100 750 550]);

uit = uitable('Parent',fig,'Position',[25 50 700 200]);
t = array2table(round(SegStat));
uit.Data = t;
uit.ColumnName = {'Snare','Kick','Hi-Hat','Crash','Ride','Snare + Hi-Hat', 'Kick + Hi-Hat'};

% barvy
% Create TabGroup
TabGroup = uitabgroup(fig);
TabGroup.Position = [20 260 720 250];
% Create Tab
Tab1 = uitab(TabGroup);
Tab1.Title = 'Pravd�podobnost p��slu�nosti';
% uiaxes
        ax = uiaxes('Parent',Tab1, 'Position',[10 10 700 200]);
        hold(ax,'on');
        ax.Box = 'on';
        ax.YLim = [-1.1 1];
        plot(ax,sample);
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
        ay = uiaxes('Parent',Tab2,'Position',[10 10 700 200]);
        hold(ay,'on');
        ay.Box = 'on';
        ay.YLim = [-1.1 1];
        plot(ay,sample);
        clear i;
        c = 0;
        for i = 1:pocet_segmentu
            switch SegLab(i)                                                        % vyp�e popisek a obarv� �sek dle klasifikoven� t��dy
                case 1                                                              % Snare
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'r','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','r',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Snare'}; 
                case 2                                                             % Kick
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'g','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','g',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Kick'}; 
                case 3                                                             % Hi-Hat
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'b','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','b',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Hi-Hat'}; 
                case 4                                                             % Crash
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'c','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','c',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Crash'};
                case 5                                                             % Ride
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'm','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','m',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Ride'};
                case 6                                                            % SN+HH
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'y','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','y',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Snare + Hi-Hat'};
                case 7                                                            % KICK+HH
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [-1.1 -1.1],'FaceColor',...
                        'k','FaceAlpha',.1,'EdgeAlpha',.1)
                    area(ay,[SegmentID(i,1) SegmentID(i,2)], [1 1],'FaceColor','k',...
                        'FaceAlpha',.1,'EdgeAlpha',.1)
                    TextLabel(i) = {'Kick + Hi-Hat'};
            end    
        end
        clear c;
% legenda
LegendaSnare = uilabel(fig);
            LegendaSnare.Position = [25 520 60 22];
            LegendaSnare.Text = 'Snare';
            LegendaSnare.HorizontalAlignment = 'center';
            LegendaSnare.BackgroundColor = [1 0.898 0.898];
LegendaKick = uilabel(fig);
            LegendaKick.Position = [88 520 60 22];
            LegendaKick.Text = 'Kick';
            LegendaKick.HorizontalAlignment = 'center';
            LegendaKick.BackgroundColor = [0.898 1 0.898];
LegendaHiHat = uilabel(fig);
            LegendaHiHat.Position = [151 520 60 22];
            LegendaHiHat.Text = 'Hi-Hat';
            LegendaHiHat.HorizontalAlignment = 'center';
            LegendaHiHat.BackgroundColor = [0.898 0.898 1];
LegendaCrash = uilabel(fig);
            LegendaCrash.Position = [214 520 60 22];
            LegendaCrash.Text = 'Crash';
            LegendaCrash.HorizontalAlignment = 'center';
            LegendaCrash.BackgroundColor = [0.898 1 1];
LegendaRide = uilabel(fig);
            LegendaRide.Position = [277 520 60 22];
            LegendaRide.Text = 'Ride';
            LegendaRide.HorizontalAlignment = 'center';
            LegendaRide.BackgroundColor = [1 0.898 1];
LegendaSnHh = uilabel(fig);
            LegendaSnHh.Position = [340 520 120 22];
            LegendaSnHh.Text = 'Snare + Hi-Hat (close)';
            LegendaSnHh.HorizontalAlignment = 'center';
            LegendaSnHh.BackgroundColor = [1 1 0.898];
LegendaSnK = uilabel(fig);
            LegendaSnK.Position = [463 520 120 22];
            LegendaSnK.Text = 'Kick + Hi-Hat (close)';
            LegendaSnK.HorizontalAlignment = 'center';
            LegendaSnK.BackgroundColor = [0.898 0.898 0.898];
LegendaFILE = uilabel(fig);
            LegendaFILE.Position = [586 520 120 22];
            LegendaFILE.Text = filename;
            LegendaFILE.HorizontalAlignment = 'center';
            
uit.RowName = TextLabel;
=======
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
<<<<<<< HEAD
% end
>>>>>>> parent of c361f40... rozšíření na dvoj údery
=======
% end
>>>>>>> parent of c361f40... rozšíření na dvoj údery
