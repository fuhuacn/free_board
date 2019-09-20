-- -------------------------------------------------------------
-- TablePlus 2.9(262)
--
-- https://tableplus.com/
--
-- Database: freeindex
-- Generation Time: 2019-09-20 23:33:06.5480
-- -------------------------------------------------------------


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


DROP TABLE IF EXISTS `adminlist`;
CREATE TABLE `adminlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailAdd` char(30) NOT NULL,
  `password` char(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `cardconfig`;
CREATE TABLE `cardconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardname` varchar(255) DEFAULT NULL,
  `typing` varchar(255) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `bkcolor` varchar(255) DEFAULT 'white',
  `layout` int(11) DEFAULT NULL,
  `refresh` int(11) DEFAULT NULL,
  `boardId` int(11) NOT NULL DEFAULT '1',
  `bordercolor` varchar(255) DEFAULT NULL,
  `titlebordercolor` varchar(255) DEFAULT NULL,
  `paddingbordercolor` varchar(255) DEFAULT NULL,
  `leftpadding` int(11) DEFAULT NULL,
  `rightpadding` int(11) DEFAULT NULL,
  `toppadding` int(11) DEFAULT NULL,
  `bottompadding` int(11) DEFAULT NULL,
  `leftmargin` int(11) DEFAULT NULL,
  `rightmargin` int(11) DEFAULT NULL,
  `topmargin` int(11) DEFAULT NULL,
  `bottommargin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `carddata`;
CREATE TABLE `carddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dashboardconfig`;
CREATE TABLE `dashboardconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerColor` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `bkColor` varchar(255) DEFAULT NULL,
  `bkPic` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `ifBanner` varchar(255) DEFAULT 'exist',
  `footerColor` varchar(255) DEFAULT NULL,
  `footerText` varchar(255) DEFAULT NULL,
  `ifFooter` varchar(255) DEFAULT 'exist',
  `width` int(11) DEFAULT NULL COMMENT '宽度，单位%',
  `layout` int(11) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `cover` text,
  `showBanner` int(11) DEFAULT NULL,
  `bannerLineColor` varchar(255) DEFAULT NULL,
  `bannerLabelColor` varchar(255) DEFAULT NULL,
  `bannerFontColor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `filelist`;
CREATE TABLE `filelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `modifiedTime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;