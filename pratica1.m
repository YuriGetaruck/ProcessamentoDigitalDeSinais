%%Processamentod igital de sianais aula 01 - 05/09

clc 
clear
close all
% tempo = 5; %tempo de gravação
% 
% FS = 8000; %Frequencia de Amonstragem
% 
% Nbits = 16;
% 
% Canais = 1;
% 
% r = audiorecorder(FS, Nbits, Canais);
% 
% Y = getaudiodata(r, 'double');

[y,Fs] = audioread("Boa noite Bruno.mp3");

Ysub = downsample(y,6);
Fs_sub = Fs/6;

t1 = 1;
t2 = 5;
N1 = round(t1*Fs_sub);
N2 = round(t2*Fs_sub);

Y2 = Ysub(N1:N2);

N = length(Y2);
t = 0 : 1/Fs : (N-1)/Fs;

figure
plot(t,2,'k')










