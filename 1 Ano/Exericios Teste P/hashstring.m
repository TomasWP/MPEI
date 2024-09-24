function hashValue = hashstring(str, seed)
    % Fun��o de dispers�o para converter uma string em um n�mero
    hashValue = mod(mod(double(str) + seed, 2^32) * 2654435761, 2^32);
end



