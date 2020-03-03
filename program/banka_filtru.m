function [filtrovane_samply,stredni_f] = banka_filtru(sample)
%{
Funkce banky filtr� pro rozd�len� na jednotliv� frekven�n� p�sma.
Vstupem je sampl a vzorkovac� kmito�et.
V�stupem jsou vyfyltrovan� sampl a vektor st�edn�ch kmito�t�.
Banka je zalo�ena na zlomko okt�vov�ch filtrech. Pomoc� prom�nn� o je mo�n�
nastavit po�et filtr� na okt�vu. Pomoc� prom�nn� rad se nastavuje ��d
filtr�.
Pro zobrazen� pr�b�h� banky filtr�, nebo pro p�ehr�n� filtrovan�ho samplu
je mo�n� odkomentovat dan� �sek k�du.
%}

%% definice promennych
Fs = 48000;
fs = 25;                    % pocatecni stredni frekvence
fs_v = fs;
fh = fs * (2^(1/6));        % po��te�n� horn� mezn� kmito�et
o = 3;                      % po�et filtr� na okt�vu
rad = 2;                    % ��d filtru
type = 'bandpass';          % typ filtru
i = 1;                      % iterace
%filtrovane_samply = zeros(200000,29);
while fh < Fs/2
    
    %% v�po�et parametr� filtr�
    fs = 2^(1/o)*fs;        % v�po�et st�edn�ch kmito�t�
    fs_v = [fs_v fs];       % vektor st�edn�ch kmito�t�
    fd = fs / (2^(1/6));    % v�po�et doln�ho mezn�ho kmito�tu         
    fh = fs * (2^(1/6));    % v�po�et horn�ho mezn�ho kmito�tu
    
    
    %% vypocet banky filtru
    if fh < Fs/2
        
        Wn = [fd/(Fs/2) fh/(Fs/2)];                   % vektor mezn�ch kmito�t�
        [z,p,k] = butter (rad,Wn,type);               % v�po�et filtru
        [b,a] = zp2tf(z,p,k);                         % p�evodn nulov�ch bod� a p�l� na p�enosovou funkci
        filtrovane_samply(:,i) = filter(b,a,sample);  % filtrace sign�lu
    
        %% p�ehr�n� pro debuging
%        sound (filtrovane_samply (:,i),Fs);
    
        %% vykreslen�
%        figure;
%         subplot(3,1,1);
%         plot (sample);                                                   % �asov� pr�b�h samplu
%         subplot(3,1,2);
%         plot (filtrovane_samply(:,i))                                    % �asov� pr�b�h vyltrovan�ho samplu
%         subplot(3,1,3);
%        freqz(b,a,Fs/2,Fs);                                               % p�enos filtru

%         figure;
%         fft_sample = abs(fft(sample));                                   % spektrum samplu 
%         fft_filter = abs(fft(filtrovane_samply (:,i)));                  % spektrum filtrovan�ho samplu
%         subplot(2,1,1)
%         plot(fft_sample);
%         subplot(2,1,2)
%         plot(fft_filter);
        %% iterace
          i = i+1;
    end
end
    for j = 1:length(filtrovane_samply(1,:))                               
        stredni_f(j) = fs_v(j);                                            % p�ed�n� st�edn�ch kmito�t� filtr�
    end
end