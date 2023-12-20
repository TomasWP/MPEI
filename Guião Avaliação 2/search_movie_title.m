function search_movie_title(movies, input_string, shingle_size, numhash_functions)
    
    simj = zeros(size(movies, 1), 1);
    threshold = 0.4;
    sim_titles = {};

    shingles = generate_shingles(input_string, shingle_size);

    signature = minhash_signature(shingles, numhash_functions);
    clc;
    disp('Loading...')
    for i = 1:size(movies, 1)
        movie_shingles = generate_shingles(movies{i, 1}, shingle_size);

        movie_signature = zeros(numhash_functions, length(movie_shingles));
        for j = 1:numhash_functions
            hashValues = minhash(movie_shingles, j);
            movie_signature(j, :) = hashValues;
        end

        for j = 1:min(size(signature, 2), size(movie_signature, 2))
            % Similaridade de Jaccard
            intersection = intersect(signature(:, j), movie_signature(:, j));
            unionSet = union(signature(:, j), movie_signature(:, j));
            disp(numel(intersection) / numel(unionSet))
            simj(i) = numel(intersection) / numel(unionSet);

            if simj(i) > threshold
                sim_titles{end+1} = movies{i, 1};
            end
        end
    end

    % ordem decrescente de similaridade
    [~, sorted_indices] = sort(simj, 'descend');
    sim_titles = sim_titles(sorted_indices);

    fprintf('\nTop 5 similar movie titles:\n');

    for k = 1:min(5, length(sim_titles))
        disp(sim_titles{k})
        fprintf('Jaccard Similarity: %0.2f\n', simj(sorted_indices(k)));

        % Encontrar índice do título
        title_index = find(strcmpi(movies(:, 1), sim_titles{k}), 1);
        if ~isempty(title_index)
            genres = movies(title_index, 3:end);

            %células to string
            genres = string(genres);

            genres = genres(~cellfun('isempty', genres) & ~strcmp(genres, '(no genres listed)'));

            if isempty(genres)
                fprintf('Genres: Not available\n');
            else
                fprintf('     Genres: ');
                genres = strjoin(genres, ', ');
                fprintf('Genres: %s\n', genres)
                fprintf('\n')
            end
        else
            fprintf('Genres: Not available\n');
        end
    end

    if isempty(sim_titles)
        fprintf('No similar titles found.\n');
    end
end

