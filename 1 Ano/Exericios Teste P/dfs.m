function [result, cycle_detected] = dfs(matriz_H, node, visited, stack)
    visited(node) = true;
    stack = [stack, node];

    for i = 1:size(matriz_H, 1)
        if matriz_H(node, i) == 1
            if ~visited(i)
                [result, cycle_detected] = dfs(matriz_H, i, visited, stack);
                if cycle_detected
                    return;
                end
            elseif any(ismember(stack, i))
                cycle_detected = true;
                result = [];
                return;
            end
        end
    end

    cycle_detected = false;
    result = stack;
end