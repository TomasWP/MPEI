function [P_label, P_word_given] = trainNaiveBayes(wordMatrix, uniqueWords, labels)
    % Número total de documentos
    numDocs = size(wordMatrix, 1);

    % Get the unique labels
    uniqueLabels = unique(labels);
    numLabels = length(uniqueLabels);
    
    % Initialize output for label probabilities
    P_label = table(cell(numLabels, 1), zeros(numLabels, 1), 'VariableNames', {'Label', 'Probability'}); % Table for label probabilities

    % Calcular P(label) para cada label
    for i = 1:numLabels
        % Assume labels is a cell array of labels and uniqueLabels is also a cell array of unique labels
        labelCount = sum(cellfun(@(x) isequal(x, uniqueLabels{i}), labels));

        P_label.Label{i} = uniqueLabels{i}; % Store the label as a string in the table
        
        if numDocs > 0
            P_label.Probability(i) = labelCount / numDocs; % Calculate the probability of the label
        else
            P_label.Probability(i) = 0; % Avoid division by zero
        end
    end

    % Calcular o vocabulário (número total de palavras únicas)
    V = length(uniqueWords);

    % Initialize the table for word probabilities
    P_word_given = table(cell(length(uniqueWords) * numLabels, 1), zeros(length(uniqueWords) * numLabels, 1), 'VariableNames', {'WordLabel', 'Probability'}); % Table for word probabilities

    % Calculate total words for each label
    % Calcular contagens totais de palavras em cada classe
    totalWords = zeros(1, numLabels); % Total words for each label
    
    % Calculate total words for each label
    for i = 1:numLabels
        % Logical index for the current label
        labelIndices = cellfun(@(x) isequal(x, uniqueLabels{i}), labels);
        
        % Ensure that the logical index matches the number of rows in wordMatrix
        if any(labelIndices) % Ensure that there are matching labels
            totalWords(i) = sum(sum(wordMatrix(labelIndices, :))); % Total words for the current label
        else
            totalWords(i) = 0; % If no matching labels, set totalWords to 0
        end
    end


    % Calcular P(palavra | label) com Laplace Smoothing
    index = 1; % Index for the table
    for i = 1:numLabels
        for j = 1:V
            % Count the occurrences of each word in the current label
            countWordInClass = sum(wordMatrix(cellfun(@(x) isequal(x, uniqueLabels{i}), labels), j));
            
            % Create the word|label pair
            wordWithLabel = sprintf('%s|%s', uniqueWords{j}, uniqueLabels{i});
            P_word_given.WordLabel{index} = wordWithLabel; % Store the word|label pair
            
            % Calculate the probability of the word given the class with Laplace Smoothing
            if totalWords(i) + V > 0
                P_word_given.Probability(index) = (countWordInClass + 1) / (totalWords(i) + V); % Probability
            else
                P_word_given.Probability(index) = 0; % Avoid division by zero
            end
            
            index = index + 1; % Move to the next row in the table
        end
    end
end
