%%Atividade Pratica 01 - Yuri Constantino Getaruck Podmowski -2103303

clc 
clear
close all

[y,Fs] = audioread("School Bell Ringing   Sound Effect 1.mp3");%recebe o audio presente na pasta do programa

Ysub = downsample(y,6); %reduz a amostragem para 8 mil
Fs_sub = Fs/6;          %reduz a amostragem para 8 mil

t1 = 1;%define o momento inicial em que o audio deve ser cortado em segundos
t2 = 5;%define o momento final em que o audio deve ser cortado em segundos 
N1 = round(t1*Fs_sub);% define a amostra inicial
N2 = round(t2*Fs_sub);% define a amostra final

Y2 = Ysub(N1:N2);

N = length(Y2);
t = 0 : 1/Fs_sub : (N-1)/Fs_sub;

figure
subplot(2,1,1)
plot(t, Y2, 'k')
ylabel("Amplitude do sinal")
xlabel('Tempo em segundos')
title('Áudio Original')
grid on

fft_do_sinal = fft(Y2);

subplot(2,1,2)
plot(abs(fft_do_sinal/length(Y2)))
ylabel("Magnetude")
xlabel('Frequencia')
title('FFT Original')
grid on


%%CLIP

th = 0.25;
th2 = -0.25;
Y_CLIP = Y2;
Y_CLIP(Y2>th)=th;
Y_CLIP(Y2<th2)=th2;

figure
subplot(2,1,1)
plot(t, Y_CLIP, 'k')
xlim([0 4])
ylim([-0.3 0.3])
ylabel("Amplitude do sinal")
xlabel('Tempo em segundos')
title('Áudio com CLIP')

fft_do_clip = fft(Y_CLIP);
subplot(2,1,2)
plot(abs(fft_do_sinal))
ylabel("Magnetude")
xlabel('Frequencia')
title('FFT CLIP')

grid on

%%Addig white noise 











