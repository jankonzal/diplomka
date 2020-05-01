function [trenovaci] = nacteni_souboru();
          
          
%% èistka
% clc
% clear all;
% close all;

%% definice promìnných
path = ('C:\Users\Honza\Documents\samply');                           % definice cest pro rychle najití složek (doèasné)
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

if ~exist('path_ftom')
folder_ftom = uigetdir(path,'Floor tom');                                  % naètení složky pro Floor Tom
end

if ~exist('path_crash')
folder_crash = uigetdir(path,'Crash');                                     % naètení složky pro Crash
end

if ~exist('path_ride')
folder_ride = uigetdir(path,'Ride');                                       % naètení složky pro Ride
end

if ~exist('path_SnHh')
folder_SnHh = uigetdir(path,'SnHh');                                       % naètení složky pro Ride
end

if ~exist('path_KickHh')
folder_KickHh = uigetdir(path,'KickHh');                                       % naètení složky pro Ride
end
% if ~exist('path_trash')
% folder_trash = uigetdir(path,'Trash');                                   % naètení složky pro Trash
% end
% 
% if ~exist('path_tom1')
% folder_tom1 = uigetdir(path,'Tom 1');                                    % naètení složky pro Tom 1
% end
% 
% if ~exist('path_tom2')
% folder_tom2 = uigetdir(path,'Tom 2');                                    % naètení složky pro Tom 2
% end


%% naètení názvù souborù ve složkách

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

%% naètení souborù
   
% SNARE
for i = 1:length(folder_sn)-2                                              % naèítání samplù pro Snare
    name = char({folder_sn(i+2).name});                                    % procházení jmen souborù ve složce
    [sample] = audioread(fullfile( path_sn, name));                        % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    [filtrovane_SMP, stredni_f] = banka_filtru(sample);                    % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Snare = i;
    waitbar(i/length(folder_sn),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
 f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù KICK');
% KICK
for i = 1:length(folder_kick)-2                                            % naèítání samplù pro Kick
    name = char({folder_kick(i+2).name});                                  % procházení jmen souborù ve složce
    [sample] = audioread(fullfile( path_kick, name));                      % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Kick = i;
    waitbar(i/length(folder_kick),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
% HI-HAT
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù HI-HAT');
 for i = 1:length(folder_hi)-2                                              % naèítání samplù pro Hi-hat
     name = char({folder_hi(i+2).name});                                    % procházení jmen souborù ve složce
     [sample] = audioread(fullfile( path_hi, name));                        % naètení samplu
     sample = sample(:,1);                                                  % zmonìní samplu
     [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
     [E] = energie(filtrovane_SMP);
     SUM_E = [SUM_E E];
     HiHat = i;
     waitbar(i/length(folder_hi),f,sprintf('Naèítání samplù: %6s %12s',name));
 end
 delete(f);
 %FLOOR TOM
%  f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù FLOOR TOM');
% for i = 1:length(folder_ftom)-2                                            % naèítání samplù pro Floor Tom
%     name = char({folder_ftom(i+2).name});                                  % procházení jmen souborù ve složce
%     [sample] = audioread(fullfile( path_ftom, name));                      % naètení samplu
%     sample = sample(:,1);                                                  % zmonìní samplu
%     [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
%     [E] = energie(filtrovane_SMP);
%     SUM_E = [SUM_E E];
%     FloorTom = i;
%     waitbar(i/length(folder_ftom),f,sprintf('Naèítání samplù: %6s %12s',name));
% end
% delete(f);
% CRASH
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù CRASH');
for i = 1:length(folder_crash)-2                                           % naèítání samplù pro Crash
    name = char({folder_crash(i+2).name});                                 % procházení jmen souborù ve složce
    [sample] = audioread(fullfile( path_crash, name));                      % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Crash = i;
    waitbar(i/length(folder_crash),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
% RIDE
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù RIDE');
for i = 1:length(folder_ride)-2                                            % naèítání samplù pro Ride
    name = char({folder_ride(i+2).name});                                  % procházení jmen souborù ve složce
    [sample] = audioread(fullfile( path_ride, name));                      % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    Ride = i;
    waitbar(i/length(folder_ride),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
% SNARE A HI-HAT
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù SNARE + HI-HAT');
for i = 1:length(folder_SnHh)-2                                            % naèítání samplù pro Ride
    name = char({folder_SnHh(i+2).name});                                  % procházení jmen souborù ve složce
    [sample] = audioread(fullfile( path_SnHh, name));                      % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    SnHh = i;
    waitbar(i/length(folder_ride),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
% KICK A HI-HAT
f = waitbar(0,'Naèítání samplù', 'Name', 'Naèítání samplù KICK + HI-HAT');
for i = 1:length(folder_KickHh)-2                                            % naèítání samplù pro Ride
    name = char({folder_KickHh(i+2).name});                                  % procházení jmen souborù ve složce
    [sample] = audioread(fullfile( path_KickHh, name));                      % naètení samplu
    sample = sample(:,1);                                                  % zmonìní samplu
    [filtrovane_SMP] = banka_filtru(sample);                               % filtrace samplu                              
    [E] = energie(filtrovane_SMP);
    SUM_E = [SUM_E E];
    KickHh = i;
    waitbar(i/length(folder_ride),f,sprintf('Naèítání samplù: %6s %12s',name));
end
delete(f);
%% vytvoøení trénovací struktury
info = table(Snare,Kick,HiHat,Crash,Ride,SnHh,KickHh);
pocet_SMP = Snare + Kick + HiHat + Crash + Ride + SnHh + KickHh;
trenovaci = struct ('E',SUM_E, 'pocet_SMP', pocet_SMP,  'info', ...        % vytvoøení trenovací struktury
     info, 'stredni_f',  stredni_f);
end