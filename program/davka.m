
%% cistka
clc;
clear all;
close all;


%% definice promìnných
%kontinuální režim / dávka
SegmentOFF = 1;
First = 1;
StartPath = ('C:\Users\Honza\Documents\samply\testovaci');


%% naètení klasifikaèního a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');


path = uigetdir(StartPath,'Složka s testovací dávkou');
folder = dir (path);


for FolderIt = First:length(folder)-2
    name = char({folder(FolderIt+2).name}); 
    [sample,fs] = audioread(fullfile( path, name));
    Stereo = size(sample);
    if Stereo(2) == 2
       sample(:,1) = sample(:,1) + sample(:,2);
       sample = sample(:,1);   
    end
    filename = name;
    %% segmentace nahrávky
    fprintf('Segmentace samplù...\n');
    [WindowID,pocet_oken, SegmentID,pocet_segmentu] = okno(sample, fs, 3500, 0.6, SegmentOFF);        % Segmentace na okna

    %% pøiøazení oken úderùm
     %f = waitbar(0,' ', 'Name', 'Výpoèet energe v pásmech');
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
            if  SegmentID(i,1) <= WindowID(j,2)-2000 && WindowID(j,1) < SegmentID(i,1)+2000
                [filtrovanySMP] = banka_filtru(sample(WindowID(j,1):WindowID(j,2)));    % Filtrace bankou filtrù
                [E] = energie(filtrovanySMP, sample(WindowID(i,1):WindowID(i,2)));      % Výpoèet energií v pásmech
                [pcaTranformed] = data2pca(E', PCAModel.PCAmu, PCAModel.PCAcoeff);
                [SVMlabel,NegLoss ,SVMscore,q] = predict(SVMModel,pcaTranformed);
                SegmentLabels(l) = SVMlabel;
                SegmentStat(l,:) = q;
                l=l+1;

            end
        end
        if exist('SegmentLabels') 
            modulo = mode(SegmentLabels);                                           % je vybrán nejèastìji analizovaný úder pomocí modula
            SegLab(i) = modulo;
            for w = 1:length(SVMModel.Prior)
                procento(w) = mean(SegmentStat(:,w));
            end
            SegStat(i,:) = procento*100;
            %waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
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
    %delete(f);
    %% výsledky
    fprintf('Zpracování výsledkù...\n');
    clear i;

    for i = 1:pocet_segmentu
       [M,index] = max(SegStat(i,:));
       SegStatLab(i) = index;
    end
    %% výsledky

% uitable

    if FolderIt == First;
        fig = uifigure('Name', 'Výsledky','Position',[100 100 1050 600]);
    end
    pravdeposobnost = uipanel(fig,'Title','Pravdìpodobnost pøíslušnosti dané tøídy [%]','Position',[20 20 720 265]);
    uit = uitable('Parent',pravdeposobnost,'Position',[0 0 700 250]);
    t = array2table(round(SegStat));
    uit.Data = t;
    uit.ColumnName = {'Snare','Kick','Hi-Hat','Crash','Ride','Snare + Hi-Hat', 'Kick + Hi-Hat'};


    cas = uipanel(fig,'Title','Èasové znaèky [vzorek]','Position',[745 20 300 265]);
    uit2 = uitable('Parent',cas,'Position',[0 0 290 250]);
    uit2.Data = SegmentID;
    uit2.ColumnName = {'Zaèátek','Konec'};

    % barvy
    % Create TabGroup
    graf = uipanel(fig,'Title','Èasový prúbìh signálu','Position',[20 290 1025 310]);
    TabGroup = uitabgroup(graf);
    TabGroup.Position = [0 0 1025 250];
    % Create Tab
    Tab1 = uitab(TabGroup);
    Tab1.Title = 'Pravdìpodobnost pøíslušnosti';
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
                switch SegStatLab(i)                                                        % vypíše popisek a obarví úsek dle klasifikovené tøídy
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
    Tab2.Title = 'Výbìr podle nejèastìjšího výskytu';
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
                switch SegLab(i)                                                        % vypíše popisek a obarví úsek dle klasifikovené tøídy
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
    % legenda
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
    FileText = sprintf('Sample %d: %s',FolderIt,filename);
    LegendaFILE = uilabel(graf);
                LegendaFILE.Position = [625 260 300 22];
                LegendaFILE.Text = FileText;
                LegendaFILE.HorizontalAlignment = 'left';

    uit.RowName = TextLabel;
    uit2.RowName = TextLabel;

   msgfig = msgbox('Next sample!','Success','modal');
    uiwait(msgfig);
    delete(LegendaFILE);
 end


   
