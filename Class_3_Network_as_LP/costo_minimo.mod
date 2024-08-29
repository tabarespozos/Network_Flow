# Conjuntos
set NODOS;    # Conjunto de nodos
set ARCOS within (NODOS cross NODOS);  # Conjunto de arcos

# Parámetros
param balance{NODOS};  # Balance de flujo en cada nodo
param costo{ARCOS};    # Costo asociado a cada arco
param capacidad{ARCOS}; # Capacidad máxima de cada arco

# Variables
var x{(i,j) in ARCOS} >= 0, <= capacidad[i,j];  # Flujo a través del arco (i,j)

# Función objetivo: Minimizar el costo total del flujo
minimize TotalCost: sum{(i,j) in ARCOS} costo[i,j] * x[i,j];

# Restricciones de conservación de flujo en cada nodo
subject to Conservation{i in NODOS}:
    sum{(i,j) in ARCOS} x[i,j] - sum{(j,i) in ARCOS} x[j,i] = balance[i];

# Datos
data;

# Definición del conjunto de nodos
set NODOS := A B C D1 D2 X Y Z;

# Definición del conjunto de arcos y parámetros asociados
set ARCOS :=
    A D1  A D2
    B D1  B D2
    C D1  C D2
    D1 X  D1 Y  D1 Z
    D2 X  D2 Y  D2 Z;

# Parámetros del balance en cada nodo
param balance :=
    A 40
    B 50
    C 45
    D1 0
    D2 0
    X -40
    Y -50
    Z -45;

# Parámetros de costo asociados a cada arco
param costo :=
    A D1 5
    A D2 6
    B D1 7
    B D2 6
    C D1 8
    C D2 7
    D1 X 6
    D1 Y 7
    D1 Z 9
    D2 X 7
    D2 Y 5
    D2 Z 6;

# Parámetros de capacidad máxima en cada arco
param capacidad :=
    A D1 40
    A D2 40
    B D1 45
    B D2 40
    C D1 40
    C D2 45
    D1 X 40
    D1 Y 40
    D1 Z 40
    D2 X 45
    D2 Y 45
    D2 Z 45;



# Llamar al solver Gurobi
option solver gurobi;

# Resolver el modelo
solve;

# Imprimir los resultados
printf "\nResultados del flujo a costo mínimo:\n";
printf "Arco (i, j) \tFlujo\n";
for {(i,j) in ARCOS: x[i,j] > 0} {
    printf "(%s, %s)\t\t%f\n", i, j, x[i,j];
}

printf "Costo total mínimo: %f\n", TotalCost;
