%% Atividade 3 - Yuri Constantino Geataruck

clc
clear 
close all


Ts = 0.1;
passo = 0.001;
tempo_total = 4;

t = 0:passo:tempo_total;
n = 0:Ts:tempo_total;

w = 2*pi;
x = sin(w*t);

W = w*Ts;

X = sin(w*n);

figure 
hold all

plot(t,x)
stem(n,X)

w_alias = 22*pi;
x_alias = sin(w_alias*t);

plot(t, x_alias)




