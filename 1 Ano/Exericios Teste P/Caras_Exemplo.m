clc
%% Enunciado
% Considere a experiência aleatória de lançar 3 vezes uma moeda equilibrada. 
% Pretende-se estimar, por simulação, a probabilidade de se obter 2 caras 
% no fim dos 3 lançamentos.
% Para estimar a probabilidade por simulação, é necessário executar várias 
% vezes a experiência aleatória de lançar 3 vezes uma moeda equilibrada e 
% calcular a porcentagem de vezes em que o resultado deu 2 caras. 
% Em Matlab, uma forma possível de implementar este simulador é a 
% seguinte (assumindo que a experiência é executada 10000 vezes):

%% Código 1

% Gerar uma matriz com 3 linhas e 10000 colunas de nu´meros aleato´rios
% entre 0.0 e 1.0 (ou seja, cada coluna representa uma experieˆncia):
experiencias = rand(3,10000);

% Gerar uma matriz com 3 linhas e 10000 colunas com o valor 1 se o valor
% da matriz anterior for superior a 0.5 (ou seja, se saiu cara) ou com o
% valor 0 caso contra´rio (ou seja, saiu coroa):
lancamentos = experiencias > 0.5; % 0.5 corresponde a 1 - prob. de caras

% Gerar um vetor linha com 10000 elementos com a soma dos valores de cada
% coluna da matriz anterior (ou seja, o nu´mero de caras de cada experieˆncia):
resultados= sum(lancamentos);

% Gerar um vetor linha com 10000 elementos com o valor 1 quando o valor do
% vetor anterior e´ 2 (ou seja, se a experieˆncia deu 2 caras) ou 0 quando e´
% diferente de 2:
sucessos= resultados==2;

% Determinar o resultado final dividindo o nu´mero de experieˆncias com 2
% caras pelo nu´mero total de experieˆncias:
probSimulacaoExemploCodigo1 = sum(sucessos)/10000

%% Código 2

N= 1e4; % Número de experiências
p = 0.5; % Probabilidade de cara
k = 2; % Número de caras
n = 3; % Número de lançamentos

% Gerar uma matriz com n Linhas e N Colunas e filtrar só pelos elementos
% em que saiu cara (> p)
% As Linhas são o número de lançamentos
% As Colunas são o número de experiências
lancamentos = rand(n,N) > p;

% Gerar um vetor linha com 10000 elementos, em que cada elemento é a soma
% da respetiva coluna da matriz anterior (ou seja, o número de caras de
% cada experiência). Aplicar um filtro em que, cada elemento irá ficar a 1
% se o elemento (depois da soma) for k (ou seja, se a experiência deu k caras)
% ou 0 quando é diferente de k
sucessos= sum(lancamentos)==k;

% Determinar o resultado final dividindo o número de experiências com k
% caras pelo número total de experiências:
probSimulacaoExemploCodigo2 = sum(sucessos)/N