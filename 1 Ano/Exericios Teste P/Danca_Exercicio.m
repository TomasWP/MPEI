clc
%% Enunciado
% Considere a seguinte “dança” de grupos: Divide-se uma turma em 3 grupos 
% (A, B e C) no início do semestre e no final de cada aula efetuam-se os 
% seguintes movimentos:
%   • 1/3 do grupo A vai para o grupo B e outro 1/3 do grupo A vai para o 
%     grupo C;
%   • 1/4 do grupo B vai para A e 1/5 de B vai para C
%   • Metade do grupo C vai para o grupo B; a outra mantém-se no grupo C.


% (a) Crie em Matlab a matriz de transição de estados que representa as 
%     trocas entre grupos.
%     Confirme que se trata de uma matriz estocástica.

% Matriz de Transição
%        A       B       C
%  A    1/3     1/4      0
%
%  B    1/3    11/20    1/2
%
%  C    1/3     1/5     1/2
matriz_transicao = [1/3 1/4 0 ; 1/3 11/20 1/2 ; 1/3 1/5 1/2];

probSimulacaoB = sum(matriz_transicao)

% (b) Crie o vetor relativo ao estado inicial considerando que no total 
%     temos 90 alunos, o grupo A tem o dobro da soma dos outros dois e os 
%     grupos B e C têm o mesmo número de alunos.

%  A     B     C
% 60    15    15
estado_inicial = [60 ; 15 ; 15];

% (c) Quantos elementos integrarão cada grupo no fim da aula 30 considerando 
%     como estado inicial o definido na alínea anterior?

num_aulas = 30;

probSimulacaoC = round(matriz_transicao^num_aulas * estado_inicial)

% (d) Quantos elementos integrarão cada grupo no fim da aula 30 considerando 
%     que inicialmente se distribuíram os 90 alunos equitativamente pelos 
%     3 grupos?

%  A     B     C
% 30    30    30
estado_inicial = [30 ; 30 ; 30];

probSimulacaoD = round(matriz_transicao^num_aulas * estado_inicial)