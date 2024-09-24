% a)

T = [0   0   0.8   0   0
     1   0    0    0   0
     0  0.9   0    0   0
     0  0.1   0    1   0
     0   0   0.2   0   1];

% b)

num_estados = 5;
transicoes = 12;
% Inicializar o vetor coluna das probabilidades
probabilidades = zeros(1, length(transicoes));
% Vetor de Estado Inicial
estado_inicial = zeros(num_estados, 1);
% Começar no Estado 1
estado_inicial(1) = 1;
% Atualizar o estado após o número desejado de transições
estado_final = T^transicoes * estado_inicial;
% Probabilidade de estar no estado 1 após o número de transições
prob_estado_1 = estado_final(1);

disp(prob_estado_1)

% c)

Q = T(1:4,1:4);
aux = eye(length(Q)) - Q;       % aux = I-Q(matriz identidade - Q)
F = inv(aux);                   % F = matriz inversa de aux

num_medio = 1;                  % estado 5 sendo a meta apenas conta com 1 ocorrencia(final)
for n = 1:4
    num_medio = num_medio + F(n,1);         % somar numeros da 1º coluna de F(valores medios em cada estado)
end

fprintf("Número médio %6.4f\n", num_medio);

% d)

% b)
N = 1e6;    %numero de simulacoes
sum = 0;

for n = 1:N
    state = crawl(T,1,4);
    if state == 4
        sum = sum + 1;
    end
end

fprintf("Probabilidade %6.4f\n", sum/N);