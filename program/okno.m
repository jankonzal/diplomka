function [WindowID,WinNum,SegmentID,q] = okno(sample, fs, WinLen, overlap, SegmentOFF)
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
% 
% 
% %% na�ten� souboru
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
%  cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
% % cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
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
WindowID = 1;                                                               % �asov� zna�ky oken
PriznakySum = [0 0];                                                        % p��znaky za��tk� a konc� �der�
WinNum = 1;                                                                 % po�et oken
% overlap = 0.6;                                                            
% WinLen=3500;
WinMinus = 1-overlap;                                                       %p�epo�et p�wsahu
if SegmentOFF == 1
    pocet_segmentu = 1;                                                     
    clear SegmentID;
    SegmentID(1,1) = 1;                                                     % �asov� zna�ky za��tk� akonc� �der�
    SegmentID(1,2) = length(sample);
end
%% normalizace hlasitosti


[E] = rms(sample);
if E < 0.4                                                                 % pokud je energie men�� ne� 0.4 (RMS) je sign�l zes�len
    while E < 0.4
    [E] = rms(sample);
    sample = sample*1.1;
    end
else                                                                        % pokud je energie men�� ne� 0.4 (RMS) je sign�l zeslaben
    while E > 0.4                                                          
    [E] = rms(sample);
    sample = sample*0.9;
    end
end

dRE = expander(-60);                                                        % expander
%sample = dRE(sample);
dRL = limiter(-1);                                                          % limiter
sample = dRL(sample);
%% segmentace plovouc�m oknem
for i=1:WinLen*WinMinus:length(sample)
    WindowID (WinNum,1) = i;    
    WindowID (WinNum,2) = i+WinLen;
     if WindowID (WinNum,2) > length(sample)
        WindowID (WinNum,2) = length(sample);
     end
    [priznaky] = tr_detektor(sample(WindowID (WinNum,1):WindowID (WinNum,2)),0,i);    % detekce transient� pro hled�n� �der�
    PriznakySum= [PriznakySum; priznaky];                                   % vektor p��znak� za��tk� a konc� transient� 
    %priznaky 
    %pause;
    WinNum=WinNum+1;                                                        %po�et oken 
end

WinNum=WinNum-1;
WindowID (WinNum,2) = length(sample);
%% ov��en� za��tku - pokud je na za��tku nahr�vky sign�l siln�j�� ne� prahov� �rove�
clear i;
WhileOff=0;
i=1;
SegOn = 0;
while WhileOff == 0
    if PriznakySum(i,1) ~= 0
        WhileOff=1;
        SegOn = 1;
    end
    if PriznakySum(i,2) ~= 0
        WhileOff=1;
    end
    i=i+1;
end

%% hled�n� �der�
% Cyklus prohled�v� p��znaky a vynech�v� nolov� hodnoty. Hledal i v�ce
% Soused�c� p��znaky pr�m�ruje
clear i;
first=1;
p=1;
q=1;
s=1;
t=1;
for i=1:length(PriznakySum)
    if PriznakySum(i,1) ~= 0
        StartMean(p) = PriznakySum(i,1);
        p=p+1;
    else
        if p>1 && first == 1;
            SegmentID(q,1) = mean(StartMean);
            q=q+1;
            first = 0;
        end
        if p>2
           SegmentID(q,1) = mean(StartMean);
            q=q+1;
        end
        StartMean = [];
        p=1;
    end
    
    if PriznakySum(i,2) ~= 0
        StopMean(s) = PriznakySum(i,2);
        s=s+1;
    else
        if s>2
            SegmentID(t,2) = mean(StopMean);
            t=t+1;
        end
        StopMean = [];
        s=1;
    end      
end
q=q-1;
if q < 1
    q = 1;
end
%% ov��en� za��tk� akonc�
% pokud se vyskytne chyba zkr�t� �der jen na okna v za��tku �deru
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
%% p��prava pro v�stup
if buffer(i,2) == 0
   buffer (i,2) = SegmentCheck(i,1); 
end
clear SegmentID;
SegmentID = buffer;
end    
