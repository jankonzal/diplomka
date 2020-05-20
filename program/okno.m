function [WindowID,WinNum,SegmentID,q] = okno(sample, fs, WinLen, overlap, SegmentOFF)
%{
    Tato funkce rozdìlí signál do èasovýc oken a hledá zaèátky a konce úderù.
    Vstupními parametry jsou zvukový signál, vzorkovací kmitoèet, velikost
    okna (doporuèeno 3500 samplù) a pøesah (doporuèen 2/3).

    Výstupními parametry jsou Identifikároty zaèátkù a koncù oken,
    identifikátory zaèátkù, koncù úderù a poèet oken.
%}

% %cistka
%   clc;
%   clear all;
%   close all;
% 
% 
% %% naètení souboru
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
WindowID = 1;                                                               % èasové znaèky oken
PriznakySum = [0 0];                                                        % pøíznaky zaèátkù a koncù úderù
WinNum = 1;                                                                 % poèet oken
% overlap = 0.6;                                                            
% WinLen=3500;
WinMinus = 1-overlap;                                                       %pøepoèet pøwsahu
if SegmentOFF == 1
    pocet_segmentu = 1;                                                     
    clear SegmentID;
    SegmentID(1,1) = 1;                                                     % èasové znaèky zaèátkù akoncù úderù
    SegmentID(1,2) = length(sample);
end
%% normalizace hlasitosti


[E] = rms(sample);
if E < 0.4                                                                 % pokud je energie menší než 0.4 (RMS) je signál zesílen
    while E < 0.4
    [E] = rms(sample);
    sample = sample*1.1;
    end
else                                                                        % pokud je energie menší než 0.4 (RMS) je signál zeslaben
    while E > 0.4                                                          
    [E] = rms(sample);
    sample = sample*0.9;
    end
end

dRE = expander(-60);                                                        % expander
%sample = dRE(sample);
dRL = limiter(-1);                                                          % limiter
sample = dRL(sample);
%% segmentace plovoucím oknem
for i=1:WinLen*WinMinus:length(sample)
    WindowID (WinNum,1) = i;    
    WindowID (WinNum,2) = i+WinLen;
     if WindowID (WinNum,2) > length(sample)
        WindowID (WinNum,2) = length(sample);
     end
    [priznaky] = tr_detektor(sample(WindowID (WinNum,1):WindowID (WinNum,2)),0,i);    % detekce transientù pro hledání úderù
    PriznakySum= [PriznakySum; priznaky];                                   % vektor pøíznakù zaèátkù a koncù transientù 
    %priznaky 
    %pause;
    WinNum=WinNum+1;                                                        %poèet oken 
end

WinNum=WinNum-1;
WindowID (WinNum,2) = length(sample);
%% ovìøení zaèátku - pokud je na zaèátku nahrávky signál silnìjší než prahová úroveò
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

%% hledání úderù
% Cyklus prohledává pøíznaky a vynechává nolové hodnoty. Hledal i více
% Sousedící pøíznaky prùmìruje
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
%% ovìøení zaèátkù akoncù
% pokud se vyskytne chyba zkrátí úder jen na okna v zaèátku úderu
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
%% pøíprava pro výstup
if buffer(i,2) == 0
   buffer (i,2) = SegmentCheck(i,1); 
end
clear SegmentID;
SegmentID = buffer;
end    
