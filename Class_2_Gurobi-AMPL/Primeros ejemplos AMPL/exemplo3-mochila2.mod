reset;
# começa a definição do modelo
model;

param N;
param custo  {1..N};
param volume {1..N};
param Vmax;

var x {1..N} binary;

# definição da restrição de volume
subject to limite_volume:  sum{i in 1..N} volume[i] * x[i] <= Vmax;

# definição da função objetivo
maximize z : sum{i in 1..N} custo[i] * x[i];


# começa a definição dos dados
data;

param N := 6;
param Vmax := 10;

param custo :=
1	8
2  	9
3	4
4	7
5	2
6	5
;

param volume :=
1	3
2  	6
3	4
4	4
5	4
6	2
;

# seleção do solver
option solver cplex;

# solução do problema
solve z;

# impressaão de resultados
display x;
display sum{i in 1..N} volume[i] * x[i];

printf "o volume usado foi: %d\n", sum{i in 1..N} volume[i] * x[i];














