clc
%% Enunciado
% Os objetivos destes exercícios são criar e testar um módulo que suporte a
% criação de Bloom filters.
% Crie um conjunto de funções Matlab que implementem as funcionalidades de 
% um Bloom Filter básico. As funções devem ter os parâmetros necessários 
% para que seja possível criar Bloom Filters de diferentes tamanhos (n) e a
% utilização de diferentes números de funções de dispersão (k). Na criação
% das diferentes funções de dispersão, use o método descrito no slide 49 da
% apresentação TP sobre funções de dispersão com a funcão que melhor desempenho
% teve na secção 4.1 anterior.
% Sugestão: Criar pelo menos 3 funções: uma para inicializar
% a estrutura de dados; outra para inserir um elemento (ou elementos) no
% filtro; uma terceira para verificar se um elemento pertence ao conjunto.

% (1) Com as funções que desenvolveu, crie um Bloom Filter para guardar um
%     conjunto, U1, de 1000 palavras diferentes. Use um Bloom Filter de
%     tamanho n = 8000 e k = 3 funções de dispersão.

% Initialize Bloom Filter
bloomFilter = initializeBloomFilter(8000, 3);

% Ler as palavras do arquivo
ficheiro=fopen("wordlist-preao-20201103.txt");
palavras = textscan(ficheiro, "%s", 'delimiter', '\n');
palavras=palavras{1};
fclose(ficheiro);

for i = 1:length(palavras)
    bloomFilter = insertIntoBloomFilter(bloomFilter, palavras(i));
end

insertIntoBloomFilter(bloomFilter, "posjcndnjdbjd");

% (2) Teste o Bloom Filter criado anteriormente, verificando a   de
%     todas as palavras do conjunto U1.
%     Obteve algum falso negativo?

falsos = 0;
% Verificar se uma palavra está no conjunto
for i = 1:length(palavras)
    isInSet = checkMembership(bloomFilter, palavras(i));
    if isInSet == 0
        falsos = falsos + 1;
    end
end

disp("Falsos Negativos:");
disp(falsos);
disp("Positivos:");
disp(length(palavras)-falsos);

% (3) Teste o Bloom Filter criado anteriormente, verificando a pertença de 
%     um novo conjunto, U2, com 10000 palavras todas diferentes das de U1.
%     Indique a percentagem de falsos positivos obtidos.





