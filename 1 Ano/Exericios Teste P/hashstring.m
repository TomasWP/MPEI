function hashValue = hashstring(str, seed)
    % Função de dispersão para converter uma string em um número
    hashValue = mod(mod(double(str) + seed, 2^32) * 2654435761, 2^32);
end



