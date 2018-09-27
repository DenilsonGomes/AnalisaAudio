% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computação
% Processamento Digital de Sinais
% Script para visualizar diagrama de polos e zeros

zplane(B,A) %plota filtro passa-faixa no plano complexo
title('Polos e Zeros do Filtro') %Titulo
ylabel('Imaginario') %legenda
xlabel('Real') %legenda

% A partir do grafico sabemos que o filtro eh IIR