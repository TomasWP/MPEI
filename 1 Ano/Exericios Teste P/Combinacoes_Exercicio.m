clc
% Pretende-se agora calcular de forma analítica as probabilidades 
% estimadas nos exercícios anteriores.
% Considere, para isso, a seguinte expressão: 
%           P(k) = nCk*p^k*(1-p)^()n-k
% em que p é a probabilidade de ocorrer o acontecimento em que estamos 
% interessados (por exemplo, se o acontecimento for "sair cara" em cada 
% lançamento, p = 0.5), k é o número de acontecimentos que ocorreram 
% em n repetições da experiência aleatória.
% Em Matlab, esta expressão é determinada da seguinte forma:

%% Resolução - cálculo analítico de probabilidade em séries experiências de Bernoulli
% Dados relativos ao problema 1
prob = 0.5;
num_caras = 2;
num_lanc = 3;
probSimulacao = nchoosek(n,k)*p^k*(1-p)^(n-k) % nchoosek(n,k)= n!/(n-k)!/k!
