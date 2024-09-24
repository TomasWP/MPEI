clc
close all
%% Enunciado
% Considere a cadeia de Markov com o diagrama de transição de estados
% seguinte:

% (a) Defina em Matlab a matriz de transição de estados T, com T_ij sendo a 
%     probabilidade de ir do estado j para o estado i num único passo.

%        1       2       3       4       5
% 1     0.8      0       0      0.3      0
%
% 2     0.2     0.6      0      0.2      0
%
% 3      0      0.3      1       0       0
%
% 4      0      0.1      0      0.4      0
%
% 5      0       0       0      0.1      1

% Matriz de Transição
matriz_transicao = [0.8 0 0 0.3 0 ; 0.2 0.6 0 0.2 0 ; 0 0.3 1 0 0 ; 0 0.1 0 0.4 0 ; 0 0 0 0.1 1];

%  (b) Faça um gráfico com a probabilidade de, começando no estado 1, estar
%      no estado 2 ao fim de n passos, com n a variar de 1 até 100.
%      Justifique o que observa.

% Número de transições
num_transicoes = 1:100;

% Vetor de Estado Inicial
estado_inicial = [1 ; 0 ; 0 ; 0 ; 0];

% Iniciar o vetor das probabilidades
probabilidades_estado2 = zeros(1, length(num_transicoes));

% Calcular as probabilidades para cada transição
for i = 1:length(num_transicoes)
    % Calcular o estado final
    estado_final = matriz_transicao^num_transicoes(i) * estado_inicial;

    % Armazenar a probabilidade
    probabilidades_estado2(1, i) = estado_final(2);
end
figure;
subplot(1,3,1);
plot(num_transicoes, probabilidades_estado2);
title("Estado 1 para Estado 2");

% (c) Faça um gráfico com a probabilidade de, começando no estado 1, estar 
%     no estado 3 ao fim de n passos. Na mesma figura, faça um segundo
%     gráfico com a probabilidade de, começando no estado1, estar no 
%     estado 5 ao fim de n passos. Em ambos os casos, considere n a variar 
%     de 1 até 100. Justifique o que observa.

% Número de Transições
num_transicoes = 1:100;

% Vetor do Estado Inicial
estado_inicial = [1 ; 0 ; 0 ; 0 ; 0];

% Iniciar o Vetor das probabilidades
probabilidades_estado3_estado5 = zeros(2, length(num_transicoes));

% Calcular as probabilidades
for i = 1:length(num_transicoes)
    % Calcular o estado final após as transições
    estado_final = matriz_transicao^num_transicoes(i) * estado_inicial;

    % Armazenar as probabilidades
    probabilidades_estado3_estado5(1, i) = estado_final(3);
    probabilidades_estado3_estado5(2, i) = estado_final(5);
end

subplot(1, 3, 2);
plot(num_transicoes,probabilidades_estado3_estado5(1, :));
title("Estado 1 para Estado 3");
subplot(1,3,3);
plot(num_transicoes, probabilidades_estado3_estado5(2,:));
title("Estado 1 para Estado 5");

% (d) Determine a matriz Q.

% Matriz Q
% A matriz Q pode ser obtida eliminando as linhas e colunas correspondentes 
% aos estados absorventes. Neste caso, os estados 3 e 5 são absorventes,
matriz_Q = matriz_transicao([1, 2, 4], [1, 2, 4]);

disp('Matriz Q:');
disp(matriz_Q);

% Calcular a matriz fundamental F
matriz_F = inv(eye(size(matriz_Q)) - matriz_Q);

disp('Matriz Fundamental F:');
disp(matriz_F);


% (f) Qual a média (valor esperado) do número de passos antes da absorção
%     começando no estado 1? E começando no estado 2? E se começando no 
%     estado 4?

% Calcular a média do número de passos para absorção a partir de cada estado
media_passos_estado1 = sum(matriz_F(1, :));
media_passos_estado2 = sum(matriz_F(2, :));
media_passos_estado4 = sum(matriz_F(3, :));

disp('Média do Número de Passos para Absorção:');
disp(['Começando no Estado 1: ', num2str(media_passos_estado1)]);
disp(['Começando no Estado 2: ', num2str(media_passos_estado2)]);
disp(['Começando no Estado 4: ', num2str(media_passos_estado4)]);
