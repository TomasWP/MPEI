%% a)
% temos 5 estados

T(1,1) = 0;
T(2,1) = 1;
T(3,1) = 0;
T(4,1) = 0;
T(5,1) = 0;

T(1,2) = 0;
T(2,2) = 0;
T(3,2) = 0.9;
T(4,2) = 0.1;
T(5,2) = 0;

T(1,3) = 0.8;
T(2,3) = 0;
T(3,3) = 0;
T(4,3) = 0;
T(5,3) = 0.2;

T(1,4) = 0;
T(2,4) = 0;
T(3,4) = 0;
T(4,4) = 1;
T(5,4) = 0;

T(1,5) = 0;
T(2,5) = 0;
T(3,5) = 0;
T(4,5) = 0;
T(5,5) = 1;

T;

%% b)

x0 = [1 0 0 0 0]'; %vetor inicial a começar no estado 1

p = T^12*x0;

fprintf("P(estado 1 voltar ao estado 1 depois de 12 iterações) = %.5f\n", p(1,1));

%% c)

% obter matriz canonica

Q = T(1:3,1:3);
F = (eye(3) - Q)^-1;

E1 = [1 0 0]'; %começando no estado 1

sum(F*E1);

%% d)

%determinar matriz B
% B = R*F
% é uma matriz que nos dá as probabilidades de sair de um estado transiente
% e de ir para um estado absorvente

R = T(4:5,1:3);
B = R*F;

B(1,1)
