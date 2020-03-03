%{
Tento soubor je u��c� se m-file. Na��t� tr�novac� data prov�d� jejich
filtraci, vypo�et energi� v p�smech, anal�zu hlavn�ch komponet, a shlukovou
anal�zu.

V�po�ty se ukl�daj� do struktury trenovaci, tato struktury je ulo�ena jako
soubor trenovaci.mat, aby nemuseli b�t v�echny samply pro ka�d� test
na��t�ny a p�epo��t�v�ny. Nen�- li tato struktura nalezena, je pot�eba
ru�n� vybrat slo�ky  se samply.


%}





%% cistka
clc;
clear all;
close all;

%% definice prom�nn�ch
fs = 48000;
load('trenovaci.mat');                                                     % na�ten� tr�novac� matice



%% na�ten� sampl�

if ~exist('trenovaci') || isempty(trenovaci)                               % pokud neexistuje matice testovac� samplu vytvo�� ji
    fprintf('Vol�m na�ten�\n');
    [trenovaci] = nacteni_souboru();
end



%% v�po�et energie v p�smech
if isempty(trenovaci.E)                                                    % pokud je struktura pr�zdn� vypo�tou se energie
fprintf('V�po�et energe v p�smech\n');
f = waitbar(0,'V�po�et energe v p�smech', 'Name', 'V�po�et energe v p�smech');
for i = 1:trenovaci.pocet
    [filtrovane_SMP,stredni_f] = banka_filtru(trenovaci.SMP(:,i), fs);     % vol�n� banky filtr�
    if ~exist('SUM_E')
        SUM_E = zeros(length(stredni_f),trenovaci.pocet);
    end
    [E] = energie(filtrovane_SMP);                                         % v�po�et energi�     
    SUM_E(:,i) = E;                                                        % skl�d�n� energi� do matice
    waitbar(i/trenovaci.pocet,f,sprintf('%d Z %d',i,trenovaci.pocet));
end
delete(f);
trenovaci.E = SUM_E;                                                       % ulo�en� prom�nn�ch do struktury
trenovaci.stredni_f = stredni_f;
end


%% PCA
fprintf('Anal�za hlavn�ch komponent...\n');
[coeff,score,latent,mu] = pca_analyza(trenovaci.E',trenovaci.pocty);          % vol�n� PCA



%% vytvo�en� klasifika�n�ho a PCA modelu

[SVMModel]=klasifikace(score);
PCAModel = struct('PCAmu', mu, 'PCAcoeff', coeff);

fprintf('Ukl�d�n� model�\n');

save SVMModel SVMModel
save PCAModel PCAModel

fprintf('Hotovo\n');
