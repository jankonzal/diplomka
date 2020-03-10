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
path_ftom = ('D:\Disk Google\FEKT\Diplomka2\samply\ftom');
path_crash = ('D:\Disk Google\FEKT\Diplomka2\samply\oh\crash');
path_ride = ('D:\Disk Google\FEKT\Diplomka2\samply\oh\ride');

%path_trash = ('D:\Disk Google\FEKT\Diplomka2\samply\oh\trash');
%path_tom1 = ('D:\Disk Google\FEKT\Diplomka2\samply\tom1');
%path_tom2 = ('D:\Disk Google\FEKT\Diplomka2\samply\tom2');

trenovaci_SMP = zeros (1000000,500);                                        % definice matice sampl� pro rychlej�� v�po�et
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

if ~exist('path_ftom')
folder_ftom = uigetdir(path,'Floor tom');                                  % na�ten� slo�ky pro Floor Tom
end

if ~exist('path_crash')
folder_crash = uigetdir(path,'Crash');                                     % na�ten� slo�ky pro Crash
end

if ~exist('path_ride')
folder_ride = uigetdir(path,'Ride');                                       % na�ten� slo�ky pro Ride
end

% if ~exist('path_trash')
% folder_trash = uigetdir(path,'Trash');                                   % na�ten� slo�ky pro Trash
% end
% 
% if ~exist('path_tom1')
% folder_tom1 = uigetdir(path,'Tom 1');                                    % na�ten� slo�ky pro Tom 1
% end
% 
% if ~exist('path_tom2')
% folder_tom2 = uigetdir(path,'Tom 2');                                    % na�ten� slo�ky pro Tom 2
% end


%% na�ten� n�zv� soubor� ve slo�k�ch

folder_sn = dir (path_sn);
folder_kick = dir (path_kick);
folder_hi = dir (path_hi);

folder_ftom = dir (path_ftom);
folder_crash = dir (path_crash);
folder_ride = dir (path_ride);

% folder_trash = dir (path_trash);
% folder_tom1 = dir (path_tom1);
% folder_tom2 = dir (path_tom2);

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

f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� FLOOR TOM');
for m = 1:length(folder_ftom)-2                                            % na��t�n� sampl� pro Floor Tom
    name = char({folder_ftom(m+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample, fs] = audioread(fullfile( path_ftom, name));                  % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k+l+m) = sample(j);                                  % ulo�en� samplu do matice 
    end
    waitbar(m/length(folder_ftom),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);

f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� CRASH');
for n = 1:length(folder_crash)-2                                           % na��t�n� sampl� pro Crash
    name = char({folder_crash(n+2).name});                                 % proch�zen� jmen soubor� ve slo�ce
    [sample, fs] = audioread(fullfile( path_crash, name));                 % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k+l+m+n) = sample(j);                                % ulo�en� samplu do matice 
    end
    waitbar(n/length(folder_crash),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);

f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� RIDE');
for o = 1:length(folder_ride)-2                                            % na��t�n� sampl� pro Ride
    name = char({folder_ride(o+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample, fs] = audioread(fullfile( path_ride, name));                 % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    for j = 1: length(sample)                                                       
    trenovaci_SMP(j,i+k+l+m+n+o) = sample(j);                              % ulo�en� samplu do matice 
    end
    waitbar(o/length(folder_ride),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);

pocet_SMP = i+k+l+m+n+o;                                                   % vysledn� po�et sampl�
pocty = [i k l m n o];                                                     % po�ty sampl� pro jednotliv� bubny
trenovaci = struct ('SMP',trenovaci_SMP, 'pocet', pocet_SMP,  'pocty', ... % vytvo�en� trenovac� struktury
    pocty, 'stredni_f',  [], 'E', []);
end