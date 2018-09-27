% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
%Processamento Digital de Sinais
% Script para visualizar o sinal no tempo e na frequencia

load train
plot(y) %Plota o sinal
ylabel('Amplitude do Sinal')
xlabel('Tempo discreto')

Yw = fftshift(fft(y)); %TF do sinal
freq_vec = linspace(-pi,pi,length(y)); %Frequencias
figure,plot(freq_vec,abs(Yw)) %Plota a TF do sinal
ylabel('Espectro de magnitude')
xlabel('Frquencia em Rad/s')