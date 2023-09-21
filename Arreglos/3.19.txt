Accion 3.19 (matriz: arreglo de [1..5, 1..5] de entero) Es
	Ambiente
	i,j,mayor, menor: entero;
	aux: arreglo de [1..5] de entero;
	bandera: booleano;

	Proceso
	posmayor:=0;
	posmenor:=0;
	Para (i a 5 ) Hacer //filas
		mayor:= LV;
		Para (j a 5) Hacer //columnas
			Si(matriz[i,j] > mayor) Entonces
				mayor:= matriz[i,j];
				aux[i] := j;
			FinSi
		FinPara
		ESC("El mayor  por la fila es: ",i," Es", mayor, "..", posmayor);
	FinPara
	Para (i:= 1 a 5 ) Hacer
		Si(aux[i] <> aux[i+1]) Entonces
			bandera:= falso;
		FinSi
	FinPara
	
	Si(bandera) Entonces
		Esc("Todos en la misma columna");
		Sino
			Esc("No estan las mismas columnas");
FinAccion
