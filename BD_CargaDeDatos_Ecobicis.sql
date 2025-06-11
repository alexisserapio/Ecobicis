begin tran
insert into empleados.EMPLEADO (idSupervisor, nombre, paterno, materno, rfc, correo, tipoEmpleado, telefono, genero, edad, estadoCivil, alcaldia, calle, num_exterior, num_interior, colonia, mes_informe, año_informe, sueldo)
values 
	-------------------------------------------SUPERVISOR------------
	(null,'Estefania','Mateos','Perez', 'ETHY726DV10U4','FannyGG@gmail.com', null, 5526197263, 'M', 18, 'C', 'Nezahualcoyotl', 'Santa Maria', '12', null, 'Ruiz', 05, 2022, 27000),
	(null,'Maria','Cuairan ','Ruidiaz', 'MCRGOD423E78R','maria123@gmail.com', null, 5521826598, 'M', 57, 'C', 'Coyoacán', 'Calle Génova', '58', null, 'Doctores', 05, 2023, 20000),
	(null,'Alberto','Moral','Poli', 'GT26S7TPLV281','AlbertWesker@gmail.com', null, 5627819273, 'H', 21, 'C', 'Los reyes', 'Bimbolo', '44', null, 'Barrio Tepalcates', 04, 2023, 8000),
	(null,'Jorge','Lopez','Garcia', 'JLLG0123GOD07','diosJL@gmail.com', null, 5579043646, 'H', 35, 'C', 'Álvaro Obregón', 'San Jose', '07', null, 'Las Palmas', 06, 2023, 17500),
	(null,'Alexis','Serapio','Hernandez', 'AASH789121W1','serapio@gmail.com', null, 5556612552, 'H', 21, 'C', 'Coyoacán', 'San Mateo', '47', '05', 'San Juan', 02, 2023, 14000),
		-----------------MANTENIMEINTO-------------------------------------------------------------

	(1,'Alicia','Rosa','Gonzalez', 'ISDF850423NHR','aliciamaravillas11@gmail.com', 'M', 5544098340, 'M', 42, 'S', 'Iztapalapa', 'Calle Madero', '07', null, 'Actipan', 04, 2023, 7000),
	(2,'Elsa','Ruth', null, 'LANH920113D3N','elsaeco@gmail.com', 'M', 5543533010, 'M', 35, 'C', 'Venustiano Carranza', 'Calle Génova', '07', '33', '7 De Julio', 01, 2023, 9000),
	(3,'Jorge','Rodriguez','Campos', 'JRCDI05ASDXZN','elmeromero@gmail.com', 'M', 5506819002, 'H', 47, 'C', 'Iztapalapa', 'Calle Madero', '07', null, 'Simon Bolivar', 03, 2023, 15000),
	(4,'Daniel','Maya','Aguilar', 'UJIO891123JUY','quintilliza5@gmail.com', 'M', 5551535935, 'H', 23, 'V', 'Venustiano Carranza', 'San Jose', '07', null, 'Emilio Carranza', 06, 2023, 9000),
	(5,'Nacho','Ramirez', null, 'SEDF800512KIU','elnachoxsera@gmail.com', 'M', 5543780899, 'H', 21, 'C', 'Coyoacán', 'San Mateo', '47', '05', 'San Juan', 02, 2023, 7500),



	-----------------AUXILIAR-------------------------------------------------------------
	(1,'Elizabeth','Fonseca', null, 'IJUY880727K87','telecomunicaciones@gmail.com', 'A', 5533137681, 'M', 63, 'D', 'Álvaro Obregón', 'San Jose', '08', null, 'Santa Maria', 05, 2023, 8000),
	(2,'Natalia','Garcia','Elsy', 'DGTH851128Y7U','Natilla@gmail.com', 'A', 5593882225, 'M', 22, null, 'Iztapalapa', 'Masaryk', '07', null, 'Roma Norte', 01, 2023, 9000),
	(3,'Norma','Elva','Chavez', 'AVD123DAAS45S',null, 'A', 5575610998, 'M', 62, null, 'Iztacalco', 'San Jose', '07', null, 'Obrera', 03, 2023, 6000),
	(4,'Juan','Martinez','Miranda', 'SFDF36733DG42','sierra69@gmail.com', 'A', 5578901325, 'H', 21, 'S', 'Benito Juárez', 'Calle Génova', '07', null, 'Guerrero', 12, 2022, 6000),
	(5,'Juan','Pablo', null, 'FUBI23GICPH7W','jpchango22@gmail.com', 'A', 5583302791, 'H', 23, 'S', 'Benito Juárez', 'Masaryk', '07', null, 'Doctores', 06, 2022, 5500),
	-------------------------------ADMINISTRATIVOS--------------------------------------------
	(2,'Sabrina','Lopez','Garcia', 'SDT34FISJER2D','Sabrina12@gmail.com', 'X', 5531038939, 'M', 21, 'V', 'Gustavo A. Madero', 'Ámsterdam', '07', null, 'Xoco', 10, 2022, 7500),
	(3,'Valeria','Alvarado','Flores', 'L9K3NVI8W8JE8','valeAF2@gmail.com', 'X', 5571690930, 'M', 33, 'C', 'Álvaro Obregón', 'Avenida Juárez', '07', '25', 'Santa Ursula', 11, 2022, 8000),
	(4,'Karen','Ortiz', null, 'LM93JA83WSD3R','lakaren77@gmail.com', 'X', 5519312769, 'M', 29, 'C', 'Iztacalco', 'Paseo de la Reforma', '07', null, 'La Primavera', 06, 2022, 7000),
	(4,'Nathan','Drake','Leyenda', 'NTSJ1763RT268','Nathanuncharted@gmail.com', 'X', 5526172983, 'M', 24, 'D', 'Iztapalapa', 'Lacra', '09', null, 'Los Patos', 05, 2023, 40000),
	(5,'Lucila','Arellano','Mendoza', 'CWD9I93ASD93D','Lucilazz21@gmail.com', 'X', 5565333654, 'M', 46, 'D', 'Iztacalco', 'Ámsterdam', '07', null, 'El Arenal', 04, 2023, 5500)
	select * from empleados.EMPLEADO
--rollback tran 
commit tran
go

DBCC CHECKIDENT ('empleados.Empleado', NORESEED);
GO 

DBCC CHECKIDENT ('empleados.Empleado', RESEED,0);
go

------ MANTENIMIENTO ---------------------------------

begin tran
insert into empleados.MANTENIMIENTO
values 
	(6,'Reparacion'),
	(7,'Limpieza'),
	(8,'Transporte'),
	(9,'Reparacion'),
	(10,'Transporte')
	select * from empleados.MANTENIMIENTO
	select *from  empleados.EMPLEADO
--rollback tran 
commit tran
go
  
------ AUXILIAR ---------------------------------
------ Hacer consistente el numero de accidentes al hacer los insert accidentes 
begin tran
insert into empleados.AUXILIAR
values 
	(11, 'LUNES A VIERNES'),
	(12,'MARTES A JUEVES'),
	(13,'SABADO Y DOMINGO'),
	(14,'LUNES A MIERCOLES'),
	(15,'LUNES Y VIERNES')
	select * from empleados.AUXILIAR
--rollback tran 
commit tran
go

------ ADMINISTRATIVO ---------------------------------
begin tran
insert into empleados.ADMINISTRACION   
values 
	(16,'Administrar Datos','Oficina Central'),
	(17,'Actualizar Registros','Oficina Central'),
	(18,'Consulta Presupuesto','Estacion'),
	(19,'Organizador','Oficinas'),
	(20,'Atencion al cliente','Estacion')
	select * from empleados.ADMINISTRACION   
--rollback tran 
commit tran
go
 
------ IDIOMAS ----------------------------------------
begin tran
insert into empleados.IDIOMA
values 
	(1,'Español'),
	(2,'Ingles'),
	(3,'Frances'),
	(4,'Aleman'),
	(5,'Japones'),
	(6,'Coreano'),
	(7,'Chino'),
	(8,'Portugues'),
	(9,'Italiano'),
	(10,'Nahuatl')
	select * from empleados.IDIOMA
--rollback tran 
commit tran
go

---------IDIOMA_EMPLEADO-----------
begin tran
insert into empleados.IDIOMA_EMPLEADO
values 
	(1,1),(1,2),
	(2,1),(2,6),(2,5),(2,4),
	(3,1),(3,10),(3,7),
	(4,1),
	(5,1),(5,3),
	(6,1),(6,8),
	(7,1),
	(8,1),
	(9,1),
	(10,1),(10,8),
	(11,1),
	(12,1),
	(13,1),
	(14,1),(14,6),
	(15,1),
	(16,1),
	(17,1),(17,4),
	(18,1),
	(19,1),
	(20,1),(20,4),(20,6)
select *from empleados.IDIOMA_EMPLEADO
--rollback 
commit tran
go

  
  -----------MOTIVO_FALTA---------
begin tran
insert into empleados.Motivo_Falta
values 
	(1,'Enfermedad'),
	(2,'Lesion'),
	(3,'Asunto Familiar'),
	(4,'Reposo por cirugia'),
	(5,'Percance traslado')
	select * from empleados.Motivo_Falta
--rollback tran 
commit tran
go
  ------------------------------------------------------------------
  begin tran
insert into empleados.HISTORICO_FALTA (idEmpleado, idMotivo, fechaFalta )
values 
	(1, 1, '2022-12-05'),
	(1, 1, '2022-11-18'),
	(1, 2, '2022-04-07'),
	(1, 5, '2022-02-17'),
----------------------------------
	(2, 1, '2022-12-30'),
	(2, 2, '2022-05-02'),
-----------------------------------
	(3, 1, '2022-10-01'),
	(3, 2, '2022-07-02'),
	(3, 2, '2022-02-14'),
-------------------------------------
	(5, 1, '2022-12-05'),
-------------------------------------
	(9, 1, '2022-06-13'),
------------------------------------
	(10, 2, '2022-08-09'),
---------------------------------
	(12, 3, '2022-06-16'),
	(12, 2, '2022-04-27'),
------------------------------------------
	(13, 5, '2022-08-31'),
	(17, 4, '2022-11-27'),
	(18, 5, '2022-01-12'),
	(20, 1, '2022-05-25'),
	(8, 4, '2022-08-16'),
	(17, 5, '2022-06-29')

select * from empleados.HISTORICO_FALTA
--rollback tran 
commit tran
go
-------------------ESTACION----------------------------------------------------------
  
begin tran
insert into bicicleta.ESTACION(idestacion,idempleado,unidades_bicicleta,numero_terminal,bicis_transito,concurrido,dias_concurridos,temporada_concurrida, nombreEstacion)
values 
	(1,1,8,043,5,'B','L-M','PRIMAVERA','NORTE'),
	(2,2,8,044,6,'B','M','PRIMAVERA','SUR'),
	(3,3,8,045,2,'A','M-M-J-V-D','OTOÑO','CENTRAL'),
	(4,4,8,046,0,'A','L-M-M-J-S-D','INVIERNO','ESTE'),
	(5,5,8,047,3,'A','M-J-V-S','VERANO','OESTE')
	select * from bicicleta.ESTACION
--rollback tran 
commit tran
go
-------------------------------COLOR BICICLETA---------------------------------
begin tran
insert into bicicleta.color
values 
	(1,'Verde'),
	(2,'Roja'),
	(3,'Azul'),
	(4,'Negro')

	select * from bicicleta.COLOR
--rollback tran 
commit tran
go


---------------------------------------BICICLETAS-----------------------------------------------

begin tran
INSERT INTO bicicleta.BICICLETA (idBicicleta, numero_serie, idEmpleado, idColor, idEstacion, tamaño, estado)
VALUES
  (1, 1001, 1, 1, 1, 'C', 'D'),
  (2, 1002, 1, 2, 1, 'M', 'F'),
  (3, 1003, 1, 3, 1, 'G', 'B'),
  (4, 1004, 1, 4, 1, 'C', 'D'),
  (5, 1005, 1, 1, 1, 'M', 'F'),
  (6, 1006, 1, 2, 1, 'G', 'B'),
  (7, 1007, 1, 3, 1, 'C', 'D'),
  (8, 1008, 1, 4, 1, 'M', 'F'),
  (9, 1009, 2, 1, 2, 'G', 'B'),
  (10, 1010, 2, 2, 2, 'C', 'D'),
  (11, 1011, 2, 3, 2, 'M', 'F'),
  (12, 1012, 2, 4, 2, 'G', 'B'),
  (13, 1013, 2, 1, 2, 'C', 'D'),
  (14, 1014, 2, 2, 2, 'M', 'F'),
  (15, 1015, 2, 3, 2, 'G', 'B'),
  (16, 1016, 2, 4, 2, 'C', 'D'),
  (17, 1017, 3, 1, 3, 'M', 'F'),
  (18, 1018, 3, 2, 3, 'G', 'B'),
  (19, 1019, 3, 3, 3, 'C', 'D'),
  (20, 1020, 3, 4, 3, 'M', 'F'),
  (21, 1021, 3, 1, 3, 'G', 'B'),
  (22, 1022, 3, 2, 3, 'C', 'D'),
  (23, 1023, 3, 3, 3, 'M', 'F'),
  (24, 1024, 3, 4, 3, 'G', 'B'),
  (25, 1025, 4, 1, 4, 'C', 'D'),
  (26, 1026, 4, 2, 4, 'M', 'F'),
  (27, 1027, 4, 3, 4, 'G', 'B'),
  (28, 1028, 4, 4, 4, 'C', 'D'),
  (29, 1029, 4, 1, 4, 'M', 'F'),
  (30, 1030, 4, 2, 4, 'G', 'B'),
  (31, 1031, 4, 3, 4, 'C', 'D'),
  (32, 1032, 4, 4, 4, 'M', 'F'),
  (33, 1033, 5, 1, 5, 'G', 'B'),
  (34, 1034, 5, 2, 5, 'C', 'D'),
  (35, 1035, 5, 3, 5, 'M', 'F'),
  (36, 1036, 5, 4, 5, 'G', 'B'),
  (37, 1037, 5, 1, 5, 'C', 'D'),
  (38, 1038, 5, 2, 5, 'M', 'F'),
  (39, 1039, 5, 3, 5, 'G', 'B'),
  (40, 1040, 5, 4, 5, 'C', 'D');
select * from bicicleta.BICICLETA
--rollback tran 
commit tran
go

----------------------------------------USUARIOS.TARJETA----------------------------------
begin tran
INSERT INTO Usuarios.TARJETA (idTarjeta,tipoTarjeta,metodopago,precioTarjeta)
VALUES

  (100, 'N', 'P',50),
  (101, 'N', 'T',50),
  (102, 'R', 'P',80),
  (103, 'R', 'T',80),
  (104, 'R', 'P',80),
  (105, 'N', 'T',50),
  (106, 'R', 'T',80),
  (107, 'R', 'T',80),
  (108, 'N', 'P',50),
  (109, 'R', 'T',80)
select * from Usuarios.TARJETA
--rollback tran 
commit tran
go

---------historicos de mantenimientos --------------------------------

BEGIN TRY
    begin tran
insert into empleados.HISTORICO_MANTENIMIENTO
values 
	(1,6,1,'Reparacion'),
	(2,6,3,'Limpieza'),
	(3,6,1,'Transporte'),
	(4,6,2,'Transporte'),
	(5,6,6,'Limpieza'),
	(6,7,9,'Limpieza'),
	(7,7,9,'Transporte'),
	(8,7,10,'Limpieza'),
	(9,7,4,'Reparacion'),
	(10,7,7,'Reparacion'),
	(11,7,12,'Limpieza'),
	(12,7,13,'Reparacion'),
	(13,7,16,'Reparacion'),
	(14,7,15,'Limpieza'),
	(15,8,19,'Reparacion'),
	(16,8,18,'Limpieza'),
	(17,8,12,'Transporte'),
	(18,8,22,'Reparacion'),
	(19,8,7,'Transporte'),
	(20,8,25,'Reparacion'),
	(21,9,21,'Limpieza'),
	(22,9,28,'Reparacion'),
	(23,9,37,'Transporte'),
	(24,9,31,'Reparacion'),
	(25,9,24,'Limpieza'),
	(26,9,34,'Reparacion'),
	(27,9,27,'Limpieza'),
	(28,9,10,'Transporte'),
	(29,9,10,'Transporte'),
	(30,9,37,'Reparacion'),
	(31,10,40,'Reparacion'),
	(32,10,07,'Transporte'),
	(33,10,21,'Transporte'),
	(34,10,30,'Limpieza'),
	(35,10,10,'Reparacion'),
	(36,10,33,'Limpieza'),
	(37,10,23,'Transporte'),
	(38,10,4,'Transporte'),
	(39,10,36,'Limpieza'),
	(40,10,34,'Transporte')	
	select * from empleados.HISTORICO_MANTENIMIENTO
--rollback tran 
	commit tran
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN;

    print 'PK duplicada' 
END CATCH;




-----------------------------------------------Usuarios.Usuario--------------------
 begin tran
INSERT INTO usuarios.USUARIO (codigoINE, correo, edad, genero, fecha_nacimiento, nombre, apellidop, apellidom, idTarjeta, app)
VALUES
  ('4J2H8N6K0R3T9P7Q2F5H', 'usuario1@gmail.com', 25, 'H', '1998-05-10', 'Juan', 'Pérez', 'Gómez', 100, null ),
  ('9S5T3R1L7I0P4M2N6B8V', 'usuario2@gmail.com', 30, 'M', '1993-08-15', 'María', 'López', 'García', 101, null ),
  ('3X8Z5V7C2J0K6L4M9N1B', 'usuario3@gmail.com', 22, 'H', '1999-02-28', 'Pedro', 'Martínez', 'Ramírez', 102, 'C'),
  ('0A4S6D9F2G8H3J7K5L1M', 'usuario4@gmail.com', 28, 'M', '1995-11-20', 'Ana', 'González', 'Torres', 103, null ),
  ('6H2J8N4L0I3P9O1U7Y5T', 'usuario5@gmail.com', 35, 'H', '1988-07-03', 'Luis', 'Rodríguez', 'Sánchez', 104, null ),
  ('7Z5X2C4V8B6N9M0Q1W3E', 'usuario6@gmail.com', 31, 'M', '1992-12-18', 'Laura', 'Hernández', 'Vargas', 105, 'R'),
  ('2R4T8Y5U0I3O9P1L7K6J', 'usuario7@gmail.com', 29, 'H', '1994-09-25', 'Sofía', 'Díaz', 'Juárez', 106, null ),
  ('5Q7W9E2R4T0Y3U8I1O6P', 'usuario8@gmail.com', 27, 'M', '1996-04-14', 'Carlos', 'Ramírez', 'López', 107, null ),
  ('1A3S5D7F9G2H4J6K8L0Z', 'usuario9@gmail.com', 33, 'H', '1990-03-08', 'Marcela', 'García', 'Pérez', 108, null ),
  ('8X6C4V2B0N9M7J5H3G1F', 'usuario10@gmail.com', 26, 'M', '1997-06-22', 'David', 'Torres', 'González', 109, null )
  select *from usuarios.USUARIO
--rollback tran 
commit tran
go

--------------------------------------------VIAJE---------------------------------------------------
begin tran
INSERT INTO usuarios.VIAJE (idUsuario, idBicicleta, fecha, estacion_inicio, estacion_fin, horaInicio, horaFin, tarifaAdicional, ruta)
VALUES 
(1,1, '2022-07-15', 'NORTE', 'SUR', '07:22:32', '14:05:03', 0, 'Reforma'),
(1,2, '2022-07-16', 'SUR', 'ESTE', '09:12:45', '12:30:15', 0, 'Avenida Juarez'),
(1,3, '2022-07-17', 'CENTRAL', 'OESTE', '11:05:21', '15:45:09', 0, 'Paseo de la Reforma'),
(1,4, '2022-07-18', 'NORTE', 'SUR', '14:30:10', '16:45:28', 0, 'Avenida Insurgentes'),
(1,5, '2022-07-19', 'ESTE', 'OESTE', '08:15:59', '09:50:47', 0, 'Avenida Reforma'),
(2,6, '2022-07-20', 'SUR', 'CENTRAL', '10:20:30', '12:05:40', 0, 'Avenida Chapultepec'),
(2,7, '2022-07-21', 'NORTE', 'ESTE', '13:40:55', '15:30:12', 0, 'Avenida Juarez'),
(2,8, '2022-07-22', 'OESTE', 'SUR', '16:15:28', '18:20:09', 0, 'Paseo de la Reforma'),
(3,9, '2022-07-23', 'CENTRAL', 'NORTE', '09:05:40', '11:35:27', 0, 'Avenida Insurgentes'),
(3,10, '2022-07-24', 'ESTE', 'SUR', '12:50:18', '15:10:55', 0, 'Avenida Reforma'),
(4,11, '2022-07-25', 'SUR', 'ESTE', '07:30:05', '09:15:40', 0, 'Avenida Juarez'),
(4,12, '2022-07-26', 'CENTRAL', 'OESTE', '10:45:27', '13:20:59', 0, 'Paseo de la Reforma'),
(4,13, '2022-07-27', 'NORTE', 'SUR', '14:10:38', '16:40:12', 0, 'Avenida Insurgentes'),
(4,14, '2022-07-28', 'ESTE', 'CENTRAL', '17:05:16', '18:45:29', 0, 'Avenida Chapultepec'),
(5,15, '2022-07-29', 'OESTE', 'SUR', '08:25:50', '10:10:17', 0, 'Avenida Juarez'),
(5,16, '2022-07-30', 'CENTRAL', 'ESTE', '11:40:30', '14:05:48', 0, 'Paseo de la Reforma'),
(6,17, '2022-07-31', 'NORTE', 'OESTE', '14:30:12', '16:55:29', 0, 'Avenida Insurgentes'),
(6,18, '2022-08-01', 'SUR', 'CENTRAL', '17:45:20', '19:20:37', 0, 'Avenida Chapultepec'),
(6,19, '2022-08-02', 'ESTE', 'NORTE', '09:15:30', '11:30:59', 0, 'Avenida Reforma'),
(6,20, '2022-08-03', 'SUR', 'ESTE', '12:40:22', '14:55:10', 0, 'Avenida Juarez'),
(7,1, '2022-08-04', 'CENTRAL', 'OESTE', '07:55:12', '10:10:49', 0, 'Paseo de la Reforma'),
(7,2, '2022-08-05', 'NORTE', 'SUR', '11:20:10', '13:35:27', 0, 'Avenida Insurgentes'),
(8,3, '2022-08-06', 'ESTE', 'CENTRAL', '14:05:30', '16:20:49', 0, 'Avenida Chapultepec'),
(8,4,'2022-08-07', 'OESTE', 'SUR', '17:30:18', '19:45:22', 0, 'Avenida Juarez'),
(8,5, '2022-08-08', 'CENTRAL', 'ESTE', '09:10:55', '11:25:30', 0, 'Paseo de la Reforma'),
(9,6, '2022-08-09', 'SUR', 'NORTE', '12:15:22', '14:30:18', 0, 'Avenida Insurgentes'),
(9,7, '2022-08-10', 'ESTE', 'SUR', '15:05:38', '17:20:52', 0, 'Avenida Reforma'),
(9,8, '2022-08-11', 'OESTE', 'CENTRAL', '17:50:09', '19:55:36', 0, 'Avenida Chapultepec'),
(10,9, '2022-08-12', 'CENTRAL', 'NORTE', '08:40:20', '10:55:45', 0, 'Avenida Juarez'),
(2,10,'2022-08-13', 'SUR', 'ESTE', '11:45:30', '14:10:59', 0, 'Paseo de la Reforma'),
(3,11, '2022-08-14', 'NORTE', 'SUR', '07:30:18', '09:45:40', 0, 'Avenida Insurgentes'),
(4,12, '2022-08-15', 'ESTE', 'CENTRAL', '10:55:28', '13:20:50', 0, 'Avenida Chapultepec'),
(5,13,'2022-08-16', 'SUR', 'OESTE', '14:40:10', '16:55:27', 0, 'Avenida Juarez'),
(6,14,'2022-08-17', 'NORTE', 'ESTE', '17:30:48', '19:45:59', 0, 'Avenida Reforma'),
(7,15, '2022-08-18', 'CENTRAL', 'SUR', '09:15:35', '11:30:18', 0, 'Paseo de la Reforma'),
(8,16, '2022-08-19', 'ESTE', 'NORTE', '12:10:22', '14:25:38', 0, 'Avenida Insurgentes'),
(9,17, '2022-08-20', 'SUR', 'CENTRAL', '15:05:55', '17:20:40', 0, 'Avenida Chapultepec'),
(10,18, '2022-08-21', 'OESTE', 'SUR', '17:50:20', '19:55:42', 0, 'Avenida Juarez'),
(5,19, '2022-08-22', 'CENTRAL', 'ESTE', '08:40:10', '10:55:28', 0, 'Paseo de la Reforma'),
(2,20, '2022-08-24', 'OESTE', 'ESTE', '13:10:10', '18:14:48', 0, 'Paseo de la Reforma');
select * from usuarios.VIAJE
--rollback tran 
commit tran
go

 -----------TIPO_ACCIDENTE---------
begin tran
insert into usuarios.TIPO_ACCIDENTE
values 
	(1,'Colision con Vegetación'),
	(2,'Colision con Letreros'),
	(3,'Falla Mecanica en Bicicleta'),
	(4,'Colision entre Bicicletas'),
	(5,'Caída resbaladiza'),
	(6,'Colisión con peatones'),
	(7,'Atropello'),
	(8,'Colision con Vehiculo')
	select * from usuarios.TIPO_ACCIDENTE
--rollback tran 
commit tran
go

----------------------------------------------------
select * from usuarios.VIAJE

select * from empleados.EMPLEADO

select * from empleados.AUXILIAR

—---------------------ACCIDENTE—---------------------------
begin tran
insert into usuarios.ACCIDENTE (idAccidente,idEmpleado,idViaje,idTipoAccidente,fecha,hora,codigo_postal, colonia, alcaldia, numero, coordenadas, calle)
values 
	(1,11,1,1,'2022-07-15','11:39:55',716,'Reforma','Gustavo A. Madero',12,1744.2111,'Santa Maria'),
	(2,11,3,2,'2022-07-17','12:23:42',716,'Ixtlahualtongo','Benito Juarez',24,7444.2751,'Calle Génova'),
	(3,12,5,3,'2022-07-19','08:39:55',516,'La Preciosa','Iztacalco',11,1514.2011,'Bimbolo'),
	(4,12,7,4,'2022-07-21','14:17:12',516,'Providencia','Iztacalco',45,1428.7842,'San Jose'),
	(5,13,9,5,'2022-07-23','10:07:42',216,'Lomas De Vista','Benito Juarez',74,1538.6826,'San Mateo'),
	(6,13,11,6,'2022-07-25','08:45:07',416,'Puerto Las Cruces','Alvaro Obregon',23,1740.6483,'Calle Madero'),
	(7,13,13,7,'2022-07-27','15:28:14',717,'Santiago Atepetlac','Gustavo A. Madero',33,1638.2298,'Santa Maria'),
	(8,13,15,8,'2022-07-29','09:07:52',215,'Lomas De Capulin','Benito Juarez',54,1528.0506,'Masaryk'),
	(9,13,17,1,'2022-07-31','15:59:02',717,'Providencia','Gustavo A. Madero',75,1207.4971,'Santa Cleopatra'),
	(10,14,19,2,'2022-08-02','11:17:47',718,'Ixtlahualtongo','Gustavo A. Madero',85,1399.7837,'Ámsterdam'),
	(11,14,21,3,'2022-08-04','09:10:49',216,'La Preciosa','Benito Juarez',96,1593.4405,'Lacra'),
	(12,14,23,4,'2022-08-06','16:02:36',416,'Reforma','Alvaro Obregon',42,1478.4216,'Paseo de la Reforma'),
	(13,14,25,5,'2022-08-08','10:00:42',719,'La Joya','Gustavo A. Madero',45,1593.3359,'Ámsterdam'),
	(14,15,27,6,'2022-08-10','16:11:33',416,'Puerto Las Cruces','Alvaro Obregon',12,1252.0448,'Calle Génova'),
	(15,15,29,7,'2022-08-12','09:39:07',216,'Reforma','Benito Juarez',78,1985.6002,'San Jose'),
	(16,15,31,8,'2022-08-14','08:00:48',516,'La Preciosa','Iztacalco',63,1258.3263,'Masaryk'),
	(17,15,33,1,'2022-08-16','15:24:26',714,'Reforma','Gustavo A. Madero',42,1639.3263,'San Mateo'),
	(18,15,35,2,'2022-08-18','09:41:47',416,'Ixtlahualtongo','Alvaro Obregon',78,1896.3263,'Calle Madero'),
	(19,15,37,3,'2022-08-20','16:39:55',716,'Puerto Las Cruces','Benito Juarez',36,1475.3528,'San Jose')

	select * from usuarios.ACCIDENTE
--rollback tran 
commit tran
go

------------------------------------------HISTORICOVIAJE---------------------------------

begin tran
insert into usuarios.HISTORICOVIAJE (idHistViaje, idViaje, fechaInicio, fechaFin, altitud, longitud)
values 
	(1, 1, '2022-07-15 07:22:32', '2022-07-15 14:05:03', 123.456, 45.678),
	(2, 2, '2022-07-16 09:12:45', '2022-07-16 12:30:15', 828.202, 34.271),
	(3, 3, '2022-07-17 11:05:21', '2022-07-17 15:45:09', 541.111, 53.071),
	(4, 4, '2022-07-18 14:30:10', '2022-07-18 16:45:28', 161.222, 73.024),
	(5, 5, '2022-07-19 08:15:59', '2022-07-19 09:50:47', 192.584, 79.882),
	(6, 6, '2022-07-20 10:20:30', '2022-07-20 12:05:40', 825.578, 40.287),
	(7, 7, '2022-07-21 13:40:55', '2022-07-21 15:30:12', 217.225, 48.797),
	(8, 8, '2022-07-22 16:15:28', '2022-07-22 18:20:09', 152.285, 13.128),
	(9, 9, '2022-07-23 09:05:40', '2022-07-23 11:35:27', 122.528, 126.087),
	(10, 10, '2022-07-24 12:50:18', '2022-07-24 15:10:55', 824.474, 227.507),
	(11, 11, '2022-07-25 07:30:05', '2022-07-25 09:15:40', 753.358, 621.391),
	(12, 12, '2022-07-26 10:45:27', '2022-07-26 13:20:59', 527.158, 83.245),
	(13, 13, '2022-07-27 14:10:38', '2022-07-27 16:40:12', 552.269, 21.778),
	(14, 14, '2022-07-28 17:05:16', '2022-07-28 18:45:29', 823.742, 28.634),
	(15, 15, '2022-07-29 08:25:50', '2022-07-29 10:10:17', 413.153, 38.093),
	(16, 16, '2022-07-30 11:40:30', '2022-07-30 14:05:48', 568.759, 43.679),
	(17, 17, '2022-07-31 14:30:12', '2022-07-31 16:55:29', 789.753, 57.531),
	(18, 18, '2022-08-01 17:45:20', '2022-08-01 19:20:37', 456.159, 47.893),
	(19, 19, '2022-08-02 09:15:30', '2022-08-02 11:30:59', 123.963, 52.889),
	(20, 20, '2022-08-03 12:40:22', '2022-08-03 14:55:10', 321.486, 127.400),
	(21, 21, '2022-08-04 07:55:12', '2022-08-04 10:10:49', 654.748, 66.347),
	(22, 22, '2022-08-05 11:20:10', '2022-08-05 13:35:27', 987.125, 54.106),
	(23, 23, '2022-08-06 14:05:30', '2022-08-06 16:20:49', 741.369, 99.546),
	(24, 24, '2022-08-07 17:30:18', '2022-08-07 19:45:22', 852.828, 50.877),
	(25, 25, '2022-08-08 09:10:55', '2022-08-08 11:25:30', 963.456, 40.209),
	(26, 26, '2022-08-09 12:15:22', '2022-08-09 14:30:18', 369.125, 34.717),
	(27, 27, '2022-08-10 15:05:38', '2022-08-10 17:20:52', 258.455, 56.741),
	(28, 28, '2022-08-11 17:50:09', '2022-08-11 19:55:36', 147.369, 87.824),
	(29, 29, '2022-08-12 08:40:20', '2022-08-12 10:55:45', 753.538, 77.537),
	(30, 30, '2022-08-13 11:45:30', '2022-08-13 14:10:59', 951.741, 96.518),
	(31, 31, '2022-08-14 07:30:18', '2022-08-14 09:45:40', 852.125, 65.180),
	(32, 32, '2022-08-15 10:55:28', '2022-08-15 13:20:50', 123.741, 73.096),
	(33, 33, '2022-08-16 14:40:10', '2022-08-16 16:55:27', 789.852, 52.089),
	(34, 34, '2022-08-17 17:30:48', '2022-08-17 19:45:59', 963.963, 10.140),
	(35, 35, '2022-08-18 09:15:35', '2022-08-18 11:30:18', 741.789, 38.747),
	(36, 36, '2022-08-19 12:10:22', '2022-08-19 14:25:38', 426.654, 66.337),
	(37, 37, '2022-08-20 15:05:55', '2022-08-20 17:20:40', 486.123, 22.038),
	(38, 38, '2022-08-21 17:50:20', '2022-08-21 19:55:42', 759.527, 62.967),
	(39, 39, '2022-08-22 08:40:10', '2022-08-22 10:55:28', 153.357, 78.445),
	(40, 40, '2022-08-23 13:10:10', '2022-08-23 18:14:48', 456.741, 82.291)
	select * from usuarios.HISTORICOVIAJE
--rollback tran 
commit tran
go

---------------------------------TELEFONO----------------------------------------------------

begin tran 
insert into usuarios.TELEFONO
values 
	(1,5528938276,1),
	(2,5531916627,2),
	(3,5526865532,3),
	(4,5594296189,4),
	(5,5507571663,5),
	(6,5535177763,6),
	(7,5516506935,7),
	(8,5544535292,8),
	(9,5569603110,9),
	(10,5587319969,10)
	select * from usuarios.TELEFONO
--rollback tran 
commit tran
go

--------------------MEMBRESIA----------------------------

begin tran 
insert into usuarios.MEMBRESIA
values 
	(100,'B',null,100),
	(101,'B',null,101),
	(102,'B',null,102),
	(103,'I',null,103),
	(104,'I',null,104),
	(105,'I',null,105),
	(106,'P',null,106),
	(107,'P',null,107),
	(108,'P',null,108),
	(109,'P',null,109)
	select * from usuarios.MEMBRESIA
--rollback tran 
commit tran
go

----------------------BASICA----------------------------------

begin tran 
insert into usuarios.BASICA (idMembresia, precioB, fechaInicio, fechaFin, descuento)
values 
	(100,118,'2022-07-05', DATEADD(DAY, 1, '2022-07-05'),18),
	(101,118,'2022-07-06', DATEADD(DAY, 1, '2022-07-06'),18),
	(102,118,'2022-07-07', DATEADD(DAY, 1, '2022-07-07'),18)
	select * from usuarios.BASICA
--rollback tran 
commit tran
go

------------------------------INTERMEDIA-------------------------

begin tran 
insert into usuarios.INTERMEDIA  (idMembresia, precioI, fechaInicio, fechaFin, viaje_gratis)
values 
	(103,400,'2022-07-05', DATEADD(MONTH, 1, '2022-07-05'),0),
	(104,400,'2022-07-10', DATEADD(MONTH, 1, '2022-07-10'),1),
	(105,400,'2022-07-15', DATEADD(MONTH, 1, '2022-07-15'),1)
	select * from usuarios.INTERMEDIA
--rollback tran 
commit tran
go

--------------------------------------PREMIUM------------------
begin tran 
insert into usuarios.PREMIUM  (idMembresia, precioP, fechaInicio, fechaFin, cashback)
values 
	(106,1000,'2022-07-05', DATEADD(YEAR, 1, '2022-07-05'),0),
	(107,1000,'2022-07-12', DATEADD(YEAR, 1, '2022-07-12'),1),
	(108,1000,'2022-07-19', DATEADD(YEAR, 1, '2022-07-19'),1),
	(109,1000,'2022-07-22', DATEADD(YEAR, 1, '2022-07-22'),0)
	select * from usuarios.PREMIUM
--rollback tran 
commit tran
go
