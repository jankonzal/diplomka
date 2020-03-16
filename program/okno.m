function [segmentID,k] = okno(sample, fs)
%%cistka
%   clc;
%   clear all;
%   close all;


%% na�ten� souboru
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
% cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\08.wav';
if exist('cesta')
    [sample, fs] = audioread(cesta);
    info = audioinfo(cesta);
end
if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*',...
        'V�echny soubory'},'Vyber zvukov� soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                                                       % zmon�n� samplu
%% definice prom�nn�ch
segmentID = 1;
k = 1;
WinLen = 3200;
%% segmentace plovouc�m oknem
for i=1:WinLen:length(sample)
    segmentID (k,1) = i;
    segmentID (k,2) = i+WinLen;
    k=k+1;
end

k=k-1;
segmentID (k,2) = length(sample);
end
