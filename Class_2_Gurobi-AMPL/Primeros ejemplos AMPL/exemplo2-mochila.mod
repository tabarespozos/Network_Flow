reset;

# seleção do solver
option solver gurobi;

# definição das variáveis
var x1 binary;
var x2 binary;
var x3 binary;
var x4 binary;
var x5 binary;
var x6 binary;

# definição da função objetivo
maximize z : 6 * x1 + 8 * x2 + 4 * x3 + 7 * x4 + 2 * x5 + 5 * x6;

# definição da restrição de volume
subject to limite_volume:
 3 * x1 + 5 * x2 + 4 * x3 + 4 * x4 + 3 * x5 + 2 * x6 <= 10;
  
# solução do problema
solve z;

# impressão de resultados
display x1;
display x2;
display x3;
display x4;
display x5;
display x6;
display 3 * x1 + 5 * x2 + 4 * x3 + 4 * x4 + 3 * x5 + 2 * x6;

expand;


