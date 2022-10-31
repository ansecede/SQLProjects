CREATE DATABASE PROYECTOBD;
USE PROYECTOBD;

CREATE TABLE USUARIOSBD
(
USUARIO VARCHAR(30) PRIMARY KEY,
CONTRASEÑA VARCHAR(30)
);

CREATE TABLE MANTENIMIENTO
(
CEDULA VARCHAR(30) PRIMARY KEY,
NOMBRE_COMPLETO VARCHAR(30),
FECHA_NACIMIENTO DATE,
CORREO_ELECTRONICO VARCHAR(30),
TELEFONO INT NULL,
DIRECCION VARCHAR(30)
);

CREATE TABLE ADMINISTRACION
(
CEDULA VARCHAR(30) PRIMARY KEY,
NOMBRE_COMPLETO VARCHAR(30),
FECHA_NACIMIENTO DATE,
CORREO_ELECTRONICO VARCHAR(30),
TELEFONO INT NULL,
DIRECCION VARCHAR(30)
);

CREATE TABLE CINTURON
(
CINTURON_ID INT PRIMARY KEY,
COLOR VARCHAR(30)
);

CREATE TABLE PROFESOR
(
CEDULA VARCHAR(30) PRIMARY KEY,
NOMBRE_COMPLETO VARCHAR(30),
FECHA_NACIMIENTO DATE,
CORREO_ELECTRONICO VARCHAR(30),
TELEFONO INT,
DIRECCION VARCHAR(30),
CINTURON INT,
FOREIGN KEY (CINTURON) REFERENCES CINTURON (CINTURON_ID)
);

CREATE TABLE HORARIO_CLASE
(
ID_HORARIO VARCHAR(30) PRIMARY KEY,
DIA VARCHAR(30),
HORA VARCHAR(30),
CEDULA_PROFESOR VARCHAR(30),
foreign key (CEDULA_PROFESOR) REFERENCES PROFESOR (CEDULA)
);

CREATE TABLE ALUMNO
(
CEDULA VARCHAR(30) PRIMARY KEY,
NOMBRE_COMPLETO VARCHAR(70),
EDAD INT,
Dia_Pago DATE,
CINTURON INT,
TIEMPO_CINTURON VARCHAR(30),
FOREIGN KEY (CINTURON) REFERENCES CINTURON (CINTURON_ID)
);

CREATE TABLE TORNEOS
(
ID_TORNEO VARCHAR(30) PRIMARY KEY,
CATEGORIA VARCHAR(30),
PESO DOUBLE,
FECHA_COMPETICION DATE
);

CREATE TABLE REGISTRAR
(
ID_REGISTRO VARCHAR(30) PRIMARY KEY,
FECHA_CLASE DATE,
ASISTENCIA BOOLEAN,
EJERCICIOS_REALIZADOS VARCHAR(30),
ID_HORARIO VARCHAR(30),
CEDULA_ALUMNO VARCHAR(30),
foreign key (ID_HORARIO) REFERENCES HORARIO_CLASE (ID_HORARIO),
foreign key (CEDULA_ALUMNO) REFERENCES ALUMNO (CEDULA)
);

CREATE TABLE GANADOR
(
ID_TORNEO VARCHAR(30),
CEDULA VARCHAR(30),
PRIMARY KEY(ID_TORNEO, CEDULA),
foreign key (ID_TORNEO) REFERENCES TORNEOS (ID_TORNEO),
foreign key (CEDULA) REFERENCES ALUMNO (CEDULA)
);

CREATE TABLE COMPETIR
(
ID_TORNEO VARCHAR(30),
CEDULA VARCHAR(30),
PRIMARY KEY(ID_TORNEO, CEDULA),
foreign key (ID_TORNEO) REFERENCES TORNEOS (ID_TORNEO),
foreign key (CEDULA) REFERENCES ALUMNO (CEDULA)
);

CREATE TABLE MATRICULAR
(
IDMATRICULAR VARCHAR(30),
CEDULA VARCHAR(30),
PRIMARY KEY(IDMATRICULAR, CEDULA),
foreign key (IDMATRICULAR) REFERENCES ADMINISTRACION (CEDULA),
foreign key (CEDULA) REFERENCES ALUMNO (CEDULA)
);

CREATE TABLE FAMILIAR
(
ID_ALUMNO VARCHAR(30) ,
ID_FAMILIAR VARCHAR(30) ,
PRIMARY KEY(ID_ALUMNO , ID_FAMILIAR),
foreign key (ID_ALUMNO) REFERENCES ALUMNO (CEDULA),
foreign key (ID_FAMILIAR) REFERENCES ALUMNO (CEDULA)
);


insert  into USUARIOSBD(USUARIO, CONTRASEÑA) values
('carlos','12345'),
('hugo','abc'),
('ana','a1a2'),
('andres','b1b2');

insert  into MANTENIMIENTO(CEDULA, NOMBRE_COMPLETO, FECHA_NACIMIENTO, CORREO_ELECTRONICO, TELEFONO, DIRECCION   ) values
('0985692200','Sofia Cristina Navarrez Lopez','1995-04-25','soficristi@gmail.com', 2345008, 'Alborada 3ra Etapa'  );

insert  into ADMINISTRACION(CEDULA, NOMBRE_COMPLETO, FECHA_NACIMIENTO, CORREO_ELECTRONICO, TELEFONO, DIRECCION   ) values
('0933206599','Luis Alberto Ceballos Castro ','1994-07-24','luisalbertoceba@gmail.com', 2148056, 'Alborada 2da Etapa'  );

insert  into cinturon(CINTURON_ID, COLOR) values
	(1, 'Blanco'),
	(2, 'Amarillo'),
	(3, 'Amarillo verde'),
	(4, 'Verde'),
	(5, 'Azul'),
	(6, 'Azul rojo'),
	(7, 'Rojo'),
	(8, 'Rojo negro'),
    (9, 'Negro');

insert  into profesor(CEDULA, NOMBRE_COMPLETO, FECHA_NACIMIENTO, CORREO_ELECTRONICO, TELEFONO, DIRECCION, CINTURON) values
('0951741815', 'Jose Juan Castillo Jara', '1975-04-22', 'josecastillo@gmail.com', 12345678, 'Alborada 2da Etapa', 9),
('1305826071', 'Hugo Emilio Wong Salas', '1980-09-06', 'hugowong@gmail.com', 12345689, 'Samanes 6', 9),
('0905636622', 'Ana Victoria Saltos Ming', '1987-12-04', 'anasaltos@gmail.com', 23456789, 'Los Almendros', 9),
('0987654321', 'Andres Paul Alban Mena', '1977-03-11', 'andresalban@gmail.com', 22334455, 'Las Acacias', 9),
('0930338285', 'Bruno Jesus Iturralde Shang', '1990-10-26', 'brunoitu@gmail.com', 11335577, 'Machala y General Gomez', 9);

insert  into HORARIO_CLASE(ID_HORARIO, DIA, HORA, CEDULA_PROFESOR) values
('001', 'Lunes', '18:00-20:00', '0951741815'),
('002', 'Martes', '14:00-16:00', '0951741815'),
('003', 'Miercoles', '09:00-11:00', '0951741815'),
('004', 'Jueves', '11:00-13:00', '0951741815'),
('005', 'Viernes', '14:00-16:00', '0951741815'),

('006', 'Lunes', '10:00-12:00', '1305826071'),
('007', 'Martes', '14:00-16:00', '1305826071'),
('008', 'Miercoles', '09:00-11:00', '1305826071'),
('009', 'Jueves', '11:00-13:00', '1305826071'),
('010', 'Viernes', '14:00-16:00', '1305826071'),

('011', 'Lunes', '09:00-11:00', '0905636622'),
('012', 'Martes', '09:00-11:00', '0905636622'),
('013', 'Miercoles', '09:00-11:00', '0905636622'),
('014', 'Jueves', '09:00-11:00', '0905636622'),
('015', 'Viernes', '09:00-11:00', '0905636622'),

('016', 'Lunes', '11:00-13:00', '0987654321'),
('017', 'Martes', '11:00-13:00', '0987654321'),
('018', 'Miercoles', '11:00-13:00', '0987654321'),
('019', 'Jueves', '11:00-13:00', '0987654321'),
('020', 'Viernes', '11:00-13:00', '0987654321'),

('021', 'Lunes', '14:00-16:00', '0930338285'),
('022', 'Martes', '14:00-16:00', '0930338285'),
('023', 'Miercoles', '14:00-16:00', '0930338285'),
('024', 'Jueves', '14:00-16:00', '0930338285'),
('025', 'Viernes', '14:00-16:00', '0930338285');

insert  into ALUMNO(CEDULA, NOMBRE_COMPLETO, EDAD, Dia_Pago, CINTURON, TIEMPO_CINTURON) values
('0962186512', 'Ana Belen Jara Yupa', 15, '2020-04-05', 3, '1 mes'),
('0978945612', 'Carlos Javier Nuñez Riera', 9, '2020-08-07', 1, '2 meses'),
('0956991245', 'Ana Maria Silva Gutierrez ',25 , '2020-07-05',2 , '4 meses'), 
('0988589801', 'Josefa Isabel Molina Castro',14 , '2020-03-01',3 , '3 meses'),
('0988647714', 'Maria Dolores Pereyra Herrera',23 , '2020-11-05',4 , '1 mes'),

('0910241062', 'Maria Teresa Acosta Medina',14 , '2020-10-15',2 , '2 meses'),
('0936002198', 'Laura Cristina Benitez Flores',18 , '2020-04-25',5 , '1 mes'),
('0945006203', 'Manuel Alejandro Alvarez Vera',19 , '2020-06-15',3 , '4 meses'),
('0930201023', 'Adrian Mario Sosa Torres',21 , '2020-04-11',3 , '2 meses'),
('0925006950', 'Alex Diego Sanchez Romero',22 , '2020-02-01',1 , '5 meses'),

('0988000148', 'Leo Lucas Perez Garcia',17 , '2020-02-04',5 , '5 meses'),
('0958602301', 'Emma Valeria Diaz Martinez',18 , '2020-02-18',4 , '1 mes'),
('0956009820', 'Lucia Valentina Lopez Diaz',19 , '2020-07-07',4 , '2 meses'),
('0982878500', 'Olivia Amaia Alvarez Vera',20 , '2020-08-16',2 , '1 mes'),
('0955653520', 'Marta Francisca Gonzales Acosta',15, '2020-06-11',3 , '6 meses'),

('0920102255', 'Jose Luis Pereyra Rojas',23 , '2020-08-01',3 , '2 meses'),
('0977474548', 'Jose Antonio Molina Castro',22 , '2020-01-01',2 , '1 mes'),
('0914121510', 'David Juan Ortiz Silva',18 , '2020-01-12',1 , '2 meses'), 
('0931303536', 'Jose Francisco Nuñez Luna',19 , '2020-02-19',4 , '4 meses'),
('0956598688', 'Antonio Manuel Godoy Jara',24 , '2020-05-03',3 , '3 meses');

insert  into REGISTRAR(ID_REGISTRO, FECHA_CLASE, ASISTENCIA, EJERCICIOS_REALIZADOS, ID_HORARIO, CEDULA_ALUMNO) values
('00001', '2020-08-31', true , 'Dips', '001', '0962186512'),
('00002', '2020-09-01', true , 'Jumping Jacks', '002', '0978945612'),
('00003', '2020-09-02', false , 'Sentadilla', '003', '0956991245'),
('00004', '2020-09-03', true , 'Plancha boca arriba', '004', '0988589801'),
('00005', '2020-09-04', true , 'Estocadas', '005', '0988647714'),

('00006', '2020-08-31', true , 'Plancha boca arriba', '006', '0910241062'),
('00007', '2020-09-01', false , 'Back Extensión Hold', '007', '0936002198'),
('00008', '2020-09-02', true , 'Sentadilla', '008', '0945006203'),
('00009', '2020-09-03', true , 'Jumping Jacks', '009', '0930201023'),
('00010', '2020-09-04', true , 'Push Up', '010', '0925006950'),

('00011', '2020-08-31', true , 'Back Extensión Hold', '011', '0988000148'),
('00012', '2020-09-01', true , 'Jumping Jacks', '012', '0958602301'),
('00013', '2020-09-02', true , 'Sentadilla', '013', '0956009820'),
('00014', '2020-09-03', true , 'Push Up', '014', '0982878500'),
('00015', '2020-09-04', true , 'Burpees', '015', '0955653520'),

('00016', '2020-08-31', true , 'Plancha boca arriba', '016', '0920102255'),
('00017', '2020-09-01', true , 'Estocadas', '017', '0977474548'),
('00018', '2020-09-02', true , 'Sentadilla', '018', '0914121510'),
('00019', '2020-09-03', true , 'Burpees', '019', '0931303536'),
('00020', '2020-09-04', true , 'Dips', '020', '0956598688');


insert  into TORNEOS(ID_TORNEO, CATEGORIA, PESO, FECHA_COMPETICION) values
('0001', 'Intercantonal', 27, '2020-02-03'),
('0002', 'Interprovincial', 35, '2020-01-25'),
('0003', 'Cantonal', 30, '2020-02-15'),
('0004', 'Provincial', 40, '2020-01-23'),
('0005', 'Region Costa', 35, '2020-01-09'),
('0006', 'Region Sierra', 32,'2020-02-23'),
('0007', 'Cantonal',26 , '2020-02-24'),
('0008', 'Interprovincial', 26, '2020-02-25'),
('0009','Internacional', 33, '2020-02-10');

insert  into GANADOR(ID_TORNEO,CEDULA) values
('0001','0962186512'),
('0002','0930201023'),
('0003','0988000148'),
('0004','0920102255'),
('0005','0982878500'),
('0006','0977474548'),
('0007','0931303536'),
('0008','0914121510'),
('0009','0956598688');

insert  into COMPETIR(ID_TORNEO,CEDULA) values
('0001','0936002198'),
('0001','0962186512'),
('0001','0978945612'),
('0001','0988647714'),
('0001','0945006203'),
('0002','0988589801'),
('0002','0930201023'),
('0003','0977474548'),
('0003','0988000148'),
('0003','0914121510'),
('0004','0931303536'),
('0004','0920102255'),
('0005','0956598688'),
('0005','0982878500'),
('0006','0910241062'),
('0006','0977474548'),
('0007','0956009820'),
('0007','0931303536'),
('0008','0982878500'),
('0008','0914121510'),
('0009','0955653520'),
('0009','0956598688');

insert  into MATRICULAR(IDMATRICULAR, CEDULA) values
('0933206599','0962186512'),
('0933206599','0978945612'),
('0933206599','0956991245'),
('0933206599','0988589801'),
('0933206599','0988647714'),
('0933206599','0910241062'),
('0933206599','0936002198'),
('0933206599','0945006203'),
('0933206599','0930201023'),
('0933206599','0925006950'),
('0933206599','0988000148'),
('0933206599','0958602301'),
('0933206599','0956009820'),
('0933206599','0982878500'),
('0933206599','0955653520'),
('0933206599','0920102255'),
('0933206599','0977474548'),
('0933206599','0914121510'),
('0933206599','0931303536'),
('0933206599','0956598688');

insert  into FAMILIAR(ID_ALUMNO,ID_FAMILIAR) values
('0956598688','0962186512'),
('0931303536','0978945612'),
('0914121510','0956991245'),
('0977474548','0988589801'),
('0920102255','0988647714'),
('0955653520','0910241062'),
('0982878500','0945006203');

-- Consultas
-- 1.Mostrar la cedula, nombre, categoria e id del torneo en los que compitieron 
-- los alumnos con edad mayor a  o igual a 14
SELECT DISTINCT a.CEDULA, a.NOMBRE_COMPLETO, t.ID_TORNEO, t.CATEGORIA
FROM Alumno a,  Competir c, Torneos t
WHERE (a.CEDULA=C.CEDULA) AND (t.ID_TORNEO=c.ID_TORNEO) AND a.EDAD>=14;

-- 2. Mostrar los alumnos y su color de cinturon que se registraron a las clases de agosto
SELECT c.CEDULA, c.NOMBRE_COMPLETO, r.FECHA_CLASE, ci.Color
FROM registrar r , alumno c, cinturon ci
WHERE  c.CEDULA=r.CEDULA_ALUMNO AND c.cinturon=ci.cinturon_id AND r.FECHA_CLASE like '%-08-%';

-- 3. Mostrar la cantidad de alumnos que han faltado por dia
SELECT HC.DIA, count(HC.DIA) as CantFaltas
FROM registrar r , alumno c, horario_clase hc
WHERE  c.CEDULA=r.CEDULA_ALUMNO AND hc.ID_HORARIO=r.ID_HORARIO AND r.ASISTENCIA= false
GROUP BY hc.DIA;

-- 4. Mostrar los alumnos que asistieron a clases entre el mes de 
-- Agosto y Septiembre que tengan un familiar en la academia 
select a.nombre_completo
from alumno a, familiar f, registrar r
where a.cedula = f.id_alumno and a.cedula = r.cedula_alumno and r.asistencia = true 
AND r.fecha_clase between '2020-08-01' and '2020-09-30'
UNION
select a.nombre_completo
from alumno a, familiar f, registrar r
where a.cedula = f.id_familiar and a.cedula = r.cedula_alumno and r.asistencia = true 
AND r.fecha_clase between '2020-08-01' and '2020-09-30';

-- Views 
create view Tiempo_Cinturon as
select a.CEDULA, a.NOMBRE_COMPLETO, a.TIEMPO_CINTURON, c.COLOR
from alumno a, cinturon c
where a.CINTURON= c.CINTURON_ID 
order by NOMBRE_COMPLETO;

create view Horarios_Profesores as
select p.CEDULA, p.NOMBRE_COMPLETO, hc.DIA, hc.HORA
from profesor p, horario_clase hc
where p.CEDULA = hc.CEDULA_PROFESOR;

create view Alumnos_Ganadores as
select a.CEDULA, a.NOMBRE_COMPLETO, a.EDAD, t.CATEGORIA, c.COLOR
from alumno a, ganador g, torneos t, cinturon c
where a.CEDULA=g.CEDULA AND g.ID_TORNEO=t.ID_TORNEO AND a.CINTURON=c.CINTURON_ID
group by a.CEDULA;

create view Familiares as
select a.CEDULA, a.NOMBRE_COMPLETO, f.cedulaFamiliar, f.nombre
from alumno a, (select a.NOMBRE_COMPLETO as nombre, a.CEDULA as cedulaFamiliar, f.ID_FAMILIAR
				from alumno a, familiar f
				where f.ID_ALUMNO = a.CEDULA) f
where f.ID_FAMILIAR = a.CEDULA;

-- SPS
-- 1. Ver horario de un solo profesor
delimiter //
create procedure verHorarioProfesor( IN CedulaProfesor varchar(30))
begin
select *
from horario_clase
where CEDULA_PROFESOR = CedulaProfesor;
end //
delimiter ;
-- call verHorarioProfesor('0951741815');

-- 2. Ver el color del cinturon y el tiempo que tiene un estudiante especificando su cedula.
delimiter //
create procedure verCinturon( IN IdAlumno varchar(30), OUT color varchar(30), OUT tiempo varchar(30))
begin
select c.COLOR,a.TIEMPO_CINTURON into color,tiempo
from alumno a, cinturon c
where a.CINTURON= c.CINTURON_ID and a.CEDULA=IdAlumno;
end //
delimiter ;
-- call verCinturon('0988589801',@color,@tiempo);
-- select @color,@tiempo;

-- 3. Elimiar el registro de un alumno en la tabla alumno
delimiter //
create procedure eliminarAlumno( IN cedula varchar(30))
begin
delete from alumno where CEDULA=cedula;
end //
delimiter ;
-- call eliminarAlumno('0956009820');

-- 4. Mostrar los alunmos de acuerdo a la edad especificada
delimiter //
create procedure edadAlumnos(IN edad int)
begin
select *
from alumno a
where a.EDAD = edad;
end //
delimiter ;
-- call edadAlumnos(20);

-- Triggers
-- 1. Colocar la asistencia a falso antes de INSERT un registro
delimiter |
create trigger asistenciaInicial before insert on registrar
for each row
begin
set NEW.ASISTENCIA= false ;
end |
delimiter ;

-- 2. Eliminar los registro de una hora de clase cuando se actualiza su hora.
delimiter |
create trigger eliminarRegistro1 after update on horario_clase
for each row
begin
delete from registrar r where r.ID_HORARIO= NEW.ID_HORARIO;
end |
delimiter ;

-- 3. Actualizar el tiempo cuando cambia de cinturon
delimiter |
create trigger actualizarTiempo before update on alumno
for each row
begin   
if (NEW.CINTURON != OLD.CINTURON) then set NEW.TIEMPO_CINTURON='0 meses';
end if;

end |
delimiter ;

-- 4. Como nueva regla, si se agrega nuevos torneos cantonales, estos serán con un peso de 35 kg.
delimiter |
create trigger setPesoCantonal before insert on torneos
for each row
begin
if(new.CATEGORIA = 'Cantonal' ) then set NEW.PESO = 35;
end if;
end |
delimiter ;




