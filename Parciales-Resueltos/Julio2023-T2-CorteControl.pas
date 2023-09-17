Accion PrimerParcial-Tema2-CorteControl Es

Ambiente
formato_fecha = Registro
  dd: 1..31;
  mm: 1..12;
  aaaa:N(4);
FinRegistro

stock = Registro Es
  clave = Registro Es
    Cod_Suc:N(2);
    Rubro:AN(20);
    Cod_Art:N(5);
  FinRegistro
  FechaUltRep: formato_fecha;
  Stock_Seguridad: N(4);
  Stocl_Actual: N(4);
FinRegistro

reg: stock;
Arch: Archivo de stock ordenado por clave;

Salida = Registro Es
  Cod_Suc:N(2);
  Cod_Art:N(5);
FinRegistro

sal: salida;
arch_sal: archivo de salida;

total_sucursal, total_rubro, total_general:entero;
fecha_usuario: formato_fecha;
resg_suc: N(2);
resg_rubro: AN(20);

Procedimiento corte_Rubro() es
  Esc("Del rubro: ",resg_rubro, "la cantidad total de articulos es: ",total_rubro);
  total_sucursal:= total_sucursal + total_rubro;
  total_rubro:=0;
  resg_rubro:= reg.clave.Rubro;
FinProcedimiento

Procedimiento corte_Sucursal() es
  corte_Rubro();
  Esc("De la sucursarl: ",resg_suc," hay en total :",total_sucursal);
  total_general:= total_general +total_sucursal;
  total_sucursal:=0;
  resg_suc:= reg.clave.Cod_Suc;
FinProcedimiento

Procedimiento tratar_Corte() Es
  Si(resg_suc <> reg.clave.Cod_Suc) Entonces
    corte_Sucursal();
    Sino
      Si (resg_rubro <> reg.clave.Rubro) Entonces
        corte_Rubro();
      FinSi
  FinSi
FinProcedimiento

Procedimiento inicializar() Es
  ABRIR E/(arch);
  Leer(arch,reg);
  ABRIR /S(arch_sal);
  resg_suc:= reg.clave.Cod_Suc;
  resg_rubro:= reg.clave.Rubro;
  total_rubro:=0;
  total_sucursal:=0;
  total_general:=0;
FinProcedimiento

Proceso
inicializar();
Esc("Ingrese fecha a controlar");
Esc("Ingrese dia: ");
Leer(fecha_usuario.dd);
Esc("Ingrese mes: ");
Leer(fecha_usuario.mm);
Esc("Ingrese el año: ");
Leer(fecha_usuario.aaaa);

Mientras NFDA(arch) Hacer
  tratar_Corte()
  Si (FechaUltRep < fecha_usuario) Entonces
    total_rubro:total_rubro + 1;
    Si (reg.clave.Rubro = "Bazar") Entonces
      sal.Cod_Suc := reg.clave.Cod_Suc;
      sal.Cod_Art := reg.clave.Cod_Art;
      grabar(arch_sal,sal);
    FinSi
  FinSi
  Leer(arch,reg);
FinMientras

corte_Sucursal();
Esc("El total general de articulos es: ",total_general);
CERRAR(arch);
CERRAR(arch_sal);
FinAccion

