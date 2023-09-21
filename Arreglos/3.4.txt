Accion 3.4 (arr: arreglo de [1..50] de enteros);

Ambiente 

arrSalida: arreglo de [1..50] de enteros;
cont,i,j :entero;

Proceso
cont:=0;
j:=1;
Para (i:= 1 hasta 50) Hacer	
		Si(arr[i] MOD 3 <> 0) Entonces
			arrSalida[j]:= arr[i];
			arr[i] := arr[i] * 3 ;
			j:=j+1;
			Sino
				cont:= cont + 1; 
	FinSi
FinPara
Esc("La cantidad de numeros que cumplieron la condicion fueron: ",cont);
FinAccion