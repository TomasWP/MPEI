clc
% Gere aleatoriamente uma matriz de transição de estados para uma cadeia de 
% 20 estados (identificados de 1 a 20) recorrendo à função rand do Matlab.

% (a) Confirme que a matriz de transição de estados é estocástica.

% Número de estados
num_estados = 20;

% Gerar a matriz de transição
matriz_transicao_aleatoria = rand(num_estados, num_estados);

% Normalizar a matriz de transição
matriz_transicao = matriz_transicao_aleatoria ./ sum(matriz_transicao_aleatoria);

% Verificar se é estocástica
probSimulacaoA = sum(matriz_transicao)

% (b) Calcular a probabilidade de o sistema, começando no estado 1, estar 
%     no estado 20 após 2, 5, 10 e 100 transições.

% Número de Transições
transicoes = [2 5 10 100];

% Inicializar o vetor coluna das probabilidades
probabilidades = zeros(1, length(transicoes));

% Vetor de Estado Inicial
estado_inicial = zeros(num_estados, 1);

% Começar no Estado 1
estado_inicial(1) = 1;

% Calcular probabilidades para cada número de transições
for i = 1:length(transicoes)
    % Atualizar o estado após o número desejado de transições
    estado_final = matriz_transicao_aleatoria^transicoes(i) * estado_inicial;
    
    % Probabilidade de estar no estado 20 após o número de transições
    probabilidade_estado_20 = estado_final(20);
    
    % Armazenar a probabilidade
    probabilidades(i) = probabilidade_estado_20;
end

disp(probabilidades);