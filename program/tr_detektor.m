function tr_detektor(okno)
% clc;
% clear all;
% close all;
% % na�ten� souboru
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_long_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\all_drums_short_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_long_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\kick_sn_hihat_short_mono.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\sn\on\Snr-01 48.wav';
% %cesta = 'C:\Users\Honza\Documents\samply\downmix\08.wav';
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
% okno = sample(:,1);                                                       % zmon�n� samplu
%% Diferen�n� filtrace

for i = 1:length(okno)
    if i==1;
    dif(i) = okno(i);
    else
    dif(i) = okno(i)-okno(i-1);
    end
end
det1 = dif.*dif;


figure(1);
subplot(3,1,1);
plot(okno);
ax = gca;
ax.YLim = [-1 1];
subplot(3, 1, 2);
plot(dif);
bx = gca;
bx.YLim = [-0.25 0.25];
subplot(3,1,3);
plot(det1);
bx = gca;
bx.YLim = [0 0.05];
end