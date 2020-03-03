function [trenovaci] = nacteni_souboru();
          
          
%% �istka
% clc
% clear all;
% close all;

%% definice prom�nn�ch
path = ('D:\Disk Google\FEKT\Diplomka2\samply');                           % definice cest pro rychle najit� slo�ek (do�asn�)
path_sn = ('D:\Disk Google\FEKT\Diplomka2\samply\sn\on');
path_hi = ('D:\Disk Google\FEKT\Diplomka2\samply\hi-hat\close');
path_kick = ('D:\Disk Google\FEKT\Diplomka2\samply\kick');
trenovaci_SMP = zeros (200000,500);                                        % definice matice sampl� pro rychlej�� v�po�et
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� SN');            % waitbar

%% v�b�r slo�ek
if ~exist('path_sn')
folder_sn = uigetdir(path,'Snare');                                        % na�ten� slo�ky pro Snare
end

if ~exist('path_hi')
folder_sn = uigetdir(path,'Hi-Hat');                                       % na�ten� slo�ky pro Hi-Hat
end

if ~exist('path_kick')
folder_sn = uigetdir(path,'Kick');                                         % na�ten� slo�ky pro Kick
end

%% na�ten� n�zv� soubor� ve slo�k�ch

folder_sn = dir (path_sn);
folder_kick = dir (path_kick);
folder_hi = dir (path_hi);

%% na�ten� soubor�
   
for i = 1:length(folder_sn)-2                                              % na��t�n� sampl� pro Snare
    name = char({folder_sn(i+2).name});                                    % proch�zen� jmen soubor� ve slo�ce
    [sample, fs] = audioread(fullfile( path_sn, name));                    % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i) = sample(j);                                        % ulo�en� samplu do matice
    end
    waitbar(i/length(folder_sn),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� KICK');
for k = 1:length(folder_kick)-2                                            % na��t�n� sampl� pro Kick
    name = char({folder_kick(k+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample, fs] = audioread(fullfile( path_kick, name));                  % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k) = sample(j);                                      % ulo�en� samplu do matice         
    end
    waitbar(k/length(folder_kick),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� HI-HAT');
for l = 1:length(folder_hi)-2                                              % na��t�n� sampl� pro Hi-hat
    name = char({folder_hi(l+2).name});                                    % proch�zen� jmen soubor� ve slo�ce
    [sample, fs] = audioread(fullfile( path_hi, name));                    % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k+l) = sample(j);                                    % ulo�en� samplu do matice 
    end
    waitbar(l/length(folder_hi),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
pocet_SMP = i+k+l;                                                         % vysledn� po�et sampl�
pocty = [i k l];                                                           % po�ty sampl� pro jednotliv� bubny
trenovaci = struct ('SMP',trenovaci_SMP, 'pocet', pocet_SMP,  'pocty', ... % vytvo�en� trenovac� struktury
    pocty, 'stredni_f',  [], 'E', []);
end