Accion PrimerParcial-Tema2-Secuencia Es

Ambiente
sec: secuencia de caracter;
v, opc_usuario, resg_reserva: caracter;
cont_empresa, cont_particular, cont_protocolo: entero;


Funcion conv_entero(v:caracter): entero
  Segun (v) Hacer
    ="0": conv_entero:=0;
    ="1": conv_entero:=1;
    ="2": conv_entero:=2;
    ="3": conv_entero:=3;
    ="4": conv_entero:=4;
    ="5": conv_entero:=5;
    ="6": conv_entero:=6;
    ="7": conv_entero:=7;
    ="8": conv_entero:=8;
    ="9": conv_entero:=9;
  FinSegun
FinFuncion






Proceso
Mientras NFDS(sec) Hacer
  Mientras (v <> "@") Hacer
