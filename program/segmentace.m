function [segmentID,k,a] = segmentace(sample, fs)
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
if ~exist('sample') || isempty(sample)          % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*','V�echny soubory'},...
        'Vyber zvukov� soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                           % zmon�n� samplu

%% prom�nn�
prah_up = 0.025 * ones(1, length(sample));                                 % Horn� prahov� hodnota
prah_lo = -0.025 * ones(1, length(sample));                                % Doln� prahov� hodnota
j = 1;                                                                     % iterace
k = 1;
start = 1;
stop = 0;
segmentID = 0;
                                   % matice pro samply
f = waitbar(0,'Po�et nalezen�ch sampl�: 1', 'Name', 'Segmentace sampl�...');

%% p�izp�soben� sign�lu
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
%% filtr diln� propusti
Wn = 4500/(fs/2); 
[b,a] = butter(15,Wn,'high');

y = filter(b,a,sample);
%% segmentace
[up1,lo1] = envelope(sample,1000,'peak');   % ob�lka sign�lu
[up,lo] = envelope(y,1000,'peak');

%% segmentace jednotliv�ch vzrok�
% for i = 1: length(sample)                                                  % cyklus segmentace
%     if up(i) > 0.025                                                       % prah ob�lky
%         if new_sample == 1                                                 % rozd�len� ssampl�
%             k = k+1;
%             waitbar(i/length(sample),f,sprintf...
%             ('Po�et nalezen�ch sampl�: %d',k));
%             j = 1;
%             new_sample = 0;
%         
%         end
%       segmentovane_samply(j,k) = sample(i); % z�pis do matice
%       j = j+1;
%     else
%         new_sample = 1;
%     end
%     
% end
%% segmentace p��zn�k�
for i = 1: length(sample)                                                                   
    if up(i) > 0.025
        stop = 1;
        if start == 1
            segmentID(k,1) = i;
            k = k+1;
            waitbar(i/length(sample),f,sprintf...
           ('Po�et nalezen�ch sampl�: %d',k));
            start = 0;
        end
    else
        start = 1;
        if stop == 1
          segmentID(k-1,2) = i;
          stop = 0;
        end
    end
end
delete(f);
k=k-1;
%% vykreslen�
% freqz(b,a);
% figure;
% hold on;                                  % vykreslen� ob�lky a mez�
% plot(sample);
%  plot(up1);
%  plot(prah_up);
% ax = gca;
% ax.YLim = [-0.2 0.2];
% hold off;
figure;
hold on;                                  % vykreslen� ob�lky a mez�
plot(y);
plot(up);
plot(prah_up);
ax = gca;
ax.YLim = [-0.2 0.2];
title('filtrovan�');
% for i = 1:k
%     plot ([segmentID(i,1) segmentID(i,1)], [-0.1 0.1],'r');
%     plot ([segmentID(i,2) segmentID(i,2)], [-0.1 0.1],'g');
% end
hold off;
end

 
