% a)
disp('a)')

T = [0  0   0.8  0 0;
     1  0   0    0 0;
     0  0.9 0    0 0;
     0  0.1 0    1 0;
     0  0   0.2  0 1];

% Q = T(1:4, 1:4);
% F = inv(eye(length(Q)) - Q);
disp(T);

% b)
disp('b)')
% Calcule a probabilidade de partindo do estado 1 voltar ao estado 1 ao fim de 12 iterações

v0 = [1 0 0 0 0];

p12 = T^12 * v0';

disp(p12(1));

% c)
disp('c)')
% Sabendo que o estado inicial foi o 1, determine o número médio de iterações antes de atingir um estado absorvente

Q = T(1:3, 1:3);

I = eye(size(Q, 1));

% Matriz fundamental F
F = inv(I - Q);

% Número médio de iterações
iteracoes = sum(F(1, :));

disp(iteracoes);

% d)
disp('d)')
% sabendo que o estado inicial foi o 1, determine  a probabilidade de a absorção se dar no estado 4

R = T(4:5, 1:3);

pAbsor = R * F;

pAbsor4 = pAbsor(1, 1);
disp(pAbsor4);