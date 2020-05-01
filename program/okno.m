<<<<<<< HEAD
function [WindowID,WinNum,SegmentID,q] = okno(sample, fs, WinLen, overlap)
%{
    Tato funkce rozd�l� sign�l do �asov�c oken a hled� za��tky a konce �der�.
    Vstupn�mi parametry jsou zvukov� sign�l, vzorkovac� kmito�et, velikost
    okna (doporu�eno 3500 sampl�) a p�esah (doporu�en 2/3).

    V�stupn�mi parametry jsou Identifik�roty za��tk� a konc� oken,
    identifik�tory za��tk�, konc� �der� a po�et oken.
%}

% %cistka
%   clc;
%   clear all;
%   close all;
=======
function [WindowID,SegmentID,k] = okno(sample, fs)
%%cistka
%   %clc;
%   %clear all;
%   %close all;
>>>>>>> parent of c361f40... rozšíření na dvoj údery
% 
% 
% %% na�ten� souboru
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
% if ~exist('sample') || isempty(sample)                                     % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
%                                             
%     [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*',...
%         'V�echny soubory'},'Vyber zvukov� soubor');
%     [sample, fs] = audioread( fullfile( pathname, filename));
%             info = audioinfo(fullfile( pathname, filename));
%     
% end
% sample = sample(:,1);                                                       % zmon�n� samplu
%% definice prom�nn�ch
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
%% segmentace plovouc�m oknem
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
%% Seskupen� segment�

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
<<<<<<< HEAD
q=q-1;
if q < 1
    q = 1;
end
%% ov��en� za��tk� akonc�

clear i;
if SegmentID (q,1) == 0
    SegmentCheck(1,1) = 1;
    for i = 1:q
        if i <= length(SegmentID)-1
            SegmentCheck(i+1,1) = SegmentID (i,1);
        end
        SegmentCheck(i,2) = SegmentID (i,2);
    end
else
    SegmentCheck = SegmentID;
end
%clear SegmentID;
clear i;
OutShift = 0;
InShift = 0;
for i = 1:q
    if i <= q-1    
        if SegmentCheck(i+1,1)  < SegmentCheck(i,2)
            buffer (i,2) = SegmentCheck(i,1);
            OutShift = OutShift + 1
        else
            buffer (i,2) = SegmentCheck(i,2);
        end
    else
       buffer (i,2) = SegmentCheck(i,2);
    end
    if i <= q-1
        if SegmentCheck(i,1) > SegmentCheck(i,2)
            buffer (i,1) = SegmentCheck(i,2);
            InShift = InShift + 1;
        else
            buffer (i,1) = SegmentCheck(i,1);
        end  
    else
       buffer (i,1) = SegmentCheck(i,1);
    end
    
        
end
if buffer(i,2) == 0
   buffer (i,2) = SegmentCheck(i,1); 
end
clear SegmentID;
SegmentID = buffer;
=======
>>>>>>> parent of c361f40... rozšíření na dvoj údery
end    
