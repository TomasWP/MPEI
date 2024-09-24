u_data = load("u.data");

data = u_data(:,1:2);
clear u_data;

dic = readcell('films.txt','Delimiter', '\t');

id_pessoa1 = 276;
id_pessoa2 = 405;

num_filmes = size(dic,1);
num_filmes_av_p1 = 0;
num_filmes_av_p2 = 0;

%% i
dic_pessoa1_i = containers.Map;
dic_pessoa2_i = containers.Map;

for i = 1:size(data)
    if data(i,1) == id_pessoa1
        num_filmes_av_p1 = num_filmes_av_p1 + 1;
        dic_pessoa1_i(num2str(data(i,2))) = data(i,1);
    end
end


for i = 1:size(data)
    if data(i,1) == id_pessoa2
        num_filmes_av_p2 = num_filmes_av_p2 + 1;
        if ~isKey(dic_pessoa1_i, num2str(data(i,2)))
            dic_pessoa2_i(num2str(data(i,2))) = data(i,1);
        end
    end
end

% Obter todas as chaves em um array
pessoa1_movies = keys(dic_pessoa1_i);
pessoa2_movies = keys(dic_pessoa2_i);

% Exibir as chaves
disp('ID dos filmes que foram avaliados pela pessoa 1 mas não pela pessoas 2:');
disp(pessoa1_movies);
disp('ID dos filmes que foram avaliados pela pessoa 2 mas não pela pessoas 1:');
disp(pessoa2_movies);