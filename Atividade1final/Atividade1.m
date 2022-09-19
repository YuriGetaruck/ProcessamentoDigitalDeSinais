%%Atividade Pratica 01 - Yuri Constantino Getaruck Podmowski -2103303

clc 
clear
close all


[y,Fs] = audioread("Pratica1_School Bell Ringing   Sound Effect 1.mp3");%recebe o audio presente na pasta do programa

Ysub = downsample(y,6); %reduz a amostragem para 8 mil
Fs_sub = Fs/6;          %reduz a amostragem para 8 mil

t1 = 1;                 %define o momento inicial em que o audio deve ser cortado em segundos
t2 = 5;                 %define o momento final em que o audio deve ser cortado em segundos 
N1 = round(t1*Fs_sub);  % define a amostra inicial
N2 = round(t2*Fs_sub);  % define a amostra final

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
P2 =  abs(fft_do_sinal/length(Y2));
P1 = P2(1:length(Y2)/2+1);
f = Fs_sub*(0:(length(Y2)/2))/length(Y2);

subplot(2,1,2)
plot(f, P1)
ylabel("Magnetude")
xlabel('Frequencia')
title('FFT Original')
grid on


%%CLIP

th = 0.17;
th2 = -0.17;
Y_CLIP = Y2;
Y_CLIP(Y2>th)=th;
Y_CLIP(Y2<th2)=th2;

fft_do_sinal = fft(Y_CLIP);
P2 =  abs(fft_do_sinal/length(Y_CLIP));
P1 = P2(1:length(Y_CLIP)/2+1);
f = Fs_sub*(0:(length(Y2)/2))/length(Y_CLIP);

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
plot(f,P1)
ylabel("Magnetude")
xlabel('Frequencia')
title('FFT CLIP')

grid on

%%Addig white noise 

w_noise = awgn(Y2, 2, -20);

figure 
subplot(2,1,1)
plot(w_noise)
ylabel("Amplitude do sinal")
xlabel('Tempo em segundos')
title('Áudio com White Noise')

fft_do_sinal = fft(w_noise);
P2 =  abs(fft_do_sinal/length(w_noise));
P1 = P2(1:length(w_noise)/2+1);
f = Fs_sub*(0:(length(Y2)/2))/length(w_noise);

subplot(2,1,2)
plot(f,P1)
ylabel("Magnetude")
xlabel('Frequencia')
title('FFT White Noise')

%%  Multiplicando o Sinal por uma senoide

Fs_senoide = 8000;           % samples per second
dt = 1/Fs_senoide;           % seconds per sample
StopTime = 4;                % seconds
t = 0:dt:StopTime-dt;     % seconds


Fc = 2;                     % hertz
x = cos(2*pi*Fc*t);

% Plot the signal versus time:

mult = Y2(:,1:32000).*x;

figure 
subplot(2,1,1)
plot(mult)
ylabel("Amplitude do sinal")
xlabel('Tempo em segundos')
title('Áudio Multiplicado por uma Senoide')

fft_do_sinal = fft(mult);
P2 =  abs(fft_do_sinal/length(mult));
P1 = P2(1:length(mult)/2+1);
f = Fs_sub*(0:(length(Y2)/2))/length(mult);

subplot(2,1,2)
plot(f,P1)
ylabel("Magnetude")
xlabel('Frequencia')
title('FFT Áuido com Senoide')

%% Média por convolucao

media = conv(Y2, ones(5,1)/5, 'same');

figure
subplot(2,3,1)
hold on
plot(Y2,'k')
plot(media, 'r')

fft_do_sinal = fft(media);
P2 =  abs(fft_do_sinal/length(media));
P1 = P2(1:length(media)/2+1);
f = Fs_sub*(0:(length(media)/2))/length(media);

subplot(2,3,4)
plot(f,P1)


subplot(2,3,2)

media = conv(Y2, ones(15,1)/15, 'same');
hold on
plot(Y2,'k')
plot(media, 'r')

fft_do_sinal = fft(media);
P2 =  abs(fft_do_sinal/length(media));
P1 = P2(1:length(media)/2+1);
f = Fs_sub*(0:(length(media)/2))/length(media);

subplot(2,3,5)
plot(f,P1)

subplot(2,3,3)

media = conv(Y2, ones(30,1)/30, 'same');
hold on
plot(Y2,'k')
plot(media, 'r')

fft_do_sinal = fft(media);
P2 =  abs(fft_do_sinal/length(media));
P1 = P2(1:length(media)/2+1);
f = Fs_sub*(0:(length(media)/2))/length(media);

subplot(2,3,6)
plot(f,P1)











