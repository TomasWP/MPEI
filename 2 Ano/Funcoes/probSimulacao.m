function probSimulacao = probSimulacao(N,p,k,n)
    lancamentos = rand(n,N) > p;            %N - número de experiências
    sucessos = sum(lancamentos)==k;         %p - probabilidade de cara
    probSimulacao = sum(sucessos)/N;        %k - número de caras
end                                         %n - número de lançamentos