clc
%% Enunciado 1
% Estime a probabilidade de obter 6 caras em 15 lançamentos de uma 
% moeda equilibrada?

num_exp = 1e4; % Número de experiências
num_lanc = 15; % Número de lançamentos
num_caras = 6; % Número de caras a obter
prob = 0.5; % Probabilidade de cara

% Criar a Matriz de experiências e aplicar um filtro em que elementos
% superiores a prob (ou seja, calhou cara) ficam a 1, o resto fica a 0
lancamentos = rand(num_lanc, num_exp) > prob;

% Criar um Vetor Linha de experiências em que cada elemento é a soma de
% cada coluna da Matriz anterior e aplicar um filtro em que elementos
% iguais a num_caras (ou seja, nessa experiência calhou 6 caras) ficam a 1,
% o resto fica a 0
sucessos = sum(lancamentos) == num_caras;

% Obter a probabilidade da Simulação, dividindo os sucessos pelo número de
% experiências
probSimulacaoEnunciado1 = sum(sucessos)/num_exp

%% Enunciado 2
% Qual é a probabilidade de obter pelo menos 6 caras em 15 lançamentos
% de uma moeda equilibrada?

num_exp = 1e4; % Número de experiências
num_lanc = 15; % Número de lançamentos
num_caras = 6; % Número de caras a obter
prob = 0.5; % Probabilidade de cara

% Criar a Matriz de experiências e aplicar um filtro em que elementos
% superiores a prob (ou seja, calhou cara) ficam a 1, o resto fica a 0
lancamentos = rand(num_lanc, num_exp) > prob;

% Criar um Vetor Linha de experiências em que cada elemento é a soma de
% cada coluna da Matriz anterior e aplicar um filtro em que elementos
% iguais a num_caras (ou seja, nessa experiência calhou 6 ou mais caras) ficam a 1,
% o resto fica a 0
sucessos = sum(lancamentos) >= num_caras;

% Obter a probabilidade da Simulação, dividindo os sucessos pelo número de
% experiências
probSimulacaoEnunciado2 = sum(sucessos)/num_exp

%% Enunciado 3 - Aplicar a Função
% Aplique a função para voltar a estimar as probabilidades das questões anteriores assim como estimar
% as probabilidades para todo o espaço de amostragem para os seguintes numeros de lançamentos: 20, 40
% e 100.

num_exp = 1e4; % Número de experiências
num_lanc = [20 40 100]; % Número de lançamentos
num_caras = 6; % Número de caras a obter
prob = 0.5; % Probabilidade de cara

probSimulacaoEnunciado3 = 0:2;

probSimulacaoEnunciado3(1) = Caras_ExercicioFunc(p, num_lanc(1), num_caras, num_exp);
probSimulacaoEnunciado3(2) = Caras_ExercicioFunc(p, num_lanc(2), num_caras, num_exp);
probSimulacaoEnunciado3(3) = Caras_ExercicioFunc(p, num_lanc(3), num_caras, num_exp);

stem(num_lanc, probSimulacaoEnunciado3, "filled")

