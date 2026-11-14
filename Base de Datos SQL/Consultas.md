## Consulta 1. Consultar todos los estudiantes registrados

**Código SQL:**

```sql
SELECT id_estudiante, nombre, apellido, programa_academico, semestre, email
FROM estudiante
ORDER BY apellido, nombre;
```

**Captura del resultado:**

<img width="811" height="312" alt="Resultado de la consulta 1" src="https://github.com/user-attachments/assets/61d72d2c-71f8-4056-81b0-fd19acf01b84" />
---

## Consulta 2. Consultar las tutorías con sus respectivos tutores

**Código SQL:**

```sql
SELECT t.id_tutoria, t.tipo AS tutoria,
    CONCAT(tu.nombre, ' ', tu.apellido) AS nombre_tutor,
    tu.departamento, t.modalidad, t.estado
FROM tutoria t
INNER JOIN tutor tu ON t.id_tutor = tu.id_tutor
ORDER BY t.id_tutoria;
```

**Captura del resultado:**

<img width="717" height="339" alt="Resultado de la consulta 2" src="https://github.com/user-attachments/assets/e882fdc8-d1ef-4327-9c6e-992e9029cfcf" />

---

## Consulta 3. Consultar las solicitudes de tutoría realizadas por los estudiantes

**Código SQL:**

```sql
SELECT s.id_solicitud,
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    t.tipo AS tutoria, s.fecha_solicitud, s.estado_solicitud
FROM solicitud s
INNER JOIN estudiante e ON s.id_estudiante = e.id_estudiante
INNER JOIN tutoria t ON s.id_tutoria = t.id_tutoria
ORDER BY s.fecha_solicitud;
```

**Captura del resultado:**

<img width="702" height="299" alt="Resultado de la consulta 3" src="https://github.com/user-attachments/assets/aa5e0a93-0133-44b3-8318-3fdf7c9f6d11" />


---

## Consulta 4. Consultar las sesiones de tutoría programadas y realizadas

**Código SQL:**

```sql
SELECT s.id_sesion, t.tipo AS tutoria, s.fecha, s.hora_inicio, s.hora_fin, ep.nombre AS espacio, ep.ubicacion, s.estado
FROM sesion s
INNER JOIN tutoria t ON s.id_tutoria = t.id_tutoria
INNER JOIN espacio ep ON s.id_espacio = ep.id_espacio
ORDER BY s.fecha, s.hora_inicio;
```

**Captura del resultado:**

<img width="818" height="293" alt="Resultado de la consulta 4" src="https://github.com/user-attachments/assets/e770ecb8-1ae0-4f93-b5f8-f4e504b70fa0" />

---

## Consulta 5. Contar cuántos estudiantes están inscritos en cada grupo

**Código SQL:**

```sql
SELECT g.id_grupo, g.nombre_grupo, g.cupo_maximo,
    COUNT(eg.id_estudiante) AS estudiantes_inscritos, g.cupo_maximo - COUNT(eg.id_estudiante) AS cupos_disponibles
FROM grupo_tutoria g
LEFT JOIN estudiante_grupo eg ON g.id_grupo = eg.id_grupo
GROUP BY g.id_grupo, g.nombre_grupo, g.cupo_maximo
ORDER BY estudiantes_inscritos DESC;
```

**Captura del resultado:**

<img width="659" height="294" alt="Resultado de la consulta 5" src="https://github.com/user-attachments/assets/c373db05-dd81-4442-8f42-401af8efb760" />

---

## Consulta 6. Consultar la asistencia de los estudiantes a las sesiones

**Código SQL:**

```sql
SELECT s.id_sesion, s.fecha,
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    t.tipo AS tutoria, a.estado_asistencia, a.observaciones
FROM asistencia a
INNER JOIN estudiante e ON a.id_estudiante = e.id_estudiante
INNER JOIN sesion s ON a.id_sesion = s.id_sesion
INNER JOIN tutoria t ON s.id_tutoria = t.id_tutoria
ORDER BY s.fecha, estudiante;
```

**Captura del resultado:**

<img width="821" height="294" alt="Resultado de la consulta 6" src="https://github.com/user-attachments/assets/2870ed20-a753-4654-9c2b-3ad688c2dcb0" />

---

## Consulta 7. Calcular el promedio de calificaciones por tutoría

**Código SQL:**

```sql
SELECT t.id_tutoria, t.tipo AS tutoria,
    COUNT(ev.id_evaluacion) AS total_evaluaciones,
    ROUND(AVG(ev.calificacion), 2) AS promedio_calificacion
FROM tutoria t
INNER JOIN sesion s ON t.id_tutoria = s.id_tutoria
INNER JOIN evaluacion ev ON s.id_sesion = ev.id_sesion
GROUP BY t.id_tutoria, t.tipo
ORDER BY promedio_calificacion DESC;
```

**Captura del resultado:**

<img width="555" height="253" alt="Resultado de la consulta 7" src="https://github.com/user-attachments/assets/53cf79c1-0893-421e-b16b-3c545145b4ee" />

---

## Consulta 8. Identificar los estudiantes con mejor rendimiento académico

**Código SQL:**

```sql
SELECT e.id_estudiante,
    CONCAT( e.nombre, ' ', e.apellido) AS estudiante,
    e.programa_academico,
    COUNT(ev.id_evaluacion) AS evaluaciones,
    ROUND(AVG(ev.calificacion), 2) AS promedio
FROM estudiante e
INNER JOIN evaluacion ev ON e.id_estudiante = ev.id_estudiante
GROUP BY e.id_estudiante, e.nombre, e.apellido, e.programa_academico
ORDER BY promedio DESC
LIMIT 5;
```

**Captura del resultado:**

<img width="643" height="157" alt="Resultado de la consulta 8" src="https://github.com/user-attachments/assets/0cc9d81e-752d-4f77-b41f-b97724118f3f" />

---

## Consulta 9. Tutorías que no han recibido solicitudes

**Código SQL:**

```sql
SELECT t.id_tutoria, t.tipo AS tutoria, t.modalidad, t.estado,
    CONCAT( tu.nombre, ' ', tu.apellido) AS nombre_tutor
FROM tutoria t
LEFT JOIN solicitud s ON t.id_tutoria = s.id_tutoria
INNER JOIN tutor tu ON t.id_tutor = tu.id_tutor
WHERE s.id_solicitud IS NULL
ORDER BY t.tipo;
```

**Captura del resultado:**

<img width="507" height="105" alt="Resultado de la consulta 9" src="https://github.com/user-attachments/assets/5e2573f5-6094-405a-ae46-eef5bfb50baa" />

---

## Consulta 10. Generar un reporte general del sistema de tutorías

**Código SQL:**

```sql
SELECT
    (SELECT COUNT(*) FROM estudiante) AS total_estudiantes,
    (SELECT COUNT(*) FROM tutor) AS total_tutores,
	(SELECT COUNT(*) FROM tutoria) AS total_tutorias,
    (SELECT COUNT(*) FROM sesion) AS total_sesiones,
    (SELECT COUNT(*) FROM solicitud) AS total_solicitudes,
    (SELECT COUNT(*) FROM evaluacion) AS total_evaluaciones,
    (SELECT COUNT(*) FROM asistencia
     WHERE estado_asistencia = 'Presente')
     AS asistencias_confirmadas;
```

**Captura del resultado:**

<img width="825" height="71" alt="Resultado de la consulta 10" src="https://github.com/user-attachments/assets/a1742399-642d-4b9c-a394-a25cf51e92a1" />

---
