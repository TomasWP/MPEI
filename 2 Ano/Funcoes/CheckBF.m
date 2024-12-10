function check = CheckBF(BF, key, k)

% returns a boolean (true or false) indicating if key is in BF using k hash
% functions

    n = length(BF);
    check = true;
    for i=1:k
        key = [key num2str(i)];
        h = string2hash(key);
        h = mod(h,n)+1;
        if ~BF(h)
            check = false;
            break;
        end
    end
end