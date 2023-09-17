Accion 3.9 (arr: arreglo de [1..200] de Libros) Es
	Ambiente

	Libros = Registro Es
		nro_titulo: N(6);
		titulo: AN(30);
		autor: AN(15);
		cant_hojas: N(6);
	FinRegistro

	posicion_libro:= 1..200;
	mayor: entero;
	posicion_mayor:= 1..200;
	i:= 1..200;

	Proceso
	mayor:= LV;
	Para(i:=1 hasta 200) Hacer
		Si(arr[i].autor = 'Nicklaus Wirth') Entonces
			Esc(arr[i].titulo);
			Si(arr[i].titulo = 'Algortimos + Estructuras de Datos= Programa') Entonces
				posicion_libro:= i;
			FinSi

			Si(arr[i].cant_hojas >= mayor) Entonces
				posicion_mayor:=i;
				mayor:= arr[i].cant_hojas;
			FinSi
		FinSi
	FinPara

	Esc(posicion_mayor);
	Esc(arr[posicion_mayor].titulo);
FinAccion
