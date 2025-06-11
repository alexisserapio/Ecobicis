DDL para instanciar la base:

CREATE DATABASE Equipo2_Ecobici 

use Equipo2_Ecobici

CREATE SCHEMA empleados

CREATE SCHEMA usuarios

CREATE SCHEMA bicicleta

--------------------------------------------------

CREATE TABLE empleados.EMPLEADO --constraint tabla
( 
	idEmpleado         integer  NOT NULL identity(1,1),
	idSupervisor	   integer  NULL ,
	nombre             varchar(30)NOT NULL ,
	materno            varchar(20) NULL ,
	paterno            varchar(20) NOT NULL ,
	rfc                char(13)  NOT NULL  CONSTRAINT u_rfc UNIQUE,
	correo             varchar(40)  NULL  CONSTRAINT u_correo UNIQUE,
	tipoEmpleado       char(1)  NULL  CONSTRAINT ck_tipoEmpleado check (tipoEmpleado in ('M','A','X')),
  telefono 			   char(10) not null CONSTRAINT ck_Tel check(TELEFONO like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	genero 			   char(1) not null CONSTRAINT ck_Genero check (genero in ('H','M')),
  edad  			   char(2) not NULL CONSTRAINT CK_edad CHECK (edad LIKE '[0-9][0-9]'),							 
  estadoCivil          char(1) NULL CONSTRAINT Ck_estadoCivil CHECK (estadoCivil in ('S','C','D','V')),
  alcaldia 			   varchar(30) NOT NULL, 
  calle 			   varchar(30) NOT NULL,
  num_exterior         char(2)  NOT NULL, -- cambiar en modelo relacional
  num_interior 		   char(2)  NULL, -- cambiar en modelo relacional
  colonia              varchar(30) NOT NULL,
  mes_informe          varchar(10) NOT NULL,
  año_informe          char(4) NOT NULL, -- cambiar en modelo relacional
  sueldo               money not null CONSTRAINT Ck_Sueldo CHECK (sueldo>5000)
  
	CONSTRAINT PK_EMPLEADO PRIMARY KEY CLUSTERED  (idEmpleado ASC)
	CONSTRAINT fk_Supervisor_Empleado FOREIGN KEY (idSupervisor) REFERENCES empleados.EMPLEADO(idEmpleado)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION
)
go
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.MANTENIMIENTO 
( 
	idEmpleado           integer  NOT NULL ,
    especialidad         varchar(20) not null,
	CONSTRAINT PK_MANTENIMIENTO  PRIMARY KEY (idEmpleado),
	CONSTRAINT fk_mantenimiento FOREIGN KEY (idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
go

—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.ADMINISTRACION   
( 
  idEmpleado           integer  NOT NULL ,
  trabajoRealizado     varchar(20) not null,
  lugarTrabajo	       varchar(20) not null,				
	CONSTRAINT PK_ADMINISTRACION PRIMARY  KEY (idEmpleado),
	CONSTRAINT fk_administracion FOREIGN KEY (idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
go
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.AUXILIAR
( 
	idEmpleado           integer  NOT NULL ,
	horario			     varchar(20) not null,
	CONSTRAINT PK_AUXILIAR PRIMARY KEY (idEmpleado),
	CONSTRAINT fk_auxiliar FOREIGN KEY (idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
go
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.IDIOMA
(
	idIdioma 				 tinyint not null,
  descripción 				 varchar(10) not null
  CONSTRAINT PK_IDIOMA PRIMARY KEY NONCLUSTERED (idIdioma),
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.IDIOMA_EMPLEADO
(
  idEmpleado integer NOT NULL, 
  idIdioma tinyint NOT NULL,
  CONSTRAINT PK_EMPLEADOIDIOMA PRIMARY KEY CLUSTERED (idEmpleado, idIdioma), 
  CONSTRAINT FK_empleadoidioma FOREIGN KEY(idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado) 
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT FK_idiomaemp FOREIGN KEY(idIdioma) REFERENCES empleados.IDIOMA(idIdioma) 
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE empleados.MOTIVO_FALTA
(
  idMotivo 						smallint not null CONSTRAINT PK_MOTIVO PRIMARY KEY,
  motivo 							varchar(20) not null CONSTRAINT U_MF UNIQUE, 
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.HISTORICO_FALTA
(
	idHistEmpleado 				smallint not null identity(1,1),
  idEmpleado 						integer not null,
  idMotivo 							smallint not null, -- cambiar en modelo relacional
  fechaFalta   					date not null, -- cambiar en modelo relacional
 -- cantidadFaltas 				numeric(10,0) not null, QUITAR
  CONSTRAINT PK_HISTOFALTAS PRIMARY KEY NONCLUSTERED (idHistEmpleado),
  CONSTRAINT fk_histofaltas FOREIGN KEY (idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado),
  CONSTRAINT fk_motivofalta FOREIGN KEY (idMotivo) REFERENCES empleados.MOTIVO_FALTA(idMotivo)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE bicicleta.ESTACION 
(
  idEstacion 						tinyint not null,
  idEmpleado 						integer not null, 
  unidades_Bicicleta 		numeric(3,0) not null,
  numero_terminal 			numeric(3,0) not null, 
  bicis_transito 				numeric(3,0) not null,
  concurrido       			char(1)     not null CONSTRAINT ck_concurrido check (concurrido in ('B','A')),
  dias_concurridos 			varchar(40) not null, 
  temporada_concurrida  varchar(10) not null,
  nombreEstacion 				varchar(20) not null,
  CONSTRAINT PK_ESTACION PRIMARY KEY CLUSTERED (idEstacion ASC),
  CONSTRAINT fk_estacion FOREIGN KEY (idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE bicicleta.COLOR 
(
  idColor 							tinyint not null CONSTRAINT PK_COLOR PRIMARY KEY,
  color 								varchar(20) not null
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE bicicleta.BICICLETA 
(
  idBicicleta  					smallint not null,
  numero_serie 					smallint not null CONSTRAINT u_NSerie UNIQUE,
  idEmpleado						integer not null,
  idColor 							tinyint not null,
  idEstacion 						tinyint not null,
  tamaño 								char(1) not null constraint ck_tamaño check (tamaño in ('C','M','G')),
  estado 								char(1)	not null constraint ck_estado check (estado in ('D','F','B')),	
  CONSTRAINT PK_BICICLETA PRIMARY KEY  CLUSTERED (idBicicleta ASC),
  CONSTRAINT fk_mante_bicicleta FOREIGN KEY (idEmpleado) REFERENCES empleados.EMPLEADO(idEmpleado),
  CONSTRAINT fk_bicicleta FOREIGN KEY (idEstacion) REFERENCES bicicleta.ESTACION(idEstacion),
  CONSTRAINT fk_color_bicicleta FOREIGN KEY (idColor) REFERENCES bicicleta.COLOR(idColor)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE empleados.HISTORICO_MANTENIMIENTO
(
	idHistoricoMant		smallint NOT NULL,
	idEmpleado			integer not null,
	idBicicleta			smallint NOT NULL,
	Mantenimiento		varchar(20) not null,
	CONSTRAINT PK_HISTMANTENIMIENTO2  PRIMARY KEY (idHistoricoMant),
	CONSTRAINT fk_mantenimiento2 FOREIGN KEY (idEmpleado) REFERENCES empleados.MANTENIMIENTO(idEmpleado),
    CONSTRAINT fk_idbiciletaMan FOREIGN KEY (idbicicleta) REFERENCES bicicleta.bicicleta(idbicicleta) --Si no deja poner con un alter
) 
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios.TARJETA
(
  idTarjeta 				integer 			not null,
  tipoTarjeta 			varchar(40) 	not null CONSTRAINT ck_tipoTarjeta check(tipoTarjeta in ('N','R')),
  metodoPago 				char(1) 			not null constraint ck_metodoPago check (metodoPago in ('T','P')),
  precioTarjeta			money		      not null,
  CONSTRAINT PK_TARJETA PRIMARY KEY NONCLUSTERED (idTarjeta ASC)
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios.USUARIO
(
    idUsuario           integer           NOT NULL identity(1,1),
    codigoINE         	char(20)          NOT NULL CONSTRAINT u_codigoINE UNIQUE,
    correo              varchar(30)       NOT NULL CONSTRAINT u_Ucorreo UNIQUE,
    edad				        numeric(4, 0)     NOT NULL,CONSTRAINT CK_Uedad CHECK (edad LIKE '[0-9][0-9]'),	
    genero              varchar(10)       NOT NULL,CONSTRAINT ck_Ugenero check (genero in ('H','M')),
    fecha_nacimiento    datetime          NOT NULL,
    nombre              varchar(30)       NOT NULL,
    apellidop           varchar(30)       NOT NULL,
    apellidom           varchar(30)       NULL,
    idTarjeta           integer           NOT NULL,
    app								  char(1)			    	null CONSTRAINT ck_Tapp check (app in ('C','R')),
  
  CONSTRAINT PK_USUARIO PRIMARY KEY CLUSTERED (idUsuario ASC),
  CONSTRAINT fk_idtarjeta FOREIGN KEY (idTarjeta) REFERENCES usuarios.TARJETA(idTarjeta)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios.VIAJE
(
  idViaje 				    integer not null identity(1,1),
  idBicicleta              smallint  not null,
  idUsuario 				  integer not null, 
  fecha 					    date not null,
  estacion_inicio 		varchar(20) not null,
  estacion_fin		 		varchar(20) not null,
  horaInicio				  time(0) not null,
  horaFin 					  time(0) not null,
  tarifaAdicional 		numeric(10,0), --agregar condicion con trigger
  ruta 								varchar(20),
  CONSTRAINT PK_VIAJE PRIMARY KEY  CLUSTERED (idViaje ASC),
  CONSTRAINT fk_viajeUsuario FOREIGN KEY (idUsuario) REFERENCES usuarios.USUARIO(idUsuario),
  CONSTRAINT fk_idbiciviaje FOREIGN KEY (idBicicleta) REFERENCES bicicleta.bicicleta(idBicicleta)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE usuarios.ACCIDENTE 
(
  idAccidente 				smallint not null,
  idEmpleado 					integer not null,
  idViaje					    integer not null, 
  idTipoAccidente 		tinyint not null,
  fecha 						  date not null,
  hora 						    time(0)  not null,
  codigo_postal				numeric(4,0) not null,
  colonia 						varchar(20) not null, 
  alcaldia 						varchar(20) not null, 
  numero 						  numeric(3,0) not null,
  coordenadas 				float(3) not null, --5 digitos con 3 decimales
  calle 							varchar(20) not null, --actualizar relacional
  CONSTRAINT PK_ACCIDENTE PRIMARY KEY  CLUSTERED (idAccidente ASC),
  CONSTRAINT fk_empleadoAccidente FOREIGN KEY (idEmpleado) REFERENCES empleados.AUXILIAR(idEmpleado),
  CONSTRAINT fk_viajeAccidente FOREIGN KEY (idViaje) REFERENCES usuarios.VIAJE(idViaje),
  CONSTRAINT fk_tipoaccidente FOREIGN KEY (idTipoAccidente) REFERENCES usuarios.TIPO_ACCIDENTE(idTipoAccidente)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios.TIPO_ACCIDENTE
(
idTipoAccidente 			tinyint not null CONSTRAINT PK_TIPOACCIDENTE PRIMARY KEY,
  tipo 						varchar(30) not null CONSTRAINT U_TIPOACCIDENTE UNIQUE,
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE usuarios.HISTORICOVIAJE
(
	idHistViaje 					smallint not null,
  idViaje 							integer not null,
  fechaInicio						datetime2(0) not null,
  fechaFin 							datetime2(0) not null,
  altitud								float(3) not null,
  longitud							float(3) not null,
  CONSTRAINT PK_HISTORICOVIAJE PRIMARY KEY  NONCLUSTERED (idHistViaje),
  CONSTRAINT fk_historicoviaje FOREIGN KEY (idViaje) REFERENCES usuarios.VIAJE(idViaje)
)
—-------------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios.TELEFONO
(
	id_telefono 	  smallint          not null,
    telefono          numeric(10, 0)    NOT NULL CONSTRAINT ck_Tel check(TELEFONO like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    idUsuario         integer           NOT NULL,
    CONSTRAINT PK_TELEFONO PRIMARY KEY NONCLUSTERED (id_telefono), 
    CONSTRAINT fk_telefono FOREIGN KEY (idUsuario) REFERENCES usuarios.USUARIO(idUsuario)
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE usuarios.MEMBRESIA
(
	idMembresia 			smallint 				not null,
  tipoSeguro 				char(1) 				not null,CONSTRAINT ck_TipoSeguro check(tipoSeguro in ('B','I','P')),
  tiempoExtra 			time  					null,
  idTarjeta 				integer 				not null,
  CONSTRAINT PK_MEMBRESIA PRIMARY KEY CLUSTERED (idMembresia asc), 
  CONSTRAINT fk_idTarjeta2 FOREIGN KEY (idTarjeta) REFERENCES usuarios.TARJETA(idTarjeta)
)
—-------------------------------------------------------------------------------------------------------------


CREATE TABLE usuarios.BASICA
(
  idMembresia    smallint       NOT NULL,
  precioB		 money NOT NULL DEFAULT 118,
  fechaInicio    date not null,
  fechaFin		 date not null,
  descuento      numeric(10,0) not null, --c
  CONSTRAINT PK_BASICA PRIMARY KEY NONCLUSTERED (idMembresia), 
  CONSTRAINT fk_basica FOREIGN KEY (idMembresia) REFERENCES usuarios.MEMBRESIA(idMembresia),
)
—-------------------------------------------------------------------------------------------------------------

CREATE TABLE usuarios.INTERMEDIA
(
	idMembresia  smallint NOT NULL,
  precioI		 money NOT NULL DEFAULT 400, 
  fechaInicio    date not null,
  fechaFin		 date not null,
  viaje_gratis   bit  NOT NULL, 
  CONSTRAINT PK_INTERMEDIA PRIMARY KEY NONCLUSTERED (idMembresia), 
  CONSTRAINT fk_intermedia FOREIGN KEY (idMembresia) REFERENCES usuarios.MEMBRESIA(idMembresia)	
)

—-------------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios.PREMIUM
(
	idMembresia    smallint NOT NULL,
  precioP		   money NOT NULL DEFAULT 1000, 
  fechaInicio      date not null,
  fechaFin		   date not null,
  cashback    	   bit  NOT NULL, 
  CONSTRAINT PK_PREMIUM PRIMARY KEY NONCLUSTERED (idMembresia), 
  CONSTRAINT fk_premium FOREIGN KEY (idMembresia) REFERENCES usuarios.MEMBRESIA(idMembresia)		
)

