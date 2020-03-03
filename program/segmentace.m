function [segmentovane_samply,k] = segmentace(sample, fs)
% %cistka
%  clc;
%  clear all;
%  close all;


%% na�ten� souboru
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_long_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\all_drums_short_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_long_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\downmix\kick_sn_hihat_short_mono.wav';
% % cesta = 'D:\Disk Google\FEKT\Diplomka2\samply\sn\on\Snr-01 48.wav';
%  [sample, fs] = audioread(cesta);
%          info = audioinfo(cesta);
% if ~exist('sample') || isempty(sample)          % pokud neexistuje sammpl otev�e se dialog pro na�teni zvukoveho souboru 
%                                             
%     [filename, pathname] = uigetfile({'*.wav','Zvukov� soubory wav';'*.*','V�echny soubory'},...
%         'Vyber zvukov� soubor');
%     [sample, fs] = audioread( fullfile( pathname, filename));
%             info = audioinfo(fullfile( pathname, filename));
%     
% end
% sample = sample(:,1);                           % zmon�n� samplu

%% prom�nn�
prah_up = 0.025 * ones(1, length(sample));
prah_lo = -0.025 * ones(1, length(sample));
j = 1;
k = 1;
new_sample = 0;
segmentovane_samply = zeros(200000,500);
f = waitbar(0,'Po�et nalezen�ch sampl�: 1', 'Name', 'Segmentace sampl�...');

%% segmentace 
[up,lo] = envelope(sample,1500,'peak');   % ob�lka sign�lu

figure
hold on;                                  % vykreslen� ob�lky a mez�
plot(sample);
plot(up);
plot(prah_up);
ax = gca;
ax.YLim = [-0.2 0.2];

hold off;

for i = 1: length(sample)                 % cyklus segmentace
    if up(i) > 0.025                      % prah ob�lky
        if new_sample == 1                % rozd�len� ssampl�
            k = k+1;
            waitbar(i/length(sample),f,sprintf('Po�et nalezen�ch sampl�: %d',k));
            j = 1;
            new_sample = 0;
        
        end
      segmentovane_samply(j,k) = sample(i); % z�pis do matice
      j = j+1;
    else
        new_sample = 1;
    end
    
end
delete(f)
end

 
