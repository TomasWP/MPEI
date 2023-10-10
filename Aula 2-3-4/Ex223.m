num_sim = 1000;
resultados = zeros(1, num_sim);
for i=1:num_sim
    lancamentos = randi([1,2], 1, 4);

    num_coroas = sum(lancamentos == 2);

    resultados(i) = num_coroas;
end

pmf = histcounts(resultados,0:5)/num_sim;

stem(0:4, pmf);
xlabel('Número de coroas');
ylabel('Probabilidade');
title('PMF Estimada de x (Número de coroas em 4 lançamentos)')