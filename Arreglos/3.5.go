Accion 3.5 (arr: arreglo de [1..30] de entero, arr2: arreglo de [1..30] de entero ) Es

	Ambiente
	arrMezcla: arreglo de [1..60] de enteros;
	i,j,k: entero;

	Proceso
	i:=1;
	j:=1;
	k:=1;

	Mientras (i <= 30  y j <= 30) Hacer
		Si(arr[i] <= arr2[j]) Entonces
			arrMezcla[k]:=arr[i];
			i:= i + 1;
			Sino
				arrMezcla[k] := arr2[j];
				j:= j + 1;
		FinSi
		
		k:= k +1 ;
	FinMientras
	Mientras (i <= 30) Hacer
		arrMezcla[k]:= arr[i];
		i := i + 1;
		k := k + 1;
	FinMientras

	Mientras (j <= 30) Hacer
		arrMezcla[k]:= arr[j];
		j := j + 1;
		k := k + 1;
	FinMientras
FinAccion