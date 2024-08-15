reset;
# definição do modelo
model;

set Produtos;
param custo {Produtos};
param volume {Produtos};
param vmax;

var x {Produtos} binary;

# definição da função objetivo
maximize lucro: sum{i in Produtos} custo[i] * x[i];

# definição da restrição de volume
subject to limite_volume:
	sum{i in Produtos} volume[i] * x[i] <= vmax;

# restrição que pose ser usada para forçar a inclusão de um produto
# subject to incluir_videogame:
	# x['videogame'] = 1;


# definição dos dados
data;

param:	Produtos:	custo	volume	:=
		laptop		8		3
		dvd			9		6
		som			4		4
		tv			7		4
		videogame	2		4
		celular		5		2
;

param vmax := 10;

# fixar a variável para obrigar a inclusão de um produto
fix x['videogame'] := 1;

# seleção do solver
option solver cplex;

# solução do problema
solve lucro;

# impressaõ de resultados
display Produtos;
display x;
display x['tv'];

