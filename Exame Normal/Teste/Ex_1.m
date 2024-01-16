% a)
a1 = 0.2;
a3 = 0.3;
a4 = 0.45;
a5 = 0.1;

T = [ 0     0       0       0       0       0
      a1    0       0       0       0       0
      0     0       0       a4      a5      0
      0     0       a3      0       1-a5    0
      1-a1  1       1-a3    0       0       0
      0     0       0       1-a4    0       1];
% b)
N = 1e6;
sum = 0;

for n = 1:N
    state = crawl(T,1,6);
    if length(state) == 4
        sum = sum + 1;
    end
end

fprintf("Probabilidade %6.4f\n", sum/N);

% c)
Q = T(1:5,1:5);
aux = eye(length(Q)) - Q;
F = inv(aux);

num_medio = 1;
for n = 1:5
    num_medio = num_medio + F(n,1);
end

fprintf("Número médio %6.4f\n", num_medio);