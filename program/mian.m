%% cistka
clc;
clear all;
close all;


%% definice prom�nn�ch
l=1;
segmentovane_samply = zeros (1000000,500); 

%% automatick� na�ten� souboru
fprintf('Na��t�n� soubor�...\n');
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

%% na�ten� klasifika�n�ho a PCA modelu
load('SVMModel.mat');
load('PCAModel.mat');

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

[segment_ID,pocet_segmentu] = segmentace(sample,fs);              % Segmentace na jednotliv� �dery
for i = 1: pocet_segmentu
    for k = segment_ID(i,1):segment_ID(i,2)
    segmentovane_samply(l,i) = sample(k);
    l=l+1;
    end
    l=1;
end
SUM_E = zeros(29,pocet_segmentu);                                          % Definice matice energi�

%% filtrace a v�po�et energi�
fprintf('V�po�et energe...\n');
f = waitbar(0,' ', 'Name', 'V�po�et energe v p�smech');
for i = 1:pocet_segmentu
    [filtrovane_samply,stredni_f] = banka_filtru(segmentovane_samply(:,i));% Filtrace bankou filtr�
    [E] = energie(filtrovane_samply, segmentovane_samply(:,i));            % V�po�et energi� v p�smech
    SUM_E(:,i) = E;
    waitbar(i/pocet_segmentu,f,sprintf('%d Z %d',i,pocet_segmentu));
end
delete(f);

%% p�eveden� nahr�vky do prostoru PCA
fprintf('P�eveden� nahr�vky do prostoru PCA...\n');
[pcaTranformed] = data2pca(SUM_E', PCAModel.PCAmu, PCAModel.PCAcoeff);

%% klasifikace do t��d
fprintf('Klasifikace t��d...\n');
[SVMlabel,SVMscore] = predict(SVMModel,pcaTranformed);

fprintf('Hotovo\n');