F1 = 'HP	Elite	12"	i5	8GB	    256GB';
F2 = 'HP	ENVY	12"	i5	8GB	    256GB';
F3 = 'ASUS	X	    15"	i7	32GB	512GB';
F4 = 'ASUS	X	    15"	i7	64GB	256GB';


fraseCell = {F1,F2,F3,F4};
k = 1;          % numero de funcoes de dispersao
Nu = 4;

%Determina as assinaturas de cada frase considerando todas as suas caracteristicas ( incluindo espaços e ponto finais),
%estime a distância de jaccard entre todas as frases e apresenta o par mais similare entre todas.

FraseMinHash = zeros(Nu, k);

% Loop over all the phrases
for FN=1:Nu
    % Get the current phrase
    Frase = fraseCell{1,FN};
    
    % Loop over all the hash functions
    for hashFuncN=1:k
        % Initialize an array to store the hash values
        hashArr=zeros(1,strlength(Frase));     
        % Store the minimum hash value for the current phrase and the current hash function
        FraseMinHash(FN,hf24) = min(hashArr);
    end
end

disp("C1 signature: "+ mat2str(FraseMinHash(1,:)));
disp("C2 signature: "+ mat2str(FraseMinHash(2,:)));
disp("C3 signature: "+ mat2str(FraseMinHash(3,:)));
disp("C4 signature: "+ mat2str(FraseMinHash(4,:)));
