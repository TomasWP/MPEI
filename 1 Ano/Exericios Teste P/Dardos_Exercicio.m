clc
%% Enunciado
% Considere o seguinte "jogo": lançamento com os olhos vendados de n dardos, 
% um de cada vez, para m alvos, garantindo-se que cada dardo atinge 
% sempre um alvo (e apenas 1).

% (a) Estime por simulação a probabilidade de nenhum alvo ter sido atingido 
%     mais do que uma vez quando n = 20 dardos e m = 100 alvos.

num_dardos = 20; % Número de Dardos
num_alvos = 100; % Número de Alvos
num_exp = 1e5; % Número de Experiências

acertos = randi(num_alvos, num_exp, num_dardos);

acertos_alvos_diferentes = 0;

for i = 1:num_exp
   linha = acertos(i, :);

   if length(unique(linha)) == num_dardos
        acertos_alvos_diferentes = acertos_alvos_diferentes + 1;
   end
end

probSimulacaoAlvosDiferentesA = acertos_alvos_diferentes/num_exp

% (b) Estime por simulação a probabilidade de pelo menos 1 alvo ter sido 
%     atingido 2 ou mais vezes quando n = 20 dardos e m = 100 alvos.

num_dardos = 20; % Número de Dardos
num_alvos = 100; % Número de Alvos
num_exp = 1e5; % Número de Experiências

acertos = randi(num_alvos, num_exp, num_dardos);

acertos_alvos_iguais = 0;

for i = 1:num_exp
   linha = acertos(i, :);

   if length(unique(linha)) < num_dardos
        acertos_alvos_iguais = acertos_alvos_iguais + 1;
   end
end

probSimulacaoAlvosIguaisB = acertos_alvos_iguais/num_exp

% (c) Considere os valores de m = 1000 e m = 100000 alvos. Para cada um 
%     destes valores, faça as simulações necessárias para desenhar um gráfico
%     (usando a função plot do Matlab) da probabilidade da alínea (b) em 
%     função do número de dardos n. Considere n de 10 a 100 com incrementos de 10.
%     Os 2 gráficos devem ser subgráficos de uma mesma figura 
%     (use a instrução subplot do Matlab).
%     Compare os resultados dos 2 casos e retire conclusões.

num_alvos_2 = [1000, 100000]; % Valores de m

figure;

for j = 1:length(num_alvos_2)
    num_alvos = num_alvos_2(j);

    prob_simulacao = zeros(1, 10);

    for num_dardos = 10:10:100
        acertos = randi(num_alvos, num_exp, num_dardos);

        alvos_atingidos_2_ou_mais_vezes = 0;

        for i = 1:num_exp
            linha = acertos(i, :);

            % Verifica se há pelo menos 1 alvo atingido 2 ou mais vezes
            if any(histcounts(linha, 1:num_alvos) >= 2)
                alvos_atingidos_2_ou_mais_vezes = alvos_atingidos_2_ou_mais_vezes + 1;
            end
        end

        prob_simulacao(num_dardos/10) = alvos_atingidos_2_ou_mais_vezes / num_exp;
    end

    subplot(1, 2, j);
    plot(10:10:100, prob_simulacao, 'o-', 'LineWidth', 2);
    title(['m = ' num2str(num_alvos_2(j))]);
    xlabel('Número de Dardos (n)');
    ylabel('Probabilidade');
    grid on;
end

sgtitle('Probabilidade de pelo menos 1 alvo atingido 2 ou mais vezes');
