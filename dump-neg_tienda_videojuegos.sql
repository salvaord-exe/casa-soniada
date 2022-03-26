-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: neg_casa_soniada
-- ------------------------------------------------------
-- Server version	5.5.5-10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cat_catalogo_cabecera`
--

DROP TABLE IF EXISTS `cat_catalogo_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_catalogo_cabecera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cabecera` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_catalogo_cabecera`
--

LOCK TABLES `cat_catalogo_cabecera` WRITE;
/*!40000 ALTER TABLE `cat_catalogo_cabecera` DISABLE KEYS */;
INSERT INTO `cat_catalogo_cabecera` VALUES (1,'Paises','Lista de países en general','A','2022-03-14 18:48:14','2022-03-15 10:22:41',1),(2,'Provincias','Lista de provincias del Ecuador','A','2022-03-15 04:06:20','2022-03-14 23:41:50',1),(3,'Ciudades','Ciudades del Ecuador','A','2022-03-14 23:54:51','2022-03-20 11:59:36',1),(4,'Sexo','Sexos de las personas','A','2022-03-20 11:35:42','2022-03-20 11:57:08',1),(5,'Sexo','Sexos de las personas','I','2022-03-20 11:36:41','2022-03-20 11:36:41',1),(6,'Sexo','Sexos de las personas','I','2022-03-20 11:37:14','2022-03-20 11:37:14',1),(7,'Sexo','Sexos de las personas','I','2022-03-20 11:37:43','2022-03-20 11:37:43',1),(8,'','','I','2022-03-20 11:38:12','2022-03-20 11:38:12',1),(9,'','','I','2022-03-20 11:38:16','2022-03-20 11:38:16',1);
/*!40000 ALTER TABLE `cat_catalogo_cabecera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_catalogo_detalle`
--

DROP TABLE IF EXISTS `cat_catalogo_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_catalogo_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cat_detalle` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_cabecera` int(11) DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  `id_padre_cab` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cabecera` (`id_cabecera`),
  KEY `id_padre` (`id_padre`),
  KEY `id_padre_cab` (`id_padre_cab`),
  CONSTRAINT `cat_catalogo_detalle_ibfk_1` FOREIGN KEY (`id_cabecera`) REFERENCES `cat_catalogo_cabecera` (`id`),
  CONSTRAINT `cat_catalogo_detalle_ibfk_2` FOREIGN KEY (`id_padre`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `cat_catalogo_detalle_ibfk_3` FOREIGN KEY (`id_padre_cab`) REFERENCES `cat_catalogo_cabecera` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_catalogo_detalle`
--

LOCK TABLES `cat_catalogo_detalle` WRITE;
/*!40000 ALTER TABLE `cat_catalogo_detalle` DISABLE KEYS */;
INSERT INTO `cat_catalogo_detalle` VALUES (1,'Estados Unidos','Pais Estados Unidos',1,NULL,'A','2022-03-14 18:49:47','2022-03-14 18:49:47',NULL,NULL),(2,'Argentina','País Argentina',1,NULL,'A','2022-03-14 23:39:08','2022-03-14 23:39:08',1,NULL),(3,'Urugay','País Uruguay',1,NULL,'A','2022-03-14 23:39:26','2022-03-14 23:59:42',1,NULL),(4,'Guayas','Provincia del Guayas',2,NULL,'A','2022-03-14 23:42:03','2022-03-14 23:42:03',1,NULL),(5,'Manabí','Provincia de Manabí xd',2,NULL,'A','2022-03-14 23:47:52','2022-03-14 23:53:02',1,NULL),(6,'Tungurahua','Provincia de Tungurahua',2,NULL,'A','2022-03-14 23:54:30','2022-03-14 23:54:37',1,NULL),(7,'Guayaquil','Ciudad de Guayaquil',3,NULL,'A','2022-03-14 23:55:02','2022-03-14 23:55:02',1,NULL),(8,'España','Reino de España',1,NULL,'A','2022-03-14 23:59:25','2022-03-14 23:59:25',1,NULL),(9,'Japón','República del Sol Naciente :D',1,NULL,'A','2022-03-15 01:18:04','2022-03-15 01:18:04',1,NULL),(10,'Masculino','Sexo Masculino',4,NULL,'A','2022-03-20 11:39:15','2022-03-20 11:39:15',1,NULL),(11,'Masculino','Sexo Masculino',4,NULL,'I','2022-03-20 11:39:36','2022-03-20 11:39:36',1,NULL),(12,'Femenino','Sexo Femenino',4,NULL,'A','2022-03-20 11:52:38','2022-03-20 11:52:38',1,NULL),(13,'Femenino','Sexo Femenino',4,NULL,'I','2022-03-20 11:53:45','2022-03-20 11:53:45',1,NULL),(14,'Femenino','Sexo Femenino',4,NULL,'I','2022-03-20 11:54:24','2022-03-20 11:54:24',1,NULL),(15,'Femenino','Sexo Femenino',4,NULL,'I','2022-03-20 11:55:03','2022-03-20 11:55:03',1,NULL),(16,'Otro','Otros sexos',4,NULL,'A','2022-03-20 11:56:57','2022-03-20 11:56:57',1,NULL),(17,'Durán','Cantón de Durán',3,NULL,'A','2022-03-20 11:59:26','2022-03-20 11:59:26',1,NULL),(18,'Daule','Cantón Daule',3,NULL,'A','2022-03-20 11:59:33','2022-03-20 11:59:33',1,NULL),(19,'Ecuador','República del Ecuador',1,NULL,'A','2022-03-20 14:24:46','2022-03-20 14:24:46',1,NULL);
/*!40000 ALTER TABLE `cat_catalogo_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neg_compra_cab`
--

DROP TABLE IF EXISTS `neg_compra_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neg_compra_cab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_forma_pago` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_forma_pago` (`id_forma_pago`),
  CONSTRAINT `neg_compra_cab_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `seg_cliente` (`id`),
  CONSTRAINT `neg_compra_cab_ibfk_2` FOREIGN KEY (`id_forma_pago`) REFERENCES `neg_forma_pago` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neg_compra_cab`
--

LOCK TABLES `neg_compra_cab` WRITE;
/*!40000 ALTER TABLE `neg_compra_cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `neg_compra_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neg_compra_det`
--

DROP TABLE IF EXISTS `neg_compra_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neg_compra_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra_cab` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valor_compra` double DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra_cab` (`id_compra_cab`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `neg_compra_det_ibfk_1` FOREIGN KEY (`id_compra_cab`) REFERENCES `neg_compra_cab` (`id`),
  CONSTRAINT `neg_compra_det_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `neg_producto` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neg_compra_det`
--

LOCK TABLES `neg_compra_det` WRITE;
/*!40000 ALTER TABLE `neg_compra_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `neg_compra_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neg_contacto`
--

DROP TABLE IF EXISTS `neg_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neg_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(500) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `mensaje` varchar(5000) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neg_contacto`
--

LOCK TABLES `neg_contacto` WRITE;
/*!40000 ALTER TABLE `neg_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `neg_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neg_fabricante`
--

DROP TABLE IF EXISTS `neg_fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neg_fabricante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) DEFAULT NULL,
  `nombre_fabricante` varchar(100) DEFAULT NULL,
  `nombre_contacto` varchar(100) DEFAULT NULL,
  `telefono1` varchar(20) DEFAULT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `correo_fabricante` varchar(100) DEFAULT NULL,
  `fecha_inicio_contrato` date DEFAULT NULL,
  `fecha_renovacion_contrato` date DEFAULT NULL,
  `fecha_fin_contrato` date DEFAULT NULL,
  `dir_logo` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais` (`id_pais`),
  KEY `user_modificacion` (`user_modificacion`),
  CONSTRAINT `neg_fabricante_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `neg_fabricante_ibfk_2` FOREIGN KEY (`user_modificacion`) REFERENCES `seg_usuario` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neg_fabricante`
--

LOCK TABLES `neg_fabricante` WRITE;
/*!40000 ALTER TABLE `neg_fabricante` DISABLE KEYS */;
INSERT INTO `neg_fabricante` VALUES (1,3,'Rockstar Games','Augsto Smith - Contacto de Ventas','588338383883','58823412341','ventas@rockstar.com','2018-09-08','2018-09-08','2023-07-19',NULL,'A','2022-03-15 00:34:06','2022-03-15 01:13:28',1),(2,9,'Nintendo Inc.','Shinji Ikari - Sales Manager','0978699517','0978699517','ventas@nintendo.com','2019-07-15','2020-08-20','2023-09-19',NULL,'A','2022-03-15 01:19:09','2022-03-15 01:19:20',1),(3,1,'Activision','Contact Sales - Activision','0999999999','0995168577','salvador_ordonez@movil2go.ec','2022-03-11','2022-03-24','2022-03-11',NULL,'A','2022-03-20 10:11:24','2022-03-20 10:11:24',1);
/*!40000 ALTER TABLE `neg_fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neg_forma_pago`
--

DROP TABLE IF EXISTS `neg_forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neg_forma_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_forma_pago` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id_marca_tc` int(11) DEFAULT NULL,
  `id_tipo_tarjeta` int(11) DEFAULT NULL,
  `num_tarjeta` varchar(20) DEFAULT NULL,
  `nombre_tarjeta` varchar(20) DEFAULT NULL,
  `cvc_tarjeta` varchar(5) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_forma_pago` (`id_tipo_forma_pago`),
  KEY `id_marca_tc` (`id_marca_tc`),
  KEY `id_tipo_tarjeta` (`id_tipo_tarjeta`),
  CONSTRAINT `neg_forma_pago_ibfk_1` FOREIGN KEY (`id_tipo_forma_pago`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `neg_forma_pago_ibfk_2` FOREIGN KEY (`id_marca_tc`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `neg_forma_pago_ibfk_3` FOREIGN KEY (`id_tipo_tarjeta`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neg_forma_pago`
--

LOCK TABLES `neg_forma_pago` WRITE;
/*!40000 ALTER TABLE `neg_forma_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `neg_forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neg_producto`
--

DROP TABLE IF EXISTS `neg_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neg_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_fabricante` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `dir_imagen` varchar(500) DEFAULT NULL,
  `calificacion` double DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fabricante` (`id_fabricante`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neg_producto`
--

LOCK TABLES `neg_producto` WRITE;
/*!40000 ALTER TABLE `neg_producto` DISABLE KEYS */;
INSERT INTO `neg_producto` VALUES (3,'videojuego1','sadfasdfasfd',2,76.47,'/Uploads/Producto/3/img_videojuego1_id_3.png',4.2,'A','2022-03-14 11:13:08','2022-03-15 18:04:17',1),(4,'Grand Theft Auto 5','Mejor videojuego de 2016',1,54.3,'/Uploads/Producto/4/img_Grand-Theft-Auto-5_id_4.png',3.4,'A','2022-03-15 10:34:28','2022-03-19 23:31:31',1),(5,'Zelda','El mejor videojuego del año en 2001',2,80,'',4,'A','2022-03-15 11:06:01','2022-03-15 11:06:08',1),(6,'CAMP PRUEBA MOVI AA 100','sadfsadf',1,3,'',3,'I','2022-03-15 12:04:44','2022-03-15 12:04:44',1),(7,'producto prueba 1','asdfsadfasdfasdf',2,3,'',3,'I','2022-03-15 12:56:45','2022-03-15 12:56:45',1),(15,'producto 25','asdfasdsafdsadf',1,98,'/Uploads/Producto/15/img_producto-25_id_15.',2,'A','2022-03-15 15:53:30','2022-03-15 17:51:21',1),(16,'Videojuego 34','asdfasfsad',1,4,'/Uploads/Producto/16/img_Videojuego-34_id_16.png',4,'I','2022-03-15 16:05:59','2022-03-15 16:14:50',1),(17,'videojuego 35','asdfsadfsadf',1,4,'/Uploads/Producto/17/img_videojuego-35_id_17.jpg',5,'A','2022-03-15 16:18:52','2022-03-15 17:38:40',1),(18,'producto 40','sadasdf',1,3,'/Uploads/Producto/18/img_producto-40_id_18.',3.9,'A','2022-03-15 17:14:01','2022-03-15 17:51:27',1),(19,'Videojuego 87','asdfasdf',2,98,'/Uploads/Producto/19/img_Videojuego-87_id_19.png',4.5,'A','2022-03-15 17:49:46','2022-03-20 02:04:37',1),(20,'Call of Duty','Es un videojuego que ya ha pasado de moda',3,76,'/Uploads/Producto/20/img_Call-of-Duty_id_20.jpeg',4.7,'A','2022-03-20 10:12:45','2022-03-20 10:12:45',1);
/*!40000 ALTER TABLE `neg_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_cliente`
--

DROP TABLE IF EXISTS `seg_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(100) DEFAULT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) DEFAULT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `celular1` varchar(20) DEFAULT NULL,
  `celular2` varchar(20) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `direccion` varchar(900) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais` (`id_pais`),
  KEY `id_provincia` (`id_provincia`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `seg_cliente_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `seg_cliente_ibfk_2` FOREIGN KEY (`id_provincia`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `seg_cliente_ibfk_3` FOREIGN KEY (`id_ciudad`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_cliente`
--

LOCK TABLES `seg_cliente` WRITE;
/*!40000 ALTER TABLE `seg_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_pantalla`
--

DROP TABLE IF EXISTS `seg_pantalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_pantalla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pantalla` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_sub_modulo` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sub_modulo` (`id_sub_modulo`),
  CONSTRAINT `seg_pantalla_ibfk_1` FOREIGN KEY (`id_sub_modulo`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_pantalla`
--

LOCK TABLES `seg_pantalla` WRITE;
/*!40000 ALTER TABLE `seg_pantalla` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_pantalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_perfil`
--

DROP TABLE IF EXISTS `seg_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_perfil` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_perfil`
--

LOCK TABLES `seg_perfil` WRITE;
/*!40000 ALTER TABLE `seg_perfil` DISABLE KEYS */;
INSERT INTO `seg_perfil` VALUES (1,'Administrador','Perfil Administrador','A',NULL,NULL,NULL),(2,'Gerente','Perfil de gerente','A',NULL,NULL,NULL),(3,'Empleado','Perfil de empleado','A',NULL,NULL,NULL),(4,'Cliente','Perfil de cliente','A',NULL,NULL,NULL);
/*!40000 ALTER TABLE `seg_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_permiso_pantalla`
--

DROP TABLE IF EXISTS `seg_permiso_pantalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_permiso_pantalla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pantalla` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pantalla` (`id_pantalla`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `seg_permiso_pantalla_ibfk_1` FOREIGN KEY (`id_pantalla`) REFERENCES `seg_pantalla` (`id`),
  CONSTRAINT `seg_permiso_pantalla_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_permiso_pantalla`
--

LOCK TABLES `seg_permiso_pantalla` WRITE;
/*!40000 ALTER TABLE `seg_permiso_pantalla` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_permiso_pantalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_personal`
--

DROP TABLE IF EXISTS `seg_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(100) DEFAULT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) DEFAULT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `celular1` varchar(20) DEFAULT NULL,
  `celular2` varchar(20) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `direccion` varchar(900) DEFAULT NULL,
  `dir_curriculum` varchar(100) DEFAULT NULL,
  `dir_copia_cedula` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais` (`id_pais`),
  KEY `id_provincia` (`id_provincia`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `seg_personal_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `seg_personal_ibfk_2` FOREIGN KEY (`id_provincia`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `seg_personal_ibfk_3` FOREIGN KEY (`id_ciudad`) REFERENCES `cat_catalogo_detalle` (`id`),
  CONSTRAINT `seg_personal_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `seg_usuario` (`id`),
  CONSTRAINT `seg_personal_ibfk_5` FOREIGN KEY (`id_usuario`) REFERENCES `seg_usuario` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_personal`
--

LOCK TABLES `seg_personal` WRITE;
/*!40000 ALTER TABLE `seg_personal` DISABLE KEYS */;
INSERT INTO `seg_personal` VALUES (1,'Admin1','Admin2','Admin3','Admin4','1998-04-02',10,'0978699517','0978699517',19,5,7,'El paso infinito del universo ensordecedor me acongoja lentamente. Ya no soy nada más que materia muerta en este infierno lleno de angustia, desesperación y desconcierto.\r\nEstoy muerto. Ellos me han asesinado.',NULL,NULL,1,'A',NULL,NULL,NULL),(2,'Empleado 1','Empleado 1','Empleado 2','Empleado 1','2000-04-04',10,'0978699517','0930230776',19,5,7,'asdfasdfsadfasdf',NULL,NULL,2,'A',NULL,NULL,NULL),(3,'Empleado 3','Empleado 3','Empleado 3','Empleado 3','2001-03-03',10,'0978699517','0978699161',9,5,17,'XD',NULL,NULL,3,'A',NULL,NULL,NULL);
/*!40000 ALTER TABLE `seg_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_usuario`
--

DROP TABLE IF EXISTS `seg_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo_usuario` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(100) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `url_img_perfil` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `user_modificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `seg_usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`estado` = 'A' or `estado` = 'I')
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario`
--

LOCK TABLES `seg_usuario` WRITE;
/*!40000 ALTER TABLE `seg_usuario` DISABLE KEYS */;
INSERT INTO `seg_usuario` VALUES (1,'admin2@gamestore.com','12345',1,NULL,'A','2022-03-14 17:12:10','2022-03-14 17:12:10',NULL),(2,'empleado@gamestore.com','12345',3,NULL,'A',NULL,NULL,NULL),(3,'empleado3@gamestore.com','987654321',3,NULL,'A',NULL,NULL,NULL);
/*!40000 ALTER TABLE `seg_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_personal`
--

DROP TABLE IF EXISTS `view_personal`;
/*!50001 DROP VIEW IF EXISTS `view_personal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_personal` (
  `id` tinyint NOT NULL,
  `primer_nombre` tinyint NOT NULL,
  `segundo_nombre` tinyint NOT NULL,
  `primer_apellido` tinyint NOT NULL,
  `segundo_apellido` tinyint NOT NULL,
  `fecha_nacimiento` tinyint NOT NULL,
  `sexo` tinyint NOT NULL,
  `celular1` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `id_pais` tinyint NOT NULL,
  `id_provincia` tinyint NOT NULL,
  `id_ciudad` tinyint NOT NULL,
  `direccion` tinyint NOT NULL,
  `dir_curriculum` tinyint NOT NULL,
  `dir_copia_cedula` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `fecha_creacion` tinyint NOT NULL,
  `fecha_modificacion` tinyint NOT NULL,
  `user_modificacion` tinyint NOT NULL,
  `id_user` tinyint NOT NULL,
  `correo_usuario` tinyint NOT NULL,
  `contrasenia` tinyint NOT NULL,
  `id_perfil` tinyint NOT NULL,
  `nombre_perfil` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_producto_fabricante`
--

DROP TABLE IF EXISTS `view_producto_fabricante`;
/*!50001 DROP VIEW IF EXISTS `view_producto_fabricante`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_producto_fabricante` (
  `id` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL,
  `id_fabricante` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `dir_imagen` tinyint NOT NULL,
  `calificacion` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `fecha_creacion` tinyint NOT NULL,
  `fecha_modificacion` tinyint NOT NULL,
  `user_modificacion` tinyint NOT NULL,
  `id_fabric_orig` tinyint NOT NULL,
  `nombre_fabric_orig` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'neg_tienda_videojuegos'
--

--
-- Final view structure for view `view_personal`
--

/*!50001 DROP TABLE IF EXISTS `view_personal`*/;
/*!50001 DROP VIEW IF EXISTS `view_personal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_personal` AS select `sp`.`id` AS `id`,`sp`.`primer_nombre` AS `primer_nombre`,`sp`.`segundo_nombre` AS `segundo_nombre`,`sp`.`primer_apellido` AS `primer_apellido`,`sp`.`segundo_apellido` AS `segundo_apellido`,`sp`.`fecha_nacimiento` AS `fecha_nacimiento`,`sp`.`sexo` AS `sexo`,`sp`.`celular1` AS `celular1`,`sp`.`celular2` AS `celular2`,`sp`.`id_pais` AS `id_pais`,`sp`.`id_provincia` AS `id_provincia`,`sp`.`id_ciudad` AS `id_ciudad`,`sp`.`direccion` AS `direccion`,`sp`.`dir_curriculum` AS `dir_curriculum`,`sp`.`dir_copia_cedula` AS `dir_copia_cedula`,`sp`.`id_usuario` AS `id_usuario`,`sp`.`estado` AS `estado`,`sp`.`fecha_creacion` AS `fecha_creacion`,`sp`.`fecha_modificacion` AS `fecha_modificacion`,`sp`.`user_modificacion` AS `user_modificacion`,`seg_usr`.`id_user` AS `id_user`,`seg_usr`.`correo_usuario` AS `correo_usuario`,`seg_usr`.`contrasenia` AS `contrasenia`,`seg_usr`.`id_perfil` AS `id_perfil`,`seg_usr`.`nombre_perfil` AS `nombre_perfil` from (`neg_tienda_videojuegos`.`seg_personal` `sp` left join (select `su`.`id` AS `id_user`,`su`.`correo_usuario` AS `correo_usuario`,`su`.`contrasenia` AS `contrasenia`,`su`.`id_perfil` AS `id_perfil`,`perf`.`nombre_perfil` AS `nombre_perfil` from (`neg_tienda_videojuegos`.`seg_usuario` `su` left join (select `sp2`.`id` AS `id_perfil_orig`,`sp2`.`nombre_perfil` AS `nombre_perfil` from `neg_tienda_videojuegos`.`seg_perfil` `sp2`) `perf` on(`su`.`id_perfil` = `perf`.`id_perfil_orig`))) `seg_usr` on(`sp`.`id_usuario` = `seg_usr`.`id_user`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_producto_fabricante`
--

/*!50001 DROP TABLE IF EXISTS `view_producto_fabricante`*/;
/*!50001 DROP VIEW IF EXISTS `view_producto_fabricante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_producto_fabricante` AS select `np`.`id` AS `id`,`np`.`nombre` AS `nombre`,`np`.`descripcion` AS `descripcion`,`np`.`id_fabricante` AS `id_fabricante`,`np`.`precio` AS `precio`,`np`.`dir_imagen` AS `dir_imagen`,`np`.`calificacion` AS `calificacion`,`np`.`estado` AS `estado`,`np`.`fecha_creacion` AS `fecha_creacion`,`np`.`fecha_modificacion` AS `fecha_modificacion`,`np`.`user_modificacion` AS `user_modificacion`,`fabr`.`id_fabric_orig` AS `id_fabric_orig`,`fabr`.`nombre_fabric_orig` AS `nombre_fabric_orig` from (`neg_tienda_videojuegos`.`neg_producto` `np` left join (select `nf`.`id` AS `id_fabric_orig`,`nf`.`nombre_fabricante` AS `nombre_fabric_orig` from `neg_tienda_videojuegos`.`neg_fabricante` `nf`) `fabr` on(`np`.`id_fabricante` = `fabr`.`id_fabric_orig`)) */;
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

-- Dump completed on 2022-03-22 22:09:12
