function wordCountMatrix = getUniqueWords(documents)
    % document: cell array containing text from each document

    % Concatenate all documents into one string
    allText = strjoin(documents, ' ');

    % Split the text into words (considering whitespace and punctuation)
    words = split(lower(allText));

    % Remove any empty strings that may result from splitting
    words = words(~cellfun('isempty', words));

    % Get unique words and their counts
    [uniqueWords, ~, idx] = unique(words);
    wordCounts = accumarray(idx, 1);

    % Combine unique words and counts into a table
    wordCountMatrix = table(uniqueWords, wordCounts, 'VariableNames', {'Word', 'Count'});
end
