-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- library 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;

-- 테이블 library.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 library.admin:~1 rows (대략적) 내보내기
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`admin_id`, `password`) VALUES
	(20170001, '111111');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 library.book_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `book_info` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publish` varchar(30) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `introduction` text DEFAULT NULL,
  `language` varchar(10) NOT NULL,
  `price` int(11) NOT NULL,
  `pubdate` date DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `pressmark` int(11) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50000018 DEFAULT CHARSET=utf8;

-- 테이블 데이터 library.book_info:~4 rows (대략적) 내보내기
DELETE FROM `book_info`;
/*!40000 ALTER TABLE `book_info` DISABLE KEYS */;
INSERT INTO `book_info` (`book_id`, `name`, `author`, `publish`, `ISBN`, `introduction`, `language`, `price`, `pubdate`, `class_id`, `pressmark`, `state`) VALUES
	(50000014, 'test11', 'test11', 'test11', '42234234', 'test11', '한국어', 12121, NULL, 2, 4, 0),
	(50000015, 'ㅇㄹㄴㅁㄴㄻ', 'ㅇㄻㄹ', 'ㅁㄴㅇㄻ', '3213', 'ㅇㄻㄴㄹ', '한국어', 23131, NULL, 123, 123, 1),
	(50000016, '13212312', '123123', '123123', '123123123', '31231', '한국어', 1233, NULL, 123, 123, 1),
	(50000017, '언젠가 아마도', '김연수', '컬쳐그라퍼', '9788970599694', '11', '한국어', 14000, NULL, 1, 33, 1);
/*!40000 ALTER TABLE `book_info` ENABLE KEYS */;

-- 테이블 library.class_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `class_info` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(45) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 library.class_info:~8 rows (대략적) 내보내기
DELETE FROM `class_info`;
/*!40000 ALTER TABLE `class_info` DISABLE KEYS */;
INSERT INTO `class_info` (`class_id`, `class_name`) VALUES
	(1, '철학'),
	(2, '종교'),
	(3, '사회과학'),
	(4, '자연과학'),
	(5, '기술과학'),
	(6, '예술'),
	(7, '문학'),
	(8, '역사');
/*!40000 ALTER TABLE `class_info` ENABLE KEYS */;

-- 테이블 library.lend_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `lend_list` (
  `sernum` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `lend_date` date DEFAULT NULL,
  `back_date` date DEFAULT NULL,
  PRIMARY KEY (`sernum`)
) ENGINE=InnoDB AUTO_INCREMENT=2015040160 DEFAULT CHARSET=utf8;

-- 테이블 데이터 library.lend_list:~1 rows (대략적) 내보내기
DELETE FROM `lend_list`;
/*!40000 ALTER TABLE `lend_list` DISABLE KEYS */;
INSERT INTO `lend_list` (`sernum`, `book_id`, `reader_id`, `lend_date`, `back_date`) VALUES
	(2015040159, 50000014, 12, '2018-07-31', NULL);
/*!40000 ALTER TABLE `lend_list` ENABLE KEYS */;

-- 테이블 library.reader_card 구조 내보내기
CREATE TABLE IF NOT EXISTS `reader_card` (
  `reader_id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `passwd` varchar(15) NOT NULL DEFAULT '111111',
  `card_state` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`reader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 library.reader_card:~2 rows (대략적) 내보내기
DELETE FROM `reader_card`;
/*!40000 ALTER TABLE `reader_card` DISABLE KEYS */;
INSERT INTO `reader_card` (`reader_id`, `name`, `passwd`, `card_state`) VALUES
	(12, '정한교', '111111', 1),
	(111111, '테스트1', '111111', 1);
/*!40000 ALTER TABLE `reader_card` ENABLE KEYS */;

-- 테이블 library.reader_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `reader_info` (
  `reader_id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telcode` varchar(11) NOT NULL,
  PRIMARY KEY (`reader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 library.reader_info:~2 rows (대략적) 내보내기
DELETE FROM `reader_info`;
/*!40000 ALTER TABLE `reader_info` DISABLE KEYS */;
INSERT INTO `reader_info` (`reader_id`, `name`, `sex`, `birth`, `address`, `telcode`) VALUES
	(12, '정한교', '남자', '2018-07-10', '대전서구갈마동', '01092455687'),
	(111111, '테스트1', '남자', '2018-07-30', 'sdf', '01092455687');
/*!40000 ALTER TABLE `reader_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
