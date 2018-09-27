% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
% Processamento Digital de Sinais
% Script para carregar e executar o audio "train.mat"

clear
clc

load train

%reproduz o audio na frequencia normal
sound(y,Fs)

%recebe o multiplo da frequencia normal
m = input('Digite o divisor da frequencia que deseja ouvir o audio: ');
y = y(:,1);
y = y(1:m:end); %muda a amostragem do sinal
Fs = Fs/m; %muda a frequencia

%reproduz o audio na nova frequencia
sound(y,Fs)