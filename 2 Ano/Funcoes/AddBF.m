function BF = AddBF(BF, key, k)

% return the array BF updated with the insertion of key using k hash
% functions
    n = length(BF);
    for i=1:k
        key = [key num2str(i)];
        h = string2hash(key);
        h = mod(h,n)+1;
        BF(h) = true;
    end
end