%% cistka
clc;
clear all;
close all;


%% definice promìnných
SUM_E = [];                                                                % Definice pole energii

%% naètení klasifikaèního a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');

%% automatické naètení souboru
fprintf('Naèítání souborù...\n');
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
 cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\08.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
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
[segmentID,pocet_segmentu] = okno(sample,fs);                       % Segmentace na jednotlivé údery

%% filtrace a výpoèet energií
fprintf('Výpoèet energe...\n');

f = waitbar(0,' ', 'Name', 'Výpoèet energe v pásmech');
for i = 1: pocet_segmentu
   [filtrovanySMP] = banka_filtru(sample(segmentID(i,1):segmentID(i,2)));% Filtrace bankou filtrù
   [E] = energie(filtrovanySMP, sample(segmentID(i,1):segmentID(i,2))); % Výpoèet energií v pásmech
   SUM_E = [SUM_E E];
   waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
end
delete(f);                                  

%% pøevedení nahrávky do prostoru PCA
fprintf('Pøevedení nahrávky do prostoru PCA...\n');
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do tøíd
fprintf('Klasifikace tøíd...\n');
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

%% seskupení segmentù
SVMcharLabel=char(SVMlabel);
new = 1;
zapis = 0;
k = 1;
name = SVMcharLabel(1,:);
for i=1:pocet_segmentu
    if new == 1
            NewName = SVMlabel(i);
            start = segmentID(i,1);
            new = 0;
        end
    if name == SVMcharLabel(i,:)
        
    else
        stop = segmentID(i,2);
        name = SVMcharLabel(i,:);
        zapis = 1;
    end
    if zapis == 1
        SegLab(k) = NewName;
        SegID(k,1) = start;
        SegID(k,2) = stop;
        k = k+1;
        zapis = 0;
        new = 1;
    end
            
end

SegLab =SegLab';
%% výsledky
cellID = num2cell(SegID);

vysledek =[SegLab cellID];

uit=uitable(figure,'Data',vysledek);