%% cistka
clc;
clear all;
close all;


%% na�ten� souboru
fprintf('Na��t�n� soubor�...\n');
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
% [sample, fs] = audioread(cesta);
%        info = audioinfo(cesta);
%% na�ten� klasifika�n�ho modelu
load('SVMModel.mat');
load('PCAModel.mat');
%% ru�n� proch�zen� 
if ~exist('sample') || isempty(sample)          % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*','V�echny soubory'},...
        'Vyber zvukov� soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                           % zmon�n� samplu

%% filtrace bankou filtr�
fprintf('Filtrov�n� bankou filtr�...\n');
[filtrovane_samply,stredni_f] = banka_filtru(sample);

%% energie po segmentaci
fprintf('Segmentace sampl�...\n');
[segmentovane_samply,pocet_segmentu] = segmentace(sample,fs);
SUM_E = zeros(29,pocet_segmentu);
fprintf('V�po�et energe...\n');
for i = 1:pocet_segmentu
    [filtrovane_samply2,stredni_f] = banka_filtru(segmentovane_samply(:,i));
    [E] = energie(filtrovane_samply2, segmentovane_samply(:,i));
    SUM_E(:,i) = E;
end
%% p�eveden� nahr�vky do prostoru PCA
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do t��d
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

fprintf('Hotovo\n');