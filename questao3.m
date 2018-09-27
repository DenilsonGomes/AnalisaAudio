% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
% Processamento Digital de Sinais
% Script para acrescentar ruido branco

% Gerar o ruido
ruido_branco = randn(size(y)); %ruido
ruido_branco = (ruido_branco - mean(ruido_branco))/10*std(ruido_branco); %ruido com media 0 e variança 0.1
figure,plot(ruido_branco) %Plota o ruido no tempo
ylabel('Amplitude do Ruido')
xlabel('Tempo Discreto')

%TF do ruido
ruidoW = fftshift(fft(ruido_branco)); %Transformada de Fourier do sinal filtrado
freq_vec = linspace(-pi,pi,length(y)); %Frequencias
figure,plot(freq_vec,abs(ruidoW)) %plota o modulo do sinal filtrado
ylabel('Espectro de Magnitude do Ruido')
xlabel('Frequencia')

% Adicionar ruido
y_ruido = y + ruido_branco*sqrt(1); %Adiciona o ruido
figure,plot(y_ruido) %Plota o sinal junto ao ruido
ylabel('Amplitude do Sinal com ruido')
xlabel('Tempo Discreto')

% Calcular TF do sinal com ruido
Yw_ruido = fft(y_ruido); %calcula a TF do sinal com ruido
figure,plot(freq_vec,fftshift(abs(Yw_ruido))) %plota o modulo do sinal com ruido
ylabel('Modulo do sinal com ruido')
xlabel('Frequencia')

%reproduzir os sinais
sound(y,Fs) %reproduz o sinal

sound(y_ruido) %reproduz o sinal com ruido