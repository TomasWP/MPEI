clc
%% Enunciado
% Considere famílias com filhos em que a probabilidade de nascimento de 
% rapazes é igual à de nascimento de raparigas:

% (a) Obtenha, por simulação, uma estimativa da probabilidade do evento 
%     "ter pelo menos um filho rapaz" em famílias com 2 filhos.

prob = 0.5; % Probabilidade de ser rapaz
num_exp = 1e5; % Número de Experiências
num_rapaz = 1; % Número de rapazes a ter
num_filhos = 2; % Número de filhos

% Gerar uma Matriz com os filhos e filtrar para ver qual é rapaz e qual é
% rapariga, se o elemento for superior a prob (ou seja, é rapaz) o elemento
% fica a 1, senão fica a 0
% Linhas - num_filhos
% Colunas - num_rapaz
filhos = rand(num_filhos, num_exp) > prob;

% Gerar um Vetor Linha em que cada elemento é a soma da respetiva coluna e
% depois aplicar um filtro em que se o elemento for maior ou igual a num_rapaz
% (ou seja, pelo menos um filho rapaz), o elemento fica a 1, senão fica a 0
sucessos = sum(filhos) >= num_rapaz;

% Calcular a probabilidade de ter pelo menos um filho, dividindo o número
% total de sucessos pelo número de experiências
probSimulacaoA = sum(sucessos)/num_exp


% (c) Suponha que, para uma família com 2 filhos escolhida ao acaso, sabemos 
%     que um dos filhos é rapaz.
%     Qual é a probabilidade do outro filho também ser rapaz? Determine o 
%     valor teórico desta probabilidade e estime a mesma probabilidade por simulação.

prob = 0.5; % Probabilidade de ser rapaz
num_exp = 1e5; % Número de Experiências
num_rapaz = 1; % Número de rapazes a ter
num_filhos = 2; % Número de filhos

% Gerar uma Matriz com os filhos e filtrar para ver qual é rapaz e qual é
% rapariga, se o elemento for superior a prob (ou seja, é rapaz) o elemento
% fica a 1, senão fica a 0
% Linhas - num_filhos
% Colunas - num_rapaz
filhos = rand(num_filhos, num_exp) > prob;

% Gerar um Vetor Linha em que cada elemento é a soma da respetiva coluna e
% criar dois Vetores Linha:
%   - rapazes_1_mais : experiências em que existe pelo menos 1 rapaz
%   - rapazes_2 : experiências em que existem 2 rapazes
rapazes_1_mais = sum(filhos) >= num_rapaz;
rapazes_2 = sum(filhos) > num_rapaz;

% O Vetor Linha rapazes_2 contem situações em que existem 2 filhos
% (logo inclui as situações em que existe pelo menos 1 filho), assim não
% precisamos de fazer rapazes_1_mais & rapazes_2 (pois isto daria apenas as 
% colunas em que há pelo menos um rapaz e exatamente dois rapazes na família.)

% Calcular a probabilidade de ter pelo menos um filho, dividindo o número
% total de rapazes_2 pelo número de rapazes_1_mais (ou seja, os casos em
% que existem exatamente 2 rapazes pelos casos em que existe pelo menos 1 rapaz)
probSimulacaoC = (rapazes_2)/rapazes_1_mais

% (d) Sabendo que o primeiro filho de uma família com 2 filhos é rapaz, 
%     determine por simulação a probabilidade do segundo filho ser rapaz. 
%     O que se pode concluir do resultado obtido relativamente à 
%     independência de acontecimentos?

prob = 0.5; % Probabilidade de ser rapaz
num_exp = 1e5; % Número de Experiências
num_rapaz = 1; % Número de rapazes a ter
num_filhos = 2; % Número de filhos

% Gerar uma Matriz com os filhos
filhos = rand(num_filhos, num_exp) > prob;

% Contar os casos em que o primeiro filho é rapaz
primeiro_rapaz = sum(filhos(1, :) == 1);

% Filtrar os casos em que o primeiro filho é rapaz e o segundo também é rapaz
rapazes_2 = sum(filhos) > num_rapaz & filhos(1, :) == 1;

% Calcular a probabilidade do segundo filho ser rapaz dado que o primeiro é rapaz
probSimulacaoD = sum(rapazes_2) / primeiro_rapaz

% (e) Considere uma família com 5 filhos. Sabendo que pelo menos um dos filhos 
%     é rapaz, obtenha por simulação uma estimativa para a probabilidade de 
%     um dos outros (e apenas um) ser também rapaz.

prob = 0.5; % Probabilidade de ser rapaz
num_exp = 1e5; % Número de Experiências
num_rapaz = 1; % Número de rapazes a ter
num_filhos = 5; % Número de filhos

% Gerar uma Matriz com os filhos
filhos = rand(num_filhos, num_exp) > prob;

% Gerar um Vetor Linha em que cada elemento é a soma da respetiva coluna e
% depois aplicar um filtro em que se o elemento for maior ou igual a num_rapaz
% (ou seja, pelo menos um filho rapaz), o elemento fica a 1, senão fica a 0
minimo_1rapaz = sum(filhos) >= num_rapaz;

% Filtrar os casos em que há pelo menos um rapaz na família
filhos_com_pelo_menos_1rapaz = filhos(:, minimo_1rapaz);

% Gerar um vetor indicando os casos em que há exatamente 2 rapazes
rapazes2 = sum(filhos_com_pelo_menos_1rapaz) == 2;

% Calcular a probabilidade de exatamente um dos outros ser rapaz
probSimulacaoE = sum(rapazes2) / sum(minimo_1rapaz)
