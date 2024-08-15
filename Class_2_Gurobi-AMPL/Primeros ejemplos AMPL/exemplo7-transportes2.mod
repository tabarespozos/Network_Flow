reset;
# definição do modelo
model;

# conjuntos usados no modelo
set Fabricas;
set Cidades;

# párametros e variáveis asociados aos conjuntos
param capacidade{Fabricas};
param demanda{Cidades};
param custo_trans{Fabricas,Cidades};
var x{Fabricas,Cidades} >= 0;

# deifnição da função objetivo
minimize custo_transporte:
  sum{i in Fabricas} sum{j in Cidades} custo_trans[i,j] * x[i,j];

# restrição de capacidade das fábricas
subject to capacidade_fabricas{i in Fabricas}:
  sum{j in Cidades} x[i,j] <= capacidade[i];

# restrições de demanda das cidades
subject to demanda_cidades{j in Cidades}:
  sum{i in Fabricas} x[i,j] >= demanda[j];


# especificação dos dados
data;

param: Fabricas: capacidade :=
	a	10
	b	12
;

param: Cidades: demanda :=
	1	7
	2	8
	3	5
;

param custo_trans :
	1	2	3 :=
a	2.1	1.6	3.1
b	2.8	3.5	1.9
;

# seleção do solver
option solver gurobi;

# solução do problema
solve custo_transporte;

# imoressão dos resultados
display x;

# comando que permite mostrar por extenso a função objetivo e as restrições do modelo
expand;
