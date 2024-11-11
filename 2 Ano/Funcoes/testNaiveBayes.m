function predictedLabel = testNaiveBayes(testDocument, P_label, P_word_given)
    % Verificar os nomes das variáveis em P_label e ajustá-los, se necessário
    if ismember('Label', P_label.Properties.VariableNames)
        uniqueLabels = P_label.Label;
    elseif ismember('Class', P_label.Properties.VariableNames)
        uniqueLabels = P_label.Class;
    else
        error('A tabela P_label precisa conter uma coluna chamada "Label" ou "Class".');
    end
    
    % Obter as probabilidades a priori
    if ismember('Probability', P_label.Properties.VariableNames)
        priorProbabilities = P_label.Probability;
    else
        error('A tabela P_label precisa conter uma coluna chamada "Probability".');
    end

    % Inicializar uma matriz para guardar as probabilidades posteriores de cada rótulo
    numLabels = length(uniqueLabels);
    posteriorProbabilities = zeros(numLabels, 1);

    % Iterar sobre cada rótulo para calcular a probabilidade posterior
    for i = 1:numLabels
        % Começa com a probabilidade a priori do rótulo
        posteriorProbabilities(i) = priorProbabilities(i);
        
        % Iterar sobre cada palavra do documento de teste
        for wordIndex = 1:length(testDocument)
            word = testDocument{wordIndex};

            % Construir a combinação "palavra|rótulo" e verificar a probabilidade condicional
            wordWithLabel = sprintf('%s|%s', word, uniqueLabels{i});
            wordGivenLabelProb = P_word_given.Probability(strcmp(P_word_given.WordLabel, wordWithLabel));
            
            % Multiplicar a probabilidade posterior pelo valor P(word|label)
            if ~isempty(wordGivenLabelProb) && wordGivenLabelProb > 0
                posteriorProbabilities(i) = posteriorProbabilities(i) * wordGivenLabelProb;
            else
                % Suavização Laplaciana para palavras desconhecidas
                posteriorProbabilities(i) = posteriorProbabilities(i) * 1e-6;
            end
        end
    end
    
    % Encontrar o rótulo com a probabilidade posterior máxima
    [~, maxIndex] = max(posteriorProbabilities);
    predictedLabel = uniqueLabels{maxIndex}; % Retorna o rótulo previsto
end