%{
Tento skript slou�� k vytvo�en� vrozk� dvoj�deru. Nejd��ve skript nejd��ve 
vyzve k zad�n� slo�ky s prvn� sadou sampl�, n�sledn� k vybr�n� dal�� slo�ky 
s druhou sadou sampl�. Na z�v�r skript vyzve k vybr�n� v�stupn� slo�ky. 
Audio souborsy jsou zmon�ny, srovn�ny hlasitosti a nakonec sm�ch�ny 
a ulo�eny jako nov� wav sobor. 
%}
clear all;
close all;
clc;

%% definice prom�nn�
path = ('C:\Users\Honza\Documents\samply');
uroven1 = 0.2;
uroven2 = 0.2;
UrovenOut = 0.4;
Pomer1 = 1;
Pomer2 = 0.5;

%% na�ten� slo�ek
path_1 = uigetdir(path,'Prvn� slo�ka se samply'); 
path_2 = uigetdir(path,'Druh� slo�ka se samply');     
PathOut = uigetdir(path,'V�stupn� slo�ka');
folder_1 = dir (path_1);
folder_2 = dir (path_2);

%% zji�t�n� del��ho samplu

if length(folder_1) >= length(folder_2)
    delka = length(folder_2);
else
    delka = length(folder_1);
end
%% proces
f = waitbar(0,'M�ch�n� sampl�', 'Name', 'M�ch�n� samplu:');
 for i = 1:delka-2
    name_1 = char({folder_1(i+2).name}); 
    [sample_1,fs] = audioread(fullfile( path_1, name_1));
    size_1 = size(sample_1);
    
    if size_1(2) == 2
        sample_1(:,1) = sample_1(:,1) + sample_1(:,2);
        sample_1 = sample_1(:,1);   
    end
    
    name_2 = char({folder_2(i+2).name}); 
    [sample_2] = audioread(fullfile( path_2, name_2));
    size_2 = size(sample_2);
    
    if size_2(2) == 2
        sample_2(:,1) = sample_2(:,1) + sample_2(:,2);
        sample_2 = sample_2(:,1);   
    end
    
    maxlen = max(length(sample_1), length(sample_2));
    sample_1(end+1:maxlen) = 0;
    sample_2(end+1:maxlen) = 0;
    
    [RMS] = rms(sample_1);
    if RMS < uroven1                                                                 % pokud je energie men�� ne� 2500 je sign�l zes�len
        while RMS < uroven1
        [RMS] = rms(sample_1);
        sample_1 = sample_1*1.1;
        end
    else                                                                        % pokud je energie men�� ne� 2500 je sign�l zeslaben
        while RMS > uroven1                                                         
        [RMS] = rms(sample_1);
        sample_1 = sample_1*0.9;
        end
    end
    dRL = limiter(-1);
    sample_1 = dRL(sample_1);
    clear RMS;
    
    [RMS] = rms(sample_2);
    if RMS < uroven2                                                                
        while RMS < uroven2
        [RMS] = rms(sample_2);
        sample_2 = sample_2*1.1;
        end
    else                                                                        
        while RMS > uroven2                                                          
        [RMS] = rms(sample_2);
        sample_2 = sample_2*0.9;
        end
    end
    sample_2 = dRL(sample_2);

    out = sample_1 * Pomer1 + sample_2 * Pomer2;
    
%     [RMS] = rms(out);
%     if RMS < UrovenOut                                                                
%         while RMS < UrovenOut
%         [RMS] = rms(out);
%         out = out*1.1;
%         end
%     else                                                                        
%         while RMS > UrovenOut                                                          
%         [RMS] = rms(out);
%         out = out*0.9;
%         end
%     end
    out = dRL(out);
    NameOut = sprintf('%d.wav', i);
    audiowrite(fullfile( PathOut, NameOut),out,fs);
    
     waitbar(i/delka,f,sprintf('M�ch�n� samplu: %6s a %6s ',name_1,name_2));
 end
 delete(f);
 
 delka1 = length(folder_1)-2;
 fprintf('Po�et soubor� v prvn� slo�ce: %d\n', delka1);
 delka2 = length(folder_2)-2;
 fprintf('Po�et soubor� v druh� slo�ce: %d\n', delka2);
 fprintf('Po�et vytvo�en�ch soubor�: %d\n', i);
 fprintf('Ulo�eno do slo�ky: %s\n', PathOut);
 