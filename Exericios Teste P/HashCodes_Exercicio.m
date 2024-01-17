clc
%% Enunciado 
% Considere a função Matlab string2hash() que implementa duas funções de 
% dispersão diferentes.
% Considere ainda 2 funções Matlab fornecidas que são adaptacões para Matlab 
% das funções de dispersão hashstring() e DJB31MA().
% Utilizando separadamente cada uma destas quatro funções de dispersão, 
% simule a inserção das chaves criadas no exercício 1a) em 3 Chaining Hash 
% Tables, uma de tamanho 5 × 10^5, outra de tamanho 2 × 10^6 e a terceira 
% de tamanho 2 × 10^6. Para cada uma das simulações (4 funções de 
% dispersão × 3 tamanhos):

% (a) Guarde um vetor com os hashcodes obtidos.

hashTableSizes = [5*1e5 1e6 2*1e6];


N = 10^5; % Número de chaves
i_min = 6; % Comprimeto mínimo da chave
i_max = 20; % Comprimento máximo da chave

caracteres = ['A':'Z' 'a':'z'];

% Chamar a função original com as probabilidades
strings = gerarChaves(N, i_min, i_max, caracteres);

codes1 = zeros(4,N);
codes2 = zeros(4,N);
codes3 = zeros(4,N);

for i= 1:3
    for j= 1:N
        code = mod(string2hash(strings{j},'djb2'),hashTableSizes(i))+1;

        if i == 1
            codes1(1,j) = code;
        elseif i == 2
            codes2(1,j) = code;
        else
            codes3(1,j) = code;
        end
    end

    for j= 1:N
        code = mod(string2hash(strings{j},'sdbm'),hashTableSizes(i))+1;

        if i == 1
            codes1(2,j) = code;
        elseif i == 2
            codes2(2,j) = code;
        else
            codes3(2,j) = code;
        end
    end

    for j= 1:N
        code = hashstring(strings{j},hashTableSizes(i))+1;

        if i == 1
            codes1(3,j) = code;
        elseif i == 2
            codes2(3,j) = code;
        else
            codes3(3,j) = code;
        end
    end

    for j= 1:N
        code = mod(DJB31MA(strings{j},13),hashTableSizes(i))+1;

        if i == 1
            codes1(4,j) = code;
        elseif i == 2
            codes2(4,j) = code;
        else
            codes3(4,j) = code;
        end
    end
end

disp(codes1);
disp(codes2);
disp(codes3);

