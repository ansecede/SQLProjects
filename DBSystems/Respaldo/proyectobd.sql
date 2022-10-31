-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectobd
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administracion`
--

DROP TABLE IF EXISTS `administracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administracion` (
  `CEDULA` varchar(30) NOT NULL,
  `NOMBRE_COMPLETO` varchar(30) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(30) DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administracion`
--

LOCK TABLES `administracion` WRITE;
/*!40000 ALTER TABLE `administracion` DISABLE KEYS */;
INSERT INTO `administracion` VALUES ('0933206599','Luis Alberto Ceballos Castro ','1994-07-24','luisalbertoceba@gmail.com',2148056,'Alborada 2da Etapa');
/*!40000 ALTER TABLE `administracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `CEDULA` varchar(30) NOT NULL,
  `NOMBRE_COMPLETO` varchar(70) DEFAULT NULL,
  `EDAD` int DEFAULT NULL,
  `Dia_Pago` date DEFAULT NULL,
  `CINTURON` int DEFAULT NULL,
  `TIEMPO_CINTURON` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CEDULA`),
  KEY `CINTURON` (`CINTURON`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`CINTURON`) REFERENCES `cinturon` (`CINTURON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES ('0910241062','Maria Teresa Acosta Medina',14,'2020-10-15',2,'2 meses'),('0914121510','David Juan Ortiz Silva',18,'2020-01-12',1,'2 meses'),('0920102255','Jose Luis Pereyra Rojas',23,'2020-08-01',3,'2 meses'),('0925006950','Alex Diego Sanchez Romero',22,'2020-02-01',1,'5 meses'),('0930201023','Adrian Mario Sosa Torres',21,'2020-04-11',3,'2 meses'),('0931303536','Jose Francisco Nuñez Luna',19,'2020-02-19',4,'4 meses'),('0936002198','Laura Cristina Benitez Flores',18,'2020-04-25',5,'1 mes'),('0945006203','Manuel Alejandro Alvarez Vera',19,'2020-06-15',3,'4 meses'),('0955653520','Marta Francisca Gonzales Acosta',15,'2020-06-11',3,'6 meses'),('0956009820','Lucia Valentina Lopez Diaz',19,'2020-07-07',4,'2 meses'),('0956598688','Antonio Manuel Godoy Jara',24,'2020-05-03',3,'3 meses'),('0956991245','Ana Maria Silva Gutierrez ',25,'2020-07-05',2,'4 meses'),('0958602301','Emma Valeria Diaz Martinez',18,'2020-02-18',4,'1 mes'),('0962186512','Ana Belen Jara Yupa',15,'2020-04-05',3,'1 mes'),('0977474548','Jose Antonio Molina Castro',22,'2020-01-01',2,'1 mes'),('0978945612','Carlos Javier Nuñez Riera',9,'2020-08-07',1,'2 meses'),('0982878500','Olivia Amaia Alvarez Vera',20,'2020-08-16',2,'1 mes'),('0988000148','Leo Lucas Perez Garcia',17,'2020-02-04',5,'5 meses'),('0988589801','Josefa Isabel Molina Castro',14,'2020-03-01',3,'3 meses'),('0988647714','Maria Dolores Pereyra Herrera',23,'2020-11-05',4,'1 mes');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarTiempo` BEFORE UPDATE ON `alumno` FOR EACH ROW begin
set NEW.TIEMPO_CINTURON='0 meses';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `alumnos_ganadores`
--

DROP TABLE IF EXISTS `alumnos_ganadores`;
/*!50001 DROP VIEW IF EXISTS `alumnos_ganadores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnos_ganadores` AS SELECT 
 1 AS `CEDULA`,
 1 AS `NOMBRE_COMPLETO`,
 1 AS `EDAD`,
 1 AS `CATEGORIA`,
 1 AS `COLOR`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cinturon`
--

DROP TABLE IF EXISTS `cinturon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinturon` (
  `CINTURON_ID` int NOT NULL,
  `COLOR` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CINTURON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinturon`
--

LOCK TABLES `cinturon` WRITE;
/*!40000 ALTER TABLE `cinturon` DISABLE KEYS */;
INSERT INTO `cinturon` VALUES (1,'Blanco'),(2,'Amarillo'),(3,'Amarillo verde'),(4,'Verde'),(5,'Azul'),(6,'Azul rojo'),(7,'Rojo'),(8,'Rojo negro'),(9,'Negro');
/*!40000 ALTER TABLE `cinturon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competir`
--

DROP TABLE IF EXISTS `competir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competir` (
  `ID_TORNEO` varchar(30) NOT NULL,
  `CEDULA` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_TORNEO`,`CEDULA`),
  KEY `CEDULA` (`CEDULA`),
  CONSTRAINT `competir_ibfk_1` FOREIGN KEY (`ID_TORNEO`) REFERENCES `torneos` (`ID_TORNEO`),
  CONSTRAINT `competir_ibfk_2` FOREIGN KEY (`CEDULA`) REFERENCES `alumno` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competir`
--

LOCK TABLES `competir` WRITE;
/*!40000 ALTER TABLE `competir` DISABLE KEYS */;
INSERT INTO `competir` VALUES ('0006','0910241062'),('0003','0914121510'),('0008','0914121510'),('0004','0920102255'),('0002','0930201023'),('0004','0931303536'),('0007','0931303536'),('0001','0936002198'),('0001','0945006203'),('0009','0955653520'),('0007','0956009820'),('0005','0956598688'),('0009','0956598688'),('0001','0962186512'),('0003','0977474548'),('0006','0977474548'),('0001','0978945612'),('0005','0982878500'),('0008','0982878500'),('0003','0988000148'),('0002','0988589801'),('0001','0988647714');
/*!40000 ALTER TABLE `competir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiar`
--

DROP TABLE IF EXISTS `familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiar` (
  `ID_ALUMNO` varchar(30) NOT NULL,
  `ID_FAMILIAR` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_ALUMNO`,`ID_FAMILIAR`),
  KEY `ID_FAMILIAR` (`ID_FAMILIAR`),
  CONSTRAINT `familiar_ibfk_1` FOREIGN KEY (`ID_ALUMNO`) REFERENCES `alumno` (`CEDULA`),
  CONSTRAINT `familiar_ibfk_2` FOREIGN KEY (`ID_FAMILIAR`) REFERENCES `alumno` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiar`
--

LOCK TABLES `familiar` WRITE;
/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
INSERT INTO `familiar` VALUES ('0955653520','0910241062'),('0982878500','0945006203'),('0914121510','0956991245'),('0956598688','0962186512'),('0931303536','0978945612'),('0977474548','0988589801'),('0920102255','0988647714');
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `familiares`
--

DROP TABLE IF EXISTS `familiares`;
/*!50001 DROP VIEW IF EXISTS `familiares`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `familiares` AS SELECT 
 1 AS `CEDULA`,
 1 AS `NOMBRE_COMPLETO`,
 1 AS `cedulaFamiliar`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ganador`
--

DROP TABLE IF EXISTS `ganador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ganador` (
  `ID_TORNEO` varchar(30) NOT NULL,
  `CEDULA` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_TORNEO`,`CEDULA`),
  KEY `CEDULA` (`CEDULA`),
  CONSTRAINT `ganador_ibfk_1` FOREIGN KEY (`ID_TORNEO`) REFERENCES `torneos` (`ID_TORNEO`),
  CONSTRAINT `ganador_ibfk_2` FOREIGN KEY (`CEDULA`) REFERENCES `alumno` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganador`
--

LOCK TABLES `ganador` WRITE;
/*!40000 ALTER TABLE `ganador` DISABLE KEYS */;
INSERT INTO `ganador` VALUES ('0008','0914121510'),('0004','0920102255'),('0002','0930201023'),('0007','0931303536'),('0009','0956598688'),('0001','0962186512'),('0006','0977474548'),('0005','0982878500'),('0003','0988000148');
/*!40000 ALTER TABLE `ganador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_clase`
--

DROP TABLE IF EXISTS `horario_clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_clase` (
  `ID_HORARIO` varchar(30) NOT NULL,
  `DIA` varchar(30) DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `CEDULA_PROFESOR` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_HORARIO`),
  KEY `CEDULA_PROFESOR` (`CEDULA_PROFESOR`),
  CONSTRAINT `horario_clase_ibfk_1` FOREIGN KEY (`CEDULA_PROFESOR`) REFERENCES `profesor` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_clase`
--

LOCK TABLES `horario_clase` WRITE;
/*!40000 ALTER TABLE `horario_clase` DISABLE KEYS */;
INSERT INTO `horario_clase` VALUES ('001','Lunes','18:00-20:00','0951741815'),('002','Martes','14:00-16:00','0951741815'),('003','Miercoles','09:00-11:00','0951741815'),('004','Jueves','11:00-13:00','0951741815'),('005','Viernes','14:00-16:00','0951741815'),('006','Lunes','10:00-12:00','1305826071'),('007','Martes','14:00-16:00','1305826071'),('008','Miercoles','09:00-11:00','1305826071'),('009','Jueves','11:00-13:00','1305826071'),('010','Viernes','14:00-16:00','1305826071'),('011','Lunes','09:00-11:00','0905636622'),('012','Martes','09:00-11:00','0905636622'),('013','Miercoles','09:00-11:00','0905636622'),('014','Jueves','09:00-11:00','0905636622'),('015','Viernes','09:00-11:00','0905636622'),('016','Lunes','11:00-13:00','0987654321'),('017','Martes','11:00-13:00','0987654321'),('018','Miercoles','11:00-13:00','0987654321'),('019','Jueves','11:00-13:00','0987654321'),('020','Viernes','11:00-13:00','0987654321'),('021','Lunes','14:00-16:00','0930338285'),('022','Martes','14:00-16:00','0930338285'),('023','Miercoles','14:00-16:00','0930338285'),('024','Jueves','14:00-16:00','0930338285'),('025','Viernes','14:00-16:00','0930338285');
/*!40000 ALTER TABLE `horario_clase` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminarRegistro1` AFTER UPDATE ON `horario_clase` FOR EACH ROW begin
delete from registrar r where r.ID_HORARIO= NEW.ID_HORARIO;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `horarios_profesores`
--

DROP TABLE IF EXISTS `horarios_profesores`;
/*!50001 DROP VIEW IF EXISTS `horarios_profesores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `horarios_profesores` AS SELECT 
 1 AS `CEDULA`,
 1 AS `NOMBRE_COMPLETO`,
 1 AS `DIA`,
 1 AS `HORA`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `CEDULA` varchar(30) NOT NULL,
  `NOMBRE_COMPLETO` varchar(30) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(30) DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
INSERT INTO `mantenimiento` VALUES ('0985692200','Sofia Cristina Navarrez Lopez','1995-04-25','soficristi@gmail.com',2345008,'Alborada 3ra Etapa');
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricular`
--

DROP TABLE IF EXISTS `matricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricular` (
  `IDMATRICULAR` varchar(30) NOT NULL,
  `CEDULA` varchar(30) NOT NULL,
  PRIMARY KEY (`IDMATRICULAR`,`CEDULA`),
  KEY `CEDULA` (`CEDULA`),
  CONSTRAINT `matricular_ibfk_1` FOREIGN KEY (`IDMATRICULAR`) REFERENCES `administracion` (`CEDULA`),
  CONSTRAINT `matricular_ibfk_2` FOREIGN KEY (`CEDULA`) REFERENCES `alumno` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricular`
--

LOCK TABLES `matricular` WRITE;
/*!40000 ALTER TABLE `matricular` DISABLE KEYS */;
INSERT INTO `matricular` VALUES ('0933206599','0910241062'),('0933206599','0914121510'),('0933206599','0920102255'),('0933206599','0925006950'),('0933206599','0930201023'),('0933206599','0931303536'),('0933206599','0936002198'),('0933206599','0945006203'),('0933206599','0955653520'),('0933206599','0956009820'),('0933206599','0956598688'),('0933206599','0956991245'),('0933206599','0958602301'),('0933206599','0962186512'),('0933206599','0977474548'),('0933206599','0978945612'),('0933206599','0982878500'),('0933206599','0988000148'),('0933206599','0988589801'),('0933206599','0988647714');
/*!40000 ALTER TABLE `matricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `CEDULA` varchar(30) NOT NULL,
  `NOMBRE_COMPLETO` varchar(30) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(30) DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  `CINTURON` int DEFAULT NULL,
  PRIMARY KEY (`CEDULA`),
  KEY `CINTURON` (`CINTURON`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`CINTURON`) REFERENCES `cinturon` (`CINTURON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('0905636622','Ana Victoria Saltos Ming','1987-12-04','anasaltos@gmail.com',23456789,'Los Almendros',9),('0930338285','Bruno Jesus Iturralde Shang','1990-10-26','brunoitu@gmail.com',11335577,'Machala y General Gomez',9),('0951741815','Jose Juan Castillo Jara','1975-04-22','josecastillo@gmail.com',12345678,'Alborada 2da Etapa',9),('0987654321','Andres Paul Alban Mena','1977-03-11','andresalban@gmail.com',22334455,'Las Acacias',9),('1305826071','Hugo Emilio Wong Salas','1980-09-06','hugowong@gmail.com',12345689,'Samanes 6',9);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrar`
--

DROP TABLE IF EXISTS `registrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrar` (
  `ID_REGISTRO` varchar(30) NOT NULL,
  `FECHA_CLASE` date DEFAULT NULL,
  `ASISTENCIA` tinyint(1) DEFAULT NULL,
  `EJERCICIOS_REALIZADOS` varchar(30) DEFAULT NULL,
  `ID_HORARIO` varchar(30) DEFAULT NULL,
  `CEDULA_ALUMNO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_REGISTRO`),
  KEY `ID_HORARIO` (`ID_HORARIO`),
  KEY `CEDULA_ALUMNO` (`CEDULA_ALUMNO`),
  CONSTRAINT `registrar_ibfk_1` FOREIGN KEY (`ID_HORARIO`) REFERENCES `horario_clase` (`ID_HORARIO`),
  CONSTRAINT `registrar_ibfk_2` FOREIGN KEY (`CEDULA_ALUMNO`) REFERENCES `alumno` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrar`
--

LOCK TABLES `registrar` WRITE;
/*!40000 ALTER TABLE `registrar` DISABLE KEYS */;
INSERT INTO `registrar` VALUES ('00001','2020-08-31',1,'Dips','001','0962186512'),('00002','2020-09-01',1,'Jumping Jacks','002','0978945612'),('00003','2020-09-02',0,'Sentadilla','003','0956991245'),('00004','2020-09-03',1,'Plancha boca arriba','004','0988589801'),('00005','2020-09-04',1,'Estocadas','005','0988647714'),('00006','2020-08-31',1,'Plancha boca arriba','006','0910241062'),('00007','2020-09-01',0,'Back Extensión Hold','007','0936002198'),('00008','2020-09-02',1,'Sentadilla','008','0945006203'),('00009','2020-09-03',1,'Jumping Jacks','009','0930201023'),('00010','2020-09-04',1,'Push Up','010','0925006950'),('00011','2020-08-31',1,'Back Extensión Hold','011','0988000148'),('00012','2020-09-01',1,'Jumping Jacks','012','0958602301'),('00013','2020-09-02',1,'Sentadilla','013','0956009820'),('00014','2020-09-03',1,'Push Up','014','0982878500'),('00015','2020-09-04',1,'Burpees','015','0955653520'),('00016','2020-08-31',1,'Plancha boca arriba','016','0920102255'),('00017','2020-09-01',1,'Estocadas','017','0977474548'),('00018','2020-09-02',1,'Sentadilla','018','0914121510'),('00019','2020-09-03',1,'Burpees','019','0931303536'),('00020','2020-09-04',1,'Dips','020','0956598688');
/*!40000 ALTER TABLE `registrar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asistenciaInicial` BEFORE INSERT ON `registrar` FOR EACH ROW begin
set NEW.ASISTENCIA= false ;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `tiempo_cinturon`
--

DROP TABLE IF EXISTS `tiempo_cinturon`;
/*!50001 DROP VIEW IF EXISTS `tiempo_cinturon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tiempo_cinturon` AS SELECT 
 1 AS `CEDULA`,
 1 AS `NOMBRE_COMPLETO`,
 1 AS `TIEMPO_CINTURON`,
 1 AS `COLOR`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos` (
  `ID_TORNEO` varchar(30) NOT NULL,
  `CATEGORIA` varchar(30) DEFAULT NULL,
  `PESO` double DEFAULT NULL,
  `FECHA_COMPETICION` date DEFAULT NULL,
  PRIMARY KEY (`ID_TORNEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos`
--

LOCK TABLES `torneos` WRITE;
/*!40000 ALTER TABLE `torneos` DISABLE KEYS */;
INSERT INTO `torneos` VALUES ('0001','Intercantonal',27,'2020-02-03'),('0002','Interprovincial',35,'2020-01-25'),('0003','Cantonal',30,'2020-02-15'),('0004','Provincial',40,'2020-01-23'),('0005','Region Costa',35,'2020-01-09'),('0006','Region Sierra',32,'2020-02-23'),('0007','Cantonal',26,'2020-02-24'),('0008','Interprovincial',26,'2020-02-25'),('0009','Internacional',33,'2020-02-10');
/*!40000 ALTER TABLE `torneos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `setPesoCantonal` BEFORE INSERT ON `torneos` FOR EACH ROW begin
if(new.CATEGORIA = 'Cantonal' ) then set NEW.PESO = 35;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuariosbd`
--

DROP TABLE IF EXISTS `usuariosbd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariosbd` (
  `USUARIO` varchar(30) NOT NULL,
  `CONTRASEÑA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariosbd`
--

LOCK TABLES `usuariosbd` WRITE;
/*!40000 ALTER TABLE `usuariosbd` DISABLE KEYS */;
INSERT INTO `usuariosbd` VALUES ('ana','a1a2'),('andres','b1b2'),('carlos','12345'),('hugo','abc');
/*!40000 ALTER TABLE `usuariosbd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `alumnos_ganadores`
--

/*!50001 DROP VIEW IF EXISTS `alumnos_ganadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnos_ganadores` AS select `a`.`CEDULA` AS `CEDULA`,`a`.`NOMBRE_COMPLETO` AS `NOMBRE_COMPLETO`,`a`.`EDAD` AS `EDAD`,`t`.`CATEGORIA` AS `CATEGORIA`,`c`.`COLOR` AS `COLOR` from (((`alumno` `a` join `ganador` `g`) join `torneos` `t`) join `cinturon` `c`) where ((`a`.`CEDULA` = `g`.`CEDULA`) and (`g`.`ID_TORNEO` = `t`.`ID_TORNEO`) and (`a`.`CINTURON` = `c`.`CINTURON_ID`)) group by `a`.`CEDULA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `familiares`
--

/*!50001 DROP VIEW IF EXISTS `familiares`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `familiares` AS select `a`.`CEDULA` AS `CEDULA`,`a`.`NOMBRE_COMPLETO` AS `NOMBRE_COMPLETO`,`f`.`cedulaFamiliar` AS `cedulaFamiliar`,`f`.`nombre` AS `nombre` from (`alumno` `a` join (select `a`.`NOMBRE_COMPLETO` AS `nombre`,`a`.`CEDULA` AS `cedulaFamiliar`,`f`.`ID_FAMILIAR` AS `ID_FAMILIAR` from (`alumno` `a` join `familiar` `f`) where (`f`.`ID_ALUMNO` = `a`.`CEDULA`)) `f`) where (`f`.`ID_FAMILIAR` = `a`.`CEDULA`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `horarios_profesores`
--

/*!50001 DROP VIEW IF EXISTS `horarios_profesores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `horarios_profesores` AS select `p`.`CEDULA` AS `CEDULA`,`p`.`NOMBRE_COMPLETO` AS `NOMBRE_COMPLETO`,`hc`.`DIA` AS `DIA`,`hc`.`HORA` AS `HORA` from (`profesor` `p` join `horario_clase` `hc`) where (`p`.`CEDULA` = `hc`.`CEDULA_PROFESOR`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tiempo_cinturon`
--

/*!50001 DROP VIEW IF EXISTS `tiempo_cinturon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tiempo_cinturon` AS select `a`.`CEDULA` AS `CEDULA`,`a`.`NOMBRE_COMPLETO` AS `NOMBRE_COMPLETO`,`a`.`TIEMPO_CINTURON` AS `TIEMPO_CINTURON`,`c`.`COLOR` AS `COLOR` from (`alumno` `a` join `cinturon` `c`) where (`a`.`CINTURON` = `c`.`CINTURON_ID`) order by `a`.`NOMBRE_COMPLETO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-11 17:07:13
