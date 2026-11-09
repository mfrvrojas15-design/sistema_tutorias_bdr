CREATE DATABASE sistema_tutorias_bdr;

USE sistema_tutorias_bdr;

-- 1. Tabla estudiante
CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    semestre INT NOT NULL,
    programa_academico VARCHAR(100) NOT NULL,

    CONSTRAINT chk_semestre
        CHECK (semestre BETWEEN 1 AND 12)
);


-- 2. Tabla tutor
CREATE TABLE tutor (
    id_tutor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    departamento VARCHAR(100) NOT NULL
);


-- 3. Tabla tutoria
CREATE TABLE tutoria (
    id_tutoria INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    modalidad VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_tutor INT NOT NULL,
	FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor),
    CONSTRAINT chk_modalidad CHECK (modalidad IN ('Presencial', 'Virtual', 'Hibrida')),
    CONSTRAINT chk_estado_tutoria CHECK (estado IN ('Activa', 'Inactiva', 'Finalizada'))
);


-- 4. Tabla solicitud
CREATE TABLE solicitud (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    fecha_solicitud DATE NOT NULL,
    estado_solicitud VARCHAR(20) NOT NULL,
    id_tutoria INT NOT NULL,
    id_estudiante INT NOT NULL,
    FOREIGN KEY (id_tutoria) REFERENCES tutoria(id_tutoria),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    CONSTRAINT chk_estado_solicitud CHECK (estado_solicitud IN ('Pendiente', 'Aprobada', 'Rechazada', 'Cancelada'))
);


-- 5. Tabla grupo_tutoria
CREATE TABLE grupo_tutoria (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_grupo VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255),
    cupo_maximo INT NOT NULL,
    id_tutoria INT NOT NULL,
    FOREIGN KEY (id_tutoria) REFERENCES tutoria(id_tutoria),
    CONSTRAINT chk_cupo_maximo CHECK (cupo_maximo > 0)
);


-- 6. Tabla espacio
CREATE TABLE espacio (
    id_espacio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL,
    capacidad INT NOT NULL,
    CONSTRAINT chk_capacidad CHECK (capacidad > 0)
);


-- 7. Tabla sesion
CREATE TABLE sesion (
    id_sesion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_tutoria INT NOT NULL,
    id_espacio INT NOT NULL,
    FOREIGN KEY (id_tutoria) REFERENCES tutoria(id_tutoria),
    FOREIGN KEY (id_espacio) REFERENCES espacio(id_espacio),
    CONSTRAINT chk_horario CHECK (hora_fin > hora_inicio),
    CONSTRAINT chk_estado_sesion CHECK (estado IN ('Programada', 'Realizada', 'Cancelada'))
);


-- 8. Tabla estudiante_grupo
CREATE TABLE estudiante_grupo (
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    PRIMARY KEY (id_estudiante, id_grupo),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
	FOREIGN KEY (id_grupo) REFERENCES grupo_tutoria(id_grupo)
);


-- 9. Tabla asistencia
CREATE TABLE asistencia (
    id_sesion INT NOT NULL,
    id_estudiante INT NOT NULL,
    estado_asistencia VARCHAR(20) NOT NULL,
    observaciones VARCHAR(255),
    PRIMARY KEY (id_sesion, id_estudiante),
    FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    CONSTRAINT chk_estado_asistencia CHECK (estado_asistencia IN ('Presente', 'Ausente', 'Justificada'))
) ENGINE=InnoDB;


-- 10. Tabla evaluacion
CREATE TABLE evaluacion (
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    calificacion DECIMAL(3,2) NOT NULL,
    fecha_evaluacion DATE NOT NULL,
    id_sesion INT NOT NULL,
    id_estudiante INT NOT NULL,
	FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    CONSTRAINT uq_evaluacion_estudiante_sesion UNIQUE (id_sesion, id_estudiante),
    CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0 AND 5)
);
