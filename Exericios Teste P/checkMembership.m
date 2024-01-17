function isInSet = checkMembership(bloomFilter, element)
    % Verifica se um elemento está no conjunto (com possíveis falsos positivos)
    isInSet = true;
    for i = 1:bloomFilter.k
        index = bloomFilter.hashFunctions{i}(element{1});
        if bloomFilter.bitArray(mod(index, bloomFilter.n) + 1) == 0
            isInSet = false;
            break;
        end
    end
end