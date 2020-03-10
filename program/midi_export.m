%function  midi_export(label)
%% cistka
clc;
close all;
clear all;

%% vytvoøení MIDI zprávy
%
rawbytes = [77 84 104 100 ... %Chuck string (4 bytes)
	    0 0 0 6 ...         %Chunk length (4 bytes)
	   ]';
tmp = [77 84 114 107]';


fileID = 'myfile.mid';

fid = fopen(fileID,'w');
fwrite(fid,rawbytes,'uint8');
fclose(fid);
%end