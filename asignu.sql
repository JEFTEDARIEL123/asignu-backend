CREATE TABLE personal (
    cedula INTEGER PRIMARY KEY,
    nombre TEXT,
    apellidos TEXT,
    correo TEXT,
    telefono TEXT,
    ocupacion TEXT
);

CREATE TABLE horarios (
    id_asign INTEGER PRIMARY KEY,
    cedula_personal INTEGER,
    aula_numero INTEGER,
    dia_semana TEXT,
    hora_entrada TEXT,
    hora_salida TEXT,
    FOREIGN KEY (cedula_personal) REFERENCES personal(cedula),
    FOREIGN KEY (aula_numero) REFERENCES aulas(numero_aula)
);

CREATE TABLE aulas (
    numero_aula INTEGER PRIMARY KEY,
    horario_disponibilidad TEXT
);

CREATE TABLE alquiler (
    id_alqui INTEGER PRIMARY KEY,
    cedula_personal2 INTEGER,
    equipo_numero INTEGER,
    hora_alqui DATETIME,
    hora_retorno DATETIME,
    FOREIGN KEY (cedula_personal2) REFERENCES personal(cedula),
    FOREIGN KEY (equipo_numero) REFERENCES equipos(numero_equipo)
);

CREATE TABLE equipos (
    numero_equipo INTEGER PRIMARY KEY,
    nombre_equipo TEXT
);

INSERT INTO personal (cedula, nombre, apellidos, correo, telefono, ocupacion) 
VALUES 
(2000123, 'Juan', 'García', 'juangarcia@example.com', '12345678', 'Profesor ITI'),
(2000345, 'María', 'Martínez', 'mariamartinez@example.com', '23456789', 'Profesor ITI'),
(2000567, 'Pedro', 'López', 'pedrolopez@example.com', '34567890', 'Profesor ITI'),
(2000789, 'Ana', 'González', 'anagonzalez@example.com', '45678901', 'Profesor ITI'),
(2000901, 'Laura', 'Rodríguez', 'laurarodriguez@example.com', '56789012', 'Profesor ITI');

INSERT INTO horarios (id_asign, cedula_personal, aula_numero, dia_semana, hora_entrada, hora_salida) VALUES
(1, 2000123, 301, 'Lunes', '08:00:00', '12:00:00'),
(2, 2000345, 301, 'Lunes', '13:00:00', '17:00:00'),
(3, 2000567, 302, 'Martes', '08:00:00', '12:00:00'),
(4, 2000789, 302, 'Martes', '13:00:00', '17:00:00'),
(5, 2000901, 303, 'Miércoles', '08:00:00', '12:00:00'),
(6, 2001023, 303, 'Miércoles', '13:00:00', '17:00:00'),
(7, 2001245, 304, 'Jueves', '08:00:00', '12:00:00'),
(8, 2001467, 304, 'Jueves', '13:00:00', '17:00:00'),
(9, 2001689, 305, 'Viernes', '08:00:00', '12:00:00'),
(10, 2001901, 305, 'Viernes', '13:00:00', '17:00:00');

INSERT INTO equipos (numero_equipo, nombre_equipo) VALUES 
(1, 'Proyector 1'),
(2, 'Proyector 2'),
(3, 'Cables 1'),
(4, 'Cables 2');

INSERT INTO alquiler (id_alqui, cedula_personal2, equipo_numero, hora_alqui, hora_retorno) VALUES
(1, 2000123, 1, '2024-03-04 08:30:12', '2024-03-04 11:20:10'),
(2, 2000123, 3, '2024-03-04 08:31:12', '2024-03-04 11:20:10'),
(3, 2000345, 2, '2024-03-04 13:20:12', '2024-03-04 16:32:10'),
(4, 2000345, 4, '2024-03-04 13:21:12', '2024-03-04 16:32:10');

CREATE TABLE ingreso (
    id_ingreso INTEGER PRIMARY KEY,
    cedula_ingreso INTEGER,
    hora_ingreso DATETIME,
    hora_salida DATETIME,
    FOREIGN KEY (cedula_ingreso) REFERENCES personal(cedula)
);

INSERT INTO ingreso (id_ingreso, cedula_ingreso, hora_ingreso, hora_salida) VALUES 
(1, 2000123, '2024-03-04 07:55:32', '2024-03-04 12:01:02'),
(2, 2000345, '2024-03-04 12:58:45', '2024-03-04 17:02:12');
