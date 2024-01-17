clc
%% Enunciado
% Considere um processo de produção fabril que produz torneiras, em que a 
% probabilidade de cada torneira ser produzida com defeito é de 30%. 
% No processo de controle de qualidade, é selecionada uma amostra de 5 peças.

% (a) Calcule analiticamente e por simulação a probabilidade de 3 peças da 
%     amostra serem defeituosas.

prob = 0.3; % Probabilidade de torneira com defeito
num_exp = 1e5; % Número de Experiências
num_amostras = 5; % Número de Torneiras a serem analizadas
num_defeituosas = 3; % Número de torneiras com defeito

% Gerar uma Matriz com as escolhas das torneiras em num_exp experiências
% Linhas - num_amostras
% Colunas - num_exp
% e filtrar pelos elementos que são inferiores ou igual a prob (ou seja, a torneira
% é defeituosa), se for inferior o elemento toma valor 1, senão toma valor 0
escolhas = rand(num_amostras, num_exp) <= prob;

% Gerar um Vetor Linha em que cada valor é a soma da respetiva coluna e
% aplicar um filtro para ver que experiências têm um numero de torneiras
% defeituosas igual a num_defeituosas, se tiver um número igual a
% num_defeituosas o elemento fica a 1, senão fica a 0
defeituosas = sum(escolhas) == num_defeituosas;

% Calcular a probabilidade de uma torneira ser defeituosa, somando todos os
% valores do Vetor Linha (ou seja, o número de torneiras defeituosas em
% todas as experiências) e dividir pelo número de experiências
probSimulacaoA = sum(defeituosas)/num_exp

% (b) Calcule analiticamente e por simulação a probabilidade de, no máximo, 
%     2 das peças da amostra serem defeituosas.

prob = 0.3; % Probabilidade de torneira com defeito
num_exp = 1e5; % Número de Experiências
num_amostras = 5; % Número de Torneiras a serem analizadas
num_defeituosas = 2; % Número de torneiras com defeito

% Gerar uma Matriz com as escolhas das torneiras em num_exp experiências
% Linhas - num_amostras
% Colunas - num_exp
% e filtrar pelos elementos que são inferiores ou igual a prob (ou seja, a torneira
% é defeituosa), se for inferior o elemento toma valor 1, senão toma valor 0
escolhas = rand(num_amostras, num_exp) <= prob;

% Gerar um Vetor Linha em que cada valor é a soma da respetiva coluna e
% aplicar um filtro para ver que experiências têm um numero de torneiras
% defeituosas igual ou inferior num_defeituosas, se tiver um número igual a
% num_defeituosas o elemento fica a 1, senão fica a 0
defeituosas = sum(escolhas) <= num_defeituosas;

% Calcular a probabilidade de uma torneira ser defeituosa, somando todos os
% valores do Vetor Linha (ou seja, o número de torneiras defeituosas em
% todas as experiências) e dividir pelo número de experiências
probSimulacaoB = sum(defeituosas)/num_exp

% (c) Baseado em simulação, construa no Matlab o histograma representativo 
%     da distribuição de probabilidades do número de peças defeituosas da
%     amostra.

% Construir o histograma
histograma = histogram(sum(escolhas), 'Normalization', 'probability');

% Adicionar rótulos ao gráfico
title('Distribuição de Probabilidades do Número de Peças Defeituosas');
xlabel('Número de Peças Defeituosas');
ylabel('Probabilidade');

% Mostrar o gráfico
grid on;
