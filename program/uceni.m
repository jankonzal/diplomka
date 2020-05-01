%{
Tento soubor je uèící se m-file. Naèítá trénovací data provádí jejich
filtraci, vypoèet energií v pásmech, analýzu hlavních komponet, a shlukovou
analýzu.

Výpoèty se ukládají do struktury trenovaci, tato struktura je uložena jako
soubor trenovaci.mat, aby nemuseli být všechny samply pro každý test
naèítány a pøepoèítávány. Není- li tato struktura nalezena, je potøeba
ruènì vybrat složky  se samply.


%}





%% cistka
clc;
clear all;
close all;


%% definice promìnných
fprintf('Naèítání trénovacích dat...\n');

%load('trenovaci.mat');                                                     % naètení trénovací struktury

%% naètení samplù
if ~exist('trenovaci') || isempty(trenovaci)                               % pokud neexistuje testovací struktura
    fprintf('Volám naètení\n');
    [trenovaci] = nacteni_souboru();
end

%% PCA
fprintf('Analýza hlavních komponent...\n');
[coeff,score,latent,mu] = pca_analyza(trenovaci.E,trenovaci.info);          % volání PCA



%% vytvoøení klasifikaèního a PCA modelu
fprintf('Ukládání modelù...\n');
[SVMModel]=klasifikace(score);
PCAModel = struct('PCAmu', mu, 'PCAcoeff', coeff);


save SVMModel SVMModel
save PCAModel PCAModel

fprintf('Hotovo\n');
