CREATE OR ALTER TRIGGER empleados.trmantenimiento  
ON empleados.mantenimiento 
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (SELECT idempleado FROM empleados.auxiliar 
			   WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en auxiliar' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.mantenimiento 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en mantenimiento' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.administracion 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en administracion' AS mensaje
	END

	ELSE IF NOT EXISTS (SELECT idempleado FROM empleados.EMPLEADO 
						WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado no existe' AS mensaje
	END

	ELSE
	BEGIN
		INSERT INTO empleados.mantenimiento (idEmpleado, especialidad)
		SELECT idEmpleado, especialidad FROM inserted
		
		SELECT 'Se insertaron el empleado en mantenimiento' AS mensaje
	END
END
--------------------AUXILIAR-------------------
---Verifica los empleados que se puedan insertar en auxiliar
CREATE OR ALTER TRIGGER empleados.trauxiliar  
ON empleados.auxiliar
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (SELECT idempleado FROM empleados.auxiliar 
			   WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en auxiliar' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.mantenimiento 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en mantenimiento' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.administracion 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en administracion' AS mensaje
	END

	ELSE IF NOT EXISTS (SELECT idempleado FROM empleados.EMPLEADO 
						WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado no existe' AS mensaje
	END

	ELSE
	BEGIN
		INSERT INTO empleados.auxiliar (idEmpleado, horario)
		SELECT idEmpleado, horario FROM inserted
		
		SELECT 'Se insertaron el empleado en auxiliar' AS mensaje
	END
END


--------------------ADMINISTRATIVO-------------
---Verifica los empleados que se puedan insertar en administrativo
CREATE OR ALTER TRIGGER empleados.tradministracion  
ON empleados.administracion
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (SELECT idempleado FROM empleados.auxiliar 
			   WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en auxiliar' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.mantenimiento 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en mantenimiento' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.administracion 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en administracion' AS mensaje
	END

	ELSE IF NOT EXISTS (SELECT idempleado FROM empleados.EMPLEADO 
						WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado no existe' AS mensaje
	END

	ELSE
	BEGIN
		INSERT INTO empleados.administracion (idEmpleado, trabajoRealizado, lugarTrabajo)
		SELECT idEmpleado, trabajoRealizado, lugarTrabajo FROM inserted
		
		SELECT 'Se insertaron el empleado en administracion' AS mensaje
	END
END

-------------
---Actualiza el tipo tarjeta si el ususario la perdio
CREATE OR ALTER TRIGGER usuarios.trTarjeta
ON usuarios.TARJETA
AFTER UPDATE
AS
BEGIN
    -- Verificar si se actualizó el tipoTarjeta de 'N' a 'R' y el precio de 50 a 80
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE tipoTarjeta = 'R' AND precioTarjeta = 80
    )
    BEGIN
        -- Actualizar los registros en la tabla
        UPDATE tar
        SET tipoTarjeta = 'R', precioTarjeta = 80
        FROM usuarios.TARJETA AS tar
        INNER JOIN inserted AS ins ON tar.idTarjeta = ins.idTarjeta
        WHERE ins.tipoTarjeta = 'N' AND ins.precioTarjeta = 50;
        
        -- Mostrar mensaje de actualización
        SELECT 'Tipo de tarjeta actualizado';
    END
END;


--------------VISTAS-------------------------
--Muestra el numero de bicicletas de color negro
create or alter view bicicleta.v_BicisNegras
as
select count(a.color) as Numero_Bicis_Negras from bicicleta.BICICLETA as b
inner join bicicleta.COLOR as a on a.idColor=b.idColor
where b.idColor=4
go

select * from bicicleta.v_BicisNegras

--Muestra el nombre completo de cada empleado y el idioma que hablan
create or alter view empleados.vNombresCompletos
as
select (nombre+' '+paterno+' '+isnull(materno, '-- Sin Materno --')) as Nombre_Completo, ididioma
from empleados.EMPLEADO e
inner join empleados.idioma_empleado i on i.idempleado = e.idempleado
go

select * from empleados.vNombresCompletos

---------muestra el nombre del usuario, su edad y los viajes realizados
create or alter view usuarios.Info
as
select (nombre+' '+apellidop+' '+isnull(apellidom, '-- Sin Materno --')) as Nombre_Completo,(DATEDIFF(year,fecha_nacimiento,getdate())) as Edad, idviaje
from usuarios.USUARIO u
left join usuarios.viaje v on v.idusuario = u.idusuario
go

select * from usuarios.Info

----USO LIKE--------
SELECT * from  empleados.vNombresCompletos where nombre_Completo LIKE 'A%' 


----------FUNCIONES----------
---nos regresa el tipo de empleado
create or alter function empleados.f_empleado()
returns table 
as
return (select idEmpleado,tipoEmpleado
from empleados.empleado)
go 

SELECT idEmpleado, tipoEmpleado
  FROM empleados.f_empleado();

---nos regresa el sueldo promedio
CREATE FUNCTION empleados.sueldoPromedio() RETURNS DECIMAL
AS
BEGIN
	DECLARE @promedio DECIMAL
	SELECT @promedio=AVG(sueldo)
	FROM empleados.EMPLEADO
RETURN @promedio
END
GO

select  empleados.sueldoPromedio()

informes
CREATE OR ALTER PROCEDURE pusuDañosBici
AS
BEGIN
	select top 5 count(a.idtipoaccidente) as 'Cantidad total por accidente',tipo AS 'Tipo de Accidente'
	from usuarios.Accidente as a
	inner join usuarios.Tipo_Accidente b
	on a.idtipoaccidente=b.idtipoaccidente
	group by a.idtipoaccidente,tipo

	--Estaciones con más reportes de accidentes con mayor frecuencia. Listado eestaciones con el número de accidentes en un periodo de tiempo (fecha inicio fecha fin) ordenados de mayor a menor
	select v.idviaje,v.estacion_fin, count(a.idempleado) as cantidadAccidente
	from usuarios.viaje v
	inner join usuarios.accidente a on a.idViaje = v.idViaje
	inner join usuarios.HistoricoViaje b on  a.idviaje=b.idviaje
	where b.fechainicio between '2022-07-15' and '2022-08-15' ---rango de un mes
	group by v.idviaje,v.estacion_fin, a.idTipoAccidente
	order by v.estacion_fin desc
END;

EXEC pusuDañosBici

--Total de accidentes en un rango de fechas, listados de mayor a menor
CREATE OR ALTER PROCEDURE pusuACCIDENTES
AS
BEGIN
	SELECT
	  CASE
		WHEN fecha BETWEEN '2022-07-15' AND '2022-07-22' THEN 'Rango 1: 2022-07-15 a 2022-07-22'
		WHEN fecha BETWEEN '2022-07-23' AND '2022-07-30' THEN 'Rango 2: 2022-07-23 a 2022-07-30'
		WHEN fecha BETWEEN '2022-07-31' AND '2022-08-06' THEN 'Rango 3: 2022-07-31 a 2022-08-06'
		WHEN fecha BETWEEN '2022-08-07' AND '2022-08-15' THEN 'Rango 3: 2022-08-07 a 2022-08-15'
		WHEN fecha BETWEEN '2022-08-16' AND '2022-08-23' THEN 'Rango 3: 2022-08-16 a 2022-08-23'
		WHEN fecha BETWEEN '2022-08-24' AND '2022-08-31' THEN 'Rango 3: 2022-08-24 a 2022-08-31'
		ELSE 'Otro rango'
	  END AS RangoFecha,
	  COUNT(idAccidente) AS cantidad
	FROM usuarios.accidente
	WHERE fecha BETWEEN '2022-07-15' AND '2022-08-31'
	GROUP BY
	  CASE
		WHEN fecha BETWEEN '2022-07-15' AND '2022-07-22' THEN 'Rango 1: 2022-07-15 a 2022-07-22'
		WHEN fecha BETWEEN '2022-07-23' AND '2022-07-30' THEN 'Rango 2: 2022-07-23 a 2022-07-30'
		WHEN fecha BETWEEN '2022-07-31' AND '2022-08-06' THEN 'Rango 3: 2022-07-31 a 2022-08-06'
		WHEN fecha BETWEEN '2022-08-07' AND '2022-08-15' THEN 'Rango 3: 2022-08-07 a 2022-08-15'
		WHEN fecha BETWEEN '2022-08-16' AND '2022-08-23' THEN 'Rango 3: 2022-08-16 a 2022-08-23'
		WHEN fecha BETWEEN '2022-08-24' AND '2022-08-31' THEN 'Rango 3: 2022-08-24 a 2022-08-31'
		ELSE 'Otro rango'
	  END
	order by cantidad desc
END;

EXEC pusuACCIDENTES

/*Total de usuarios por rangos de fechas y rangos de edades (10 a 215 años, 15-
20 años, 20 a 30 años, más de 30 años)*/
CREATE OR ALTER PROCEDURE pusuRangoUsuarios
AS
BEGIN
	SELECT 
		COUNT(*) AS TotalUsuarios,
		CASE
			WHEN fecha_nacimiento >= '2000-01-01' AND fecha_nacimiento < '2010-01-01' THEN '2000s'
			WHEN fecha_nacimiento >= '1990-01-01' AND fecha_nacimiento < '2000-01-01' THEN '1990s'
			WHEN fecha_nacimiento >= '1980-01-01' AND fecha_nacimiento < '1990-01-01' THEN '1980s'
			ELSE 'Anterior a los 80s'
		END AS RangoFechas
	FROM usuarios.USUARIO
	GROUP BY
		CASE
			WHEN fecha_nacimiento >= '2000-01-01' AND fecha_nacimiento < '2010-01-01' THEN '2000s'
			WHEN fecha_nacimiento >= '1990-01-01' AND fecha_nacimiento < '2000-01-01' THEN '1990s'
			WHEN fecha_nacimiento >= '1980-01-01' AND fecha_nacimiento < '1990-01-01' THEN '1980s'
			ELSE 'Anterior a los 80s'
		end

	SELECT 
		COUNT(*) AS TotalUsuarios,
		CASE
			WHEN edad BETWEEN 10 AND 15 THEN '10-15 años'
			WHEN edad BETWEEN 16 AND 20 THEN '16-20 años'
			WHEN edad BETWEEN 21 AND 30 THEN '21-30 años'
			ELSE 'Más de 30 años'
		END AS RangoEdades
	FROM usuarios.USUARIO
	GROUP BY 
		CASE
			WHEN edad BETWEEN 10 AND 15 THEN '10-15 años'
			WHEN edad BETWEEN 16 AND 20 THEN '16-20 años'
			WHEN edad BETWEEN 21 AND 30 THEN '21-30 años'
			ELSE 'Más de 30 años'
		END;
END;

EXEC pusuRangoUsuarios

/*Inventario de las bicicletas (todos los datos de las bicicletas) por estaciones con
el número de viajes, por un periodo de tiempo, incluir el nuemro de accidentes
si ha tenido*/
CREATE OR ALTER PROCEDURE pusuBicicletas
AS
BEGIN
	select  b.idBicicleta, b.numero_serie, b.idColor, b.tamaño, b.estado, 
	e.nombreEstacion, count(v.idviaje) as VIAJES,count(a.idempleado) AS ACCIDENTE, h.fechainicio
	from bicicleta.BICICLETA b
	left join bicicleta.estacion e on b.idEstacion = e.idEstacion
	left join  usuarios.viaje v on v.idBicicleta = b.idBicicleta
	left join usuarios.accidente a on a.idViaje = v.idViaje
	left join usuarios.historicoViaje h on h.idViaje = v.idViaje
	where h.fechainicio between '2022-07-15' and '2022-08-15'
	group by b.idBicicleta, b.numero_serie, b.idColor, b.tamaño, b.estado,e.nombreEstacion, h.fechainicio
	order by idBicicleta asc
END 

EXEC pusuBicicletas
--Listado de usuarios (datos generales), datos de su membresía y el tiempo en meses que tienen la membresia

CREATE OR ALTER PROCEDURE pusuUsuarios
AS
BEGIN
	SELECT DISTINCT u.apellidop+' '+isnull(u.apellidom,'-')+' '+u.nombre as nombreUsuario,
	case u.genero
		WHEN 'H' THEN 'Hombre'
		WHEN 'M' THEN 'Mujer'
		ELSE '-'
		END as genero,
	u.edad,u.correo,t.telefono,m.idMembresia,datediff(month,fechaInicio,fechaFin)as Meses_con_Membresia,
	case m.tipoSeguro
		WHEN 'B' THEN 'BASICA'
		WHEN 'I' THEN 'INETERMEDIA'
		WHEN 'P' THEN 'PREMIUM'
		ELSE '-'
		END as tipoMembresia
	from usuarios.usuario u
	inner join usuarios.telefono t on t.idUsuario = u.idUsuario
	inner join usuarios.tarjeta ta on ta.idTarjeta = u.idTarjeta
	inner join usuarios.membresia m on m.idTarjeta = ta.idTarjeta
	inner join usuarios.viaje v on v.idUsuario = u.idUsuario
	inner join usuarios.HISTORICOVIAJE hv on hv.idViaje=v.idViaje
	GROUP BY  u.apellidop+' '+isnull(u.apellidom,'-')+' '+u.nombre,u.genero,u.edad,u.correo,t.telefono,m.idMembresia,m.tipoSeguro,fechainicio, fechafin
END;

EXEC pusuUsuarios

  
--Agentes mejor recocidos en un mes especifico, para eso cada que un agente
--auxilia a un usuario en algún incidente el usuario llena una pequeña encuesta.
CREATE OR ALTER PROCEDURE pusuMejorEmpleado
AS
BEGIN
	select count(a.idEmpleado)as 'Total Accidentes Atendidos en el MES',s.nombre,s.paterno,s.mes_informe
	from usuarios.ACCIDENTE a
	inner join empleados.EMPLEADO s
	on a.idEmpleado=s.idEmpleado
	group by a.idEmpleado,s.nombre,s.paterno,s.mes_informe
	order by a.idEmpleado desc
END;

EXEC pusuMejorEmpleado
--Listado de empleados con su tipo

create or alter function empleados.f_empleado()
returns table 
as
return (select idEmpleado,tipoEmpleado
from empleados.empleado)
go 

CREATE OR ALTER PROCEDURE pusuEmpleadotipo
AS
BEGIN
  SELECT idEmpleado, tipoEmpleado
  FROM empleados.f_empleado();
END;

exec pusuEmpleadotipo


/*Informe de los recorridos, por estación y/o por periodo de tiempo (fecha inicio
y fecha fin); nombre del usuario, estación de partida, lugar de llegada, tiempo
en minutos del recorrido y costo*/ 
CREATE OR ALTER PROCEDURE pusuEstacionRe
AS
BEGIN
	select u.apellidop+' '+isnull(u.apellidom,'-')+' '+u.nombre as Nombre, v.estacion_inicio, v.estacion_fin, v.horaInicio, v.horaFin, h.fechaInicio, h.fechafin, 
	DATEDIFF(hour, v.horaInicio, v.horaFin) AS TiempoTotal,
	DATEDIFF(minute, v.horaInicio, v.horaFin) AS DiferenciaMinutos
	from usuarios.USUARIO u
	left join usuarios.VIAJE V on v.idUsuario = u.idUsuario
	left join usuarios.historicoviaje h on v.idViaje = h.idViaje
END;

exec pusuEstacionRe

/*Épocas del año con número de recorridos ordenados de mayor a menor*/

CREATE OR ALTER PROCEDURE pusuRECORRIDOS
AS
BEGIN
	SELECT 'Agosto' AS Mes, COUNT(idViaje) AS NumeroViajes
	FROM usuarios.VIAJE
	WHERE fecha BETWEEN '2022-08-01' AND '2022-08-31'
	UNION ALL
	SELECT 'Julio' AS Mes, COUNT(idViaje) AS NumeroViajes
	FROM usuarios.VIAJE
	WHERE fecha BETWEEN '2022-07-01' AND '2022-07-31'
END;

exec pusuRECORRIDOS


/*Obtener pada cada agente sus datos personales y el listado de los accidentes
que han atendido (tipo de accidente, fecha, lugar)*/

CREATE OR ALTER PROCEDURE pusuAccidenteEmpleado
AS
BEGIN
  SELECT
    e.paterno + ' ' + ISNULL(e.materno, '-') + ' ' + e.nombre AS Nombre,
    a.idAccidente,
    a.fecha,
    a.hora,
    a.colonia + ' ' + a.alcaldia + ' ' + a.calle AS Lugar
  FROM
    empleados.auxiliar ax
    LEFT JOIN empleados.empleado e ON e.idEmpleado = ax.idEmpleado
    LEFT JOIN usuarios.accidente a ON a.idEmpleado = ax.idEmpleado;
END;
    
exec pusuAccidenteEmpleado

create or alter view bicicleta.v_BicisNegras
as
select count(a.color) as Numero_Bicis_Negras from bicicleta.BICICLETA as b
join bicicleta.COLOR as a on a.idColor=b.idColor
where b.idColor=4
go
   
select * FROM bicicleta.v_BicisNegras;

create or alter view empleados.vNombresCompletos
as
select (nombre+' '+paterno+' '+isnull(materno, '-- Sin Materno --')) as Nombre_Completo
from empleados.EMPLEADO
go

select * from empleados.vNombresCompletos

create or alter view usuarios.Info
as
select (nombre+' '+apellidop+' '+isnull(apellidom, '-- Sin Materno --')) as Nombre_Completo,(DATEDIFF(year,fecha_nacimiento,getdate())) as Edad 
from usuarios.USUARIO
go

select * from usuarios.Info

valida triggers
 CREATE OR ALTER TRIGGER empleados.trmantenimiento  
ON empleados.mantenimiento 
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (SELECT idempleado FROM empleados.auxiliar 
			   WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en auxiliar' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.mantenimiento 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en mantenimiento' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.administracion 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en administracion' AS mensaje
	END

	ELSE IF NOT EXISTS (SELECT idempleado FROM empleados.EMPLEADO 
						WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado no existe' AS mensaje
	END

	ELSE
	BEGIN
		INSERT INTO empleados.mantenimiento (idEmpleado, especialidad)
		SELECT idEmpleado, especialidad FROM inserted
		
		SELECT 'Se insertaron el empleado en mantenimiento' AS mensaje
	END
END

insert into empleados.mantenimiento
values (7,'Reparacion')

select * from empleados.mantenimiento


--------------------AUXILIAR-------------------
CREATE OR ALTER TRIGGER empleados.trauxiliar  
ON empleados.auxiliar
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (SELECT idempleado FROM empleados.auxiliar 
			   WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en auxiliar' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.mantenimiento 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en mantenimiento' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.administracion 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en administracion' AS mensaje
	END

	ELSE IF NOT EXISTS (SELECT idempleado FROM empleados.EMPLEADO 
						WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado no existe' AS mensaje
	END

	ELSE
	BEGIN
		INSERT INTO empleados.auxiliar (idEmpleado, horario)
		SELECT idEmpleado, horario FROM inserted
		
		SELECT 'Se insertaron el empleado en auxiliar' AS mensaje
	END
END

insert into empleados.auxiliar
values (22,'Lunes a martes')

select * from empleados.auxiliar

--------------------ADMINISTRATIVO-------------
CREATE OR ALTER TRIGGER empleados.tradministracion  
ON empleados.administracion
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (SELECT idempleado FROM empleados.auxiliar 
			   WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en auxiliar' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.mantenimiento 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en mantenimiento' AS mensaje
	END

	ELSE IF EXISTS (SELECT idempleado FROM empleados.administracion 
					WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado ya está en administracion' AS mensaje
	END

	ELSE IF NOT EXISTS (SELECT idempleado FROM empleados.EMPLEADO 
						WHERE idempleado IN (SELECT idempleado FROM inserted))
	BEGIN 
		SELECT 'El empleado no existe' AS mensaje
	END

	ELSE
	BEGIN
		INSERT INTO empleados.administracion (idEmpleado, trabajoRealizado, lugarTrabajo)
		SELECT idEmpleado, trabajoRealizado, lugarTrabajo FROM inserted
		
		SELECT 'Se insertaron el empleado en administracion' AS mensaje
	END
END

insert into empleados.administracion
values (21,'sis','mexico')

select * from empleados.administracion


-------------
CREATE OR ALTER TRIGGER usuarios.trTarjeta
ON usuarios.TARJETA
AFTER UPDATE
AS
BEGIN
    -- Verificar si se actualizó el tipoTarjeta de 'N' a 'R' y el precio de 50 a 80
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE tipoTarjeta = 'R' AND precioTarjeta = 80
    )
    BEGIN
        -- Actualizar los registros en la tabla
        UPDATE tar
        SET tipoTarjeta = 'R', precioTarjeta = 80
        FROM usuarios.TARJETA AS tar
        INNER JOIN inserted AS ins ON tar.idTarjeta = ins.idTarjeta
        WHERE ins.tipoTarjeta = 'N' AND ins.precioTarjeta = 50;
        
        -- Mostrar mensaje de actualización
        SELECT 'Tipo de tarjeta actualizado';
    END
END;

update usuarios.TARJETA
set tipoTarjeta = 'R', precioTarjeta = 80
where idTarjeta = 102

select * from usuarios.TARJETA
