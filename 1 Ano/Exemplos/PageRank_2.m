clc
%% Enunciado
% Considere o conjunto de páginas Web e respetivas hyperligações entre si 
% dado pelo diagrama seguinte:

% (a) Usando a matriz H das hyperligações, obtenha a estimativa do pagerank 
%     de cada página ao fim de 10 iterações. Relembre que deve considerar 
%       (i) a mesma probabilidade de transição de cada página para todas as
%           páginas seguintes possíveis
%       (ii) a probabilidade da página inicial deve ser igual para todas as 
%            páginas.
%     Qual/quais a(s) página(s) com maior pagerank e qual o seu valor?

% Matriz H

%       A       B       C       D       E       F
% A     0       0       0       0       1       0
%
% B     1       0       0       0       1       0
%
% C     0       1       0       1       0       0
%
% D     0       1       1       0       0       0
%
% E     0       0       0       0       0       0
%
% F     0       0       0       0       1       0

matriz_H = [0 0 0 0 1 0 ; 1 0 0 0 1 0 ; 0 1 0 1 0 0 ; 0 1 1 0 0 0 ; 0 0 0 0 0 0 ; 0 0 0 0 1 0];

num_iteracoes = 10;

% Vetor inicial do PageRank
% Inicialmente todas têm o mesmo Rank
% size(matriz_H, 1) --> Dá o número de linhas
pagerank_inicial = ones(size(matriz_H, 1), 1) / size(matriz_H, 1);

% Normalizar a Matriz H
col_sum = sum(matriz_H);
% Evitar divisão por zero (pondo a soma da coluna a 1, assim 0 a dividir
% por 1 vai dar 0)
col_sum(col_sum == 0) = 1;
matriz_H = matriz_H./col_sum;

% Calcular o PageRank após 10 iterações
pagerank_final = matriz_H^num_iteracoes * pagerank_inicial;

% Páginas com maior PageRank
max_pagerank = max(pagerank_final);
paginas_maior_pagerank = pagerank_final == max_pagerank;

% Converter índices para letras
paginas_maior_pagerank_letras = paginas_letras(paginas_maior_pagerank);

disp('Página(s) com maior PageRank:');
disp(paginas_maior_pagerank_letras);
disp('Valor do PageRank:');
disp(max_pagerank);

% (b) Identifique a "spider trap" e o "dead-end" contidos neste conjunto 
%     de páginas.

% Mapear índices para letras
paginas_letras = ['A', 'B', 'C', 'D', 'E', 'F'];

% Identificar Dead-Ends
dead_ends = find(sum(matriz_H) == 0);

% Converter índices para letras
dead_ends_letras = paginas_letras(dead_ends);

disp('Dead Ends:');
disp(dead_ends_letras);

% Identificar Spider Traps
cycles = zeros(size(matriz_H, 1), 1);
for i = 1:size(matriz_H, 1)
    visited = false(size(matriz_H, 1), 1);
    [~, cycle_detected] = dfs(matriz_H, i, visited, []);
    cycles(i) = cycle_detected;
end
spider_traps = find(cycles);

% Converter índices para letras
spider_traps_letras = paginas_letras(spider_traps);

disp('Spider Traps:');
disp(spider_traps_letras);

% (c) Altere a matriz H para resolver apenas o problema do "dead-end"e 
%     recalcule o pagerank de cada página novamente em 10 iterações.

% Matriz H

%       A       B       C       D       E       F
% A     0       0       0       0       1       0
%
% B     1       0       0       0       1       0
%
% C     0       1       0       1       0       0
%
% D     0       1       1       0       0       0
%
% E     0       0       0       0       0       1
%
% F     0       0       0       0       1       0

matriz_H = [0 0 0 0 1 0 ; 1 0 0 0 1 0 ; 0 1 0 1 0 0 ; 0 1 1 0 0 0 ; 0 0 0 0 0 1 ; 0 0 0 0 1 0];

num_iteracoes = 10;

% Vetor inicial do PageRank
% Inicialmente todas têm o mesmo Rank
% size(matriz_H, 1) --> Dá o número de linhas
pagerank_inicial = ones(size(matriz_H, 1), 1) / size(matriz_H, 1);

% Normalizar a Matriz H
col_sum = sum(matriz_H);
% Evitar divisão por zero (pondo a soma da coluna a 1, assim 0 a dividir
% por 1 vai dar 0)
col_sum(col_sum == 0) = 1;
matriz_H = matriz_H./col_sum;

% Calcular o PageRank após 10 iterações
pagerank_final = matriz_H^num_iteracoes * pagerank_inicial;

% Páginas com maior PageRank
max_pagerank = max(pagerank_final);
paginas_maior_pagerank = find(pagerank_final == max_pagerank);

% Converter índices para letras
paginas_maior_pagerank_letras = paginas_letras(paginas_maior_pagerank);

disp('Página(s) com maior PageRank:');
disp(paginas_maior_pagerank_letras);
disp('Valor do PageRank:');
disp(max_pagerank);