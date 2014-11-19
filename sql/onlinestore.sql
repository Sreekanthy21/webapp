-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 18, 2014 at 05:53 PM
-- Server version: 5.5.40
-- PHP Version: 5.3.10-1ubuntu3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`,`email`,`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`uid`, `username`, `fullname`, `email`, `mobile`, `city`, `country`, `isactive`, `create_date`) VALUES
(1, 'syekabathula', 'Sreekanth Yekabathula', 'sreekanthy21@gmail.com', '9885098850', 'Chennai', 'India', 1, '2014-11-18 16:42:43'),
(2, 'ssreekanth', 'S Sreekanth', 'ssreekanth@gmail.com', '9885098851', 'Chennai', 'India', 1, '2014-11-18 16:42:43'),
(3, 'davidram', 'David Ramson', 'david@gmail.com', '9885098852', 'Chennai', 'India', 1, '2014-11-18 14:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalvalue` int(11) NOT NULL,
  `ordertime` datetime NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `uid`, `pid`, `quantity`, `totalvalue`, `ordertime`) VALUES
(901, 1, 1, 4, 4000, '2014-11-18 09:30:24'),
(902, 2, 4, 10, 10000, '2014-11-18 14:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float NOT NULL,
  `instock` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `name`, `value`, `instock`, `create_date`, `last_modified`) VALUES
(1, 'Laptop', 70000, 1, '2014-11-18 16:37:36', '2014-11-18 10:36:29'),
(2, 'Desktop', 30000, 0, '2014-11-18 00:00:00', '2014-11-18 00:00:00'),
(4, 'HeadPhones', 1000, 1, '2014-11-18 00:00:00', '2014-11-18 00:00:00'),
(5, 'Intex Keyboard', 1000, 0, '2014-11-18 00:00:00', '2014-11-18 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `customers` (`uid`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `customers` (`uid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
