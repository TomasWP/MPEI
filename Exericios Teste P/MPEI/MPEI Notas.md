
## Criar um Vetor Linha

```
Número_inicial : incremento : Número_final

A = 0:2:10 # Cria um Vetor Linha de 0 até 10, de 2 em 2
Ex: A = [0     2     4     6     8    10]

B = 3:-1:-3 # Cria um Vetor Linha de 3 até -3, de -1 em -1
Ex: B = [3     2     1     0    -1    -2    -3]

C = randi(100, 1, 10) # Cria um Vetor Linha com 10 valores (os valores são de 1 a 100)
Ex: C = [51   100    94    22    90    11    42    26    54    39]
```

## Criar um Vetor Coluna

```
A = [ 1; 2; 3] # Cria um Vetor Coluna de 3 Linhas
Ex: A = [1
         2
         3]

B = [1 2 3]’ # Transpondo um Vetor Linha de 3 Colunas, Cria um Vetor Coluna 3 de Linhas
Ex: B = [1
         2
         3]

C = randi(100, 10, 1) # Cria um Vetor Coluna com 10 valores (os valores são de 1 a 100)
Ex: C = [51
		 913
		 868
		 420
		 32
		 74
	     403
		 543
	     381
		 807]
```

## Criar uma Matriz

```
A= [1 2 3;4 5 6] # Matriz com 2 linhas e 3 colunas
Ex: A = [1 2 3
         4 5 6]

B = rand(5,5) # Matriz aleatória (valores de 0 a 1) com 5 linhas e 5 colunas
Ex: B = [0.2057    0.4845    0.2374    0.1123    0.4325
         0.3883    0.1518    0.5309    0.7844    0.6948
         0.5518    0.7819    0.0915    0.2916    0.7581
         0.2290    0.1006    0.4053    0.6035    0.4326
         0.6419    0.2941    0.1048    0.9644    0.6555]
```

## Índices

```
A = rand(5,5) # Matriz aleatória (valores de 0 a 1) com 5 linhas e 5 colunas
Ex: A = [0.2057    0.4845    0.2374    0.1123    0.4325
         0.3883    0.1518    0.5309    0.7844    0.6948
         0.5518    0.7819    0.0915    0.2916    0.7581
         0.2290    0.1006    0.4053    0.6035    0.4326
         0.6419    0.2941    0.1048    0.9644    0.6555]

B = A(1, 3) # Seleciona elemento de A na Linha 1, Coluna 3
Ex: B = 0.2374

C = A(4:5, 1:2) # Seleciona os elementos de A da Linha 4 a 5, Coluna 1 a 2
Ex: C = [0.2290    0.1006
         0.6419    0.2941]

D = A(2, [1 3 5]) # Seleciona os elementos de A da Linha 2, Colunas 1, 3 e 5
Ex: D = [0.3883 0.5309 0.6948]

E = A([1 3 5], 3) # Seleciona os elementos de A da Linha 1, 3 e 5, Coluna 3
Ex: E = [0.2374
		 0.0915
		 0.1048]
		 
A(1,3)= 7 # Altera o elemento de A da Linha 1, Coluna 3 para 7
```

## Criar um Gráfico

```
A = 0:2:10 # Cria um Vetor Linha de 0 até 10, de 2 em 2
Ex: A = [0     2     4     6     8    10]

plot(A, A*2) # Cria um Gráfico em que os valores de A estão presentes no Eixo do X, e                  os valores de A*2 estão presentes no Eixo do Y
```
![[Pasted image 20240114123909.png]]

