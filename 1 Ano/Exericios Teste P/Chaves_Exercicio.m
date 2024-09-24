clc
%% Enunciado
% Crie uma função para gerar chaves constituídas por caracteres.
% O comprimento (i.e., o número de caracteres) de cada chave deve ser 
% escolhido aleatoriamente (distribuição uniforme) entre i_min e i_max. 
% A função deve ter como parâmetros de entrada o número N de chaves a gerar,
% os valores de i_min e i_max, um vector com os caracteres a usar nas chaves
% e um vector com as probabilidades de cada um dos caracteres a utilizar.
% Se a função for chamada sem o último parâmetro, deve considerar os caracteres 
% equiprováveis(ver a documentação da função nargin).
% A função deve devolver um "cell array" com o conjunto de chaves geradas 
% garantindo que as chaves são todas diferentes.

% (a) Gere um conjunto de N = 10^5 chaves usando todas as letras maiúsculas 
%     e minúsculas ('A'  a  'Z' e 'a' a 'z') com igual probabilidade e em que
%     i_min = 6 e i_max = 20.

N = 10^5; % Número de chaves
i_min = 6; % Comprimeto mínimo da chave
i_max = 20; % Comprimento máximo da chave
caracteres = ['A':'Z' 'a':'z'];

% Gerar as chaves
chaves_prob_equiprovaveis = gerarChaves(N, i_min, i_max, caracteres);

disp("Chaves Geradas:");
disp(chaves_prob_equiprovaveis);

% (b) Gere um conjunto de N = 10^5 chaves usando todas as letras minúsculas
%     ('a' a 'z') com as probabilidades contidas no ficheiro prob_pt.txt e 
%     que correspondem às frequências das letras em Português
%     (https://pt.wikipedia.org/wiki/Frequ%C3%AAncia_de_letras). Considere
%     novamente i_min = 6 e i_max = 20.

N = 10^5; % Número de chaves
i_min = 6; % Comprimeto mínimo da chave
i_max = 20; % Comprimento máximo da chave
caracteres = ['a':'z'];

% Ler as probabilidades do arquivo
probabilidades = load('prob_pt.txt');

% Chamar a função original com as probabilidades
chaves_probs = gerarChaves(N, i_min, i_max, caracteres, probabilidades);

disp("Chaves Geradas:");
disp(chaves_probs);