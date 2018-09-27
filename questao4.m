% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
% Processamento Digital de Sinais
% Script para implementar filtro para remover o ruido do sinal
% 
% Analisando a TF do sinal percebemos que o sinal "train" tem suas componentes
%mais fortes nas frequencias entre 0.4 e 1.8. Logo
%um bom jeito de tirar o ruido é um filtro Passa-Faixa com 0.13<w<0.6

%Filtro Passa-Faixa
wc1 = 0.4; %Frquencia inicial
wc2 = 1.8; %Frquencia final
[B,A] = butter(20, [wc1/pi,wc2/pi]);
[H,W] = freqz(B,A,length(y));
figure,plot(W,abs(H)) %Plota filtro Passa-Faixa
title('Transformada de Fourier do Filtro') %Titulo
ylabel('Espectro de magnitude') %legenda
xlabel('Frequencia em Rad/s') %legenda

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

sound(y_ruido,Fs) %reproduz audio ruidoso
sound(y_filt,Fs) %reproduz audio filtrado

[H,W] = impz(B,A,length(y)); %resposta ao impulso do filtro
figure,plot(W,abs(H)) %plota a resposta ao impulso do filtro
title('Resposta ao Impulso') %Titulo
ylabel('Amplitude') %legenda
xlabel('Tempo discreto') %legenda