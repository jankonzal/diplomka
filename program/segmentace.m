function [segmentID,k,a] = segmentace(sample, fs)
%%cistka
%   clc;
%   clear all;
%   close all;


%% naètení souboru
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
if ~exist('sample') || isempty(sample)          % pokud neexistuje sammpl otevøe se dialog pro naèteni zvukoveho souboru 
                                            
    [filename, pathname] = uigetfile({'*.wav','Zvukové soubory wav';'*.*','Všechny soubory'},...
        'Vyber zvukový soubor');
    [sample, fs] = audioread( fullfile( pathname, filename));
            info = audioinfo(fullfile( pathname, filename));
    
end
sample = sample(:,1);                           % zmonìní samplu

%% promìnné
prah_up = 0.025 * ones(1, length(sample));                                 % Horní prahová hodnota
prah_lo = -0.025 * ones(1, length(sample));                                % Dolní prahová hodnota
j = 1;                                                                     % iterace
k = 1;
start = 1;
stop = 0;
segmentID = 0;
                                   % matice pro samply
f = waitbar(0,'Poèet nalezených samplù: 1', 'Name', 'Segmentace samplù...');

%% pøizpùsobení signálu
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
%% filtr dilní propusti
Wn = 4500/(fs/2); 
[b,a] = butter(15,Wn,'high');

y = filter(b,a,sample);
%% segmentace
[up1,lo1] = envelope(sample,1000,'peak');   % obálka signálu
[up,lo] = envelope(y,1000,'peak');

%% segmentace jednotlivích vzrokù
% for i = 1: length(sample)                                                  % cyklus segmentace
%     if up(i) > 0.025                                                       % prah obálky
%         if new_sample == 1                                                 % rozdìlení ssamplù
%             k = k+1;
%             waitbar(i/length(sample),f,sprintf...
%             ('Poèet nalezených samplù: %d',k));
%             j = 1;
%             new_sample = 0;
%         
%         end
%       segmentovane_samply(j,k) = sample(i); % zápis do matice
%       j = j+1;
%     else
%         new_sample = 1;
%     end
%     
% end
%% segmentace pøíznákù
for i = 1: length(sample)                                                                   
    if up(i) > 0.025
        stop = 1;
        if start == 1
            segmentID(k,1) = i;
            k = k+1;
            waitbar(i/length(sample),f,sprintf...
           ('Poèet nalezených samplù: %d',k));
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
%% vykreslení
% freqz(b,a);
% figure;
% hold on;                                  % vykreslení obálky a mezí
% plot(sample);
%  plot(up1);
%  plot(prah_up);
% ax = gca;
% ax.YLim = [-0.2 0.2];
% hold off;
figure;
hold on;                                  % vykreslení obálky a mezí
plot(y);
plot(up);
plot(prah_up);
ax = gca;
ax.YLim = [-0.2 0.2];
title('filtrovaný');
% for i = 1:k
%     plot ([segmentID(i,1) segmentID(i,1)], [-0.1 0.1],'r');
%     plot ([segmentID(i,2) segmentID(i,2)], [-0.1 0.1],'g');
% end
hold off;
end

 
