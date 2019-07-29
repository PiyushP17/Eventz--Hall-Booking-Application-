-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2019 at 07:25 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hallbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `userid` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `hallid` varchar(30) NOT NULL,
  `slot` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`userid`, `date`, `hallid`, `slot`) VALUES
('shr', '2019-03-15', 'hall1', 'slot1'),
('netcom', '2019-03-21', 'hall1', 'slot1'),
('netcom', '2019-03-21', 'hall1', 'Slot2'),
('netcom', '2019-03-22', 'hall2', 'slot2'),
('netcom', '2019-03-22', 'hall2', 'Slot1'),
('netcom', '2019-03-22', 'hall1', 'slot2'),
('netcom', '2019-03-22', 'hall1', 'Slot1'),
('netcom', '2019-03-23', 'hall1', 'slot1'),
('netcom', '2019-03-23', 'hall1', 'Slot2'),
('netcom', '2019-03-23', 'hall2', 'slot1'),
('netcom', '2019-03-25', 'hall1', 'slot1'),
('admin', '2019-03-25', 'hall1', 'Slot2'),
('admin', '2019-03-25', 'hall2', 'slot1'),
('Piyush', '2019-07-16', 'hall1', 'slot2'),
('Piyush', '2019-07-16', 'hall1', 'Slot1'),
('Piyush', '2019-07-16', 'hall2', 'slot1'),
('Piyush', '2019-07-16', 'hall2', 'Slot2'),
('Piyush', '2019-07-17', 'hall1', 'slot1'),
('qwerty', '2019-07-17', 'hall1', 'Slot2'),
('Piyush', '2019-07-19', 'hall1', 'Slot2'),
('qwerty', '2019-07-20', 'hall1', 'Slot2'),
('Piyush', '2019-07-30', 'hall1', 'Slot1'),
('Admin', '2019-07-30', 'hall2', 'Slot2'),
('Piyush', '2019-07-22', 'hall1', 'Slot2'),
('Piyush', '2019-08-01', 'hall1', 'Slot2'),
('Admin', '2019-07-24', 'hall1', 'Slot1'),
('Piyush', '2019-07-19', 'hall1', 'Slot1'),
('Piyush', '2019-08-06', 'hall1', 'Slot2'),
('Piyush', '2019-07-23', 'hall2', 'Slot1'),
('Piyush', '2019-07-20', 'hall1', 'Slot1'),
('Piyush', '2019-07-20', 'hall2', 'Slot2'),
('Piyush', '2019-07-20', 'hall2', 'Slot1'),
('Piyush', '2019-07-22', 'hall1', 'Slot1'),
('Piyush', '2019-07-22', 'hall2', 'Slot1'),
('Piyush', '2019-07-22', 'hall2', 'Slot2'),
('Piyush', '2019-07-23', 'hall1', 'Slot1'),
('Admin', '2019-07-30', 'hall2', 'Slot1'),
('Piyush', '2019-07-23', 'hall2', 'Slot2'),
('Piyush', '2019-07-30', 'hall1', 'Slot2'),
('Piyush', '2019-07-31', 'hall1', 'Slot1'),
('John Wick', '2019-07-29', 'hall1', 'Slot1');

-- --------------------------------------------------------

--
-- Table structure for table `book_date`
--

DROP TABLE IF EXISTS `book_date`;
CREATE TABLE IF NOT EXISTS `book_date` (
  `sno` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_date`
--

INSERT INTO `book_date` (`sno`, `date`, `status`) VALUES
(1, '2019-03-14', 'close'),
(2, '2019-03-15', 'close'),
(3, '2019-03-17', 'close'),
(4, '2019-03-18', 'close'),
(5, '2019-03-19', 'close'),
(6, '2019-03-20', 'close'),
(7, '2019-03-21', 'close'),
(8, '2019-03-22', 'close'),
(9, '2019-03-23', 'close'),
(10, '2019-03-25', 'close'),
(11, '2019-03-26', 'close'),
(12, '2019-03-27', 'close'),
(13, '2019-03-28', 'close'),
(14, '2019-03-29', 'close'),
(15, '2019-03-30', 'close'),
(16, '2019-04-01', 'close'),
(17, '2019-04-02', 'close'),
(18, '2019-04-03', 'close'),
(19, '2019-04-04', 'close'),
(20, '2019-04-05', 'close'),
(21, '2019-04-06', 'close'),
(22, '2019-04-08', 'close'),
(23, '2019-04-09', 'close'),
(24, '2019-04-10', 'close'),
(25, '2019-04-11', 'close'),
(26, '2019-04-12', 'close'),
(27, '2019-04-13', 'close'),
(28, '2019-04-15', 'close'),
(29, '2019-04-16', 'close'),
(30, '2019-04-17', 'close'),
(31, '2019-04-18', 'close'),
(32, '2019-04-19', 'close'),
(33, '2019-04-20', 'close'),
(45, '2019-05-04', 'close'),
(44, '2019-05-03', 'close'),
(43, '2019-05-02', 'close'),
(42, '2019-05-01', 'close'),
(41, '2019-04-30', 'close'),
(40, '2019-04-29', 'close'),
(39, '2019-04-27', 'close'),
(38, '2019-04-26', 'close'),
(37, '2019-04-25', 'close'),
(36, '2019-04-24', 'close'),
(35, '2019-04-23', 'close'),
(34, '2019-04-22', 'close'),
(46, '2019-05-06', 'close'),
(47, '2019-05-07', 'close'),
(48, '2019-05-08', 'close'),
(49, '2019-05-09', 'close'),
(50, '2019-05-10', 'close'),
(51, '2019-05-11', 'close'),
(65, '1970-01-03', 'close'),
(66, '1970-01-05', 'close'),
(67, '1970-01-06', 'close'),
(68, '1970-01-07', 'close'),
(69, '1970-01-08', 'close'),
(70, '1970-01-09', 'close'),
(71, '1970-01-10', 'close'),
(72, '1970-01-12', 'close'),
(73, '1970-01-13', 'close'),
(74, '1970-01-14', 'close'),
(75, '1970-01-15', 'close'),
(76, '1970-01-16', 'close'),
(77, '1970-01-17', 'close'),
(78, '1970-01-19', 'close'),
(79, '1970-01-20', 'close'),
(80, '1970-01-21', 'close'),
(81, '1970-01-22', 'close'),
(82, '1970-01-23', 'close'),
(83, '1970-01-24', 'close'),
(84, '1970-01-26', 'close'),
(85, '1970-01-27', 'close'),
(86, '1970-01-28', 'close'),
(87, '1970-01-29', 'close'),
(88, '1970-01-30', 'close'),
(89, '1970-01-31', 'close'),
(90, '1970-02-02', 'close'),
(91, '1970-02-03', 'close'),
(92, '1970-02-04', 'close'),
(93, '1970-02-05', 'close'),
(94, '2019-07-16', 'close'),
(95, '2019-07-17', 'close'),
(96, '2019-07-18', 'close'),
(97, '2019-07-19', 'close'),
(98, '2019-07-20', 'close'),
(99, '2019-07-22', 'close'),
(100, '2019-07-23', 'close'),
(101, '2019-07-24', 'close'),
(102, '2019-07-25', 'close'),
(103, '2019-07-26', 'open'),
(104, '2019-07-27', 'open'),
(105, '2019-07-29', 'open'),
(106, '2019-07-30', 'close'),
(107, '2019-07-31', 'open'),
(108, '2019-08-01', 'open'),
(109, '2019-08-02', 'open'),
(110, '2019-08-03', 'open'),
(111, '2019-08-05', 'open'),
(112, '2019-08-06', 'open'),
(113, '2019-08-07', 'open'),
(114, '2019-08-08', 'open'),
(115, '2019-08-09', 'open'),
(116, '2019-08-10', 'open'),
(117, '2019-08-12', 'open'),
(118, '2019-08-13', 'open'),
(119, '2019-08-14', 'open'),
(120, '2019-08-15', 'open'),
(121, '2019-08-16', 'open'),
(122, '2019-08-17', 'open'),
(123, '2019-08-19', 'open'),
(124, '2019-08-20', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
CREATE TABLE IF NOT EXISTS `hall` (
  `hallid` varchar(10) NOT NULL,
  `halllocation` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`hallid`, `halllocation`) VALUES
('h1', 'Vivekanda Block'),
('h2', 'Bhabha Block');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password` varchar(33) NOT NULL,
  `securityquestion` varchar(50) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `securityquestion`, `answer`, `type`, `email`) VALUES
('Admin', 'e6e061838856bf47e1de730719fb2609', 'What is your pet name?', 'tim', 'admin', 'admin@netcom.com'),
('Piyush', '202cb962ac59075b964b07152d234b70', 'What is your birth place?', 'India', 'user', 'asdf@gmail.com'),
('qwerty', 'asdf', 'What is my last name ?', 'xyz', 'user', NULL),
('netcom', '600a2c4bdc6be34ca9f20d2b6fc0367a', 'What is your pet name ?', 'tom', 'user', 'netcom@netcom.com'),
('John Wick', '36e3fb42cbce08b6e53bc542e7a523d0', 'What is your pet name ?', 'dog', 'user', 'johnwick@killerr.com'),
('admin2', 'c84258e9c39059a89ab77d846ddab909', 'What is your pet name?', 'dog', 'admin', 'admin2@gmail.com'),
('qqqwwww', '4eae35f1b35977a00ebd8086c259d4c9', 'What is your mother\'s maiden name?', 'eee', 'user', 'www');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
