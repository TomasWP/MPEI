function [results] = search_movie_title(movies, input_string)
    
    % Cria um vetor com os nomes dos filmes
    movie_names = movies(:, 1);

    % Cria um vetor com os generos dos filmes
    movie_genres = movies(:, 3:end);

    % Define os parâmetros para MinHash
    shingle_size = 3; % Tamanho dos shingles
    num_hash_functions = 100; % Número de funções de dispersão

    % Calcula a matriz de assinaturas MinHash
    minhash_matrix = zeros(length(movie_names), num_hash_functions);
    for i = 1:length(movie_names)
        movie_name = char(movie_names(i));
        shingles = generate_shingles(movie_name, shingle_size);
        minhash_matrix(i, :) = minhash(shingles, num_hash_functions);
    end

    % Calcula a assinatura MinHash da string de input
    input_shingles = generate_shingles(input_string, shingle_size);
    input_signature = minhash(input_shingles, num_hash_functions);

    % Calcula a similaridade de Jaccard usando a assinatura MinHash
    jaccard_indices = zeros(length(movie_names), 1);
    for i = 1:length(movie_names)
        jaccard_indices(i) = sum(minhash_matrix(i, :) == input_signature) / num_hash_functions;
    end

    % Ordena os filmes por ordem decrescente de similaridade
    [~, indices] = sort(jaccard_indices, 'descend');

    % Seleciona os 5 filmes com maior similaridade
    results = movie_names(indices(1:5));

    % Adiciona os generos dos filmes aos resultados
    for i = 1:length(results)
        results(i) = [results(i), movie_genres(indices(i)), jaccard_indices(indices(i))];
    end

    % Imprime os resultados
    for i = 1:length(results)
        fprintf('%s\t%s\t%f\n', results(i, 1), results(i, 2), results(i, 3));
    end
end

