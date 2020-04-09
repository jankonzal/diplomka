function [WindowID,SegmentID,k] = okno(sample, fs)
%%cistka
%   %clc;
%   %clear all;
%   %close all;
% 
% 
% %% naètení souboru
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
%  cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
% % cesta = 'C:\Users\Honza\Documents\samply\sn\on\Snr-01 48.wav';
% if exist('cesta')
%     [sample, fs] = audioread(cesta);
%     info = audioinfo(cesta);
% end
% if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otevøe se dialog pro naèteni zvukoveho souboru 
%                                             
%     [filename, pathname] = uigetfile({'*.wav','Zvukové soubory wav';'*.*',...
%         'Všechny soubory'},'Vyber zvukový soubor');
%     [sample, fs] = audioread( fullfile( pathname, filename));
%             info = audioinfo(fullfile( pathname, filename));
%     
% end
% sample = sample(:,1);                                                       % zmonìní samplu
%% definice promìnných
WindowID = 1;
PriznakySum = [0 0];
k = 1;
WinLen = 3500;
overlap= 0.7;
WinMinus = 1-overlap;
%% normalizace hlasitosti
[E] = energie(sample);
if E < 2500
    while E < 2500
    [E] = energie(sample);
    sample = sample*1.1;
    end
else
    while E > 2500
    [E] = energie(sample);
    sample = sample*0.9;
    end
end
%% segmentace plovoucím oknem
for i=1:WinLen*WinMinus:length(sample)
    WindowID (k,1) = i;
    WindowID (k,2) = i+WinLen;
     if WindowID (k,2) > length(sample)
        WindowID (k,2) = length(sample);
     end
    [priznaky] = tr_detektor(sample(WindowID (k,1):WindowID (k,2)),0,i);
    PriznakySum= [PriznakySum; priznaky]; 
    
     
    %priznaky 
    %pause;
    k=k+1;
  
end

k=k-1;
WindowID (k,2) = length(sample);
%% Seskupení segmentù

i=[];
SegmentID(1,1)=1;
p=1;
q=1;
s=1;
t=1;
for i=1:length(PriznakySum)
    if PriznakySum(i,1) ~= 0
        StartMean(p) = PriznakySum(i,1);
        p=p+1;
    else
        if p>1
            SegmentID(q+1,1) = mean(StartMean);
            q=q+1;
        end
        StartMean = [];
        p=1;
    end
    
    if PriznakySum(i,2) ~= 0
        StopMean(s) = PriznakySum(i,2);
        s=s+1;
    else
        if s>1
            SegmentID(t,2) = mean(StopMean);
            t=t+1;
        end
        StopMean = [];
        s=1;
    end      
end
end    
