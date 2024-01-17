clc
%% Enunciado
% Considere a seguinte situação e responda às alíneas abaixo:
% Um aluno do primeiro ano de um curso de Engenharia tem todas as semanas 
% 2 aulas Teórico-Práticas de uma Unidade Curricular X às 9:00, às quartas 
% e sextas.
% Todos os dias que tem aulas desta UC, o aluno decide se vai à aula ou não 
% da seguinte forma: Se tiver estado presente na aula anterior, a 
% probabilidade de ir à aula é 70%; se faltou à anterior, a probabilidade 
% de ir é 80%.

% (a) Se estiver presente na aula de quarta numa determinada semana, qual 
%     a probabilidade de estar presente na aula de quarta da semana seguinte?
%     Sugestão: Comece por definir a matriz de transição de estados e o 
%     vetor estado correspondentes.

% Definir a Matriz de Transição
P = [0.7, 0.8 ; 0.3, 0.2];  %   Estado1     Estado2
                            %     0.7          0.8    ----> Probabilidade de ir
                            %     0.3          0.2    ----> Probabilidade de não ir

% Vetor de estado inicial [Presente, Faltou]
estado_inicial = [1 ; 0];   % Suponha que o aluno estava "Presente" na semana atual
                            % 1 Presente
                            % 0

% Calcular a probabilidade de estar "Presente" na semana seguinte
% Calcula a probabilidade na segunda Semana
probabilidade_presente_semana_seguinte = P^2 * estado_inicial;

probSimulacaoA = probabilidade_presente_semana_seguinte(1)

% (b) Se não estiver presente na aula de quarta numa determinada semana, 
%     qual a probabilidade de estar presente na aula de quarta da semana seguinte?

% Definir a Matriz de Transição
P = [0.7, 0.8 ; 0.3, 0.2];  %   Estado1     Estado2
                            %     0.7          0.8    ----> Probabilidade de ir
                            %     0.3          0.2    ----> Probabilidade de não ir

% Vetor de estado inicial [Presente, Faltou]
estado_inicial = [0 ; 1];   % Suponha que o aluno estava "Presente" na semana atual
                            % 1 Presente
                            % 0

% Calcular a probabilidade de estar "Presente" na semana seguinte
% Calcula a probabilidade na segunda Semana                    
probabilidade_presente_semana_seguinte = P^2 * estado_inicial;

probSimulacaoB = probabilidade_presente_semana_seguinte(1)

% (c) Sabendo que esteve presente na primeira aula, qual a probabilidade 
%     de estar na última aula, assumindo que o semestre tem exatamente 
%     15 semanas de aulas e não existem feriados?

% Definir a Matriz de Transição
P = [0.7, 0.8 ; 0.3, 0.2];  %   Estado1     Estado2
                            %     0.7          0.8    ----> Probabilidade de ir
                            %     0.3          0.2    ----> Probabilidade de não ir

% Vetor de estado inicial [Presente, Faltou]
estado_inicial = [1 ; 0];   % Suponha que o aluno estava "Presente" na semana atual
                            % 1 Presente
                            % 0

% Calcular a probabilidade de estar "Presente" na última semana
% Calcula a probabilidade na segunda Semana                    
probabilidade_presente_semana_seguinte = P^15 * estado_inicial;

% (d) Represente num gráfico a probabilidade de faltar a cada uma das 30 
%     aulas, assumindo que a probabilidade de estar presente na primeira 
%     aula é de 85%.

% Definir a Matriz de Transição
P = [0.7, 0.8 ; 0.3, 0.2];  %   Estado1     Estado2
                            %     0.7          0.8    ----> Probabilidade de ir
                            %     0.3          0.2    ----> Probabilidade de não ir

% Probabilidade de estar presente na primeira aula
probabilidade_inicial = [0.85; 0.15];

% Inicializar vetor para armazenar probabilidades de faltar
probabilidade_faltar = zeros(30, 1);

% Calcular probabilidades para cada aula
for i = 1:30
    probabilidade_faltar(i) = probabilidade_inicial(2); % Probabilidade de faltar
    probabilidade_inicial = P * probabilidade_inicial;  % Atualizar para a próxima aula
end

% Plotar o gráfico
figure;
plot(1:30, probabilidade_faltar, 'o-', 'LineWidth', 2);
title('Probabilidade de Faltar em Cada Aula');
xlabel('Número da Aula');
ylabel('Probabilidade de Faltar');
grid on;

