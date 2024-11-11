% Function to read and return the content of a CSV file
function [headers, data] = readCSVFile(pathToFile, delimiter)
    baseDir = pwd;  % Use the current directory as the base
    filePath = fullfile(baseDir, pathToFile);
    outputData = readcell(filePath, "Delimiter", delimiter);
    % Get the headers
    headers = outputData(1,:);
    data = outputData(2:end,:);
end