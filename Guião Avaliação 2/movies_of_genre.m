function movies_of_genre(movies, genre)
    count = 0;
    for i = 1:size(movies, 1)
        genres = movies(i, 3:end);
        for j = 1:length(genres)
            if ~ismissing(genres{j})
                if strcmpi(genres{j}, genre)
                    count = count + 1;
                end
            end
        end
    end
    fprintf('Number of movies of genre %s - %d\n', genre, count);
    fprintf('\n')
end