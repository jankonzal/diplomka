%{
Tento skript slouží k vytvoøení vrozkù dvojúderu. Nejdøíve skript nejdøíve 
vyzve k zadání složky s první sadou samplù, následnì k vybrání další složky 
s druhou sadou samplù. Na závìr skript vyzve k vybrání výstupní složky. 
Audio souborsy jsou zmonìny, srovnány hlasitosti a nakonec smíchány 
a uloženy jako nový wav sobor. 
%}
clear all;
close all;
clc;

%% definice promìnný
path = ('C:\Users\Honza\Documents\samply');
uroven1 = 0.2;
uroven2 = 0.2;
UrovenOut = 0.4;
Pomer1 = 1;
Pomer2 = 0.5;

%% naètení složek
path_1 = uigetdir(path,'První složka se samply'); 
path_2 = uigetdir(path,'Druhá složka se samply');     
PathOut = uigetdir(path,'Výstupní složka');
folder_1 = dir (path_1);
folder_2 = dir (path_2);

%% zjištìní delšího samplu

if length(folder_1) >= length(folder_2)
    delka = length(folder_2);
else
    delka = length(folder_1);
end
%% proces
f = waitbar(0,'Míchání samplù', 'Name', 'Míchání samplu:');
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
    if RMS < uroven1                                                                 % pokud je energie menší než 2500 je signál zesílen
        while RMS < uroven1
        [RMS] = rms(sample_1);
        sample_1 = sample_1*1.1;
        end
    else                                                                        % pokud je energie menší než 2500 je signál zeslaben
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
    
     waitbar(i/delka,f,sprintf('Míchání samplu: %6s a %6s ',name_1,name_2));
 end
 delete(f);
 
 delka1 = length(folder_1)-2;
 fprintf('Poèet souborù v první složce: %d\n', delka1);
 delka2 = length(folder_2)-2;
 fprintf('Poèet souborù v druhé složce: %d\n', delka2);
 fprintf('Poèet vytvoøených souborù: %d\n', i);
 fprintf('Uloženo do složky: %s\n', PathOut);
 