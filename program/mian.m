%% cistka
clc;
clear all;
close all;


%% definice promìnných
l=1;
segmentovane_samply = zeros (1000000,500); 

%% automatické naètení souboru
fprintf('Naèítání souborù...\n');
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\08.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
if exist('cesta')
    [sample, fs] = audioread(cesta);
    info = audioinfo(cesta);
end

%% naètení klasifikaèního a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');

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

[segment_ID,pocet_segmentu] = segmentace(sample,fs);              % Segmentace na jednotlivé údery
for i = 1: pocet_segmentu
    for k = segment_ID(i,1):segment_ID(i,2)
    segmentovane_samply(l,i) = sample(k);
    l=l+1;
    end
    l=1;
end
SUM_E = zeros(29,pocet_segmentu);                                          % Definice matice energií

%% filtrace a výpoèet energií
fprintf('Výpoèet energe...\n');
f = waitbar(0,' ', 'Name', 'Výpoèet energe v pásmech');
for i = 1:pocet_segmentu
    [filtrovane_samply,stredni_f] = banka_filtru(segmentovane_samply(:,i));% Filtrace bankou filtrù
    [E] = energie(filtrovane_samply, segmentovane_samply(:,i));            % Výpoèet energií v pásmech
    SUM_E(:,i) = E;
    waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
end
delete(f);

%% pøevedení nahrávky do prostoru PCA
fprintf('Pøevedení nahrávky do prostoru PCA...\n');
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do tøíd
fprintf('Klasifikace tøíd...\n');
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

fprintf('Hotovo\n');