function createWorkspace(moviesFile, workspaceFile)

    movies = readcell(moviesFile, 'Delimiter', ',');
    
    numhash_functions = 3;
    shingle_size = 4;


    save(workspaceFile);
end