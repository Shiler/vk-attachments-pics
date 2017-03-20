CREATE DATABASE  IF NOT EXISTS `likeit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `likeit`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: likeit
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_answer_id` (`id`),
  KEY `answer_user_idx` (`user_id`),
  KEY `answer_question_idx` (`question_id`),
  CONSTRAINT `answer_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `answer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (2,1,1,'2016-01-01 00:00:00','da'),(3,1,1,'2016-01-01 12:00:00','kek'),(5,2,4,'2016-01-01 12:00:00','222'),(6,9,4,'2016-01-01 12:00:00','131231'),(7,8,5,'2017-01-20 05:00:09','Ух ты! Заработало!'),(8,8,1,'2017-01-20 05:04:50','Тадам! Все работает'),(9,8,3,'2017-01-21 22:18:24','dsadasdaddddddddd'),(12,9,1,'2017-01-21 22:31:10','Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum '),(13,9,6,'2017-01-21 22:35:43','Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum'),(15,9,2,'2017-01-22 20:06:27','kgjkhkghkjhkjhgkjhkg'),(17,8,10,'2017-01-23 07:07:34','да пойдёт но ты знаешь что она урезана'),(20,12,10,'2017-01-23 07:27:47','sadadasdasdadadada'),(21,13,10,'2017-01-23 07:30:33','Dasdakldaskdalsd'),(28,9,9,'2017-01-24 06:07:24','ну типа новый ответ'),(29,9,8,'2017-01-25 17:50:03','ddsadsadadadada'),(30,9,15,'2017-03-17 13:35:17','DA SOQA DAAAAA');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_rating`
--

DROP TABLE IF EXISTS `answer_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_rating` (
  `answer_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  KEY `fk_raiting_user_idx` (`user_id`),
  KEY `fk_raiting_answer1` (`answer_id`),
  CONSTRAINT `fk_raiting_answer1` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_raiting_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_rating`
--

LOCK TABLES `answer_rating` WRITE;
/*!40000 ALTER TABLE `answer_rating` DISABLE KEYS */;
INSERT INTO `answer_rating` VALUES (2,1,3),(3,1,4),(2,2,3),(6,2,3),(2,8,3),(3,8,4),(6,8,5),(2,8,3),(13,8,5),(5,8,5),(12,8,5),(17,12,5),(20,13,5),(21,12,3),(9,9,4),(17,9,3),(2,9,5),(3,9,3),(8,9,3),(17,15,5),(30,8,5),(15,8,4);
/*!40000 ALTER TABLE `answer_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `creator` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`creator`),
  UNIQUE KEY `idx_question_id` (`id`),
  KEY `question_user_idx` (`creator`),
  KEY `question_type_idx` (`type`),
  CONSTRAINT `question_type` FOREIGN KEY (`type`) REFERENCES `question_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `question_user` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,1,0,'Как дела?','Ну тут содержание','2016-01-01 00:00:00','2017-01-27 01:39:46',2),(2,2,2,0,'ПРИВЕТУЛИ','как-то так','2016-01-01 00:00:00','2017-01-26 19:03:04',3),(3,1,2,0,'ТУТ ПРОСТО ОХЕРИТЕЛЬНЫЙ ВОПРОС ВЫ В ЭТО НЕ ПОВЕРИТЕ КАКОЙ ОН ДЛИННЫЙ','хех мда','2016-01-14 23:15:00','2017-01-23 02:38:06',14),(4,4,9,0,'Дратути!!!!!!!!','Это мой первый вопрос :)','2017-01-18 18:43:48','2017-01-22 03:16:22',1),(5,2,9,0,'Такс такс такс...','Что тут у нас? Ахахах! Мемы! Наканецта!','2017-01-18 23:41:14','2017-01-22 03:28:20',1),(6,7,8,0,'Еще один вопрос!','Какой хороший сегодня день, ух!','2017-01-19 00:18:48','2017-01-22 03:06:13',1),(7,2,8,0,'Проверка работы AJAX','Тадам! Вроде работает...','2017-01-21 06:02:06','2017-01-22 03:02:04',0),(8,1,8,0,'на телефоне появился вирус com.android.systemUI. Как от него избавиться?','Помогите, пожалуйста! Спасибо.','2017-01-22 06:18:20','2017-01-24 00:41:49',1),(9,1,8,0,'Ребят, хочу купить видюху новую GTX 750ti но посмотрев в интернете там и ASUS и GIGABYTE и MSI.Какая лучше?','Ребят, хочу купить видюху новую GTX 750ti но посмотрев в интернете там и ASUS и GIGABYTE и MSI.Какая лучше?','2017-01-23 07:05:00','2017-01-26 18:05:31',1),(10,1,9,0,'Подойдет ли данная видеокарта к моему пк?','Видеокарта MSI PCI-Ex GeForce GTX 1050 2GT OC 2GB GDDR5 (128bit) (1404/7008) (DVI, HDMI, DisplayPort) (GTX 1050 2GT OC) \r\nПодробнее: http:// hard.rozetka.com.ua/msi_gtx_1050_2gt_oc/p12729117/','2017-01-23 07:07:00','2017-01-23 04:35:17',1),(11,3,9,0,'Кто придумал, что посл. прием пищи должен состояться за 4 ч до сна?! Что посоветуете: не выспаться перед работой, +++','зато соблюсти данное Ц. У. (то бишь сидеть до 12 ночи), либо же лечь пораньше и не париться на эту тему????','2017-01-25 17:49:24','2017-01-27 07:21:11',1),(12,3,15,0,'Какая погода в Минске?','><script>alert()</alert>','2017-01-27 10:18:20','2017-01-27 07:18:19',0),(13,3,15,0,'Какая погода в Минске?','<script>alert()</alert>','2017-01-27 10:18:30','2017-01-27 07:18:29',0),(14,3,15,0,'Какая погода в Минске?','Подскажите, пожалуйста!','2017-01-27 10:19:46','2017-01-27 07:19:45',0),(15,2,8,0,'Maksm pdoР?','sooooooooooooqa blyat','2017-03-17 13:34:14','2017-03-17 10:35:05',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `name_ru` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_type`
--

LOCK TABLES `question_type` WRITE;
/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
INSERT INTO `question_type` VALUES (1,'Tech','Техника'),(2,'Art','Искусство'),(3,'Health','Здоровье'),(4,'Programming','Программирование'),(5,'Religion','Религия'),(6,'Science','Наука'),(7,'Politics','Политика');
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_role` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(4) DEFAULT '1',
  `age` tinyint(3) unsigned DEFAULT NULL,
  `answer_amount` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(5) DEFAULT 'en',
  PRIMARY KEY (`id`,`create_time`),
  UNIQUE KEY `idx_name` (`user_name`),
  KEY `user_role_idx` (`user_role`),
  CONSTRAINT `user_role` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ishiler','Евгений Юшкевич','e.shiler@yandex.ru','1234','2016-01-01 00:00:00',2,0,20,0,'en'),(2,'kekkk','User Two','wewe','1231','2016-02-02 00:00:00',1,0,11,0,'en'),(7,'firstUser','First User','eee@mail.kek','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2017-01-16 07:41:23',1,0,20,0,'en'),(8,'userTwo','Privet Mir','sdadada@mail.ru','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-16 08:15:46',1,0,16,0,'ru'),(9,'userThree','Ivan Ivanov','evsdsa@das.ru','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-16 08:18:55',1,0,12,0,'ru'),(10,'ktoto1','Ivan Ivanov','evgen33@mail.ru','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-16 09:22:03',1,0,17,0,'en'),(11,'userFour','User Four','userfour12312331@mail.ru','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-23 07:20:36',1,0,20,0,NULL),(12,'userFive','User Five','eee@mail.keksd','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-23 07:25:08',1,0,20,0,'en'),(13,'userSix','User Six','sdadadsad@dsadDas.ru','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-23 07:30:22',1,0,20,0,'en'),(15,'testUser','Epam Test','ekekek@mail.ru','daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5','2017-01-27 10:17:18',1,0,20,0,'ru');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rated_question`
--

DROP TABLE IF EXISTS `user_rated_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rated_question` (
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `rated` tinyint(4) NOT NULL,
  KEY `user_id_fk_idx` (`user_id`),
  KEY `question_id_fk_idx` (`question_id`),
  CONSTRAINT `question_id_fk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rated_question`
--

LOCK TABLES `user_rated_question` WRITE;
/*!40000 ALTER TABLE `user_rated_question` DISABLE KEYS */;
INSERT INTO `user_rated_question` VALUES (2,1,1),(1,1,0),(9,6,1),(8,4,1),(8,2,1),(8,5,1),(9,3,1),(8,1,1),(8,3,1),(12,10,1),(9,8,1),(9,9,1),(9,2,1),(15,11,1);
/*!40000 ALTER TABLE `user_rated_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_role_id` (`id`),
  UNIQUE KEY `idx_role_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,'Admin'),(1,'User');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-20 16:59:04
