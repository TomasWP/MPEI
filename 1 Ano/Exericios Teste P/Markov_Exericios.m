clc
%% Enunciado
%  Considere o seguinte diagrama representativo de uma Cadeia de Markov:

% (a) Defina, em Matlab, a matriz de transição de estados T assumindo 
%     p = 0.4 e q = 0.6.

p = 0.4;
q = 0.6;

% Matriz de Transição
%        A       B       C       D
%  A    p^2      0       0      q^2
%
%  B   (1-p)^2   0       0     q(1-q)
%
%  C   p(1-p)    0       0     q(1-q)
%
%  D   p(1-p)    1       1     (1-q)^2
matriz_transicao = [p^2 0 0 q^2 ; (1-p)^2 0 0 q*(1-q) ; p*(1-p) 0 0 q*(1-q) ; p*(1-p) 1 1 (1-q)^2];

% (b) Assuma que o sistema se encontra inicialmente no estado A.
%     Qual a probabilidade de estar em cada estado ao fim de 5, 10, 100 e 
%     200 transições?

% Número de Transições
num_tansicoes = [5 10 100 200];

% Vetor do Estado Inicial
estado_inicial = [1 ; 0 ; 0 ; 0];

% Iniciar o Vetor das probabilidades
probabilidades = zeros(4, length(num_tansicoes));

% Calcular probabilidades para cada número de transições
for i = 1:length(num_tansicoes)
    
    % Atualizar o estado após o número de transições desejado
    estado_final = matriz_transicao^num_tansicoes(i) * estado_inicial;

    % Armazenar as probabilidades para cada estado
    probabilidades(:, i) = estado_final*100;
end

disp(probabilidades);

% (c) Determine as probabilidades limite de cada estado.
%     Compare estes valores com os obtidos na alínea anterior. 
%     O que conclui?

% Calcular as probabilidades limite (autovetores associados ao autovalor 1)
[V, D] = eig(matriz_transicao');

% Encontrar o autovetor associado ao autovalor 1
autovetor_1 = V(:, find(abs(diag(D) - 1) < 1e-6)); % Ajuste para tratar precisão numérica

% Normalizar o autovetor para obter as probabilidades limite
probabilidades_limite = autovetor_1 / sum(autovetor_1);

% Apresentar as probabilidades limite em percentagem com 5 casas decimais
disp('Probabilidades Limite:');
disp(['Estado A: ', num2str(probabilidades_limite(1) * 100, '%.5f'), '%']);
disp(['Estado B: ', num2str(probabilidades_limite(2) * 100, '%.5f'), '%']);
