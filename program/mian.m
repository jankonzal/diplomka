%% cistka
clc;
clear all;
close all;


%% naètení souboru
fprintf('Naèítání souborù...\n');
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
% [sample, fs] = audioread(cesta);
%        info = audioinfo(cesta);
%% naètení klasifikaèního modelu
load('SVMModel.mat');
load('PCAModel.mat');
%% ruèní procházení 
if ~exist('sample') || isempty(sample)          % pokud neexistuje sammpl otevøe se dialog pro naèteni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukové soubory wav';'*.*','Všechny soubory'},...
        'Vyber zvukový soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                           % zmonìní samplu

%% filtrace bankou filtrù
fprintf('Filtrování bankou filtrù...\n');
[filtrovane_samply,stredni_f] = banka_filtru(sample);

%% energie po segmentaci
fprintf('Segmentace samplù...\n');
[segmentovane_samply,pocet_segmentu] = segmentace(sample,fs);
SUM_E = zeros(29,pocet_segmentu);
fprintf('Výpoèet energe...\n');
for i = 1:pocet_segmentu
    [filtrovane_samply2,stredni_f] = banka_filtru(segmentovane_samply(:,i));
    [E] = energie(filtrovane_samply2, segmentovane_samply(:,i));
    SUM_E(:,i) = E;
end
%% pøevedení nahrávky do prostoru PCA
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do tøíd
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

fprintf('Hotovo\n');