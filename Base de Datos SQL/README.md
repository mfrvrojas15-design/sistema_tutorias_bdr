# Base de Datos SQL

## Sistema de Gestión de Tutorías Universitarias

Esta carpeta contiene la implementación de la base de datos del Sistema de Gestión de Tutorías Universitarias, desarrollada en MySQL 8.0.

La base de datos se construyó a partir del modelo entidad-relación y del modelo relacional normalizado, con el propósito de administrar estudiantes, tutores, tutorías, solicitudes, grupos, sesiones, espacios, asistencias y evaluaciones.

## Archivos incluidos

**1. CreacionTablas.sql**

Contiene las instrucciones `CREATE TABLE` para construir las 10 tablas del sistema. Incluye claves primarias, claves foráneas, tipos de datos y restricciones de integridad.

**2. Registros.sql**

Contiene las instrucciones `INSERT INTO` utilizadas para insertar 12 registros de prueba en cada una de las 10 tablas.

**3. Consultas.sql**

Contiene 10 consultas SQL relacionadas con el funcionamiento del sistema, incluyendo:

- Consulta de estudiantes registrados.
- Tutorías y tutores asignados.
- Solicitudes realizadas por los estudiantes.
- Sesiones de tutoría.
- Cupos disponibles en los grupos.
- Registro de asistencia.
- Promedio de calificaciones por tutoría.
- Estudiantes con mejor rendimiento.
- Tutorías sin solicitudes.
- Reporte general del sistema.

## Instrucciones de ejecución

1. Abrir MySQL Workbench y conectarse al servidor.
2. Crear una base de datos llamada `sistema_tutorias_bdr`.
3. Seleccionar la base de datos mediante `USE sistema_tutorias_bdr;`.
4. Ejecutar `CreacionTablas.sql` para crear las tablas.
5. Ejecutar `Registros.sql` para insertar los datos de prueba.
6. Ejecutar las consultas de `Consultas.sql` para verificar el funcionamiento del sistema.

## Tecnologías utilizadas

- MySQL Server 8.0.
- MySQL Workbench 8.0.
- SQL (Structured Query Language).

## Relación con el proyecto

Esta implementación corresponde a la fase final del proyecto y permite comprobar mediante instrucciones SQL el funcionamiento del modelo relacional previamente diseñado y normalizado.
