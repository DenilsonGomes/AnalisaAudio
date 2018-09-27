% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
% Processamento Digital de Sinais
% Script para carregar e executar o audio "chirp.mat"
% Breakpoints para acompanhar o passo-a-passo:
% [16,24,33,42,50,58,65,74,90,97,107,113,121]

clear
clc

%#1
load chirp %carrega o sinal

%reproduz o audio na frequencia normal
sound(y,Fs)

%recebe o multiplo da frequencia normal
m = input('Digite o divisor da frequencia que deseja ouvir o audio: ');
y = y(:,1);
y = y(1:m:end); %muda a amostragem do sinal
Fs = Fs/m; %muda a frequencia

%reproduz o audio na nova frequencia
sound(y,Fs)

clear
load chirp

%#2
plot(y) %Plota o sinal
title('Sinal')
ylabel('Amplitude do Sinal')
xlabel('Tempo discreto')

Yw = fftshift(fft(y)); %TF do sinal
freq_vec = linspace(-pi,pi,length(y)); %Frequencias
figure,plot(freq_vec,abs(Yw)) %Plota a TF do sinal
title('Transformada de Fourier do Sinal')
ylabel('Espectro de magnitude')
xlabel('Frquencia em Rad/s')

%#3
% Gerar o ruido
ruido_branco = randn(size(y)); %ruido
ruido_branco = (ruido_branco - mean(ruido_branco))/10*std(ruido_branco); %ruido com media 0 e variança 0.1
figure,plot(ruido_branco) %Plota o ruido no tempo
title('Ruido') %Titulo
ylabel('Amplitude do Ruido')
xlabel('Tempo Discreto')

%TF do ruido
ruidoW = fftshift(fft(ruido_branco)); %Transformada de Fourier do sinal filtrado
freq_vec = linspace(-pi,pi,length(y)); %Frequencias
figure,plot(freq_vec,abs(ruidoW)) %plota o modulo do sinal filtrado
title('Transformada de Foutier Ruido') %Titulo
ylabel('Espectro de Magnitude do Ruido')
xlabel('Frequencia')

% Adicionar ruido
y_ruido = y + ruido_branco*sqrt(1); %Adiciona o ruido
figure,plot(y_ruido) %Plota o sinal junto ao ruido
title('Sinal com Ruido') %Titulo
ylabel('Amplitude do Sinal com ruido')
xlabel('Tempo Discreto')

% Calcular TF do sinal com ruido
Yw_ruido = fft(y_ruido); %calcula a TF do sinal com ruido
figure,plot(freq_vec,fftshift(abs(Yw_ruido))) %plota o modulo do sinal com ruido
title('Transformada de Foutier do Sinal com Ruido') %Titulo
ylabel('Modulo do sinal com ruido')
xlabel('Frequencia')

%reproduzir os sinais
sound(y,Fs) %reproduz o sinal

sound(y_ruido) %reproduz o sinal com ruido

%#4
% Analisando a tranformada de Fourier do sinal conseguimos vizaulizar que a
% parte mais significativo do audio ocorre com frequencias acima de 1.5,
% que resulta em 0.48. Dessa forma um bom filtro para tirar o ruido adiocionado é um Filtro
% Passa-Alta, aceitando w>0.48.

wc1 = 0.48; %Frquencia final
[B,A] = butter(20, wc1, 'high');
[H,W] = freqz(B,A,length(y));
figure,plot(W,abs(H)) %Plota filtro Passa-Faixa
title('Transformada de Fourier do Filtro') %Titulo
ylabel('Espectro de magnitude') %legenda
xlabel('Frequencia em Rad/s') %legenda

[H,W] = impz(B,A,length(y)); %resposta ao impulso do filtro
figure,plot(W,abs(H)) %plota a resposta ao impulso do filtro
title('Resposta ao Impulso') %Titulo
ylabel('Amplitude') %legenda
xlabel('Tempo discreto') %legenda

%#5
zplane(B,A) %plota filtro passa-faixa no plano complexo
title('Polos e Zeros do Filtro') %Titulo
ylabel('Imaginario') %legenda
xlabel('Real') %legenda

%#6
fvtool(W,H)
fvtool(B,A)

%#7
y_filt = filter(B,A,y); %Sinal filtrado
figure,plot(real(y_filt)) %Plota o sinal filtrado
title('Sinal Filtrado no tempo') %Titulo
ylabel('Amplitude do Sinal Filtrado') %legenda
xlabel('Tempo discreto') %legenda

Yw_filt = fftshift(fft(y_filt)); %TF centrada no zero do sinal filtrado
freq_vec = linspace(-pi,pi,length(Yw_filt)); %Frequencias
figure,plot(freq_vec,abs(Yw_filt)) %Plota TF do sinal filtrado
title('Transformada de Foutier do Sinal Filtrado') %Titulo
ylabel('Espectro de magnitude') %legenda
xlabel('Frequencia em Rad/s') %legenda

%#8
sound(y_ruido,Fs) %reproduz audio ruidoso
sound(y_filt,Fs) %reproduz audio filtrado