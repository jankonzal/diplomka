function [filtrovane_samply,stredni_f] = banka_filtru(sample)
%{
Funkce banky filtrù pro rozdìlení na jednotlivá frekvenèní pásma.
Vstupem je sampl a vzorkovací kmitoèet.
Výstupem jsou vyfyltrovaný sampl a vektor støedních kmitoètù.
Banka je založena na zlomko oktávových filtrech. Pomocí promìnné o je možné
nastavit poèet filtrù na oktávu. Pomocí promìnné rad se nastavuje øád
filtrù.
Pro zobrazení prùbìhù banky filtrù, nebo pro pøehrání filtrovaného samplu
je možné odkomentovat daný úsek kódu.
%}

%% definice promennych
Fs = 48000;
fs = 25;                    % pocatecni stredni frekvence
fs_v = fs;
fh = fs * (2^(1/6));        % poèáteèní horní mezní kmitoèet
o = 3;                      % poèet filtrù na oktávu
rad = 2;                    % øád filtru
type = 'bandpass';          % typ filtru
i = 1;                      % iterace
%filtrovane_samply = zeros(200000,29);
while fh < Fs/2
    
    %% výpoèet parametrù filtrù
    fs = 2^(1/o)*fs;        % výpoèet støedních kmitoètù
    fs_v = [fs_v fs];       % vektor støedních kmitoètù
    fd = fs / (2^(1/6));    % výpoèet dolního mezního kmitoètu         
    fh = fs * (2^(1/6));    % výpoèet horního mezního kmitoètu
    
    
    %% vypocet banky filtru
    if fh < Fs/2
        
        Wn = [fd/(Fs/2) fh/(Fs/2)];                   % vektor mezních kmitoètù
        [z,p,k] = butter (rad,Wn,type);               % výpoèet filtru
        [b,a] = zp2tf(z,p,k);                         % pøevodn nulových bodù a pólù na pøenosovou funkci
        filtrovane_samply(:,i) = filter(b,a,sample);  % filtrace signálu
    
        %% pøehrání pro debuging
%        sound (filtrovane_samply (:,i),Fs);
    
        %% vykreslení
%        figure;
%         subplot(3,1,1);
%         plot (sample);                                                   % èasový prùbìh samplu
%         subplot(3,1,2);
%         plot (filtrovane_samply(:,i))                                    % èasový prùbìh vyltrovaného samplu
%         subplot(3,1,3);
%        freqz(b,a,Fs/2,Fs);                                               % pøenos filtru

%         figure;
%         fft_sample = abs(fft(sample));                                   % spektrum samplu 
%         fft_filter = abs(fft(filtrovane_samply (:,i)));                  % spektrum filtrovaného samplu
%         subplot(2,1,1)
%         plot(fft_sample);
%         subplot(2,1,2)
%         plot(fft_filter);
        %% iterace
          i = i+1;
    end
end
    for j = 1:length(filtrovane_samply(1,:))                               
        stredni_f(j) = fs_v(j);                                            % pøedání støedních kmitoètù filtrù
    end
end