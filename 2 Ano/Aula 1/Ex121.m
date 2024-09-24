% Ex 1.2
% 1. a/b)
    N= 1e5; %número de experiências
    p = 0.5; %probabilidade de cara
    k = 2; %número de caras
    n = 3; %número de lançamentos
    disp(probSimulacao(N,p,k,n));
% 2.
    N = 1e5;
    p = 0.5;
    k = 6;
    n = 15;
    disp(probSimulacao(N,p,k,n));
% 3.
    disp(1-probSimulacao(1e5,0.5,5,15));
% 4.
    disp("2 caras");
    disp("");
    fprintf('15 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 2, 15));
    fprintf('20 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 2, 20));
    fprintf('40 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 2, 40));
    fprintf('100 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 2, 100));

    fprintf("\n");

    disp("6 caras");
    fprintf('15 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 6, 15));
    fprintf('20 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 6, 20));
    fprintf('40 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 6, 40));
    fprintf('100 lançamentos: %.4f\n', probSimulacao(1e5, 0.5, 6, 100));

% 5.

    %% Cálculo analítico de probabilidade em séries experiências de Bernoulli
    % Dados relativos ao problema 1
    p = 0.5;
    k = 2;
    n = 3;
    prob= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!
    disp(prob)

    p = 0.5;
    k = 6;
    n = 15;
    prob= nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!  
    disp(prob)

% 6.
    % a)
    disp("Simulação")
    disp(probSimulacao(1e5,0.3,3,5)) 
    disp("Analiticamente")
    disp(calcAnalitico(0.3,3,5))

    % b)
    c1 = calcAnalitico(0.3,0,5);
    c2 = calcAnalitico(0.3,1,5);
    c3 = calcAnalitico(0.3,2,5);
    disp(c1+c2+c3);

    % c)
    % Construção do histograma
    amostras = binornd(5, 0.3, [1e5, 1]);
    histogram(amostras, 'Normalization', 'probability');
    xlabel('Número de peças defeituosas');
    ylabel('Frequência relativa');
    title('Histograma do número de peças defeituosas');