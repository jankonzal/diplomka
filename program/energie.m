function [E] = energie(filtrovane_samply,puvodni_samply)
%{
Funkce pro v�po�et energie ve frekven�n�ch p�smech.
Vstupem jsou filtrovan� samply a p�vodn� samply (pro mo�nost zobrazen� rozd�l�)
V�stupem je vektor energi�.
Po odkomentovan� k�du lze zobrazit vypo�ten� energie z banky filtr�
srovnan� se spektrem p�vodn�ho samplu.

%}
for i = 1:length(filtrovane_samply(1,:))
    sm = filtrovane_samply(:,i);                   
    E(i,1) = sum(abs(sm).^2);                                                % v�po�et energie
end

% figure;
% subplot(2,1,1);
% bar(E);                                                                  % zobrazen� energi� v p�smech
% xticks([1 3 5 7 9 11 13 15 17 19 21 23 25 27 29]);
% xticklabels({'25','40','63','100','160','250','400'...
%     '630','1000','1600','2500','4000','6300','10000', '20000'});
% ylabel('energie [aj]');
% xlabel('frekvence [Hz]');
% title ('Energie ve frekven�n�ch p�smech');
% subplot(2,1,2);
% Fs = 48000;
% y = puvodni_samply;
% N = length(y);
% f = (0:N-1)*(Fs/N);
% fft_sample = abs(fft(puvodni_samply));% spektrum sign�lu
% semilogx(f,fft_sample);
%    ax = gca;
%     
%   ax.XLim = [25 20000];
%   xticks([25 40 63 100 160 250 400 630 1000 1600 2500 4000 6300 10000 20000]);
%          %xticklabels({'25','40','63','100','160','250','400'...
%     %'630','1000','1600','2500','4000','6300','10000', '20000'});
% ylabel('relativn� mplituda [aj]');
% xlabel('frekvence [Hz]');
% title ('Spektrum sign�lu')
end