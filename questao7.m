% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
% Processamento Digital de Sinais
% ja implementado na questao 4 - sinal filtrado no tempo e na frequencia

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