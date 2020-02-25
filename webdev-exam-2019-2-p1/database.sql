-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_868
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `E_main`
--

DROP TABLE IF EXISTS `E_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_main` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user` varchar(32) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `E_main`
--

LOCK TABLES `E_main` WRITE;
/*!40000 ALTER TABLE `E_main` DISABLE KEYS */;
INSERT INTO `E_main` VALUES (4,'2020-02-05','admin','Доступ к общим ресурсам организации','Новое','sefs'),(5,'2020-02-13','admin','Доступ в интернет','Новое','123');
/*!40000 ALTER TABLE `E_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `E_role`
--

DROP TABLE IF EXISTS `E_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_role` (
  `id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `E_role`
--

LOCK TABLES `E_role` WRITE;
/*!40000 ALTER TABLE `E_role` DISABLE KEYS */;
INSERT INTO `E_role` VALUES (1,'admin','Aдминистратор (суперпользователь, имеет полный доступ к системе, в том числе к удалению обращений)'),(2,'support','Cпециалист технической поддержки (может производить манипуляции с состоянием обращений — изменением статуса)'),(3,'user','Пользователь (может оставлять обращения)');
/*!40000 ALTER TABLE `E_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `E_status`
--

DROP TABLE IF EXISTS `E_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `E_status`
--

LOCK TABLES `E_status` WRITE;
/*!40000 ALTER TABLE `E_status` DISABLE KEYS */;
INSERT INTO `E_status` VALUES (2,'В работе'),(1,'Новое'),(4,'Отказано'),(3,'Ошибочное'),(5,'Решено');
/*!40000 ALTER TABLE `E_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `E_type`
--

DROP TABLE IF EXISTS `E_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `E_type`
--

LOCK TABLES `E_type` WRITE;
/*!40000 ALTER TABLE `E_type` DISABLE KEYS */;
INSERT INTO `E_type` VALUES (2,'Доступ в интернет'),(3,'Доступ к общим ресурсам организации'),(5,'Другое'),(4,'Предоставление доступа'),(1,'Проблемы с компьютером');
/*!40000 ALTER TABLE `E_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `E_user`
--

DROP TABLE IF EXISTS `E_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_user` (
  `id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `fsm` varchar(255) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `E_user`
--

LOCK TABLES `E_user` WRITE;
/*!40000 ALTER TABLE `E_user` DISABLE KEYS */;
INSERT INTO `E_user` VALUES (1,'admin','admin','Иванов Иван Иванович','admin'),(2,'support','support','Петров Пётр Петрович','support'),(3,'user','user','Александров Александр Александрович','user');
/*!40000 ALTER TABLE `E_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab6_inceidents`
--

DROP TABLE IF EXISTS `Lab6_inceidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lab6_inceidents` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `priority` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab6_inceidents`
--

LOCK TABLES `Lab6_inceidents` WRITE;
/*!40000 ALTER TABLE `Lab6_inceidents` DISABLE KEYS */;
INSERT INTO `Lab6_inceidents` VALUES (3,'Inceident№1',1,3),(4,'inceident№12',1,2),(5,'inceident№13',1,1),(6,'inceident№21',2,1),(7,'inceident№22',2,2),(8,'inceident№31',3,1),(9,'inceident№4',4,3),(10,'inceident№41',4,3);
/*!40000 ALTER TABLE `Lab6_inceidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEOPLE`
--

DROP TABLE IF EXISTS `PEOPLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEOPLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_n` varchar(50) NOT NULL,
  `first_n` varchar(50) NOT NULL,
  `middle_n` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEOPLE`
--

LOCK TABLES `PEOPLE` WRITE;
/*!40000 ALTER TABLE `PEOPLE` DISABLE KEYS */;
INSERT INTO `PEOPLE` VALUES (1,'Иванов','Иван','Иванович','1976-05-15','м'),(2,'Иванова','Нина','Сергеевна','1978-08-11','ж');
/*!40000 ALTER TABLE `PEOPLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEOPLE_POST`
--

DROP TABLE IF EXISTS `PEOPLE_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEOPLE_POST` (
  `person_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  KEY `fk_post_id` (`post_id`),
  KEY `fk_people_id` (`person_id`),
  CONSTRAINT `fk_people_id` FOREIGN KEY (`person_id`) REFERENCES `PEOPLE` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `POST` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEOPLE_POST`
--

LOCK TABLES `PEOPLE_POST` WRITE;
/*!40000 ALTER TABLE `PEOPLE_POST` DISABLE KEYS */;
INSERT INTO `PEOPLE_POST` VALUES (1,1,8000),(2,2,11000);
/*!40000 ALTER TABLE `PEOPLE_POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POST`
--

DROP TABLE IF EXISTS `POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST`
--

LOCK TABLES `POST` WRITE;
/*!40000 ALTER TABLE `POST` DISABLE KEYS */;
INSERT INTO `POST` VALUES (1,'Менеджер ','NULL'),(2,'Администратор','NULL');
/*!40000 ALTER TABLE `POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `id` int(11) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `birthday` date NOT NULL,
  `sex` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (1,'Иванов','Иван','Иванович','2001-01-01',1);
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People_Posts`
--

DROP TABLE IF EXISTS `People_Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People_Posts` (
  `personal_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People_Posts`
--

LOCK TABLES `People_Posts` WRITE;
/*!40000 ALTER TABLE `People_Posts` DISABLE KEYS */;
INSERT INTO `People_Posts` VALUES (1,1,1000000);
/*!40000 ALTER TABLE `People_Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `short_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,'Директор','Dir');
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReE_checkbook`
--

DROP TABLE IF EXISTS `ReE_checkbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReE_checkbook` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user` varchar(32) NOT NULL,
  `book` varchar(64) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReE_checkbook`
--

LOCK TABLES `ReE_checkbook` WRITE;
/*!40000 ALTER TABLE `ReE_checkbook` DISABLE KEYS */;
INSERT INTO `ReE_checkbook` VALUES (1,'2020-02-04','user','The witcher','Выдано');
/*!40000 ALTER TABLE `ReE_checkbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReE_main`
--

DROP TABLE IF EXISTS `ReE_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReE_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `year` year(4) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReE_main`
--

LOCK TABLES `ReE_main` WRITE;
/*!40000 ALTER TABLE `ReE_main` DISABLE KEYS */;
INSERT INTO `ReE_main` VALUES (1,'Lord of the rings','Tolkien',1946,30),(2,'The witcher','Sapcovsky',1995,40),(3,'qwerty','Adsaasd Adwwqwd',1998,12),(4,'Voina i Mir','Tolstoy L.',1956,12);
/*!40000 ALTER TABLE `ReE_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReE_role`
--

DROP TABLE IF EXISTS `ReE_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReE_role` (
  `id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReE_role`
--

LOCK TABLES `ReE_role` WRITE;
/*!40000 ALTER TABLE `ReE_role` DISABLE KEYS */;
INSERT INTO `ReE_role` VALUES (1,'admin','Администратор (суперпользователь, имеет полный доступ к системе, в том числе к удалению книг и записей из журнала)'),(2,'libman','Библиотекарь (может редактировать книги и производить манипуляции с состоянием записей журнала — добавлять новые и изменять статус имеющихся)'),(3,'user','Пользователь (может регистрировать книги)');
/*!40000 ALTER TABLE `ReE_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReE_status`
--

DROP TABLE IF EXISTS `ReE_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReE_status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReE_status`
--

LOCK TABLES `ReE_status` WRITE;
/*!40000 ALTER TABLE `ReE_status` DISABLE KEYS */;
INSERT INTO `ReE_status` VALUES (4,'Возвращено'),(3,'Возмещение ущерба'),(1,'Выдано'),(2,'Просрочено');
/*!40000 ALTER TABLE `ReE_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReE_user`
--

DROP TABLE IF EXISTS `ReE_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReE_user` (
  `id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `fsm` varchar(255) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReE_user`
--

LOCK TABLES `ReE_user` WRITE;
/*!40000 ALTER TABLE `ReE_user` DISABLE KEYS */;
INSERT INTO `ReE_user` VALUES (1,'admin','admin','Иванов И.И','admin'),(2,'libman','libman','Петров П.П.','libman'),(3,'user','user','Сидоров С.С.','user');
/*!40000 ALTER TABLE `ReE_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `author` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'John Ronald Reuel Tolkien'),(2,'George Raymond Richard Martin'),(3,'Andrzej Sapkowski'),(4,'writer'),(5,'another writer'),(6,'Иванов Иван Иванович'),(7,'Петров Пётр Петрович');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_books`
--

DROP TABLE IF EXISTS `auth_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_books` (
  `auth_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  `rack` int(11) NOT NULL,
  `shelf` int(11) NOT NULL,
  `coun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_books`
--

LOCK TABLES `auth_books` WRITE;
/*!40000 ALTER TABLE `auth_books` DISABLE KEYS */;
INSERT INTO `auth_books` VALUES (1,1,1,1,10),(2,2,2,1,20),(3,3,1,1,10),(4,4,4,2,1),(5,4,4,2,1),(6,5,2,1,5),(6,6,4,6,50),(7,6,4,6,50);
/*!40000 ALTER TABLE `auth_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibhalls`
--

DROP TABLE IF EXISTS `bibhalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibhalls` (
  `shortname` varchar(20) NOT NULL,
  `fullname` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibhalls`
--

LOCK TABLES `bibhalls` WRITE;
/*!40000 ALTER TABLE `bibhalls` DISABLE KEYS */;
INSERT INTO `bibhalls` VALUES ('1','First'),('2','Second');
/*!40000 ALTER TABLE `bibhalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `part` int(11) DEFAULT NULL,
  `ISBN` int(11) NOT NULL,
  `yearp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'lord of the rings',1,1000,'1954-10-10'),(2,'song of ice and fire',1,1001,'1991-10-10'),(3,'miecz przeznaczenia',2,1003,'1992-10-10'),(4,'just book',NULL,9999,'2015-12-21'),(5,'kolobok',NULL,1002,'1800-10-10'),(6,'golden egg',NULL,1004,'2000-10-10');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `position` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_description`
--

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;
INSERT INTO `category_description` VALUES (1,'Food',1.00),(2,'textile',2.00),(3,'hygiene_products',3.00),(4,'Appliances',4.00),(5,'medical_preparations',5.00),(6,'furniture',6.00),(7,'taburet',6.10),(8,'table',6.20);
/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_description`
--

DROP TABLE IF EXISTS `clients_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `home_address` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_description`
--

LOCK TABLES `clients_description` WRITE;
/*!40000 ALTER TABLE `clients_description` DISABLE KEYS */;
INSERT INTO `clients_description` VALUES (1,'Ivan Ivanov','888888888888','Russia,Moscow','ivan@gmail.com'),(2,'Sidirov Sidr','777777777777','Russia,Bryansk','sidr@mail.ru'),(3,'Greg Grigory','666666666666','Russia, Moscow','greg@ya.ru'),(4,'Maks Maksimov','5555555555555','Russia,Belgorod','maks@mail.ru');
/*!40000 ALTER TABLE `clients_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commits`
--

DROP TABLE IF EXISTS `commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commits`
--

LOCK TABLES `commits` WRITE;
/*!40000 ALTER TABLE `commits` DISABLE KEYS */;
INSERT INTO `commits` VALUES (1,'Проверка',1,'2019-12-26 15:00:00'),(2,'Привет ',33,'2019-12-26 15:59:30');
/*!40000 ALTER TABLE `commits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `priority` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `incidents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'Инцидент 1',1,1),(2,'Инцидент 2',2,1),(3,'Инцидент 3',1,2),(4,'Инцидент 4',2,2),(5,'Инцидент 5',1,23),(6,'Инцидент 6',2,23),(7,'Инцидент 7',1,3),(8,'Инцидент 8',2,3);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_color`
--

DROP TABLE IF EXISTS `list_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `color` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `list_color_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_color`
--

LOCK TABLES `list_color` WRITE;
/*!40000 ALTER TABLE `list_color` DISABLE KEYS */;
INSERT INTO `list_color` VALUES (1,1,'red'),(2,1,'blue'),(3,2,'red'),(4,2,'blue'),(5,3,'red');
/*!40000 ALTER TABLE `list_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_image`
--

DROP TABLE IF EXISTS `list_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `image` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `list_image_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_image`
--

LOCK TABLES `list_image` WRITE;
/*!40000 ALTER TABLE `list_image` DISABLE KEYS */;
INSERT INTO `list_image` VALUES (1,1,'1.png'),(2,1,'2.png'),(3,1,'3.png'),(4,2,'4.png'),(5,2,'5.png');
/*!40000 ALTER TABLE `list_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_size`
--

DROP TABLE IF EXISTS `list_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `size` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `list_size_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_size`
--

LOCK TABLES `list_size` WRITE;
/*!40000 ALTER TABLE `list_size` DISABLE KEYS */;
INSERT INTO `list_size` VALUES (1,1,'100x100'),(2,1,'200x200'),(3,1,'300x300'),(4,2,'100x100'),(5,3,'150x150');
/*!40000 ALTER TABLE `list_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_description`
--

DROP TABLE IF EXISTS `orders_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_description` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `pay_method` varchar(60) DEFAULT NULL,
  `delivery_method` varchar(60) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `cost_product` decimal(19,2) DEFAULT NULL,
  `count_product` int(11) DEFAULT NULL,
  `total_cost` decimal(19,2) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `id_client` (`id_client`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `orders_description_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients_description` (`id`),
  CONSTRAINT `orders_description_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_description`
--

LOCK TABLES `orders_description` WRITE;
/*!40000 ALTER TABLE `orders_description` DISABLE KEYS */;
INSERT INTO `orders_description` VALUES (1,123,1,'cashless payments','pickup',1,10000.00,1,10000.00,'2020-01-04 20:00:02'),(2,124,1,'cashless payments','pickup',2,40.00,500,25000.00,'2020-01-04 20:00:02'),(3,125,2,'cash','pickup',2,10000.00,1,10000.00,'2020-01-04 20:00:02'),(4,126,3,'cashless payments','home delivery',2,30000.00,1,30999.00,'2020-01-04 20:00:02'),(5,127,4,'cashless payments','home delivery',2,50000.00,1,50500.00,'2020-01-04 20:00:02');
/*!40000 ALTER TABLE `orders_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_desk`
--

DROP TABLE IF EXISTS `p_desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_desk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `название` varchar(255) NOT NULL,
  `автор` varchar(255) NOT NULL,
  `годиздания` year(4) NOT NULL,
  `количество` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `название` (`название`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_desk`
--

LOCK TABLES `p_desk` WRITE;
/*!40000 ALTER TABLE `p_desk` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_log`
--

DROP TABLE IF EXISTS `p_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `дата` date NOT NULL,
  `пользователь` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `book` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `пользователь` (`пользователь`),
  KEY `p-log_ibfk_2` (`status`),
  KEY `p-log_ibfk_3` (`book`),
  CONSTRAINT `p_log_ibfk_1` FOREIGN KEY (`пользователь`) REFERENCES `p_users` (`id`),
  CONSTRAINT `p_log_ibfk_2` FOREIGN KEY (`status`) REFERENCES `p_stat` (`id`),
  CONSTRAINT `p_log_ibfk_3` FOREIGN KEY (`book`) REFERENCES `p_desk` (`название`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_log`
--

LOCK TABLES `p_log` WRITE;
/*!40000 ALTER TABLE `p_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_roles`
--

DROP TABLE IF EXISTS `p_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `роль` varchar(32) NOT NULL,
  `описание` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_roles`
--

LOCK TABLES `p_roles` WRITE;
/*!40000 ALTER TABLE `p_roles` DISABLE KEYS */;
INSERT INTO `p_roles` VALUES (1,'Администратор','суперпользователь, имеет полный доступ к системе, в том числе к удалению книг и записей из журнала'),(2,'Библиотекарь','может редактировать книги и производить манипуляции с состоянием записей журнала — добавлять новые и изменять статус имеющихся'),(3,'Пользователь','может регистрировать книги');
/*!40000 ALTER TABLE `p_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_stat`
--

DROP TABLE IF EXISTS `p_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_stat`
--

LOCK TABLES `p_stat` WRITE;
/*!40000 ALTER TABLE `p_stat` DISABLE KEYS */;
INSERT INTO `p_stat` VALUES (1,'Выдано'),(2,'Просрочено'),(3,'Возмещение ущерба'),(4,'Возвращено');
/*!40000 ALTER TABLE `p_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_users`
--

DROP TABLE IF EXISTS `p_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `p_users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `p_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_users`
--

LOCK TABLES `p_users` WRITE;
/*!40000 ALTER TABLE `p_users` DISABLE KEYS */;
INSERT INTO `p_users` VALUES (1,'admin','admin','Gerasimenko D.A.',1),(2,'librarian','library','Librarian I.O.',2),(3,'user','user','User I.O.',3);
/*!40000 ALTER TABLE `p_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `id` (`id_product`,`id_category`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,1),(2,2,4),(3,3,4),(4,4,4),(5,4,6);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `short_descript` varchar(200) DEFAULT NULL,
  `full_descript` varchar(500) DEFAULT NULL,
  `basic_price` decimal(19,2) DEFAULT NULL,
  `current_price` decimal(19,2) DEFAULT NULL,
  `count_stock` int(11) DEFAULT NULL,
  `article` varchar(20) DEFAULT NULL,
  `min_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (1,'Snickers','snickers','ne tormozi snikersni',55.00,40.00,100000,'Snick',500),(2,'TV samsung 4k','SmartTV','super good TV 4k',30000.00,30000.00,13,'sm-7214',1),(3,'LG smart','LG','super TV',50000.00,49999.00,23,'lg-458',1),(4,'smart_chair','chair','nichego ydobnee ne videl',10000.00,9999.00,17,'biggi-2670',1);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racks`
--

DROP TABLE IF EXISTS `racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racks` (
  `id` int(11) NOT NULL,
  `hall` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racks`
--

LOCK TABLES `racks` WRITE;
/*!40000 ALTER TABLE `racks` DISABLE KEYS */;
INSERT INTO `racks` VALUES (1,'1'),(2,'1'),(3,'2'),(4,'2');
/*!40000 ALTER TABLE `racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','administrator'),(2,'user','user...');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (11,'Администратор','суперпользователь, имеет полный доступ к системе, в том числе к удалению обращений'),(12,'техническая поддержка','может производить манипуляции с состоянием обращений — изменением статуса'),(13,'пользователь','может оставлять обращения');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_list` (`id`),
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(32,1),(33,2),(34,2),(35,2);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (2,'В работе'),(1,'Новое'),(4,'Отказано'),(3,'Ошибочное'),(5,'Решено');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech_roles`
--

DROP TABLE IF EXISTS `tech_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tech_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `роль` varchar(32) NOT NULL,
  `описание` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech_roles`
--

LOCK TABLES `tech_roles` WRITE;
/*!40000 ALTER TABLE `tech_roles` DISABLE KEYS */;
INSERT INTO `tech_roles` VALUES (1,'Администратор','суперпользователь, имеет полный доступ к системе, в том числе к удалению обращений'),(2,'Специалист','может производить манипуляции с состоянием обращений — изменением статуса'),(3,'Пользователь','может оставлять обращения');
/*!40000 ALTER TABLE `tech_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech_users`
--

DROP TABLE IF EXISTS `tech_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tech_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `роль` (`role`),
  CONSTRAINT `tech_users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `tech_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech_users`
--

LOCK TABLES `tech_users` WRITE;
/*!40000 ALTER TABLE `tech_users` DISABLE KEYS */;
INSERT INTO `tech_users` VALUES (1,'admin','admin','Gerasimenko D.A.',1),(2,'manager','manager','Manager I.O.',2),(3,'user','user','User IO',3);
/*!40000 ALTER TABLE `tech_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technical_supp`
--

DROP TABLE IF EXISTS `technical_supp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technical_supp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `дата` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `пользователь` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `пользователь` (`пользователь`),
  KEY `тип` (`type`),
  KEY `статус` (`status`),
  CONSTRAINT `technical_supp_ibfk_1` FOREIGN KEY (`пользователь`) REFERENCES `tech_users` (`id`),
  CONSTRAINT `technical_supp_ibfk_2` FOREIGN KEY (`type`) REFERENCES `treatment` (`id`),
  CONSTRAINT `technical_supp_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical_supp`
--

LOCK TABLES `technical_supp` WRITE;
/*!40000 ALTER TABLE `technical_supp` DISABLE KEYS */;
INSERT INTO `technical_supp` VALUES (1,'2020-01-25 00:00:00',1,5,5,'text'),(2,'2020-01-25 12:11:36',1,3,2,'test13213dawdawda'),(5,'2020-01-25 12:49:05',1,3,2,'Просто текст'),(6,'2020-01-25 13:18:39',2,4,4,'что-то'),(7,'2020-01-25 13:20:14',1,4,4,'eqeq'),(8,'2020-01-25 13:25:40',3,3,2,'qeq'),(9,'2020-01-25 13:35:49',1,4,2,'1231231'),(10,'2020-01-25 13:38:34',1,3,1,'3131'),(11,'2020-01-25 13:39:17',1,4,1,'3131'),(13,'2020-01-25 13:59:17',3,1,1,'waewea'),(14,'2020-01-25 14:04:07',3,3,1,'просто'),(15,'2020-01-25 14:06:11',1,4,1,'тестик'),(16,'2020-01-25 14:22:55',2,3,3,'test13213');
/*!40000 ALTER TABLE `technical_supp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (2,'Доступ в интернет'),(3,'Доступ к общим ресурсам организации'),(5,'Другое'),(4,'Предоставление доступа'),(1,'Проблемы с компьютером');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type of treatment`
--

DROP TABLE IF EXISTS `type of treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type of treatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `тип` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type of treatment`
--

LOCK TABLES `type of treatment` WRITE;
/*!40000 ALTER TABLE `type of treatment` DISABLE KEYS */;
INSERT INTO `type of treatment` VALUES (1,'Проблемы с компьютером'),(2,'Доступ в интернет'),(3,'Доступ к общим ресурсам организации'),(4,'предоставление доступа'),(5,'другое');
/*!40000 ALTER TABLE `type of treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `FIO` varchar(255) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','qwerty','Иванов Иван Иванович',11,'2019-11-12 09:30:26'),(2,'support','qwerty','Сидоров Сергей Георгиевич',12,'2019-11-12 09:30:26'),(3,'user','user','Осипцов Игорь Евгеньевич',13,'2019-11-12 09:34:15'),(23,'galka','admin','Иванова Галина Ивановна',13,'2019-12-17 11:56:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list`
--

DROP TABLE IF EXISTS `users_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list`
--

LOCK TABLES `users_list` WRITE;
/*!40000 ALTER TABLE `users_list` DISABLE KEYS */;
INSERT INTO `users_list` VALUES (1,'timur.chikishev@mail.ru','Timur','Chikishev','$6$rounds=656000$gcs0srjXVqkbMMBG$EFvFpXywHVA/hTnFTkF7YXWow472FRb5txs2woLXQZYcZ79nkJv48xU56f/tEMnrtcTLmGhpSgx0bu9.N83do0',1),(32,'admin@gmail.com','Demid','Gerasimenko','$6$rounds=656000$KAnt5tNBmwXn/Yvk$ym7C4BzODOsDY3jTbeO6G1K086C2aHtTtY9Z7vOp2r8HzaL5Ck0Wr1ppUqF13TtMixfH78ow.ZQsKlapTQqg.0',1),(33,'lol@kek.ru','Lol','kek','$6$rounds=656000$9.7.z/qRQx59x8l3$O4o2UMzx58m2uO8Rd2ePZdmGgWjP71ZFlx.awkcTyuKdLMsQiO2S5gA3DmEVhwViTwC5y5Vv.ccc9x8OR5c3E/',1),(34,'serzh.sharipov.01@mail.ru','Сергей','Шарипов','$6$rounds=656000$QlrUsN.DClT.u31l$.BlIU8ITC8GnPHRY.6W.j.OAI4uJbslB5xoYasC.37N3wonc5nLzaav6citaNqkrD7cHP4hpX56pRZqKrdbif1',1),(35,'111@yandex.ru','1234','1234','111111111',1);
/*!40000 ALTER TABLE `users_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-25 19:02:10
