/*SPRINT_PREV_RIESGOS;*/

/*CREAR DATABASE SPRINT_PREV_RIESGOS;*/
DROP DATABASE IF EXISTS SPRINT_PREV_RIESGOS;
CREATE DATABASE SPRINT_PREV_RIESGOS;

/*USAR TABLA ABPRO_6_PREV_RIESGOS*/
USE SPRINT_PREV_RIESGOS;

/*CREAR TABLA Cliente*/
CREATE TABLE Cliente(
    idCliente INT NOT NULL AUTO_INCREMENT,
    rutCliente INT(9) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    afp VARCHAR(30) NULL,
    sistemaSalud VARCHAR(2) NULL,
    direccion VARCHAR(70) NULL,
    comuna VARCHAR(50) NULL,
    edad INT(3) NOT NULL,
    idUsuario INT NOT NULL,
    PRIMARY KEY (idCliente),
    UNIQUE (rutCliente)
);

/*CREAR TABLA Accidente*/
CREATE TABLE Accidente(
    accidenteId INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dia DATE NULL,
    hora TIME NULL,
    lugar VARCHAR(50) NOT NULL,
    origen VARCHAR(100) NULL,
    consecuencias VARCHAR(100) NULL,
    idCliente INT(9) NOT NULL
);

/*CREAR LLAVE FORÁNEA ENTRE ACCIDENTE Y CLIENTE*/
ALTER TABLE Accidente
ADD CONSTRAINT accidente_cliente_FK
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);


/*CREAR TABLA Capacitacion*/
CREATE TABLE Capacitacion(
    idCapacitacion INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    fecha DATE NULL,
    hora TIME NULL,
    lugar VARCHAR(50) NOT NULL,
    duracion INT(3) NULL,
    cantidadAsistentes INT(5) NOT NULL,
    rutCliente INT(9) NOT NULL
);

/*CREAR LLAVE FORÁNEA ENTRE CAPACITACION Y CLIENTE*/
ALTER TABLE Capacitacion
ADD CONSTRAINT capacitacion_cliente_FK
FOREIGN KEY (rutCliente) REFERENCES Cliente(rutCliente);

/*CREAR TABLA Asistentes*/
CREATE TABLE Asistentes(
    idAsistente INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    edad INT(3) NOT NULL,
    capacitacion_idCapacitacion INT(9) NOT NULL
);

/*CREAR LLAVE FORÁNEA ENTRE ASISTENTES Y CAPACITACION*/
ALTER TABLE Asistentes
ADD CONSTRAINT asistentes_capacitacion_FK
FOREIGN KEY (capacitacion_idCapacitacion) REFERENCES Capacitacion(idCapacitacion);

/*MODIFICAR TABLA Cliente*/

ALTER TABLE Cliente
RENAME COLUMN nombres TO cliNombres,
CHANGE COLUMN apellidos cliApellidos VARCHAR(50) NOT NULL,
RENAME COLUMN telefono TO cliTelefono,
RENAME COLUMN afp TO cliAfp,
RENAME COLUMN sistemaSalud TO cliSistemaSalud,
CHANGE COLUMN direccion cliDireccion VARCHAR(100) NOT NULL,
CHANGE COLUMN comuna cliComuna VARCHAR(50) NOT NULL,
CHANGE COLUMN edad cliEdad INT(3) NOT NULL;


/*MODIFICAR TABLA Capacitacion*/

ALTER TABLE Capacitacion
RENAME COLUMN fecha TO capFecha,
RENAME COLUMN hora TO capHora,
CHANGE COLUMN lugar capLugar VARCHAR(100) NOT NULL,
CHANGE COLUMN duracion capDuracion INT(4) NULL,
DROP COLUMN cantidadAsistentes;
;

ALTER TABLE Asistentes
CHANGE COLUMN nombres asisNombreCompleto VARCHAR(100) NOT NULL,
CHANGE COLUMN edad asisEdad INT(3) NOT NULL,
ADD COLUMN asisCorreo VARCHAR(70) NULL,
ADD COLUMN asisTelefono VARCHAR(20) NULL;

/*MODIFICAR TABLA Accidente*/

ALTER TABLE Accidente
RENAME COLUMN accidenteId TO idAccidente,
RENAME COLUMN dia TO acciFecha,
CHANGE COLUMN hora acciHora TIME NOT NULL,
CHANGE COLUMN lugar acciLugar VARCHAR(150) NOT NULL,
CHANGE COLUMN origen acciOrigen VARCHAR(100) NOT NULL,
RENAME COLUMN consecuencias TO acciConsecuencias;
;

/*CREAR TABLA Visita*/
CREATE TABLE Visita(
    idVisita INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    visFecha DATE NOT NULL,
    visHora TIME NULL,
    visLugar VARCHAR(50) NOT NULL,
    visComentarios VARCHAR(250) NOT NULL,
    cliente_rutCliente INT(9) NOT NULL
    /*idCheckeo INT NOT NULL*/
);

/*ALTER TABLE Visita
ADD CONSTRAINT visita_checkeo_FK
FOREIGN KEY (idCheckeo) REFERENCES checkeos(id);
*/

CREATE TABLE visitaCheckeo(
	idVisita INT NOT NULL, /*FK VISITA ok*/
    idCheckeo INT NOT NULL /*FK CHECKEO*/
);



/*CREAR LLAVE FORÁNEA ENTRE VISITA Y CLIENTE*/
ALTER TABLE Visita
ADD CONSTRAINT visita_cliente_FK
FOREIGN KEY (cliente_rutCliente) REFERENCES Cliente(rutCliente);

/*ACTIVIDAD*/

CREATE TABLE checkeos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NULL
);

ALTER TABLE visitaCheckeo
ADD CONSTRAINT visitaCheckeo_vista_FK
FOREIGN KEY (idVisita) REFERENCES Visita(idVisita),

ADD CONSTRAINT visitaCheckeo_checkeo_FK
FOREIGN KEY (idCheckeo) REFERENCES checkeos(id)
;

CREATE TABLE resultadoCheckeo(
	checkeos_id INT NOT NULL, /*FK CHECKEOS*/
    resultadoCheckeo ENUM("CUMPLE","C/OBSERVACIONES","NO CUMPLE") NOT NULL
);
ALTER TABLE resultadoCheckeo
ADD CONSTRAINT checkeos_resultadoCheckeo_FK
FOREIGN KEY (checkeos_id) REFERENCES checkeos(id);


CREATE TABLE usuarios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    run INT NOT NULL UNIQUE,
	nombre VARCHAR(20) NULL,
    apellidos VARCHAR(20) NULL,
    fechaNac DATE NOT NULL
);

/*ALTER TABLE usuarios
ADD COLUMN idUsuario INT NULL;*/ /*FK CLIENTE*/

/*ALTER TABLE usuarios
ADD CONSTRAINT usuario_cliente_FK
FOREIGN KEY (idUsuario) REFERENCES Cliente(idUsuario);
*/
ALTER TABLE Cliente
ADD CONSTRAINT cliente_usuario_FK
FOREIGN KEY (idUsuario) REFERENCES usuarios(id);

CREATE TABLE administrativos(
	run INT NOT NULL PRIMARY KEY,
    nombres VARCHAR(45) NULL,
    apellidos VARCHAR(45) NULL,
    email VARCHAR(25) NULL,
    area VARCHAR(25) NULL,
    idUsuario INT NOT NULL /*FK usuario*/
);

ALTER TABLE administrativos
ADD CONSTRAINT administrativos_usuario_FK
FOREIGN KEY (idUsuario) REFERENCES usuarios(id);


CREATE TABLE profesionales(
	rut INT NOT NULL PRIMARY KEY,
    nombres VARCHAR(45) NULL,
    apellidos VARCHAR(45) NULL,
    telefono INT NULL,
    tituloProfesional VARCHAR(30) NULL,
    proyecto VARCHAR(45) NULL,
    idUsuario INT NOT NULL
);

ALTER TABLE profesionales
ADD CONSTRAINT profesionales_usuario_FK
FOREIGN KEY (idUsuario) REFERENCES usuarios(id);


/*A las tablas anteriores debe sumar las siguientes*/

/*1.- Una tabla que registre los pagos de cada cliente. Esta tabla debe contener un campo
identificador correlativo autoincremental, la fecha del pago, el monto del pago, el mes y
año que se está pagando (en campos distintos). Es necesario recordar que un cliente tiene
muchos pagos, pero un registro de pago se asociará solo a un cliente*/
CREATE TABLE pagos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fechaPago DATE NOT NULL,
    montoPago INT NOT NULL,
    mes INT NOT NULL,
    anio INT NOT NULL,
    idCliente INT NOT NULL /*FK CLIENTE*/
);

ALTER TABLE pagos
ADD CONSTRAINT pagos_cliente_FK
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);

/*2.- Una tabla que registre asesorías realizadas a los clientes. Una asesoría es una actividad
de verificación de situaciones que pueden generar problemas en el mediano plazo. Por
cada una de estas instancias se desea conocer un código único, la fecha de realización, el motivo por el cual se solicita y el profesional al que se asignará dicha asesoría (debe existir
una llave foránea a la tabla profesional)*/
CREATE TABLE asesoria(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    motivoSolicitud VARCHAR(50) NULL,
    idProfesional INT NOT NULL /*FK PROFESIONAL*/
);

ALTER TABLE asesoria
ADD CONSTRAINT profesionales_asesoria_FK
FOREIGN KEY (idProfesional) REFERENCES profesionales(rut);


/*3.- Por cada asesoría, se generan una o más actividades de mejora, que son
recomendaciones que el profesional hace al cliente. En cada una de estas instancias se
registra un campo único autoincremental, el título de la actividad de mejora, la
descripción de esta y el plazo en días de resolución.*/
CREATE TABLE mejoras(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mejora VARCHAR(50) NULL,
    descripcion VARCHAR(200) NULL,
    plazo INT NOT NULL,
    idAsesoria INT NOT NULL /*FK asesoria*/
);
ALTER TABLE mejoras
ADD CONSTRAINT mejoras_asesoria_FK
FOREIGN KEY (idAsesoria) REFERENCES asesoria(id);

/*En base al enunciado anterior, se solicita que realice las siguientes labores como parte de esta evaluación:*/

/*1.- Script completo con la creación de la base de datos. Debe crear las tablas en el orden lógico, y debe considerar en ello todas las restricciones y elementos que sea necesario abordar*/
/*ESTE MISMO SCRIPT ES EL ENTREGABLE:
 PERMITE CREAR BASE DE DATOS, CREAR TABLAS, CREAR LAS RELACIONES ENTRE TABLAS, E INSERCIÓN DE DATOS PARA POSTERIOR CONSULTA*/
 
 /*INSERTAR REGISTROS EN LA TABLA USUARIOS*/
INSERT INTO usuarios
(run, nombre, apellidos, fechaNac)
VALUES
('123456', 'Matias', 'Calderon', '2000-06-02'),
('987654', 'Priscila', 'Carrillo', '1995-05-03'),
('147852', 'Leonel', 'Briones', '1983-09-05'),
('963258', 'Adrian', 'Fredes', '1995-03-15'),
('159753', 'Benjamin', 'Pavez', '1998-05-02');
/*2.-Al script anterior debe agregar consultas de inserción de registros en cada tabla. Se pide como mínimo tres registros en cada tabla insertados. Debe cuidar el orden lógico de inserción de datos, a fin de no generar conflictos con las restricciones*/
/*INSERTAR REGISTROS A LA TABLA CLIENTES*/
INSERT INTO Cliente
(rutCliente, cliNombres, cliApellidos, cliTelefono, cliAfp, cliSistemaSalud, cliDireccion, cliComuna, cliEdad, idUsuario)
VALUES
('159753', "Benjamín", "Pavéz", 555555, "AFP A", 1, "", "Viña del Mar", 25, 5),
('123456', "Matías", "Calderón", 44444, "AFP B", 2, "", "Viña del Mar", 22, 1),
('147852', "Leonel", "Briones", 33333, "AFP C", 1, "", "Quillota", 40, 3),
('987654', "Priscila", "Carrillo", 222222, "AFP A", 2, "", "Valparaíso", 28, 2),
('963258', "Adrián", "Fredes", 111111, "AFP C", 1, "", "Casablanca", 28, 4)
;

/*DATOS BENJAMÍN PAVÉZ*/
/*INSERTAR REGISTROS TABLA VISITA*/
INSERT INTO Visita
(visFecha, visHora, visLugar, visComentarios, cliente_rutCliente)
VALUES 
('25-07-23', '16:30', 'Nogales', 'Visita sin novedades','159753'),
('28-02-23', '17:20', 'Ventana', 'Visita sin novedades','963258'),
('12-01-23', '18:00', 'Quintero', 'Atencion en enfermeria por malestares','123456'),
('30-12-22', '19:00', 'Valparaiso','Visita sin novedades','147852'),
('15-02-23', '12:30', 'Viña del mar', 'Visita sin novedades','987654');

/*INSERTAR REGISTROS TABLA CHECKEOS*/
INSERT INTO checkeos VALUES
('1','Claudia'),
('2','Jorge'),
('3','Luisa'),
('4','Hugo'),
('5','Raquel');

/*INSERTAR REGISTROS TABLA VISITACHECKEO*/
INSERT INTO visitaCheckeo
(idVisita, idCheckeo)
VALUES 
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5');

/*INSERTAR REGISTROS TABLA RESULTADOCHECKEO*/
INSERT INTO resultadoCheckeo VALUES
('1','CUMPLE'),
('2','CUMPLE'),
('3','C/OBSERVACIONES'),
('4','CUMPLE'),
('5','CUMPLE');

/*INSERTAR REGISTROS TABLA USUARIOS*/
/*INSERT INTO usuarios VALUES
('1','1','Matias','Calderon','2000-06-02','1'),
('2','2','Priscila','Carrillo','1995-05-03','2'),
('3','3','Leonel','Briones','1983-09-05','3'),
('4','4','Adrian','Fredes','1995-03-15','4'),
('5','5','Benjamin','Pavez','1998-05-02','5');*/

/*INSERTAR REGISTROS A LA TABLA PAGOS*/
INSERT INTO pagos
(fechaPago, montoPago, mes, anio, idCliente)
VALUES
('2022/7/25', 149990, 7, 2022, 1),
('2022/4/14', 78990, 4, 2022, 2),
('2022/3/10', 45666, 3, 2022, 3),
('2023/1/12', 145111, 1, 2023, 4),
('2022/8/6',  745215, 8, 2023, 5)
;
 /*INSERTAR REGISTROS A LA TABLA PROFESIONALES*/
 INSERT INTO profesionales
 (rut, nombres, apellidos, telefono, tituloProfesional, proyecto, idUsuario)
 VALUES
 (123, 'Juan Benito', 'Pérez Melo', 777777, 'Arquitecto', 'Proyecto A', 1),
 (456, 'Luz María', 'González Tabilo', 888888, 'Ingeniera Civil', 'Proyecto A', 2),
 (789, 'José Felipe', 'Rodriguez Araya', 999999, 'Ingeniero Comercial', 'Proyecto B', 3),
 (012, 'Daniel Gustavo','Araya Carreño', 444444, 'Ingeniero Civil', 'Proyecto C', 4),
 (345, 'Pamela Constanza', 'Berríos Gómez', 555555, 'Ingeniera Comercial', 'Proyecto D', 5)
 ;
 
 /*INGRESAR REGISTROS A LA TABLA ASESORIA*/
 INSERT INTO asesoria
 (fecha, motivoSolicitud, idProfesional)
 VALUES
 ('2023/1/14', 'ASESORIA A', 123),
 ('2022/2/14', 'ASESORIA B', 456),
 ('2022/1/15', 'ASESORIA C', 789),
 ('2021/12/16', 'ASESORIA D', 012),
 ('2021/12/14', 'ASESORIA E', 345)
 ;
 /*INSERTAR REGISTROS MEJORA */
 INSERT INTO mejoras
 (mejora, descripcion, plazo, idAsesoria)
 VALUES
 ('MEJORA 1', 'DESCRIPCION A', 5, 1),
 ('MEJORA 2', 'DESCRIPCION B', 7, 2),
 ('MEJORA 3', 'DESCRIPCION C', 4, 3),
 ('MEJORA 4', 'DESCRIPCION D', 12, 4),
 ('MEJORA 5', 'DESCRIPCION E', 4, 5)
 ;
/*datos PRISCILA CARRILLO*/
/*INSERTAR REGISTROS EN TABLA CAPACITACION*/
INSERT INTO Capacitacion
(idCapacitacion, capFecha, capHora, capLugar, capDuracion, rutCliente)
VALUES 
(6, '07-02-23', '08:00', "Viña del mar", 35, 123456 ),
(7, '08-02-23', '09:00', "Valparaiso", 40, 987654 ),
(8, '09-02-23', '10:00', "Limache", 45, 147852),
(9, '10-02-23', '11:00', "Peñablanca", 2, 159753),
(10, '11-02-23', '12:00', "Quilpue", 50, 963258 )
;

/*INSERTAR REGISTROS EN TABLA ASISTENTES*/
INSERT INTO Asistentes
(idAsistente, asisNombreCompleto, asisEdad, capacitacion_idCapacitacion, asisCorreo, asisTelefono)
VALUES 
(10, "Marcos Durán", 30, 6, "marcosduran@gmail.com", 95645324 ),
(11, "Sonia Guerra", 25, 7, "soniaguerra@gmail.com", 93409888),
(12, "Maria Cabrera", 28, 8, "mariacabrera@gmail.com", 92332109 ),
(13, "Monica Garrido", 29, 9, "monicagarrido@gmail.com", 97800984 ),
(14, "Fernando Flores", 31, 10, "fernandoflores@gmail.com", 97660456)
;

/*DATOS MATIAS CALDERÓN*/
/*INSERTAR REGISTROS EN TABLA ACCIDENTE*/
INSERT INTO Accidente (idAccidente, acciFecha, acciHora, acciLugar, acciOrigen, acciConsecuencias, idCliente) 
VALUES (11, '05-04-23', '22:00', 'Providencia', 'mal estacionado', 'parteEmpadronado', 1),
		(12, '06-07-22', '21:30', 'Calle7', 'atropello', ' heridos', 2),
		(13, '11-03-22', '15:45', 'Calle mirador', 'colicionPare', ' herido', 3),
		(14, '06-04-19', '16:15', 'Libertad', 'PersonaCorriendo', 'caida', 5),
		(15, '07-05-23', '17:45', 'Lomiras Bajo', 'Pelea de almunos', 'moreton', 4);
        
/*Diccionario de datos del modelo, indicando como mínimo: nombre de la tabla, descripción de la función de la tabla, listado con campos de la tabla indicando nombre, tipo de dato, precisión y descripción del campo. Debe indicar finalmente cual o cuales campos son parte de la llave primaria, y con qué tablas se relaciona.*/

/*Finalmente, en un archivo aparte o bien en el mismo script indicado en el punto
inicial, genere tres consultas de búsqueda de datos, que realicen lo siguiente:*/


/*a) Realice una consulta que permita listar todas las capacitaciones de un cliente en
particular, indicando el nombre completo, la edad y el correo electrónico de los asistentes.*/
/*
SELECT a.asisNombreCompleto, a.asisEdad, a.asisCorreo, c.idCapacitacion
FROM Capacitacion c
JOIN Asistentes a
ON a.capacitacion_idCapacitacion = c.idCapacitacion
WHERE cliente_rutCliente = 2
;
*/
/*
+--------------------+----------+-----------------------+----------------+
| asisNombreCompleto | asisEdad | asisCorreo            | idCapacitacion |
+--------------------+----------+-----------------------+----------------+
| Sonia Guerra       |       25 | soniaguerra@gmail.com |              7 |
+--------------------+----------+-----------------------+----------------+
1 row in set (0,00 sec)

*/

/*b) Realice una consulta que permita desplegar todas las visitas en terreno realizadas a los clientes que sean de la comuna de Valparaíso. Por cada visita debe indicar todos los chequeos que se hicieron en ella, junto con el estado de cumplimiento de cada uno.*/

/*
SELECT Cliente.cliNombres, Cliente.cliComuna, Visita.idVisita, visitaCheckeo.idCheckeo, checkeos.id, checkeos.nombre,resultadoCheckeo.resultadoCheckeo
FROM resultadoCheckeo
INNER JOIN checkeos
ON resultadoCheckeo.checkeos_id = checkeos.id
INNER JOIN visitaCheckeo
ON checkeos.id = visitaCheckeo.idCheckeo
INNER JOIN Visita
ON visitaCheckeo.idVisita = Visita.idVisita
INNER JOIN Cliente
ON Cliente.rutCliente = Visita.cliente_rutCliente
WHERE cliComuna = 'Valparaíso'
;
*/
/*
+------------+-------------+----------+-----------+----+---------+------------------+
| cliNombres | cliComuna   | idVisita | idCheckeo | id | nombre  | resultadoCheckeo |
+------------+-------------+----------+-----------+----+---------+------------------+
| Priscila   | Valparaíso  |        1 |         1 |  1 | Claudia | CUMPLE           |
+------------+-------------+----------+-----------+----+---------+------------------+
1 row in set (0,00 sec)

*/

/*c) Realice una consulta que despliegue los accidentes registrados para todos los clientes, indicando los datos de detalle del accidente, y el nombre, apellido, RUT y teléfono del
cliente al que se asocia dicha situación*/

/*SELECT Accidente.acciFecha, Accidente.acciHora, Accidente.acciLugar, Accidente.acciOrigen, Accidente.acciConsecuencias, Cliente.cliNombres
FROM Accidente
INNER JOIN Cliente
ON Cliente.rutCliente = Accidente.cliente_rutCliente
ORDER BY Accidente.acciFecha
;
*/
/*
+------------+----------+---------------+------------------+-------------------+------------+
| acciFecha  | acciHora | acciLugar     | acciOrigen       | acciConsecuencias | cliNombres |
+------------+----------+---------------+------------------+-------------------+------------+
| 2005-04-23 | 22:00:00 | Providencia   | mal estacionado  | parteEmpadronado  | Benjamín   |
| 2006-04-19 | 16:15:00 | Libertad      | PersonaCorriendo | caida             | Priscila   |
| 2006-07-22 | 21:30:00 | Calle7        | atropello        |  heridos          | Matías     |
| 2007-05-23 | 17:45:00 | Lomiras Bajo  | Pelea de almunos | moreton           | Adrián     |
| 2011-03-22 | 15:45:00 | Calle mirador | colicionPare     |  herido           | Leonel     |
+------------+----------+---------------+------------------+-------------------+------------+
5 rows in set (0,00 sec)

*/


