function signature = minhash_signature(shingles, numHashFunctions)
    signature = zeros(length(shingles), numHashFunctions);
    for i = 1:numHashFunctions
        hashValues = minhash(shingles, i);
        signature(:, i) = hashValues';
    end
end