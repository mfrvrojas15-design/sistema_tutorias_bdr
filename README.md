# Sistema de Gestión de Tutorías Universitarias

Este proyecto tiene como objetivo diseñar e implementar una base de datos
relacional para gestionar el proceso de tutorías académicas de una universidad.

El sistema permitirá registrar estudiantes, tutores, asignaturas, horarios de
disponibilidad, espacios físicos o virtuales y reservas de tutorías. También
contemplará tutorías individuales y grupales, control de asistencia,
cancelaciones, evaluaciones del servicio y generación de reportes.

La solución busca centralizar la información, evitar conflictos de horario,
controlar la capacidad de las sesiones y facilitar el seguimiento de los
servicios de acompañamiento académico ofrecidos por la universidad.

## Integrantes
- Maria Fernanda Rojas Villamizar 2243576
- Vivian Yulitza Ramirez Ramos 2243563
- Juan Jose Espinosa Ortega 2243551
- Carlos David Herrera Rodriguez 2243562

## Objetivos

- Diseñar un modelo entidad-relación para el sistema de tutorías.
- Implementar el modelo mediante una base de datos relacional.
- Administrar estudiantes, tutores, asignaturas y servicios académicos.
- Gestionar la disponibilidad y los horarios de los tutores.
- Permitir la reserva, cancelación y reprogramación de tutorías.
- Evitar reservas duplicadas y conflictos de horario.
- Registrar la asistencia y el resultado de las sesiones.
- Generar consultas y reportes sobre el uso del sistema.


## Contenido de la presentación final

El proyecto se presenta en el siguiente orden, de acuerdo
con los requisitos de la entrega final.

### 1. Análisis de la situación
[Ver documentación del análisis](Modelo%20E-R/)

### 2. Modelo Entidad–Relación
[Ver modelo E-R](Modelo%20E-R/)

### 3. Modelo relacional y normalización
[Ver diagrama e informe de normalización](Modelo%20Relacional/)

### 4. Base de datos construida en SQL
[Ver código de creación de tablas](Base%20de%20Datos%20SQL/CreacionTablas.sql)

### 5. Carga de datos al modelo
[Ver inserción de 12 registros por tabla](Base%20de%20Datos%20SQL/Registros.sql)

### 6. Diez consultas sobre la base de datos
[Ver las 10 consultas SQL](Base%20de%20Datos%20SQL/Consultas.sql)

---

**Tecnología:** MySQL 8.0 y MySQL Workbench.

**Orden de ejecución:** `CreacionTablas.sql` → `Registros.sql` → `Consultas.sql`.
  
