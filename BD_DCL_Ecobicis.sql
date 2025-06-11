USE Equipo2_Ecobici
GO
CREATE LOGIN SoloLectura01 WITH PASSWORD='1234zaq*' MUST_CHANGE, DEFAULT_DATABASE=Equipo2_Ecobici,CHECK_EXPIRATION=ON, --Se instancian os logins que requieren sustituir su contraseña al momento 
CHECK_POLICY=ON																											--de conectarse por primera vez
create user UsuarioConsulta01 for login SoloLectura01

CREATE LOGIN SoloLectura02 WITH PASSWORD='1234zaq*' MUST_CHANGE, DEFAULT_DATABASE=Equipo2_Ecobici,CHECK_EXPIRATION=ON,
CHECK_POLICY=ON
create user UsuarioConsulta02 for login SoloLectura02

use Equipo2_Ecobici
go
Grant select on schema::bicicleta to UsuarioConsulta01 --Se le garantiza uso del select al usuario
Grant select on schema::empleados to UsuarioConsulta01
Grant select on schema::usuarios to UsuarioConsulta01
Deny insert, update, delete on schema :: bicicleta to UsuarioConsulta01
Deny insert, update, delete on schema :: empleados to UsuarioConsulta01 --Y se le niegan las modificaciones
Deny insert, update, delete on schema :: usuarios to UsuarioConsulta01
GO


use Equipo2_Ecobici
go
Grant select on schema::bicicleta to UsuarioConsulta02 --Se repite lo mismo con este segundo usuario
Grant select on schema::empleados to UsuarioConsulta02
Grant select on schema::usuarios to UsuarioConsulta02
Deny insert, update, delete on schema :: bicicleta to UsuarioConsulta02
Deny insert, update, delete on schema :: empleados to UsuarioConsulta02
Deny insert, update, delete on schema :: usuarios to UsuarioConsulta02
GO
-----------------------------USUARIO_GESTOR----------------------
USE Equipo2_Ecobici
GO
CREATE LOGIN SoloGestion01 WITH PASSWORD='1234zaq*', DEFAULT_DATABASE=Equipo2_Ecobici, CHECK_POLICY=ON, CHECK_EXPIRATION=ON --Se instancian dos usuarios Gestores, de igual manera se requiere
create user UsuarioGestor01 for login SoloGestion01																			-- Que sustituyan sus constraseñas

USE Equipo2_Ecobici
GO
CREATE LOGIN SoloGestion02 WITH PASSWORD='1234zaq*' MUST_CHANGE, DEFAULT_DATABASE=Equipo2_Ecobici, CHECK_POLICY=ON,CHECK_EXPIRATION=ON
create user UsuarioGestor02 for login SoloGestion02

use Equipo2_Ecobici
go
Grant insert, update,select, delete on schema :: bicicleta to UsuarioGestor01 --Se le garantizan todos los permisos "comunes" al usuario gestor, es decir puede leer o insertar
Grant insert, update,select, delete on schema :: empleados to UsuarioGestor01
Grant insert, update,select, delete on schema :: usuarios to UsuarioGestor01
GO


use Equipo2_Ecobici
go
Grant insert, update,select, delete on schema :: bicicleta to UsuarioGestor02
Grant insert, update,select, delete on schema :: empleados to UsuarioGestor02
Grant insert, update,select, delete on schema :: usuarios to UsuarioGestor02
GO
------------------------------ADMINISTRADORES-----------------------------------------
USE Equipo2_Ecobici
GO
CREATE LOGIN SoloAdmin01 WITH PASSWORD='1234zaq*' MUST_CHANGE, DEFAULT_DATABASE=Equipo2_Ecobici,CHECK_POLICY=ON,CHECK_EXPIRATION=ON -- Se instancian dos usuarios administradores que de igual manera
																																	--requieren modificar su contrasña para seguir.
create user Administrador01 for login SoloAdmin01

GRANT CONTROL ON DATABASE::Equipo2_Ecobici TO Administrador01 --Se le garantiza control total de la bse de datos al usuario administrador
go

CREATE LOGIN SoloAdmin02 WITH PASSWORD='1234zaq*' MUST_CHANGE, DEFAULT_DATABASE=Equipo2_Ecobici, CHECK_POLICY=ON,CHECK_EXPIRATION=ON

create user Administrador02 for login SoloAdmin02

GRANT CONTROL ON DATABASE::Equipo2_Ecobici TO Administrador02
go
