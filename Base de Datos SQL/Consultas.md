## Consulta 1. Consultar todos los estudiantes registrados

**Código SQL:**

```sql
SELECT id_estudiante, nombre, apellido, programa_academico, semestre, email
FROM estudiante
ORDER BY apellido, nombre;
```

**Captura del resultado:**

![Resultado de la consulta 1](<img width="811" height="312" alt="image" src="https://github.com/user-attachments/assets/61d72d2c-71f8-4056-81b0-fd19acf01b84" />
)

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

![Resultado de la consulta 2](imagenes/consulta2.png)

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

![Resultado de la consulta 3](imagenes/consulta3.png)

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

![Resultado de la consulta 4](imagenes/consulta4.png)

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

![Resultado de la consulta 5](imagenes/consulta5.png)

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

![Resultado de la consulta 6](imagenes/consulta6.png)

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

![Resultado de la consulta 7](imagenes/consulta7.png)

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

![Resultado de la consulta 8](imagenes/consulta8.png)

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

![Resultado de la consulta 9](imagenes/consulta9.png)

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

![Resultado de la consulta 10](imagenes/consulta10.png)

---
