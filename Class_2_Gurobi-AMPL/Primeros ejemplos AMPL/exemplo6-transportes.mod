reset;
# definição das variáveis
var xa1 >= 0;
var xa2 >= 0;
var xa3 >= 0;
var xb1 >= 0;
var xb2 >= 0;
var xb3 >= 0;

# definição da função objetivo
minimize custo_transporte:
    2.1 * xa1 + 1.6 * xa2 + 3.1 * xa3
  + 2.8 * xb1 + 3.5 * xb2 + 1.9 * xb3;

# definição das restrições
subject to capacidade_a:
   xa1 + xa2 + xa3 <= 10;

subject to capacidade_b:
   xb1 + xb2 + xb3 <= 12;
   
subject to demanda_1:
  xa1 + xb1 >= 7;
subject to demanda_2:
  xa2 + xb2 >= 8;
subject to demanda_3:
  xa3 + xb3 >= 5;

# seleção do solver
option solver cplex;

# solução do problema  
solve custo_transporte;
  
# impressaõ de resultados
display xa1;
display xa2;
display xa3;
display xb1;
display xb2;
display xb3;
