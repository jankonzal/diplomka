%{
Tento soubor je u��c� se m-file. Na��t� tr�novac� data prov�d� jejich
filtraci, vypo�et energi� v p�smech, anal�zu hlavn�ch komponet, a shlukovou
anal�zu.

V�po�ty se ukl�daj� do struktury trenovaci, tato struktura je ulo�ena jako
soubor trenovaci.mat, aby nemuseli b�t v�echny samply pro ka�d� test
na��t�ny a p�epo��t�v�ny. Nen�- li tato struktura nalezena, je pot�eba
ru�n� vybrat slo�ky  se samply.


%}





%% cistka
clc;
clear all;
close all;


%% definice prom�nn�ch
fprintf('Na��t�n� tr�novac�ch dat...\n');

%load('trenovaci.mat');                                                     % na�ten� tr�novac� struktury

%% na�ten� sampl�
if ~exist('trenovaci') || isempty(trenovaci)                               % pokud neexistuje testovac� struktura
    fprintf('Vol�m na�ten�\n');
    [trenovaci] = nacteni_souboru();
end

%% PCA
fprintf('Anal�za hlavn�ch komponent...\n');
[coeff,score,latent,mu] = pca_analyza(trenovaci.E,trenovaci.info);          % vol�n� PCA



%% vytvo�en� klasifika�n�ho a PCA modelu
fprintf('Ukl�d�n� model�...\n');
[SVMModel]=klasifikace(score);
PCAModel = struct('PCAmu', mu, 'PCAcoeff', coeff);


save SVMModel SVMModel
save PCAModel PCAModel

fprintf('Hotovo\n');
