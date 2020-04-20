function [trenovaci] = nacteni_souboru();
          
          
%% �istka
% clc
% clear all;
% close all;

%% definice prom�nn�ch
path = ('C:\Users\Honza\Documents\samply');                           % definice cest pro rychle najit� slo�ek (do�asn�)
path_sn = ('C:\Users\Honza\Documents\samply\sn\on');
path_hi = ('C:\Users\Honza\Documents\samply\hi-hat\close');
path_kick = ('C:\Users\Honza\Documents\samply\kick');
path_ftom = ('C:\Users\Honza\Documents\samply\ftom');
path_crash = ('C:\Users\Honza\Documents\samply\oh\crash');
path_ride = ('C:\Users\Honza\Documents\samply\oh\ride');

path_SnHh = ('C:\Users\Honza\Documents\samply\snhh');
path_KickHh = ('C:\Users\Honza\Documents\samply\kickhh');
%path_trash = ('D:\Disk Google\FEKT\Diplomka2\samply\oh\trash');
%path_tom1 = ('D:\Disk Google\FEKT\Diplomka2\samply\tom1');
%path_tom2 = ('D:\Disk Google\FEKT\Diplomka2\samply\tom2');

SUM_E = [];                                        
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

if ~exist('path_SnHh')
folder_SnHh = uigetdir(path,'SnHh');                                       % na�ten� slo�ky pro Ride
end

if ~exist('path_KickHh')
folder_KickHh = uigetdir(path,'KickHh');                                       % na�ten� slo�ky pro Ride
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

folder_SnHh = dir (path_SnHh);
folder_KickHh = dir (path_KickHh);
% folder_trash = dir (path_trash);
% folder_tom1 = dir (path_tom1);
% folder_tom2 = dir (path_tom2);

%% na�ten� soubor�
   
% SNARE
for i = 1:length(folder_sn)-2                                              % na��t�n� sampl� pro Snare
    name = char({folder_sn(i+2).name});                                    % proch�zen� jmen soubor� ve slo�ce
    [sample] = audioread(fullfile( path_sn, name));                        % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    [filtrovane_SMP, stredni_f] = banka_filtru(sample);                    % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Snare = i;
    waitbar(i/length(folder_sn),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
 f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� KICK');
% KICK
for i = 1:length(folder_kick)-2                                            % na��t�n� sampl� pro Kick
    name = char({folder_kick(i+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample] = audioread(fullfile( path_kick, name));                      % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Kick = i;
    waitbar(i/length(folder_kick),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
% HI-HAT
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� HI-HAT');
 for i = 1:length(folder_hi)-2                                              % na��t�n� sampl� pro Hi-hat
     name = char({folder_hi(i+2).name});                                    % proch�zen� jmen soubor� ve slo�ce
     [sample] = audioread(fullfile( path_hi, name));                        % na�ten� samplu
     sample = sample(:,1);                                                  % zmon�n� samplu
     [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
     [E] = energie(filtrovane_SMP);
     SUM_E = [SUM_E E];
     HiHat = i;
     waitbar(i/length(folder_hi),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
 end
 delete(f);
 %FLOOR TOM
%  f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� FLOOR TOM');
% for i = 1:length(folder_ftom)-2                                            % na��t�n� sampl� pro Floor Tom
%     name = char({folder_ftom(i+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
%     [sample] = audioread(fullfile( path_ftom, name));                      % na�ten� samplu
%     sample = sample(:,1);                                                  % zmon�n� samplu
%     [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
%     [E] = energie(filtrovane_SMP);
%     SUM_E = [SUM_E E];
%     FloorTom = i;
%     waitbar(i/length(folder_ftom),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
% end
% delete(f);
% CRASH
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� CRASH');
for i = 1:length(folder_crash)-2                                           % na��t�n� sampl� pro Crash
    name = char({folder_crash(i+2).name});                                 % proch�zen� jmen soubor� ve slo�ce
    [sample] = audioread(fullfile( path_crash, name));                      % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Crash = i;
    waitbar(i/length(folder_crash),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
% RIDE
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� RIDE');
for i = 1:length(folder_ride)-2                                            % na��t�n� sampl� pro Ride
    name = char({folder_ride(i+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample] = audioread(fullfile( path_ride, name));                      % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Ride = i;
    waitbar(i/length(folder_ride),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
% SNARE A HI-HAT
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� SNARE + HI-HAT');
for i = 1:length(folder_SnHh)-2                                            % na��t�n� sampl� pro Ride
    name = char({folder_SnHh(i+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample] = audioread(fullfile( path_SnHh, name));                      % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    SnHh = i;
    waitbar(i/length(folder_ride),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
% KICK A HI-HAT
f = waitbar(0,'Na��t�n� sampl�', 'Name', 'Na��t�n� sampl� KICK + HI-HAT');
for i = 1:length(folder_KickHh)-2                                            % na��t�n� sampl� pro Ride
    name = char({folder_KickHh(i+2).name});                                  % proch�zen� jmen soubor� ve slo�ce
    [sample] = audioread(fullfile( path_KickHh, name));                      % na�ten� samplu
    sample = sample(:,1);                                                  % zmon�n� samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    KickHh = i;
    waitbar(i/length(folder_ride),f,sprintf('Na��t�n� sampl�: %6s %12s',name));
end
delete(f);
%% vytvo�en� tr�novac� struktury
info = table(Snare,Kick,HiHat,Crash,Ride,SnHh,KickHh);
pocet_SMP = Snare + Kick + HiHat + Crash + Ride + SnHh + KickHh;
trenovaci = struct ('E',SUM_E, 'pocet_SMP', pocet_SMP,  'info', ...        % vytvo�en� trenovac� struktury
     info, 'stredni_f',  stredni_f);
end