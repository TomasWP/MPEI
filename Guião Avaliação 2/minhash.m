function hashValues = minhash(shingles, index)
    hashValues = zeros(1, length(shingles));
    for i = 1:length(shingles)
        hashValues(i) = min(mod(find(strcmp(shingles, shingles{i})), index));
    end
end