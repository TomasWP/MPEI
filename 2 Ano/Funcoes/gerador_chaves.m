function C = gerador_chaves(N, imin, imax, char_set, probs)
    if nargin == 5
        probs = probs/sum(probs);
    elseif nargin == 4
        probs = 1;
    else
        C = [];
        return
    end

    Nchar_set = length(char_set);
    C = cell(1, N);      % inicializar o conjunto de chaves

    for n = 1:N
        len = randi([imin, imax]);  % criar tamanho da chave
        if length(probs) == 1
            indice = randi(Nchar_set, 1, len);
        else
            indice = discrete_rnd(len, probs);
        end
        C{n} = char_set(indice);
    end

    C = unique(C);  %determinar chaves uncias
    n = length(C);

    while n<Nchar_set
        len = randi([imin, imax]);
        if length(probs) == 1
            indice = randi(Nchar_Set, 1, len);
        else
            indice = discrete_rnd(len, probs);
        end

        key = char_Seet(indice);

        if ~ismember(key,C)
            n = n+1;
            C{n} = key;
        end
    end
end

function indice = discrete_rnd(len, probVector)

    cs = cumsum(probVector);  % Cálculo das somas cumulativas das probabilidades
    indice = zeros(1, len);
    for k = 1:len
        indice(k) = 1 + sum(rand()>cs);
    end
end