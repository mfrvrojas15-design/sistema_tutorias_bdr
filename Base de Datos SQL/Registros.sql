INSERT INTO estudiante (id_estudiante, nombre, apellido, email, telefono, semestre, programa_academico)
VALUES
(1, 'Carlos', 'Ramirez', 'carlos.ramirez@example.com', '3001000001', 3, 'Ingenieria de Sistemas'),
(2, 'Laura', 'Gomez', 'laura.gomez@example.com', '3001000002', 4, 'Ingenieria de Sistemas'),
(3, 'Andres', 'Martinez', 'andres.martinez@example.com', '3001000003', 2, 'Administracion de Empresas'),
(4, 'Valentina', 'Rodriguez', 'valentina.rodriguez@example.com', '3001000004', 5, 'Ingenieria Industrial'),
(5, 'Juan', 'Perez', 'juan.perez@example.com', '3001000005', 1, 'Ingenieria de Sistemas'),
(6, 'Daniela', 'Torres', 'daniela.torres@example.com', '3001000006', 6, 'Contaduria Publica'),
(7, 'Santiago', 'Lopez', 'santiago.lopez@example.com', '3001000007', 3, 'Ingenieria Industrial'),
(8, 'Camila', 'Hernandez', 'camila.hernandez@example.com', '3001000008', 4, 'Administracion de Empresas'),
(9, 'Sebastian', 'Moreno', 'sebastian.moreno@example.com', '3001000009', 2, 'Ingenieria de Sistemas'),
(10, 'Natalia', 'Castro', 'natalia.castro@example.com', '3001000010', 7, 'Contaduria Publica'),
(11, 'Mateo', 'Vargas', 'mateo.vargas@example.com', '3001000011', 5, 'Ingenieria Industrial'),
(12, 'Isabella', 'Rojas', 'isabella.rojas@example.com', '3001000012', 3, 'Ingenieria de Sistemas');


INSERT INTO tutor (id_tutor, nombre, apellido, email, telefono, departamento)
VALUES
(1, 'Pedro', 'Sanchez', 'pedro.sanchez@example.com', '3102000001', 'Matematicas'),
(2, 'Maria', 'Fernandez', 'maria.fernandez@example.com', '3102000002', 'Informatica'),
(3, 'Jorge', 'Diaz', 'jorge.diaz@example.com', '3102000003', 'Administracion'),
(4, 'Ana', 'Gutierrez', 'ana.gutierrez@example.com', '3102000004', 'Fisica'),
(5, 'Luis', 'Herrera', 'luis.herrera@example.com', '3102000005', 'Programacion'),
(6, 'Patricia', 'Mendoza', 'patricia.mendoza@example.com', '3102000006', 'Contabilidad'),
(7, 'Ricardo', 'Ortiz', 'ricardo.ortiz@example.com', '3102000007', 'Estadistica'),
(8, 'Claudia', 'Silva', 'claudia.silva@example.com', '3102000008', 'Economia'),
(9, 'Fernando', 'Ruiz', 'fernando.ruiz@example.com', '3102000009', 'Bases de Datos'),
(10, 'Sandra', 'Jimenez', 'sandra.jimenez@example.com', '3102000010', 'Investigacion'),
(11, 'Miguel', 'Navarro', 'miguel.navarro@example.com', '3102000011', 'Calculo'),
(12, 'Paola', 'Medina', 'paola.medina@example.com', '3102000012', 'Ingenieria');


INSERT INTO tutoria (id_tutoria, tipo, modalidad, estado, id_tutor)
VALUES
(1, 'Calculo Diferencial', 'Presencial', 'Activa', 1),
(2, 'Programacion I', 'Virtual', 'Activa', 2),
(3, 'Administracion', 'Presencial', 'Activa', 3),
(4, 'Fisica Mecanica', 'Hibrida', 'Activa', 4),
(5, 'Estructuras de Datos', 'Virtual', 'Activa', 5),
(6, 'Contabilidad General', 'Presencial', 'Activa', 6),
(7, 'Estadistica', 'Hibrida', 'Activa', 7),
(8, 'Microeconomia', 'Virtual', 'Inactiva', 8),
(9, 'Bases de Datos', 'Presencial', 'Activa', 9),
(10, 'Metodologia de Investigacion', 'Virtual', 'Activa', 10),
(11, 'Calculo Integral', 'Presencial', 'Finalizada', 11),
(12, 'Procesos Industriales', 'Hibrida', 'Activa', 12);


INSERT INTO solicitud (id_solicitud, fecha_solicitud, estado_solicitud, id_tutoria, id_estudiante)
VALUES
(1, '2026-09-01', 'Aprobada', 1, 1),
(2, '2026-09-02', 'Aprobada', 2, 2),
(3, '2026-09-03', 'Aprobada', 3, 3),
(4, '2026-09-04', 'Aprobada', 4, 4),
(5, '2026-09-05', 'Aprobada', 5, 5),
(6, '2026-09-06', 'Aprobada', 6, 6),
(7, '2026-09-07', 'Aprobada', 7, 7),
(8, '2026-09-08', 'Rechazada', 8, 8),
(9, '2026-09-09', 'Aprobada', 9, 9),
(10, '2026-09-10', 'Pendiente', 10, 10),
(11, '2026-09-11', 'Aprobada', 11, 11),
(12, '2026-09-12', 'Aprobada', 12, 12);


INSERT INTO grupo_tutoria (id_grupo, nombre_grupo, descripcion, cupo_maximo, id_tutoria)
VALUES
(1, 'Grupo Calculo A', 'Refuerzo de derivadas', 20, 1),
(2, 'Grupo Programacion A', 'Fundamentos de programacion', 25, 2),
(3, 'Grupo Administracion A', 'Principios administrativos', 20, 3),
(4, 'Grupo Fisica A', 'Movimiento y fuerzas', 15, 4),
(5, 'Grupo Estructuras A', 'Listas, pilas y colas', 20, 5),
(6, 'Grupo Contabilidad A', 'Registro de operaciones', 25, 6),
(7, 'Grupo Estadistica A', 'Probabilidad descriptiva', 20, 7),
(8, 'Grupo Economia A', 'Conceptos de mercado', 20, 8),
(9, 'Grupo BD A', 'Modelo relacional y SQL', 25, 9),
(10, 'Grupo Investigacion A', 'Formulacion de proyectos', 15, 10),
(11, 'Grupo Integral A', 'Tecnicas de integracion', 20, 11),
(12, 'Grupo Industrial A', 'Procesos de produccion', 20, 12);


INSERT INTO espacio (id_espacio, nombre, tipo, ubicacion, capacidad)
VALUES
(1, 'Aula 101', 'Salon', 'Bloque A', 30),
(2, 'Sala Virtual 1', 'Virtual', 'Plataforma institucional', 100),
(3, 'Aula 202', 'Salon', 'Bloque B', 25),
(4, 'Laboratorio Fisica', 'Laboratorio', 'Bloque C', 20),
(5, 'Sala Virtual 2', 'Virtual', 'Plataforma institucional', 100),
(6, 'Aula 303', 'Salon', 'Bloque A', 30),
(7, 'Laboratorio Estadistica', 'Laboratorio', 'Bloque D', 25),
(8, 'Sala Virtual 3', 'Virtual', 'Plataforma institucional', 100),
(9, 'Laboratorio Sistemas', 'Laboratorio', 'Bloque E', 30),
(10, 'Sala Virtual 4', 'Virtual', 'Plataforma institucional', 100),
(11, 'Aula 404', 'Salon', 'Bloque B', 25),
(12, 'Laboratorio Industrial', 'Laboratorio', 'Bloque F', 25);


INSERT INTO sesion (id_sesion, fecha, hora_inicio, hora_fin, estado, id_tutoria, id_espacio)
VALUES
(1, '2026-09-15', '08:00:00', '10:00:00', 'Realizada', 1, 1),
(2, '2026-09-16', '10:00:00', '12:00:00', 'Realizada', 2, 2),
(3, '2026-09-17', '14:00:00', '16:00:00', 'Realizada', 3, 3),
(4, '2026-09-18', '08:00:00', '10:00:00', 'Realizada', 4, 4),
(5, '2026-09-19', '10:00:00', '12:00:00', 'Realizada', 5, 5),
(6, '2026-09-20', '14:00:00', '16:00:00', 'Realizada', 6, 6),
(7, '2026-09-21', '08:00:00', '10:00:00', 'Realizada', 7, 7),
(8, '2026-09-22', '10:00:00', '12:00:00', 'Cancelada', 8, 8),
(9, '2026-09-23', '14:00:00', '16:00:00', 'Realizada', 9, 9),
(10, '2026-11-20', '08:00:00', '10:00:00', 'Programada', 10, 10),
(11, '2026-09-25', '10:00:00', '12:00:00', 'Realizada', 11, 11),
(12, '2026-09-26', '14:00:00', '16:00:00', 'Realizada', 12, 12);


INSERT INTO estudiante_grupo (id_estudiante, id_grupo)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 9),
(9, 9),
(10, 10),
(11, 11),
(12, 12);


INSERT INTO asistencia (id_sesion, id_estudiante, estado_asistencia, observaciones)
VALUES
(1, 1, 'Presente', 'Participo activamente'),
(2, 2, 'Presente', 'Completo los ejercicios'),
(3, 3, 'Presente', 'Buena participacion'),
(4, 4, 'Ausente', 'No asistio a la sesion'),
(5, 5, 'Presente', 'Resolvio las actividades'),
(6, 6, 'Presente', 'Mostro interes'),
(7, 7, 'Justificada', 'Presento excusa academica'),
(9, 8, 'Presente', 'Participo en la practica'),
(9, 9, 'Presente', 'Realizo ejercicios SQL'),
(11, 11, 'Presente', 'Buen desempeño'),
(12, 12, 'Presente', 'Trabajo en equipo'),
(1, 2, 'Presente', 'Asistio como refuerzo adicional');


INSERT INTO evaluacion (id_evaluacion, calificacion, fecha_evaluacion, id_sesion, id_estudiante)
VALUES
(1, 4.50, '2026-09-15', 1, 1),
(2, 4.20, '2026-09-16', 2, 2),
(3, 4.80, '2026-09-17', 3, 3),
(4, 3.50, '2026-09-18', 4, 4),
(5, 4.00, '2026-09-19', 5, 5),
(6, 4.70, '2026-09-20', 6, 6),
(7, 3.80, '2026-09-21', 7, 7),
(8, 4.10, '2026-09-23', 9, 8),
(9, 4.90, '2026-09-23', 9, 9),
(10, 4.30, '2026-09-25', 11, 11),
(11, 4.60, '2026-09-26', 12, 12),
(12, 4.40, '2026-09-15', 1, 2);