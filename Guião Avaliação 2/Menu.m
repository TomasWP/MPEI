% Carregar os dados do arquivo movies.csv
movies = readcell('movies.csv', 'Delimiter', ',');


% Substituir strings vazias e '(no genres listed)'
movies(cellfun(@(x) isempty(x) || strcmp(x, '(no genres listed)'), movies)) = {''};

while true
    % Menu
    fprintf('Select an option:\n')
    fprintf('1 - Display available genres\n')
    fprintf('2 - Number of movies of a genre\n')
    fprintf('3 - Number of movies of a genre on a given year\n')
    fprintf('4 - Search movie titles\n')
    fprintf('5 - Search movies based on genres\n')
    fprintf('6 - Exit\n')
    option = -1;
    while (option<1 || option>6)
        option = input('Select an option: ');
    end
    
    switch option
        case 1 
            display_available_genres(movies, 1);
        case 2
            genres_unique = display_available_genres(movies, 2);
            genre = -1;
            while (genre<=0 || genre > length(genres_unique))
                genre = input('Select a genre: ');
            end
            movies_of_genre(movies, genres_unique{genre})
        case 6
            disp('Exiting...')
            break;
    end
end
