-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: May 20, 2015 at 05:37 PM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `messageBoard`
--
CREATE DATABASE IF NOT EXISTS `messageBoard` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `messageBoard`;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `mID` int(11) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `mTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mContent` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`mID`, `IP`, `mTime`, `mContent`) VALUES
(1, '0:0:0:0:0:0:0:1', '2015-05-20 15:27:36', '排序是一个非常常见的应用场景,很多时候,我们需要根据自己需要排序的数据类型,来自定义排序算法,但是,在这里,我们只介绍这些基础排序算法,包括:插入排序、选择排序、冒泡排序、快速排序(重点)、堆排序、归并排序等等。'),
(2, '171.114.218.93', '2015-05-18 22:09:15', '思路上从待排序的数据中选出一个,插入到前面合适的位置,耗时点在插入方面,合适 的位置意味着我们需要进行比较找出哪是合适的位置。'),
(3, '151.104.207.14', '2015-05-19 18:09:17', '与直接插入排序正好相反,选择排序是从待排序的数中选出最小的放在已经排好的后面,这个算法选数耗时。'),
(4, '128.106.118.45', '2015-05-20 15:30:53', '冒泡排序是一种很简单,不论是理解还是时间起来都比较容易的一种排序算法,思路简单:小的数一点一点向前 起泡,最终有序。');
