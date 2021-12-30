-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: jeongseup-db.cjslesezqmkf.ap-northeast-2.rds.amazonaws.com    Database: did_project
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.18-MariaDB

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
-- Table structure for table `t_answer`
--

DROP TABLE IF EXISTS `t_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned DEFAULT NULL,
  `answer_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `t_answer_FK` (`question_id`),
  CONSTRAINT `t_answer_FK` FOREIGN KEY (`question_id`) REFERENCES `t_question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_answer`
--

LOCK TABLES `t_answer` WRITE;
/*!40000 ALTER TABLE `t_answer` DISABLE KEYS */;
INSERT INTO `t_answer` VALUES (1,1,'3번 설문지의 1번 답변입니다'),(2,2,'3번 설문지의 2번 답변입니다'),(3,3,'3번 설문지의 3번 답변입니다'),(4,4,'3번 설문지의 4번 답변입니다'),(5,5,'3번 설문지의 5번 답변입니다'),(6,6,'3번 설문지의 6번 답변입니다'),(674,1,'1'),(675,2,'1'),(676,3,'4'),(677,4,'4'),(678,5,'4'),(679,6,'sadadadsadada'),(680,1,'1'),(681,1,'1'),(682,2,'1'),(683,3,'1'),(684,4,'1'),(685,5,'3'),(686,6,'좋아요'),(687,1,'1'),(688,2,'1'),(689,3,'1'),(690,4,'1'),(691,5,'1'),(692,6,''),(693,1,'1'),(694,2,'1'),(695,3,'1'),(696,4,'4'),(697,5,'4'),(698,6,''),(699,1,'1'),(700,2,'1'),(701,3,'1'),(702,4,'1'),(703,5,'1'),(704,6,''),(705,1,'1'),(706,2,'1'),(707,3,'1'),(708,4,'1'),(709,5,'1'),(710,6,''),(711,1,'2'),(712,2,'2'),(713,3,'1'),(714,4,'1'),(715,5,'1'),(716,6,'aaa'),(717,1,'1'),(718,2,'1'),(719,3,'1'),(720,4,'1'),(721,5,'1'),(722,6,''),(723,1,'1'),(724,2,'1'),(725,3,'1'),(726,4,'1'),(727,5,'1'),(728,6,'hello'),(729,1,'1'),(730,2,'1'),(731,3,'1'),(732,4,'1'),(733,5,'1'),(734,6,''),(735,1,'1'),(736,2,'1'),(737,3,'1'),(738,4,'1'),(739,5,'1'),(740,6,''),(741,1,'1'),(742,2,'1'),(743,3,'1'),(744,4,'1'),(745,5,'1'),(746,6,'asdadaddaklasdsadladlas'),(747,1,'1'),(748,2,'1'),(749,3,'1'),(750,4,'1'),(751,5,'1'),(752,6,''),(753,1,'1'),(754,2,'1'),(755,3,'1'),(756,4,'1'),(757,5,'1'),(758,6,''),(759,1,'1'),(760,2,'1'),(761,3,'1'),(762,4,'1'),(763,5,'1'),(764,6,''),(765,1,'2'),(766,2,'2'),(767,3,'2'),(768,4,'2'),(769,5,'2'),(770,6,'감사합니다');
/*!40000 ALTER TABLE `t_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_complete`
--

DROP TABLE IF EXISTS `t_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_complete` (
  `complete_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(10) unsigned DEFAULT NULL,
  `user_account` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_vp` longtext DEFAULT NULL,
  PRIMARY KEY (`complete_id`),
  KEY `t_survey_complete_people_FK` (`survey_id`),
  KEY `t_complete_FK_1` (`user_account`),
  CONSTRAINT `t_complete_FK` FOREIGN KEY (`survey_id`) REFERENCES `t_survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_complete`
--

LOCK TABLES `t_complete` WRITE;
/*!40000 ALTER TABLE `t_complete` DISABLE KEYS */;
INSERT INTO `t_complete` VALUES (1,1,'0x1',NULL),(2,1,'0x2',NULL),(3,1,'0x3',NULL),(4,2,'0x4',NULL),(5,2,'0x5',NULL),(6,3,'0xec05bb94ddab86d34ef4af83d8b07b588372fcda',NULL),(7,3,'0xc28699572207e2f1073751de720ee79ce15948c1',NULL),(8,3,'0xd28f712891562be2d0af3d9f73dc5df46da8f633',NULL),(64,3,'0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8','0x7b2276657273696f6e223a227832353531392d7873616c736132302d706f6c7931333035222c226e6f6e6365223a2245545533724a70442b342b6c745575715a635675517569493733486263366b56222c22657068656d5075626c69634b6579223a22593252495657486c7758684d7772645379794864306d447063356f7741764e55667a57686c666d65347a513d222c2263697068657274657874223a224a2f434a59592f59304d6f4c64674e372b492b6f6741723541706176492f7352644d316a4f3665745236352f6d66457034314c47614b4e593543412b6e50514230584655584a4569785a33393769367269663448376b7831387955344c4e7a52422b4f75776e4768632f667354676c536f413d3d227d');
/*!40000 ALTER TABLE `t_complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goods`
--

DROP TABLE IF EXISTS `t_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_amount` int(10) unsigned DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `goods_image_path` varchar(100) DEFAULT NULL,
  `goods_issuer` varchar(10) DEFAULT NULL,
  `goods_coupon` int(11) DEFAULT NULL,
  `goods_valid` date DEFAULT NULL,
  `goods_original_price` int(10) unsigned DEFAULT NULL,
  `goods_discounted_price` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goods`
--

LOCK TABLES `t_goods` WRITE;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
INSERT INTO `t_goods` VALUES (1,100,'아이스 카페 아메리카노 Tall','coupon1.jpg','스타벅스',6,'2022-02-03',4100,3450),(2,10,'하트앤하트케이크','coupon2.jpg','뚜레주르',31,'2022-01-03',19000,17825),(3,80,'민트 초코칩 할리치노 R','coupon3.jpg','할리스',8,'2022-03-21',5900,4600),(4,90,'NEW 더블컵/콘','coupon4.jpg','나뚜루',8,'2022-04-15',5240,4600),(5,40,'오리지널 글레이즈드 하프더즌','coupon5.jpg','크리스피크림도넛',14,'2021-12-25',9000,8050),(6,50,'몬스터와퍼세트','coupon6.jpg','버거킹',15,'2022-01-23',9500,8625),(7,20,'굽네 오리지널+콜라1.25L','coupon7.jpg','굽네치킨',24,'2022-03-11',15200,13800),(8,15,'포테이토(오리지널)L+ 콜라1.25L','coupon8.jpg','도미노피자',36,'2021-12-05',22000,20700),(9,30,'CU 1만원권','coupon9.jpg','편의점 모바일상품권',15,'2022-02-20',10000,8625),(10,20,'신세계 상품권(30,000원)','coupon10.jpg','신세계백화점',50,'2022-05-12',30000,28750),(11,100,'온라인상품권(5,000원)','coupon11.jpg','해피머니',7,'2022-04-30',5000,4025),(12,50,'1인 주말관람권(2D)','coupon12.jpg','롯데시네마',17,'2022-01-18',11000,9775),(13,15,'활기단 3.75gX10환','coupon13.jpg','정관장',50,'2021-12-10',30000,28750),(14,40,'슈가버블 섬유유연제 3L 리필(용기포함)','coupon14.jpg','이마트',6,'2021-12-03',4100,3450),(15,30,'피코크 유기농 스퀴즈 오렌지 980ml','coupon15.jpg','이마트',15,'2022-11-28',9980,8625);
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_question`
--

DROP TABLE IF EXISTS `t_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_question` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(10) unsigned DEFAULT NULL,
  `quesiton_order` int(10) unsigned DEFAULT NULL,
  `quesiton_content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `t_question_FK_1` (`survey_id`),
  CONSTRAINT `t_question_FK` FOREIGN KEY (`survey_id`) REFERENCES `t_survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_question`
--

LOCK TABLES `t_question` WRITE;
/*!40000 ALTER TABLE `t_question` DISABLE KEYS */;
INSERT INTO `t_question` VALUES (1,3,1,'온라인쇼핑을 한 달에 몇 회 정도 하십니까?'),(2,3,2,'무신사 브랜드를 어떻게 평가하시나요?'),(3,3,3,'다른 온라인 쇼핑몰에 어느 정도 소비를 하시는 편입니까?'),(4,3,4,'쇼핑을 할 때 가장 고려하는 점이 무엇입니까?'),(5,3,5,'무신사 제품 퀄리티에 만족 하십니까?'),(6,3,6,'무신사를 이용할때 가장 불편했던 점은 무엇입니까?');
/*!40000 ALTER TABLE `t_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_survey`
--

DROP TABLE IF EXISTS `t_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_survey` (
  `survey_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '유니크 아이디값',
  `survey_start_date` date DEFAULT NULL COMMENT '설문 시작일',
  `survey_end_date` date DEFAULT NULL COMMENT '설문 종료일',
  `survey_image_path` varchar(100) DEFAULT NULL COMMENT '설문지 이미지 경로',
  `survey_title` varchar(100) DEFAULT NULL COMMENT '설문지 제목',
  `survey_description` varchar(100) DEFAULT NULL COMMENT '설문지 설명',
  `survey_request_count` int(10) unsigned DEFAULT NULL COMMENT '설문지에 참가한 인원수',
  `survey_complete_count` int(10) unsigned DEFAULT NULL COMMENT '설문지를 마친 인원수',
  `survey_price` int(10) unsigned DEFAULT NULL COMMENT '설문지 리워드 값',
  `survey_time` time DEFAULT NULL COMMENT '설문지 소요시간',
  `survey_coupon` int(10) unsigned DEFAULT NULL COMMENT '설문지 리워드 쿠폰 수',
  `user_account` varchar(100) DEFAULT NULL COMMENT '설문지 담당회사 어카운트주소',
  `survey_total_number` int(10) unsigned DEFAULT NULL,
  `survey_done_number` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `t_survey_FK` (`user_account`),
  CONSTRAINT `t_survey_FK` FOREIGN KEY (`user_account`) REFERENCES `t_user` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_survey`
--

LOCK TABLES `t_survey` WRITE;
/*!40000 ALTER TABLE `t_survey` DISABLE KEYS */;
INSERT INTO `t_survey` VALUES (1,'2021-11-15','2021-11-30','surveyImg2.jpg','문화 생활 관련 조사','문화 및 여가 생활 관련 전반적 U&A 설문입니다.',90,100,2500,'00:04:00',4,'0x12',1500,1450),(2,'2021-11-18','2021-12-13','surveyImg1.jpg','전자 제품 관련 조사','가전 제품 구입 관련 전반적인 고객들을 대상으로 하는 U&A 설문입니다.',20,100,2000,'00:06:00',3,'0x12',2000,1928),(3,'2021-11-23','2021-12-13','surveyImg3.jpg','패션 관련 조사','무신사를 이용하는 고객들을 대상으로 하는 U&A 설문입니다.',50,100,5000,'00:03:00',9,'0x12',1000,450),(4,'2021-11-16','2021-12-13','surveyImg4.jpg','인터넷 은행 관련 조사','인터넷 은행을 이용하는 고객들을 대상으로 하는 U&A 설문입니다.',100,100,3000,'00:06:00',5,'0x12',1000,955),(5,'2021-11-08','2021-11-28','surveyImg5.jpg','자동차 관련 조사','현대차를 이용하는 고객들을 대상으로 하는 U&A 설문입니다.',100,100,2500,'00:06:00',4,'0x45',2000,1853),(6,'2021-11-25','2021-12-07','surveyImg6.jpg','주택 관련 조사','주택소유자를 대상으로 하는 U&A 설문입니다.',50,100,3500,'00:10:00',6,'0x45',1500,1220);
/*!40000 ALTER TABLE `t_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `user_account` varchar(100) NOT NULL,
  `user_image_path` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `user_point` int(11) NOT NULL DEFAULT 0,
  `user_coupon` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('0x12',NULL,'company',0,0),('0x15B21E6b74c88AC8cA39F9e3Ad4B2ff5Faccc513',NULL,'user',114800,-8),('0x3',NULL,'user',0,0),('0x4',NULL,'user',0,0),('0x45',NULL,'company',0,0),('0x5',NULL,'user',0,0),('0x6',NULL,'user',0,0),('0x7',NULL,'user',0,0),('0x8',NULL,'user',0,0),('0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',NULL,'user',57500,88);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_goods`
--

DROP TABLE IF EXISTS `t_user_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_goods` (
  `user_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `user_account` varchar(100) NOT NULL,
  `user_goods_amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_goods_id`),
  KEY `t_user_goods_FK` (`goods_id`),
  KEY `t_user_goods_FK_2` (`user_account`),
  CONSTRAINT `t_user_goods_FK` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`goods_id`),
  CONSTRAINT `t_user_goods_FK_1` FOREIGN KEY (`user_account`) REFERENCES `t_user` (`user_account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_goods`
--

LOCK TABLES `t_user_goods` WRITE;
/*!40000 ALTER TABLE `t_user_goods` DISABLE KEYS */;
INSERT INTO `t_user_goods` VALUES (1,1,'아이스 카페 아메리카노 Tall','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',1),(2,2,'하트앤하트케이크','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',1),(3,3,'민트 초코칩 할리치노 R','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(4,4,'NEW 더블컵/콘','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(5,5,'오리지널 글레이즈드 하프더즌','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(6,6,'몬스터와퍼세트','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(7,7,'굽네 오리지널+콜라1.25L','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',1),(8,8,'포테이토(오리지널)L+ 콜라1.25L','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(9,9,'CU 1만원권','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(10,10,'신세계 상품권(30,000원)','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',1),(11,11,'온라인상품권(5,000원)','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(12,12,'1인 주말관람권(2D)','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(13,13,'활기단 3.75gX10환','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(14,14,'슈가버블 섬유유연제 3L 리필(용기포함)','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0),(15,15,'피코크 유기농 스퀴즈 오렌지 980ml','0x965ca4F0648c223C3B09e1E8bA46F9f71f7df1b8',0);
/*!40000 ALTER TABLE `t_user_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'did_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 23:58:20
