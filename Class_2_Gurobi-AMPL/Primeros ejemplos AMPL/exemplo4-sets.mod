reset;

# este modelo mostra 4 diferentes alternativas de definição do conjunto 'Produtos'
# ativar somente uma delas na definição do modelo e na especificação dos dados
model;

set Produtos;			# 1a alternativa


# set Produtos := 10 .. 16 by 2;	# 2a alternativa
# param inicio;			# 3a alternativa
# param final > inicio;
# param intervalo;
# set Produtos := inicio .. final by intervalo;


#set Produtos;			# 4a alternativa



# declaração dos parámetros asociados ao conjunto 'Produtos'
param custo {Produtos};
param volume{Produtos};

data;

set Produtos := 10 12 14 16;	# 1a alternativa

# param inicio := 10;		# 3a alternativa
# param final := 16;
# param intervalo := 2;


# especificação dos dados para 'custo' e 'volume' na 1a, 2a e 3a alternativas
param custo:=
10	3
12	2
14	5
16	8
;
param volume:=
10	3
12	2
14	5
16	8
;


# especificação dos dados para 'custo' e 'volume' na 4a alternativa
#param: Produtos: custo volume:=
#10	3	3
#12	2	6
#14	5	4
#16	8	5
#;


# impressão dos conjuntos e parámetros
display Produtos;
display custo;
display volume;

# impressão dos elementos do conjunto 'Produtos' que sao maiores que 12
for{p in Produtos} {
  if p > 12 then {
    printf "O elemento %d tem custo igual a %d\n", p, custo[p];
  }
}

# impressão dos elementos do conjunnto 'Produtos' com custo maior que 4 e menor que 6
printf "\n\n";
for{p in Produtos} {
  if custo[p] > 4 && custo[p] < 6 then {
    printf "O elemento %d tem custo maior que 4 e menor que 6 (custo: %d)\n\n", p, custo[p];
  }
}













