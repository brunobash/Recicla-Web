CREATE DATABASE  IF NOT EXISTS `rec_web` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rec_web`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: rec_web
-- ------------------------------------------------------
-- Server version	5.5.27

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


DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `idtel` int(3) NOT NULL AUTO_INCREMENT,
  `celular` varchar(15) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idtel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `dataNasc` varchar(10) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `perfil` varchar(15) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (22,'Administrador','adm','123','adm@gmail.com','(61) 3463-3689','1991-02-05','654.926.154-69','administrador','(61) 94564-8156'),(23,'Aluno','aluno','123','aluno@gmail.com','(31) 5816-5416','2000-10-23','186.651.651-56','usuario','(61) 94546-1516');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_ambiente`
--

DROP TABLE IF EXISTS `usuario_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_ambiente` (
  `id_usu` int(3) NOT NULL,
  `id_amb` int(3) NOT NULL,
  PRIMARY KEY (`id_usu`,`id_amb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_ambiente`
--

LOCK TABLES `usuario_ambiente` WRITE;
/*!40000 ALTER TABLE `usuario_ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_centro`
--

DROP TABLE IF EXISTS `usuario_centro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_centro` (
  `id_usu` int(3) NOT NULL,
  `id_cen` int(3) NOT NULL,
  PRIMARY KEY (`id_usu`,`id_cen`),
  KEY `id_cen` (`id_cen`),
  CONSTRAINT `usuario_centro_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id`),
  CONSTRAINT `usuario_centro_ibfk_2` FOREIGN KEY (`id_cen`) REFERENCES `centroesportivo` (`idCen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_centro`
--

LOCK TABLES `usuario_centro` WRITE;
/*!40000 ALTER TABLE `usuario_centro` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_centro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_endereco`
--

DROP TABLE IF EXISTS `usuario_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_endereco` (
  `id_usuario` int(3) NOT NULL,
  `id_ende` int(3) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_ende`),
  KEY `fk_usuario_has_endereco_endereco1_idx` (`id_ende`),
  KEY `fk_usuario_has_endereco_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario_has_endereco_endereco1` FOREIGN KEY (`id_ende`) REFERENCES `endereco` (`idEnd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_endereco`
--

LOCK TABLES `usuario_endereco` WRITE;
/*!40000 ALTER TABLE `usuario_endereco` DISABLE KEYS */;
INSERT INTO `usuario_endereco` VALUES (22,18),(23,19);
/*!40000 ALTER TABLE `usuario_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_telefone`
--

DROP TABLE IF EXISTS `usuario_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_telefone` (
  `id_usu` int(3) NOT NULL,
  `id_tel` int(3) NOT NULL,
  PRIMARY KEY (`id_usu`,`id_tel`),
  KEY `id_tel` (`id_tel`),
  CONSTRAINT `usuario_telefone_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id`),
  CONSTRAINT `usuario_telefone_ibfk_2` FOREIGN KEY (`id_tel`) REFERENCES `telefone` (`idtel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_telefone`
--

LOCK TABLES `usuario_telefone` WRITE;
/*!40000 ALTER TABLE `usuario_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_telefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-08 18:04:35
