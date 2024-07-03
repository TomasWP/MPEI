%% b)
T = [0,     0,     0,  0,  0; 
     0.5,   0,     0,  0,  0;
     0,    1/3,    0,  0,  0;
     0.5,  1/3,    0,  0,  0;
     0,    1/3,    0,  1,  0];

%% c)
num_estados = size(T, 1); 
num_sim = 1e5;
matriz_transicao = T;
for i = 1:size(T, 1)
    column_sum = sum(T(:, i));
    if column_sum ~= 0
        matriz_transicao(:, i) = T(:, i) / column_sum;
    end
end

% i)
average_length = 0;
seq_acgi = 0;
seq_3letras = 0;

for i = 1:num_sim
    state = crawl(matriz_transicao, [1 2], [3 5]);
    if size(state,2) == 4
        seq_acgi = seq_acgi + 1;
    end

    if size(state,2) == 3
        seq_3letras = seq_3letras + 1;
    end
    average_length = average_length + size(state,2);
end

average_length = average_length/num_sim;

% Exibição do resultado
fprintf('Tamanho Médio das Sequências Geradas: %.2f\n', average_length);

% ii)

acgi_seq = 0;

for i = 1:num_sim
    state = crawl(matriz_transicao, [1 2], [3 5]);
    if size(state,2) == 4
        acgi_seq = acgi_seq + 1;
    end
end

prob_acgi_seq = acgi_seq/num_sim;

% Exibição do resultado
fprintf('Probabilidade de obter a sequência "acgi": %.2f\n', prob_acgi_seq);

% iii)

letter3_seq = 0;

for i = 1:num_sim
    state = crawl(matriz_transicao, [1 2], [3 5]);
    if size(state,2) == 3
        letter3_seq = letter3_seq + 1;
    end
end

prob_letter3_seq = letter3_seq/num_sim;

% Exibição do resultado
fprintf('Probabilidade de obter a sequência de 3 letras: %.2f\n', prob_letter3_seq);

% iv)

abs = zeros(num_estados, 1);

for i = 1:num_sim
    state = crawl(matriz_transicao, [1 2], [3 5]);
    if state(end) == 3
        abs(3) = abs(3) + 1;
    elseif state(end) == 5
        abs(5) = abs(5) + 1;
    end
end

prob_abs = abs / num_sim;
% Exibição do resultado
fprintf('Probabilidade de absorção estado "e": %.2f\n', prob_abs(3));
fprintf('Probabilidade de absorção estado "i": %.2f\n', prob_abs(5));