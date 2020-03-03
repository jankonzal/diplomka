function [trenovaci] = nacteni_souboru();
          
          
%% èistka
% clc
% clear all;
% close all;

%% definice promìnných
path = ('D:\Disk Google\FEKT\Diplomka2\samply');                           % definice cest pro rychle najití složek (doèasné)
path_sn = ('D:\Disk Google\FEKT\Diplomka2\samply\sn\on');
path_hi = ('D:\Disk Google\FEKT\Diplomka2\samply\hi-hat\close');
path_kick = ('D:\Disk Google\FEKT\Diplomka2\samply\kick');
trenovaci_SMP = zeros (200000,500);                                        % definice matice samplù pro rychlejší výpoèet
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù SN');            % waitbar

%% výbìr složek
if ~exist('path_sn')
folder_sn = uigetdir(path,'Snare');                                        % naètení složky pro Snare
end

if ~exist('path_hi')
folder_sn = uigetdir(path,'Hi-Hat');                                       % naètení složky pro Hi-Hat
end

if ~exist('path_kick')
folder_sn = uigetdir(path,'Kick');                                         % naètení složky pro Kick
end

%% naètení názvù souborù ve složkách

folder_sn = dir (path_sn);
folder_kick = dir (path_kick);
folder_hi = dir (path_hi);

%% naètení souborù
   
for i = 1:length(folder_sn)-2                                              % naèítání samplù pro Snare
    name = char({folder_sn(i+2).name});                                    % procházení jmen souborù ve složce
    [sample, fs] = audioread(fullfile( path_sn, name));                    % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i) = sample(j);                                        % uložení samplu do matice
    end
    waitbar(i/length(folder_sn),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù KICK');
for k = 1:length(folder_kick)-2                                            % naèítání samplù pro Kick
    name = char({folder_kick(k+2).name});                                  % procházení jmen souborù ve složce
    [sample, fs] = audioread(fullfile( path_kick, name));                  % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k) = sample(j);                                      % uložení samplu do matice         
    end
    waitbar(k/length(folder_kick),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù HI-HAT');
for l = 1:length(folder_hi)-2                                              % naèítání samplù pro Hi-hat
    name = char({folder_hi(l+2).name});                                    % procházení jmen souborù ve složce
    [sample, fs] = audioread(fullfile( path_hi, name));                    % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k+l) = sample(j);                                    % uložení samplu do matice 
    end
    waitbar(l/length(folder_hi),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
pocet_SMP = i+k+l;                                                         % vyslední poèet samplù
pocty = [i k l];                                                           % poèty samplù pro jednotlivé bubny
trenovaci = struct ('SMP',trenovaci_SMP, 'pocet', pocet_SMP,  'pocty', ... % vytvoøení trenovací struktury
    pocty, 'stredni_f',  [], 'E', []);
end