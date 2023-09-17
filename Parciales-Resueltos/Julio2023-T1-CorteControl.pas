Accion PrimerParcial-Tema1-CorteControl Es

Ambiente

formato_fecha = Registro
  dd: 1..31;
  mm: 1..12;
  aaaa:N(4);
FinRegistro

inventario = Registro
  Clave = Registro
    Cod_Suc: N(2);
    Rubro: AN(20);
    Cod_Art: N(5);
  FinRegistro
  FechaUltRep: formato_fecha;
  Stock_Seguridad: N(5);
  Stock: N(5);
FinRegistro

reg: inventario;
arch: Archivo de inventario ordenado por clave;

salida= Registro
  Cod_Suc: N(2);
  Rubro: AN(20);
  cant_articulos: N(10);
FinRegistro

sal: salida;
arch_sal: archivo de salida;

//Puedo usar los mismos contadores para consignas a y b.
total_sucursal, total_rubro, total_general: entero;
resg_suc: N(2);
resg_rubro: AN(20);

//Defino del corte mas chiquito al mas grande (por que los mas grandes llaman a los mas chicos)

Procedimiento corte_Rubro() es
  //Consigna A
  Esc("La cantidad total de articulos del rubro que tienen menor stock que el stock de seguridad es: ", total_rubro);
  //Aca grabo salida
  sal.Cod_Suc := resg_suc;
  sal.Rubro := resg_rubro;
  sal.cant_articulos:= total_rubro;
  grabar(arch_sal, sal);
  total_sucursal:= total_sucursal + total_rubro;
  total_rubro:=0;
  resg_rubro:= reg.clave.rubro;
FinProcedimiento

Procedimiento corte_Sucursal() es
  corte_Rubro();
  Esc("La cantidad total de articulos en la sucursal que requieren reposicion es: ",total_sucursal);
  total_general:= total_general +total_sucursal;
  total_sucursal:=0;
  resg_suc:= reg.clave.Cod_Suc;
FinProcedimiento

Procedimiento Inicializalizar() Es
  ABRIR E/(arch);
  LEER(arch, reg);
  ABRIR /S (arch_sal);
  resg_suc:= reg.clave.Cod_Suc;
  resg_rubro:= reg.clave.Rubro;
  total_rubro:=0;
  total_sucursal:=0;
  total_general:=0;
FinProcedimiento

Procedimiento Tratar_Corte() Es
  Si (resg_suc <> reg.clave.Cod_Suc) Entonces
    corte_Sucursal();
    Sino Si (resg_rubro <> reg.clave.Rubro) Entonces
      corte_Rubro();
    FinSi
  FinSi
FinProcedimiento

Proceso
Inicializalizar();
Esc("Los articulos que requieren reposicion son ");
Mientras NFDA(arch) Hacer
  Tratar_Corte();
  //Parte tratar Archivo
  Si (reg.Stock < reg.Stock_Seguridad) Entonces
    total_rubro:= total_rubro +1 ;
    Esc("Articulo: ",reg.clave.Cod_Art, "Sucursal", reg.clave.Cod_Suc, "Rubro:", reg.clave.Rubro);
  FinSi
  Leer(Arch,reg);
FinMientras
corte_Sucursal();
Esc("El total general de articulos con stock actual por debajo del de seguridad es: ",total_general);
Cerrar(arch);
Cerrar(arch_sal)

FinProceso