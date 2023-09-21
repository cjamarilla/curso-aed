Accion 3.2 Es
	Ambiente
	arr: arreglo de [1..100] de enteros;
	cont, suma, max, min, posmin, posmax, i:entero;

	Proceso
	cont:=0;
	suma:=0;
	max:= LV;
	min:= HV;
	Para (i:=1 hasta 100) Hacer
		//Parte 1
		Esc("Ingrese el valor del arreglo en la posicion",i,": ");
		Leer(arr[i]);
		//Parte 2
		Si (arr[i] > mayor) Entonces
				max:= arr[i];
				posmax:=i;
		FinSi
		Si(arr[i] < menor) Entonces
			min:= arr[i];
			posmin:=i;
		FinSi
		//Parte 3
		Si(arr[i] MOD 2 = 0) Entonces
			suma:= suma + arr[i];
			cont:= cont+1;
		FinSi
	FinPara
	Esc("El numero mas grande es: ",max," y esta en la posicion: ",posmax);
	Esc("El numero mas pequeño es: ",min," y esta en la posicion: ",posmin);
	Esc("La cantidad de numeros pares dentro del arreglo es: ",cont," y la sumatoria de todos ellos es: ",suma);
FinAccion