-- MariaDB dump 10.19  Distrib 10.5.16-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: proyectoAgendaDB
-- ------------------------------------------------------
-- Server version	10.5.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clases`
--

DROP TABLE IF EXISTS `Clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clases` (
  `id_clase` int(50) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clases`
--

LOCK TABLES `Clases` WRITE;
/*!40000 ALTER TABLE `Clases` DISABLE KEYS */;
INSERT INTO `Clases` VALUES (1,'Matematicas'),(2,'Ciencia'),(3,'Aplicaciones de bases de datos'),(4,'Proyecto Integrador'),(5,'Usabilidad'),(6,'Web'),(7,'pruebaClase'),(8,'Prueba 2'),(9,'Prueba 3'),(10,'Prueba4'),(11,'Prueba5'),(15,'Prueba 21'),(16,'Prueba 21');
/*!40000 ALTER TABLE `Clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clases_Estudiantes`
--

DROP TABLE IF EXISTS `Clases_Estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clases_Estudiantes` (
  `id_clase` int(50) DEFAULT NULL,
  `id_estudiante` int(50) DEFAULT NULL,
  `administrador` int(2) DEFAULT NULL,
  KEY `id_clase` (`id_clase`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `Clases_Estudiantes_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `Clases` (`id_clase`),
  CONSTRAINT `Clases_Estudiantes_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `Estudiantes` (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clases_Estudiantes`
--

LOCK TABLES `Clases_Estudiantes` WRITE;
/*!40000 ALTER TABLE `Clases_Estudiantes` DISABLE KEYS */;
INSERT INTO `Clases_Estudiantes` VALUES (1,1,1),(2,1,1),(3,1,1),(3,2,2),(4,2,1),(5,2,1),(6,2,1),(1,2,3),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(11,1,1),(15,1,1),(16,1,1),(16,1,1),(16,2,1);
/*!40000 ALTER TABLE `Clases_Estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiantes`
--

DROP TABLE IF EXISTS `Estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estudiantes` (
  `id_estudiante` int(50) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `appellido_paterno` varchar(100) DEFAULT NULL,
  `appellido_materno` varchar(100) DEFAULT NULL,
  `mail` varchar(500) DEFAULT NULL,
  `telefono` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `whatsapp` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiantes`
--

LOCK TABLES `Estudiantes` WRITE;
/*!40000 ALTER TABLE `Estudiantes` DISABLE KEYS */;
INSERT INTO `Estudiantes` VALUES (1,'Alejandro','Lopez','Garza','alejandro.lopezg@udem.edu','8182552779','udem1234',1),(2,'Daniel','Martinez','Martinez','daniele.martinez@udem.edu','8120395437','udem123',1),(3,'Enrico','Cecchini','Rivera','enrico@udem.edu','8112324566','udem123',1),(4,'Axel','Martinez','Tamez','axel@udem.edu','8115624577','udem123',1),(5,'Victor','Ponce','de Leon','victor@udem.edu','8183663785','udem123',1);
/*!40000 ALTER TABLE `Estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiantes_Tareas`
--

DROP TABLE IF EXISTS `Estudiantes_Tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estudiantes_Tareas` (
  `id_estudiante` int(50) DEFAULT NULL,
  `id_tarea` int(50) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_tarea` (`id_tarea`),
  CONSTRAINT `Estudiantes_Tareas_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `Estudiantes` (`id_estudiante`),
  CONSTRAINT `Estudiantes_Tareas_ibfk_2` FOREIGN KEY (`id_tarea`) REFERENCES `Tareas` (`id_tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiantes_Tareas`
--

LOCK TABLES `Estudiantes_Tareas` WRITE;
/*!40000 ALTER TABLE `Estudiantes_Tareas` DISABLE KEYS */;
INSERT INTO `Estudiantes_Tareas` VALUES (1,1,1),(2,1,1),(1,2,1);
/*!40000 ALTER TABLE `Estudiantes_Tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invitados`
--

DROP TABLE IF EXISTS `Invitados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invitados` (
  `id_invitado` int(50) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_invitado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invitados`
--

LOCK TABLES `Invitados` WRITE;
/*!40000 ALTER TABLE `Invitados` DISABLE KEYS */;
INSERT INTO `Invitados` VALUES (1,'8113250573'),(2,'8120395438'),(3,'8113250569');
/*!40000 ALTER TABLE `Invitados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invitados_Clases`
--

DROP TABLE IF EXISTS `Invitados_Clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invitados_Clases` (
  `id_invitado` int(50) DEFAULT NULL,
  `id_clase` int(50) DEFAULT NULL,
  KEY `id_clase` (`id_clase`),
  KEY `id_invitado` (`id_invitado`),
  CONSTRAINT `Invitados_Clases_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `Clases` (`id_clase`),
  CONSTRAINT `Invitados_Clases_ibfk_2` FOREIGN KEY (`id_invitado`) REFERENCES `Invitados` (`id_invitado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invitados_Clases`
--

LOCK TABLES `Invitados_Clases` WRITE;
/*!40000 ALTER TABLE `Invitados_Clases` DISABLE KEYS */;
INSERT INTO `Invitados_Clases` VALUES (1,4),(1,6),(2,1),(2,2),(1,11),(3,11);
/*!40000 ALTER TABLE `Invitados_Clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tareas`
--

DROP TABLE IF EXISTS `Tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tareas` (
  `id_tarea` int(50) NOT NULL AUTO_INCREMENT,
  `id_clase` int(50) DEFAULT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_tarea`),
  KEY `id_clase` (`id_clase`),
  CONSTRAINT `Tareas_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `Clases` (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tareas`
--

LOCK TABLES `Tareas` WRITE;
/*!40000 ALTER TABLE `Tareas` DISABLE KEYS */;
INSERT INTO `Tareas` VALUES (1,1,'Tarea 1','2022-10-14','el profe mando tarea'),(2,2,'Tarea 2','2022-10-14','el profe mando tarea de ciencia'),(4,6,'Tarea 5','2022-10-24','Tarea de BD'),(5,6,'Tarea 6','2022-10-14','Otra tarea de BD'),(6,16,'Tarea 7','2022-10-10','Nueva tarea BD');
/*!40000 ALTER TABLE `Tareas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 13:04:37
