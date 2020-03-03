function [E] = energie(filtrovane_samply,puvodni_samply)
%{
Funkce pro výpoèet energie ve frekvenèních pásmech.
Vstupem jsou filtrované samply a pùvodní samply (pro možnost zobrazení rozdílù)
Výstupem je vektor energií.
Po odkomentovaní kódu lze zobrazit vypoètené energie z banky filtrù
srovnané se spektrem pùvodního samplu.

%}
for i = 1:length(filtrovane_samply(1,:))
    sm = filtrovane_samply(:,i);                   
    E(i) = sum(abs(sm).^2);                                                % výpoèet energie
end

% figure;
% subplot(2,1,1);
% bar(E);                                                                  % zobrazení energií v pásmech
% 
% xticklabels({'25','50','200','630','2000','6400'});
% subplot(2,1,2);
% fft_sample = abs(fft(puvodni_samply));                                   % spektrum signálu
% semilogx(fft_sample);
%          ax = gca;
%          ax.XLim = [10 20000];
end