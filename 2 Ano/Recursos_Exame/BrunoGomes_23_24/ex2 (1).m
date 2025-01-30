%% a)
dados = load('dados.mat')
entrada = dados.entrada;
teste = dados.teste;
n = 300; % 300 palavras para meter no filtro
m = 500; %tamanho filtro

N = 10000; % numero de chaves que vamos gerar
k = 2;  %2 funcoes de dispersao
chaves = [];
for i = 1:length(entrada)
    chaves = chaves + kHashValues(entrada{i},9); % gerar chaves aleatorias 
end


chaves = unique(chaves); % remover chaves repetidas

vector = inicializar(m); % inicializar filtro de bloom
U1 = chaves(1:9);

for i = 1:length(U1)
    vector = adicionar_elemento(vector, U1(i), k); %inserir elemento
end

exists_word = ones(1,n); 

U2 = teste; 
counter = 0;

for i = 1:n
    exists_word(i) = pertenca(vector, U2{i}, k);

    if exists_word(i)
        counter = counter + 1;
    end
end

counter

add = 0;
for i = 1:length(entrada)
    if entrada{i} == "Paul"
        add = add + 1;
    end
    
end

add