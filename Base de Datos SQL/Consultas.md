-- 1. Consultar todos los estudiantes registrados
SELECT id_estudiante, nombre, apellido, programa_academico, semestre, email
FROM estudiante
ORDER BY apellido, nombre;


-- 2. Consultar las tutorías con sus respectivos tutores
SELECT t.id_tutoria, t.tipo AS tutoria,
    CONCAT(tu.nombre, ' ', tu.apellido) AS nombre_tutor,
    tu.departamento, t.modalidad, t.estado
FROM tutoria t
INNER JOIN tutor tu ON t.id_tutor = tu.id_tutor
ORDER BY t.id_tutoria;


-- 3. Consultar las solicitudes de tutoría realizadas por los estudiantes
SELECT s.id_solicitud,
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    t.tipo AS tutoria, s.fecha_solicitud, s.estado_solicitud
FROM solicitud s
INNER JOIN estudiante e ON s.id_estudiante = e.id_estudiante
INNER JOIN tutoria t ON s.id_tutoria = t.id_tutoria
ORDER BY s.fecha_solicitud;


-- 4. Consultar las sesiones de tutoría programadas y realizadas
SELECT s.id_sesion, t.tipo AS tutoria, s.fecha, s.hora_inicio, s.hora_fin, ep.nombre AS espacio, ep.ubicacion, s.estado
FROM sesion s
INNER JOIN tutoria t ON s.id_tutoria = t.id_tutoria
INNER JOIN espacio ep ON s.id_espacio = ep.id_espacio
ORDER BY s.fecha, s.hora_inicio;


-- 5. Contar cuántos estudiantes están inscritos en cada grupo
SELECT g.id_grupo, g.nombre_grupo, g.cupo_maximo,
    COUNT(eg.id_estudiante) AS estudiantes_inscritos, g.cupo_maximo - COUNT(eg.id_estudiante) AS cupos_disponibles
FROM grupo_tutoria g
LEFT JOIN estudiante_grupo eg ON g.id_grupo = eg.id_grupo
GROUP BY g.id_grupo, g.nombre_grupo, g.cupo_maximo
ORDER BY estudiantes_inscritos DESC;


-- 6. Consultar la asistencia de los estudiantes a las sesiones
SELECT s.id_sesion, s.fecha,
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    t.tipo AS tutoria, a.estado_asistencia, a.observaciones
FROM asistencia a
INNER JOIN estudiante e ON a.id_estudiante = e.id_estudiante
INNER JOIN sesion s ON a.id_sesion = s.id_sesion
INNER JOIN tutoria t ON s.id_tutoria = t.id_tutoria
ORDER BY s.fecha, estudiante;


-- 7. Calcular el promedio de calificaciones por tutoría
SELECT t.id_tutoria, t.tipo AS tutoria,
    COUNT(ev.id_evaluacion) AS total_evaluaciones,
    ROUND(AVG(ev.calificacion), 2) AS promedio_calificacion
FROM tutoria t
INNER JOIN sesion s ON t.id_tutoria = s.id_tutoria
INNER JOIN evaluacion ev ON s.id_sesion = ev.id_sesion
GROUP BY t.id_tutoria, t.tipo
ORDER BY promedio_calificacion DESC;


-- 8. Identificar los estudiantes con mejor rendimiento académico
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


-- 9. tutorías que no han recibido solicitudes
SELECT t.id_tutoria, t.tipo AS tutoria, t.modalidad, t.estado,
    CONCAT( tu.nombre, ' ', tu.apellido) AS nombre_tutor
FROM tutoria t
LEFT JOIN solicitud s ON t.id_tutoria = s.id_tutoria
INNER JOIN tutor tu ON t.id_tutor = tu.id_tutor
WHERE s.id_solicitud IS NULL
ORDER BY t.tipo;


-- 10. Generar un reporte general del sistema de tutorías
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
