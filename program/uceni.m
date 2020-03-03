%{
Tento soubor je uèící se m-file. Naèítá trénovací data provádí jejich
filtraci, vypoèet energií v pásmech, analýzu hlavních komponet, a shlukovou
analýzu.

Výpoèty se ukládají do struktury trenovaci, tato struktury je uložena jako
soubor trenovaci.mat, aby nemuseli být všechny samply pro každý test
naèítány a pøepoèítávány. Není- li tato struktura nalezena, je potøeba
ruènì vybrat složky  se samply.


%}





%% cistka
clc;
clear all;
close all;

%% definice promìnných
fs = 48000;
load('trenovaci.mat');                                                     % naètení trénovací matice



%% naètení samplù

if ~exist('trenovaci') || isempty(trenovaci)                               % pokud neexistuje matice testovací samplu vytvoèí ji
    fprintf('Volám naètení\n');
    [trenovaci] = nacteni_souboru();
end



%% výpoèet energie v pásmech
if isempty(trenovaci.E)                                                    % pokud je struktura prázdná vypoètou se energie
fprintf('Výpoèet energe v pásmech\n');
f = waitbar(0,'Výpoèet energe v pásmech', 'Name', 'Výpoèet energe v pásmech');
for i = 1:trenovaci.pocet
    [filtrovane_SMP,stredni_f] = banka_filtru(trenovaci.SMP(:,i), fs);     % volání banky filtrù
    if ~exist('SUM_E')
        SUM_E = zeros(length(stredni_f),trenovaci.pocet);
    end
    [E] = energie(filtrovane_SMP);                                         % výpoèet energií     
    SUM_E(:,i) = E;                                                        % skládání energií do matice
    waitbar(i/trenovaci.pocet,f,sprintf('%d Z %d',i,trenovaci.pocet));
end
delete(f);
trenovaci.E = SUM_E;                                                       % uložení promìnných do struktury
trenovaci.stredni_f = stredni_f;
end


%% PCA
fprintf('Analýza hlavních komponent...\n');
[coeff,score,latent,mu] = pca_analyza(trenovaci.E',trenovaci.pocty);          % volání PCA



%% vytvoøení klasifikaèního a PCA modelu

[SVMModel]=klasifikace(score);
PCAModel = struct('PCAmu', mu, 'PCAcoeff', coeff);

fprintf('Ukládání modelù\n');

save SVMModel SVMModel
save PCAModel PCAModel

fprintf('Hotovo\n');
