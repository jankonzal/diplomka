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
    E(i) = sum(abs(sm).^2);                                                % v�po�et energie
end

% figure;
% subplot(2,1,1);
% bar(E);                                                                  % zobrazen� energi� v p�smech
% 
% xticklabels({'25','50','200','630','2000','6400'});
% subplot(2,1,2);
% fft_sample = abs(fft(puvodni_samply));                                   % spektrum sign�lu
% semilogx(fft_sample);
%          ax = gca;
%          ax.XLim = [10 20000];
end