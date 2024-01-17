function hashValue = hashFunction(input, seed)
    % Função de dispersão para converter uma string em um número
    hashValue = mod(mod(double(input) + seed, 2^32) * 2654435761, 2^32);
end