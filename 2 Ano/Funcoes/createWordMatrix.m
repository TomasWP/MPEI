function [wordMatrix, uniqueWords] = createWordMatrix(documents)
    % documents: cell array containing text from each document
    
    % Concatenate all documents into one string and extract unique words
    allText = strjoin(documents, ' ');
    allWords = split(lower(allText));
    allWords = allWords(~cellfun('isempty', allWords));
    uniqueWords = unique(allWords); % List of unique words (column headers)

    % Initialize the word occurrence matrix
    numDocs = numel(documents);
    numWords = numel(uniqueWords);
    wordMatrix = zeros(numDocs, numWords);

    % Fill the matrix with word counts for each document
    for i = 1:numDocs
        % Split the document into words
        docWords = split(lower(documents{i}));
        docWords = docWords(~cellfun('isempty', docWords));

        % Count occurrences of each unique word in the document
        for j = 1:numWords
            wordMatrix(i, j) = sum(strcmp(docWords, uniqueWords{j}));
        end
    end
end
