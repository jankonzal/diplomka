function [segmentovane_samply,k] = segmentace(sample, fs)
% %cistka
%  clc;
%  clear all;
%  close all;


%% naètení souboru
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
%  [sample, fs] = audioread(cesta);
%          info = audioinfo(cesta);
% if ~exist('sample') || isempty(sample)          % pokud neexistuje sammpl otevøe se dialog pro naèteni zvukoveho souboru 
%                                             
%     [filename, pathname] = uigetfile({'*.wav','Zvukové soubory wav';'*.*','Všechny soubory'},...
%         'Vyber zvukový soubor');
%     [sample, fs] = audioread( fullfile( pathname, filename));
%             info = audioinfo(fullfile( pathname, filename));
%     
% end
% sample = sample(:,1);                           % zmonìní samplu

%% promìnné
prah_up = 0.025 * ones(1, length(sample));
prah_lo = -0.025 * ones(1, length(sample));
j = 1;
k = 1;
new_sample = 0;
segmentovane_samply = zeros(200000,500);
f = waitbar(0,'Poèet nalezených samplù: 1', 'Name', 'Segmentace samplù...');

%% segmentace 
[up,lo] = envelope(sample,1500,'peak');   % obálka signálu

figure
hold on;                                  % vykreslení obálky a mezí
plot(sample);
plot(up);
plot(prah_up);
ax = gca;
ax.YLim = [-0.2 0.2];

hold off;

for i = 1: length(sample)                 % cyklus segmentace
    if up(i) > 0.025                      % prah obálky
        if new_sample == 1                % rozdìlení ssamplù
            k = k+1;
            waitbar(i/length(sample),f,sprintf('Poèet nalezených samplù: %d',k));
            j = 1;
            new_sample = 0;
        
        end
      segmentovane_samply(j,k) = sample(i); % zápis do matice
      j = j+1;
    else
        new_sample = 1;
    end
    
end
delete(f)
end

 
