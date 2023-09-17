Accion 3.10 (arr) Es
	Ambiente
	//i fila, j columna
	matriz: matriz de [1..3, 1..2] de enteros;
	i,j:entero;

	Proceso
	i:=1;
	j:=1;
	Para (i:= 1 a 3) Hacera
		Para (j:= 1 a 2) Hacer
				("La posicion ",[i],[j],matriz[i][j]);
		Fin