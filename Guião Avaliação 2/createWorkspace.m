function createWorkspace(moviesFile, workspaceFile)

    movies = readcell(moviesFile, 'Delimiter', ',');
    

    shingleSize = 4;
    numHashFunctions = 3;


    save(workspaceFile);
end