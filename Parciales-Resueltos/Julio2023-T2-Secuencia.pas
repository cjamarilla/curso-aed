Accion PrimerParcial-Tema2-Secuencias Es

Ambiente
secuenciaArticulos, secuenciaVenta, secuenciaSalida: secuencia de caracter;
ventanaArticulo, ventanaVenta, opc_usuario, resg_pago, resg_envio: caracter;
cant_tarjeta, cant_contado, cont_tarjeta, cont_contado, i, unidades_vendidas: entero;

Funcion aEntero(v:caracter): entero
  Segun (v) Hacer
    ="0": aEntero:=0;
    ="1": aEntero:=1;
    ="2": aEntero:=2;
    ="3": aEntero:=3;
    ="4": aEntero:=4;
    ="5": aEntero:=5;
    ="6": aEntero:=6;
    ="7": aEntero:=7;
    ="8": aEntero:=8;
    ="9": aEntero:=9;
  FinSegun
FinFuncion


Proceso
ARR(secuenciaArticulos);
AVZ(secuenciaArticulos,ventanaArticulo);
ARR(secuenciaVenta);
AVZ(secuenciaVenta,ventanaVenta);
CREAR(secuenciaSalida);

//Le pido al sobre que tipo de venta [contado/tarjeta] quiere que se genere el informe
Escribir("Ingrese sobre que desea el informe [S:sucursal|D:domicilio] :");
Leer(opc_usuario);

Mientras NFDS(secuenciaArticulos) Hacer
  Para (i:= 1 a 9) Hacer
    AVZ(secuenciaArticulos,ventanaArticulo);
  FinPara
  cant_contado:=0;
  cant_tarjeta:=0;
  cont_tarjeta:=0;
  cont_contado:=0;
  unidades_vendidas:=0;
  //Trato la secuencia de ventas}
  Mientras (ventanaVenta <> "#") Hacer
    //Con este para me muevo directo a FP
    Para(i:=1 a 4) Hacer
      AVZ(secuenciaVenta,ventanaVenta);
    FinPara
    //Hago un resguardo de la forma de venta
    resg_pago:= ventanaVenta;
    AVZ(secuenciaVenta,ventanaVenta);
    //Hago un resguardo de la forma de envio
    resg_envio:=ventanaVenta;
    AVZ(secuenciaVenta,ventanaVenta);

    Para (i=1 a 0) Hacer
      unidades_vendidas:= unidades_vendidas * 10 + aEntero(ventanaVenta);
      AVZ(secuenciaVenta,ventanaVenta);
    FinPara

    Si (resg_envio = opc_usuario) Entonces
      Si (resg_pago = "C") Entonces
        cant_contado:= cant_contado + unidades_vendidas;
        cont_contado:= cont_contado + 1;
        Sino 
          Si(resg_pago = "T") Entonces
            cant_tarjeta := cant_tarjeta + unidades_vendidas;
            cont_tarjeta := cont_tarjeta + 1;
          FinSi
      FinSi    
      Sino
      Si (resg_pago = "C") Entonces
        cont_contado:= cont_contado + 1;
        Sino
          Si (resg_pago = "T") Entonces
            cant_tarjeta:= cant_tarjeta + 1;
          FinSi
      FinSi
    FinSi
  FinMientras

  //Continuo la secuencia de articulos, que quede en la parte de nombre de articulos
  Mientras(ventanaArticulo <> "&") Hacer
    Si (cant_contado < cant_tarjeta) Entonces
      Esc(ventanaArticulo);
      Esc(secuenciaSalida,ventanaArticulo);
      AVZ(secuenciaArticulos,ventanaArticulo);
      Sino
        Esc(ventanaArticulo);
        AVZ(secuenciaArticulos,ventanaArticulo);
    FinSi
  FinMientras
  Esc(cant_contado, cant_tarjeta);
FinMientras

CERRAR(secuenciaArticulos);
CERRAR(secuenciaVentas);
CERRAR(secuenciaSalida);

FinAccion

