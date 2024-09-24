function bloomFilter = insertIntoBloomFilter(bloomFilter, element)
    % Insere um elemento no filtro de Bloom
    for i = 1:bloomFilter.k
        index = bloomFilter.hashFunctions{i}(string2hash(element{1}));  % Converte a célula para uma string usando {1}
        bloomFilter.bitArray(mod(index, bloomFilter.n) + 1) = 1;
    end
end

