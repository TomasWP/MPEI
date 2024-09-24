function bloomFilter = initializeBloomFilter(n, k)
    % Inicializa um filtro de Bloom
    bloomFilter.n = n;  % Tamanho do filtro
    bloomFilter.k = k;  % Número de funções de dispersão
    bloomFilter.bitArray = zeros(1, n);  % Inicializa o array de bits

    % Criação das funções de dispersão
    bloomFilter.hashFunctions = cell(1, k);
    for i = 1:k
        seed = randi(2^32);  % Seed aleatória para a função de dispersão
        bloomFilter.hashFunctions{i} = @(input) hashFunction(input, seed);
    end
end