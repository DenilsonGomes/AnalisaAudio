% Autor: Denilson Gomes Vaz da Silva
% Departamento de Engenharia de Computa��o
% Processamento Digital de Sinais
% O que acontece ao escutar o sinal filtrado na frequencia Fs?
% O audio reproduzido deste sinal filtrado � muito proximo do sinal antes
% de adicionar o ruido. Isto porque o audio "train" � facilmente separado
% do ruido gerado.

sound(y_ruido,Fs) %reproduz audio ruidoso
sound(y_filt,Fs) %reproduz audio filtrado