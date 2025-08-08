# Ecobicis
#### Proyecto orientado al diseño y desarrollo de una base de datos para la plataforma de transporte urbano "Ecobici", con el objetivo de optimizar el sistema de registro de préstamos de bicicletas, control de tiempos de traslado y gestión de compras de tarjetas de movilidad integrada, mejorando así el proceso actualmente implementado de forma oficial.

## Introducción
Este proyecto, desarrollado en SQL para SQL Server, surge como una propuesta para modernizar y optimizar el sistema de gestión de datos de Ecobici.

Para ver los requisitos solicitados para resolver el proyecto, se tiene el siguiente archivo PDF: [Requerimentos Proyecto Ecobicis](https://github.com/alexisserapio/Ecobicis/blob/main/src/Requerimentos_ProyectoEcobicis.pdf)


La solución se diseñó atendiendo a requerimientos clave, incluyendo la creación de sentencias DCL para la administración de usuarios y permisos, DDL para la definición de la base de datos, esquemas y tablas, así como DML para la manipulación de la información.

## 💻 Tech Stack
- El proyecto se desarrolló utilizando completamente lenguaje SQL para SQL SERVER.
- Se hizo uso de **Embarcadero ER/Studio** para realizar las sentencias a partir del modelo lógico.
- En el proceso de desarrollo se implemento control de versionamiento utilizando **Git** y manejo de repositorios en **Github**.

## 📲 Desglose del proyecto:

### Diseño Conceptual

El desarrollo del proyecto se inicio realizando un diseño conceptual que satisfaciera las necesidades propuestas para el desarrollo del proyecto, la propuesta presentada fue la siguiente:

<img src="https://github.com/alexisserapio/Ecobicis/blob/main/src/Dise%C3%B1oConceptual.png" alt="Diagrama del modelo lógico presentado para el proyecto" width="1400" height="1000">

Este diagrama incluye:
- Todas las relaciones entre tablas.
- Atributos y caracteristicas de cada entidad.
- Propuestas de llaves primarias y foráneas.
- Identificación de relaciones débiles.
- Cardinalidades de las relaciones.

---

### Diseño Lógico

A partir del diseño conceptual, se creó un modelo lógico más depurado en Embarcadero ER/Studio:

<img src="https://github.com/alexisserapio/Ecobicis/blob/main/src/Dise%C3%B1oLogico.png" alt="Diagrama del modelo lógico presentado para el proyecto" width="1200" height="1200">

---

## Sentencias SQL desarrolladas:

### DCL (Data Control Language)
Archivo **seguridad.sql**
- Creación de 2 logins para usuarios de consulta.
- Creación de 4 logins para administradores con permisos restringidos.
- Creación de 2 usuarios con control total sobre la base de datos.
  
### DDL (Data Definition Language)
Archivo **crearbase.sql**
- Sentencias para la creación de la base de datos.
- Definición de esquemas y tablas.
  
### DML (Data Manipulation Language)
Archivo **dml.sql**
- Creación de 4 triggers, 3 views y 2 functions.
- Preparado para integrarse a un sistema web dinámico capaz de interactuar con la base de datos.
  
### Estadisticas
Archivo **informes.sql**
- Generación de 9 estadísticas mediante un *stored procedure*.
- Ejecución de procedimientos para el análisis de información.
  
### Carga Inicial
Archivo: **cargainicial.sql**
- Población inicial de la base de datos para pruebas.
- Contiene Inserts para las 23 tablas del sistema.
  
### Triggers
Archivo: **validar triggers.sql**
- Creación de 4 triggers para rechazar registros no válidos y otras validaciones en el sistema we integrado.
  
## 📣 To-do
- Implementar el sistema web para la propuesta de mejora al servicio de Ecobici.
- Realizar optimización de las sentencias SQL.
