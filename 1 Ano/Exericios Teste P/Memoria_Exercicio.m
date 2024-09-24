clc
%% Enunciado
% Considere um array de tamanho T que serve de base à implementação de uma 
% memória associativa (por exemplo, em Java). Assuma que a função de hash 
% devolve um valor entre 0 e T - 1 com todos os valores igualmente prováveis.

% (a) Determine por simulação a probabilidade de haver pelo menos uma colisão 
%     (pelo menos 2 chaves mapeadas pela função de hash para a mesma posição 
%     do array) se forem introduzidas 10 chaves num array de tamanho T = 1000.

% Parâmetros
T = 1000; % Tamanho do array
num_chaves = 10; % Número de chaves
num_simulacoes = 1e5; % Número de simulações

% Inicialização do vetor para contar o número de colisões em cada simulação
num_colisoes = zeros(1, num_simulacoes);

for sim = 1:num_simulacoes
    % Geração de chaves aleatórias e cálculo dos valores de hash
    chaves = randi(T, 1, num_chaves);
    
    % Verificação de colisões
    colisoes = num_chaves - length(unique(chaves));
    
    % Armazenamento do número de colisões na simulação atual
    num_colisoes(sim) = colisoes;
end

% Cálculo da probabilidade de pelo menos uma colisão
probabilidade_colisao = sum(num_colisoes) / num_simulacoes;

% Exibição dos resultados
fprintf('Probabilidade de pelo menos uma colisão: %.4f\n', probabilidade_colisao);

% (b) Faça um gráfico da probabilidade da alínea (a) (estimada por simulação)
%     em função do número de chaves para todos os valores relevantes num array
%     de tamanho T = 1000.

% Gráfico da probabilidade de colisão em função do número de chaves
figure;
plot(num_chaves, probabilidade_colisao, 'o-', 'LineWidth', 2);
title('Probabilidade de Colisão em Função do Número de Chaves');
xlabel('Número de Chaves');
ylabel('Probabilidade de Colisão');
grid on;
