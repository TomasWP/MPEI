function chaves = gerarChaves(N, imin, imax, caracteres, probabilidades)
    % Verificar se as probabilidades foram fornecidas
    if nargin < 5
        % Se não foram fornecidas, considerar caracteres equiprováveis
        probabilidades = ones(1, numel(caracteres)) / numel(caracteres);
    end

    % Inicializar conjunto de chaves
    chaves = cell(N, 1);

    for i = 1:N
        % Gerar comprimento aleatório para a chave
        comprimento = randi([imin, imax]);

        % Escolher caracteres de acordo com as probabilidades
        idx_caracteres = randsample(1:numel(caracteres), comprimento, true, probabilidades);
        chave = caracteres(idx_caracteres);

        % Converter para string e armazenar na célula
        chaves{i} = chave;
    end

    % Remover chaves duplicadas
    chaves = unique(chaves);
end


