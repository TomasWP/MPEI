function probSimulacao = Caras_ExercicioFunc(p, num_lanc, num_caras, num_exp)
    % Gerar a Matriz de Lançamentos e aplicar um filtro em que elementos
    % superiores a p ficam a 1, o resto fica a 0
    % Linhas - num_lanc
    % Colunas - num_exp
    lancamentos = rand(num_lanc, num_exp) > p;

    % Gerar um Vetor Linha em que cada elemento é a soma da respetiva
    % coluna da Matriz anterior e aplicar um filtro em que os elementos
    % iguais a num_caras (ou seja, foi obtido exatamente o número de caras 
    % pretendido) fica a 1, o resto fica a 0
    sucessos = sum(lancamentos) == num_caras;

    % Calcular a probablidade da Simulação, sumando o Vetor Linha sucessos
    % (vai dar o número respetivo de sucessos obtidos) e dividir pelo
    % número de experiências
    probSimulacao = sum(sucessos)/num_exp;
end