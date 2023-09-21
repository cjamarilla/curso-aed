Accion 3.1_Parte1 Es
	Ambiente
	arr: arreglo de [1..100] de enteros;
	i:entero;

	Proceso
	//Parte 1
	Para (i:= 1 hasta 100) Hacer
		Esc("Ingrese un valor para la posicion",i,": ");
		Leer(arr[i]);
	FinPara
FinAccion


Accion 3.1_Parte2 (arr: arreglo de [1..100] de enteros) Es
	Ambiente
	i, min, max, posmin, posmax: entero;

	Proceso
	//Parte 2
	min := HV;
	max := LV;

	Para (i:=1 hasta 100) Hacer
		Si (arr[i] > mayor) Entonces
				max:= arr[i];
				posmax:=i;
		FinSi
		Si(arr[i] < menor) Entonces
			min:= arr[i];
			posmin:=i;
		FinSi
	FinPara
	Esc("El numero mas grande es: ",max," y esta en la posicion: ",posmax);
	Esc("El numero mas pequeño es: ",min," y esta en la posicion: ",posmin);
FinAccion


Accion 3.1_Parte3 (arr: arreglo de [1..10] de enteros) Es
	Ambiente
		cont, suma, i: entero;
	
	Proceso
	//Parte 3
	cont:=0;
	suma:=0;
	Para(i:=1 hasta 100) Hacer
		Si(arr[i] MOD 2 = 0) Entonces
			suma:= suma + arr[i];
			cont:= cont+1;
		FinSi
	FinPara
	Esc("La cantidad de numeros pares dentro del arreglo es: ",cont," y la sumatoria de todos ellos es: ",suma);





