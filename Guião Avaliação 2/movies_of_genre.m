function movies_of_genre(movies, genre)
    % Array para guardar as hashes
    hashes = {};

    % Loop through each cell to collect hashes
    for i = 1:size(movies, 1)
        for j = 1:size(movies, 2)
            currentGenre = movies{i, j};
            if ischar(currentGenre) && ~isempty(currentGenre) && ~strcmp(currentGenre, "missing")
                % Use string hashing function to generate hash
                hashValue = string2hash(currentGenre);
                % Convert hash to string before storing
                hashStr = num2str(hashValue);
                hashes = [hashes, hashStr];
            elseif iscell(currentGenre)
                for k = 1:numel(currentGenre)
                    if ischar(currentGenre{k}) && ~isempty(currentGenre{k}) && ~strcmp(currentGenre{k}, "missing")
                        % Use string hashing function to generate hash
                        hashValue = string2hash(currentGenre{k});
                        % Convert hash to string before storing
                        hashStr = num2str(hashValue);
                        hashes = [hashes, hashStr];
                    end
                end
            end
        end
        progress = (i*100)/length(movies);
        fprintf('Loading Results...%.2f %%\n', progress);
    end

    % Create containers.Map with string keys
    bloomFilter = containers.Map('KeyType','char','ValueType','uint32');
    
    % Count occurrences of hashes using the containers.Map
    for i = 1:numel(hashes)
        hashKey = hashes{i};
        if isKey(bloomFilter, hashKey)
            bloomFilter(hashKey) = bloomFilter(hashKey) + 1;
        else
            bloomFilter(hashKey) = 1;
        end
    end

    % Count number of movies for the selected genre
    genreHash = string2hash(genre);
    genreHashStr = num2str(genreHash);
    count = bloomFilter(genreHashStr);
    
    disp(['Number of movies in genre "', genre, '": ', num2str(count)]);

    fprintf('\n')
end