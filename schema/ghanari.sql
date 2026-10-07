-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ghanari
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `blocker_username` varchar(20) NOT NULL,
  `blocked_username` varchar(20) NOT NULL,
  PRIMARY KEY (`blocked_username`,`blocker_username`),
  KEY `fk_blocker_idx` (`blocker_username`),
  CONSTRAINT `fk_blocked` FOREIGN KEY (`blocked_username`) REFERENCES `member` (`username`),
  CONSTRAINT `fk_blocker` FOREIGN KEY (`blocker_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES ('hajimir','jali'),('hajimir','zare');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `liker_username` varchar(20) NOT NULL,
  `favorite_tweet_id` int NOT NULL,
  PRIMARY KEY (`liker_username`,`favorite_tweet_id`),
  KEY `fk_favorite_tweet_id_idx` (`favorite_tweet_id`),
  CONSTRAINT `fk_favorite_tweet_id` FOREIGN KEY (`favorite_tweet_id`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `fk_liker_username` FOREIGN KEY (`liker_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES ('hajimir',44),('hajimir',45);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `follower_username` varchar(20) NOT NULL,
  `following_username` varchar(20) NOT NULL,
  PRIMARY KEY (`follower_username`,`following_username`),
  KEY `fk_following_idx` (`following_username`),
  CONSTRAINT `fk_follower` FOREIGN KEY (`follower_username`) REFERENCES `member` (`username`),
  CONSTRAINT `fk_following` FOREIGN KEY (`following_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('hajimir','cheshm'),('hajimir','jali');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag` (
  `hashtag_content` char(6) NOT NULL,
  PRIMARY KEY (`hashtag_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES ('#abcde'),('#hehe'),('#hello'),('#hi'),('hehe');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag_tweets`
--

DROP TABLE IF EXISTS `hashtag_tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag_tweets` (
  `content` char(6) NOT NULL,
  `corresponding_tweet_id` int DEFAULT NULL,
  PRIMARY KEY (`content`),
  KEY `fk_tweet_id_idx` (`corresponding_tweet_id`),
  KEY `fk_corresponding_tweet_id_idx` (`corresponding_tweet_id`),
  CONSTRAINT `fk_corresponding_tweet_id` FOREIGN KEY (`corresponding_tweet_id`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `fk_hashtag` FOREIGN KEY (`content`) REFERENCES `hashtag` (`hashtag_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag_tweets`
--

LOCK TABLES `hashtag_tweets` WRITE;
/*!40000 ALTER TABLE `hashtag_tweets` DISABLE KEYS */;
INSERT INTO `hashtag_tweets` VALUES ('#abcde',44),('#hello',50);
/*!40000 ALTER TABLE `hashtag_tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logins` (
  `member_username` varchar(20) NOT NULL,
  `login_date` date NOT NULL,
  `login_id` int NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `login_id_UNIQUE` (`login_id`),
  KEY `fk_member_idx` (`member_username`),
  CONSTRAINT `fk_member` FOREIGN KEY (`member_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES ('hajimir','2021-07-13',2),('cheshm','2021-07-13',3),('hajimir','2021-07-13',4),('cheshm','2021-07-13',5),('hajimir','2021-07-13',6),('hajimir','2021-07-14',7),('jali','2021-07-14',8),('hajimir','2021-07-14',9),('jali','2021-07-14',10),('hajimir','2021-07-14',11),('jali','2021-07-14',12),('hajimir','2021-07-14',13),('cheshm','2021-07-14',14),('hajimir','2021-07-14',15),('hajimir','2021-07-14',16),('cheshm','2021-07-14',17),('hajimir','2021-07-14',18),('hajimir','2021-07-14',19),('hajimir','2021-07-14',20),('hajimir','2021-07-14',21),('hajimir','2021-07-14',22),('hajimir','2021-07-14',23),('hajimir','2021-07-14',24),('zare','2021-07-14',25),('zare','2021-07-14',26),('hajimir','2021-07-16',27),('hajimir','2021-07-16',28);
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `membership_date` date NOT NULL,
  `biography` varchar(64) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('ahmad','shahriari','ahmadsh','b4a16e5306285ad1c08c876524a618cba96571e98b4985d2a83ab4d2c3379d08','2001-01-11','2021-07-13','hello guys'),('mehdi','malmas','cheshm','1935239a60853bf11222dfc7a4cc828e7bb9502286a4d9fd48cf65f6c0183151','2004-11-11','2021-07-10','hooo'),('farhan','keyvan','farhaK1','4c5a4ded3eebb510d773f003e185cb4657aee1a80db2a17164e74cbf9afbfcaa','2002-11-17','2021-07-10','hello farhan'),('hadi','keyhan','hadike','87e5a16f3790e6bfc06087244a0d4cd03f2c8c07d696c3f1cc6a08ec1bc6897f','2002-11-16','2021-07-10','hello hadik'),('Saleh','mirzaei','hajimir','eaaf6f7d89713ce85e2e8a886b382247f9c4d2a7a2be9eebd30ddd1a95b361fa','2002-11-11','2021-07-10','hello'),('hossein','ahmadi','hosam','fd5737c6a20df12ce295e778f51b9d22116e824773c70e21fb11a6fd7215c7bf','2002-11-11','2021-07-13','i love football'),('ali','jalali','jali','b01fd237c5f71f6a8800b250ab4c5a5feb9add1b85880a2773b3f3ea10262c16','2002-11-22','2021-07-10','hey'),('akbar','kazemi','kazem','8087d5ac32ff2d20e6e3c5f93fd6b9aeb702fe607fd5e6565a16fc900a7cb40e','2001-12-21','2021-07-13','hello i\'m akbar'),('mohammad','abbasi','mamadab','54836c52d2913f8ca347808f1dab01a6416e2418f09d7e498f0f75bd74d20d81','2002-11-18','2021-07-10','hello mamad'),('nima','moslemi','mosi','ee79976c9380d5e337fc1c095ece8c8f22f91f306ceeb161fa51fecede2c4ba1','2002-11-11','2021-07-10','hi'),('reza','hashemi','rezshemi','2a2bf1a4b3314b8cf72e918a9db8254c4ce030cb1706a287ac280ba14e17bafa','2002-11-15','2021-07-10','hello reza'),('ali','salmeh','salmi','9b56ca8566a48b98a8c29a7fd307038ed555123439a937eb85d9c45166881e6e','2002-11-11','2021-07-13','ILoveCARS'),('ali','zade','zad','c3a755c3a3f44ea82197c52eace8ed3269085890438e3e4eceecd518a0dd55e8','2002-11-20','2021-07-10','hello zad'),('keyvan','zarei','zare','4eb687cf833dfccb42a51e169eee9ed40effcdf61708bca2c7e6f5ca60ed9042','2002-11-21','2021-07-10','hello keyvan'),('erfan','zarezade','zarzad','13d4392c044e0e22b1d957606b18f4cad4c5f44c548a90effe481713bcb7bb81','2002-11-19','2021-07-10','hello erfan');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `signup_trigger` AFTER INSERT ON `member` FOR EACH ROW BEGIN
INSERT INTO sign_up_list(username , sign_up_date)
VALUES (new.username , new.membership_date);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `sender_username` varchar(20) NOT NULL,
  `receiver_username` varchar(20) NOT NULL,
  `sending_time` datetime NOT NULL,
  `content` varchar(256) DEFAULT NULL,
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_tweet_id` int DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id_UNIQUE` (`message_id`),
  KEY `fk_message_tweet_id_idx` (`message_tweet_id`),
  KEY `fk_sender_idx` (`sender_username`),
  KEY `fk_receiver_idx` (`receiver_username`),
  CONSTRAINT `fk_message_tweet_id` FOREIGN KEY (`message_tweet_id`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `fk_receiver` FOREIGN KEY (`receiver_username`) REFERENCES `member` (`username`),
  CONSTRAINT `fk_sender` FOREIGN KEY (`sender_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('hajimir','mosi','2021-07-14 17:25:14',NULL,4,44),('hajimir','mosi','2021-07-14 17:26:15','hello mosi. how you doing?',5,NULL),('hajimir','cheshm','2021-07-14 17:27:45',NULL,6,44),('hajimir','cheshm','2021-07-14 17:28:10','hello cheshm. how you doing?',7,NULL),('zare','jali','2021-07-14 20:54:53','hello my friend',8,NULL),('zare','jali','2021-07-14 20:54:53','hello my friend',9,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_up_list`
--

DROP TABLE IF EXISTS `sign_up_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign_up_list` (
  `username` varchar(20) NOT NULL,
  `sign_up_date` date NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_user_name` FOREIGN KEY (`username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_up_list`
--

LOCK TABLES `sign_up_list` WRITE;
/*!40000 ALTER TABLE `sign_up_list` DISABLE KEYS */;
INSERT INTO `sign_up_list` VALUES ('ahmadsh','2021-07-13');
/*!40000 ALTER TABLE `sign_up_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet` (
  `content` varchar(256) NOT NULL,
  `sender_username` varchar(20) NOT NULL,
  `sending_date` date NOT NULL,
  `tweet_id` int NOT NULL AUTO_INCREMENT,
  `tweet_mention_id` int DEFAULT NULL,
  PRIMARY KEY (`tweet_id`),
  UNIQUE KEY `tweet_id_UNIQUE` (`tweet_id`),
  KEY `fk_sender_idx` (`sender_username`),
  KEY `fk_tweet_sender_username_idx` (`sender_username`),
  KEY `fk_tweet_mention_id_idx` (`tweet_mention_id`),
  CONSTRAINT `fk_tweet_mention_id` FOREIGN KEY (`tweet_mention_id`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `fk_tweet_person` FOREIGN KEY (`sender_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES ('hello world','hajimir','2021-07-13',44,NULL),('hey hey','hajimir','2021-07-13',45,NULL),('it\'s a good day!','hajimir','2021-07-13',46,NULL),('hello i\'ts a test','hajimir','2021-07-14',47,NULL),('hello i\'m jali','jali','2021-07-14',48,NULL),('hello jali','hajimir','2021-07-14',49,48),('#hello everyone','hajimir','2021-07-16',50,NULL);
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hashtag_tweet_trigger` AFTER INSERT ON `tweet` FOR EACH ROW BEGIN
INSERT INTO tweet_list
VALUES(new.tweet_id , new.sending_date , new.sender_username);


SET @var = 1;
halghe : LOOP 
IF (@var > length(new.content)) THEN
LEAVE halghe;
END IF;

IF (substr(new.content , @var , 6) REGEXP '#[a-z][a-z][a-z][a-z][a-z]') THEN
call insert_hashtag_to_tweet(substr(new.content , @var , 6) , new.tweet_id);
END IF;

SET @var = @var + 1;
END LOOP;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tweet_list`
--

DROP TABLE IF EXISTS `tweet_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_list` (
  `id_tweet` int NOT NULL,
  `sending_time` date NOT NULL,
  `sender_username` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tweet`),
  KEY `fk_sender_idx` (`sender_username`),
  CONSTRAINT `fk_id_tweet` FOREIGN KEY (`id_tweet`) REFERENCES `tweet` (`tweet_id`),
  CONSTRAINT `fk_sender_user` FOREIGN KEY (`sender_username`) REFERENCES `member` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_list`
--

LOCK TABLES `tweet_list` WRITE;
/*!40000 ALTER TABLE `tweet_list` DISABLE KEYS */;
INSERT INTO `tweet_list` VALUES (44,'2021-07-13','hajimir'),(45,'2021-07-13','hajimir'),(46,'2021-07-13','hajimir'),(47,'2021-07-14','hajimir'),(48,'2021-07-14','jali'),(49,'2021-07-14','hajimir'),(50,'2021-07-16','hajimir');
/*!40000 ALTER TABLE `tweet_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ghanari'
--

--
-- Dumping routines for database 'ghanari'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_favorite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_favorite`(tweetID int)
BEGIN
call get_last_login(@a);
insert into favorite (liker_username, favorite_tweet_id)
select @a , tweetID
where @a not in
	(select blocked_username from blocks where blocker_username = 
		(select sender_username from tweet where tweet_id = tweetID))
        AND NOT EXISTS (SELECT *
			FROM favorite
            WHERE liker_username = @a AND favorite_tweet_id = tweetID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `block_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `block_user`(blocked varchar(20))
BEGIN
call get_last_login(@a);
INSERT INTO blocks
SELECT @a , blocked
WHERE NOT EXISTS(SELECT *
FROM blocks
WHERE blocker_username = @a AND  blocked_username = blocked
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_message_senders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_message_senders`()
BEGIN
call get_last_login(@a);
 SELECT S.sender_username 
 FROM (
 SELECT DISTINCT sender_username , MAX(sending_time) AS lt
	FROM message
	WHERE receiver_username = @a
	GROUP BY sender_username
	ORDER BY lt DESC
    ) AS S;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_user_logins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_user_logins`(intended_user varchar(20))
BEGIN
SELECT login_date
FROM logins
WHERE member_username = intended_user
ORDER BY login_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account`(first_name varchar(20) , last_name varchar(20) , username varchar(20) , password varchar(128) , birthDate Date, biography varchar(64))
BEGIN
INSERT INTO member VALUES
(first_name , last_name , username , sha2(password , 256) , birthDate,current_date() , biography);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `follow_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `follow_user`(followingusr varchar(20))
BEGIN
call get_last_login(@a);
INSERT INTO follow
SELECT @a , followingusr
WHERE NOT EXISTS(SELECT *
FROM follow
WHERE follower_username = @a AND  following_username = followingusr
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_a_user_messages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_a_user_messages`(message_sender varchar(20))
BEGIN
call get_last_login(@a);


SELECT message.message_tweet_id , message.sender_username AS message_sender , message.content , tweet.content , message.sending_time
FROM message LEFT JOIN tweet ON message.message_tweet_id = tweet.tweet_id
WHERE message.receiver_username NOT IN (
	SELECT blocked_username 
	FROM blocks
    WHERE blocker_username = (SELECT sender_username
        FROM tweet
        WHERE tweet_id = message.message_tweet_id
            )
    )
AND message.sender_username = message_sender
AND message.receiver_username = @a

ORDER BY message.sending_time DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_a_user_tweets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_a_user_tweets`(tweet_sender varchar(20))
BEGIN
call get_last_login(@a);
SELECT tweet_id , content , sending_date
FROM tweet
WHERE sender_username = tweet_sender AND NOT EXISTS
	(SELECT *
	 FROM blocks
	 WHERE blocker_username = tweet_sender AND blocked_username = @a
	);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comments_of_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comments_of_tweet`(tweetID int)
BEGIN
call get_last_login(@a);
select c.sender_username , c.content , c.sending_date
FROM (SELECT *
FROM tweet 
WHERE sender_username NOT IN (
SELECT blocker_username
FROM blocks
WHERE blocked_username = @a
) ) AS  c
WHERE c.tweet_mention_id = tweetID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_count_favorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_count_favorites`(tweetID int)
BEGIN
call get_last_login(@a);
SELECT count(liker_username)
FROM favorite 
WHERE favorite_tweet_id = tweetID and 
	NOT EXISTS (SELECT * 
				FROM blocks
				WHERE blocked_username = @a AND blocker_username = ( SELECT sender_username 
																			FROM tweet
                                                                            WHERE tweet_id = tweetID));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_following_tweets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_following_tweets`()
BEGIN
call get_last_login(@a);
SELECT tweet_id , sender_username , content
FROM tweet,follow
WHERE sender_username = following_username AND follower_username = @a AND NOT EXISTS
	(SELECT *
	 FROM blocks
	 WHERE blocker_username = sender_username AND blocked_username = @a
	)
ORDER BY sending_date DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_last_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_last_login`(OUT currentUser varchar(20))
BEGIN
SELECT member_username into currentUser
FROM logins
WHERE login_id = (SELECT MAX(login_id)
	FROM logins);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_list_of_likers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_list_of_likers`(tweetID int)
BEGIN
call get_last_login(@a);
WITH blockers(user_name)
AS (SELECT blocker_username FROM blocks WHERE blocked_username = @a)
SELECT liker_username 
FROM favorite
WHERE favorite_tweet_id = tweetID AND (SELECT sender_username FROM tweet WHERE tweet_id = tweetID) NOT IN (SELECT user_name FROM blockers);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_personal_tweets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_personal_tweets`()
BEGIN
call get_last_login(@a);
SELECT tweet_id , content , sending_date
FROM tweet 
WHERE sender_username = @a
ORDER BY tweet.sending_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_top_favorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_favorites`()
BEGIN
call get_last_login(@a);
SELECT sender_username , content , sending_date , count(liker_username) AS likes
FROM favorite JOIN tweet ON favorite.favorite_tweet_id = tweet.tweet_id
WHERE sender_username NOT IN (SELECT blocker_username FROM blocks WHERE blocked_username = @a)
GROUP BY tweet_id
ORDER BY likes DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tweets_with_a_hashtag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tweets_with_a_hashtag`(hashtag_content varchar(6))
BEGIN
call get_last_login(@a);
SELECT ava.tweet_id , ava.sender_username , ava.content , ava.sending_date
FROM tweet AS ava JOIN hashtag_tweets AS ht ON ht.corresponding_tweet_id = ava.tweet_id
WHERE ht.content = hashtag_content AND NOT EXISTS(
SELECT *
FROM blocks
WHERE blocker_username = ava.sender_username AND blocked_username = @a
)
ORDER BY ava.sending_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_hashtag_to_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_hashtag_to_tweet`(hashtagContent varchar(6) , tweetID int)
BEGIN
call get_last_login(@a);

IF tweetID IN (SELECT tweet_id 
				FROM tweet
				WHERE sender_username = @a) THEN 
	INSERT INTO hashtag
	VALUES(hashtagContent);
	INSERT INTO hashtag_tweets
	SELECT hashtag_content , tweetID
	FROM hashtag 
	WHERE  hashtag_content = hashtagContent
		AND hashtag_content REGEXP '#[a-z][a-z][a-z][a-z][a-z]';
    
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_account`(user_name varchar(20), pass_word varchar(128))
BEGIN
INSERT IGNORE INTO logins(member_username , login_date)
SELECT member.username , current_date() 
FROM member
WHERE member.username = user_name AND member.password = sha2(pass_word , 256);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `row_cnt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `row_cnt`(IN command VarChar(6000))
BEGIN
SET @query = command;
	PREPARE stmt FROM @query;
	EXECUTE stmt;
	SELECT ROW_COUNT() AS 'Affected rows';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_comment`( tweetID int , mention_content varchar(256))
BEGIN
call get_last_login(@a);
INSERT INTO tweet(content , sender_username , sending_date , tweet_mention_id)
SELECT * FROM (SELECT mention_content , @a , current_date(), tweetID) AS tmp
WHERE NOT EXISTS(
SELECT *
FROM blocks
WHERE blocker_username =  
	(
		SELECT t.sender_username
		FROM tweet AS t
		WHERE t.tweet_id = tweetID
	) 
AND blocked_username = @a
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_text_as_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_text_as_message`(receiver varchar(20) , message_content varchar(256))
BEGIN
call get_last_login(@a);
INSERT  INTO message(sender_username , receiver_username , sending_time , content)
SELECT @a , receiver , NOW() , message_content
WHERE @a NOT IN (SELECT blocked_username FROM blocks WHERE blocker_username = receiver);
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_tweet`(tweet_content varchar(256))
BEGIN
call get_last_login(@a);
INSERT INTO tweet
VALUES (tweet_content , @a , current_date(),DEFAULT , DEFAULT);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_tweet_as_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_tweet_as_message`(receiver varchar(20) , tweetID int)
BEGIN
call get_last_login(@a);
INSERT INTO message(sender_username,receiver_username ,message_tweet_id,sending_time)
SELECT @a , receiver , tweetID , NOW()
WHERE @a NOT IN (
	SELECT blocked_username 
	FROM blocks 
	WHERE blocker_username = receiver)
AND @a NOT IN (
	SELECT blocked_username 
	FROM blocks 
	WHERE blocker_username = (
		SELECT sender_username 
		FROM tweet 
		WHERE tweet_id = tweetID )
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unblock_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unblock_user`(blocked varchar(20))
BEGIN
call get_last_login(@a);
DELETE FROM blocks
WHERE blocker_username = @a AND  blocked_username = blocked;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unfollow_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unfollow_user`(following_user varchar(20))
BEGIN
call get_last_login(@a);
DELETE FROM follow
WHERE follower_username = @a AND  following_username = following_user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-16 22:07:34
