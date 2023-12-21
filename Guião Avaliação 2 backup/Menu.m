workspaceFile = 'workspace.mat';
moviesFile = 'movies.csv';

if exist(workspaceFile, 'file') ~= 2
    fprintf('Creating Workspace...\n');
    createWorkspace(moviesFile, workspaceFile);
end

fprintf('Loading Workspace...\n');
load(workspaceFile);

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
    option = input('Select an option: ');
    while (option<1 || option>6)
        disp('ERROR! Select a valid option!')
        option = input('Select an option: ');
    end
    
    switch option
        case 1 
            display_available_genres(movies, 1);
            disp('Saving...')
            save(workspaceFile, 'movies');
        case 2
            genres_unique = display_available_genres(movies, 2);
            genre = input('Select a genre: ');
            while (genre<=0 || genre > length(genres_unique))
                disp('ERROR! Select a valid option!')
                genre = input('Select a genre: ');
            end
            movies_of_genre(movies, genres_unique{genre});

        case 3 %%INCOMPLETO....NECESSARIO CORRIGIR
            genres_unique = display_available_genres(movies, 2);
            user_input = input('Select a genre and a year (separated by ','): ', 's');
            data = strsplit(user_input, ',');
            genre=str2double(data{1});
            year=str2double(data{2});
            movies_of_genre_year(movies, genres_unique{genre}, 1995);
        case 4
            user_input = input('Insert a string: ','s'); % Converte a string de input para minúsculas e remove espaços
            search_movie_title(movies, user_input, shingle_size, numhash_functions);

        case 6
            disp('Exiting...')
            break;
    end
end
