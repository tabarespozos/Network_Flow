reset;

# definição das variáveis
var p integer;
var b integer;

# definição da função objetivo
maximize lucro : 8 * p + 5 * b;

# definição da restrições
subject to trigo:
  4 * p +  3 * b <= 500;
  
subject to variavel_paes:
  0 <= p <= 100;
  
subject to variavel_balchas:
  0 <= b <= 200; 

# seleção do solver
option solver gurobi;  

# solução do problema
solve lucro;

# impressão de resultados
display p;
display b;
display 4 * p +  3 * b;
display lucro;
display trigo;










