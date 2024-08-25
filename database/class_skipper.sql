-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2024 at 11:11 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `class_skipper`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `camera1` varchar(20) NOT NULL,
  `camera2` varchar(20) NOT NULL,
  `camera3` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `camera1`, `camera2`, `camera3`) VALUES
('admin', 'admin', 'CSE', 'Canteen', 'Auditorium');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `regno` varchar(20) NOT NULL,
  `rdate` varchar(20) NOT NULL,
  `attendance` varchar(20) NOT NULL,
  `mask_st` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `regno`, `rdate`, `attendance`, `mask_st`) VALUES
(1, '4101', '12-03-2024', 'Present', '-'),
(2, '4102', '12-03-2024', 'Present', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`) VALUES
(1, 'CSE'),
(2, 'IT'),
(3, 'MCA'),
(4, 'MSc'),
(5, 'BCA'),
(6, 'BSc');

-- --------------------------------------------------------

--
-- Table structure for table `detect_class_skipper`
--

CREATE TABLE `detect_class_skipper` (
  `id` int(11) NOT NULL,
  `regno` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `camera` varchar(20) NOT NULL,
  `face_img` varchar(20) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detect_class_skipper`
--

INSERT INTO `detect_class_skipper` (`id`, `regno`, `name`, `camera`, `face_img`, `dept`, `date_time`) VALUES
(8, '4102', 'Ishu', 'Canteen', 'd8.jpg', 'CSE', '2024-03-12 15:35:21'),
(9, '4102', 'Ishu', 'Canteen', 'd9.jpg', 'CSE', '2024-03-12 15:35:43'),
(10, '4101', 'Kannan', 'Canteen', 'd10.jpg', 'CSE', '2024-03-12 15:36:24'),
(11, '4101', 'Kannan', 'Canteen', 'd11.jpg', 'CSE', '2024-03-12 15:36:46'),
(12, '4101', 'Kannan', 'Canteen', 'd12.jpg', 'CSE', '2024-03-12 15:38:58'),
(13, '4101', 'Kannan', 'Canteen', 'd13.jpg', 'CSE', '2024-03-12 15:39:20'),
(14, '4101', 'Kannan', 'Canteen', 'd14.jpg', 'CSE', '2024-03-12 15:42:20'),
(15, '4101', 'Kannan', 'Canteen', 'd15.jpg', 'CSE', '2024-03-12 15:42:42'),
(16, '4101', 'Kannan', 'Canteen', 'd16.jpg', 'CSE', '2024-03-12 15:43:05'),
(17, '4101', 'Kannan', 'Auditorium', 'd17.jpg', 'CSE', '2024-03-12 15:43:51'),
(18, '4101', 'Kannan', 'Auditorium', 'd18.jpg', 'CSE', '2024-03-12 15:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `aadhar` varchar(20) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL,
  `rdate` varchar(20) NOT NULL,
  `face_st` int(11) NOT NULL,
  `fimg` varchar(30) NOT NULL,
  `otp` varchar(20) NOT NULL,
  `allow_st` int(11) NOT NULL,
  `regno` varchar(20) NOT NULL,
  `parent_mob` bigint(20) NOT NULL,
  UNIQUE KEY `regno` (`regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `name`, `address`, `mobile`, `email`, `aadhar`, `dept`, `year`, `rdate`, `face_st`, `fimg`, `otp`, `allow_st`, `regno`, `parent_mob`) VALUES
(1, 'Kannan', '25, SJ Nagar, Salem', 9517538524, 'kannan@gmail.com', '235678479567', 'CSE', '2020-2024', '', 0, 'User.1.60.jpg', '', 0, '4101', 9894442716),
(2, 'Ishu', '56,DD', 9545487454, 'ishu@gmail.com', '356598753434', 'CSE', '2020-2024', '', 0, 'User.2.42.jpg', '', 0, '4102', 9878454564);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `stype` varchar(20) NOT NULL,
  `rdate` varchar(15) NOT NULL,
  `dept` varchar(20) NOT NULL,
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `mobile`, `email`, `location`, `uname`, `pass`, `stype`, `rdate`, `dept`) VALUES
(1, 'Rajan', 9894442716, 'rajan@gmail.com', 'Chennai', 'S001', '123456', 'HOD', '12-03-2024', 'CSE'),
(2, 'Suresh', 8562175557, 'suresh@gmail.com', 'Madurai', 'S002', '123456', 'Staff', '12-03-2024', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `staff` varchar(20) NOT NULL,
  `semester` int(11) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `hour1` int(11) NOT NULL,
  `minute1` int(11) NOT NULL,
  `hour2` int(11) NOT NULL,
  `minute2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `dept`, `staff`, `semester`, `subject`, `hour1`, `minute1`, `hour2`, `minute2`) VALUES
(1, 'CSE', 'S002', 6, 'Python', 15, 0, 16, 30);

-- --------------------------------------------------------

--
-- Table structure for table `vt_face`
--

CREATE TABLE `vt_face` (
  `id` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `vface` varchar(30) NOT NULL,
  `mask_st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vt_face`
--

INSERT INTO `vt_face` (`id`, `vid`, `vface`, `mask_st`) VALUES
(155, 2, 'User.2.2.jpg', 0),
(156, 2, 'User.2.3.jpg', 0),
(157, 2, 'User.2.4.jpg', 0),
(158, 2, 'User.2.5.jpg', 0),
(159, 2, 'User.2.6.jpg', 0),
(160, 2, 'User.2.7.jpg', 0),
(161, 2, 'User.2.8.jpg', 0),
(162, 2, 'User.2.9.jpg', 0),
(163, 2, 'User.2.10.jpg', 0),
(164, 2, 'User.2.11.jpg', 0),
(165, 2, 'User.2.12.jpg', 0),
(166, 2, 'User.2.13.jpg', 0),
(167, 2, 'User.2.14.jpg', 0),
(168, 2, 'User.2.15.jpg', 0),
(169, 2, 'User.2.16.jpg', 0),
(170, 2, 'User.2.17.jpg', 0),
(171, 2, 'User.2.18.jpg', 0),
(172, 2, 'User.2.19.jpg', 0),
(173, 2, 'User.2.20.jpg', 0),
(174, 2, 'User.2.21.jpg', 0),
(175, 2, 'User.2.22.jpg', 0),
(176, 2, 'User.2.23.jpg', 0),
(177, 2, 'User.2.24.jpg', 0),
(178, 2, 'User.2.25.jpg', 0),
(179, 2, 'User.2.26.jpg', 0),
(180, 2, 'User.2.27.jpg', 0),
(181, 2, 'User.2.28.jpg', 0),
(182, 2, 'User.2.29.jpg', 0),
(183, 2, 'User.2.30.jpg', 0),
(184, 2, 'User.2.31.jpg', 0),
(185, 2, 'User.2.32.jpg', 0),
(186, 2, 'User.2.33.jpg', 0),
(187, 2, 'User.2.34.jpg', 0),
(188, 2, 'User.2.35.jpg', 0),
(189, 2, 'User.2.36.jpg', 0),
(190, 2, 'User.2.37.jpg', 0),
(191, 2, 'User.2.38.jpg', 0),
(192, 2, 'User.2.39.jpg', 0),
(193, 2, 'User.2.40.jpg', 0),
(194, 2, 'User.2.41.jpg', 0),
(195, 2, 'User.2.42.jpg', 0),
(196, 1, 'User.1.2.jpg', 0),
(197, 1, 'User.1.3.jpg', 0),
(198, 1, 'User.1.4.jpg', 0),
(199, 1, 'User.1.5.jpg', 0),
(200, 1, 'User.1.6.jpg', 0),
(201, 1, 'User.1.7.jpg', 0),
(202, 1, 'User.1.8.jpg', 0),
(203, 1, 'User.1.9.jpg', 0),
(204, 1, 'User.1.10.jpg', 0),
(205, 1, 'User.1.11.jpg', 0),
(206, 1, 'User.1.12.jpg', 0),
(207, 1, 'User.1.13.jpg', 0),
(208, 1, 'User.1.14.jpg', 0),
(209, 1, 'User.1.15.jpg', 0),
(210, 1, 'User.1.16.jpg', 0),
(211, 1, 'User.1.17.jpg', 0),
(212, 1, 'User.1.18.jpg', 0),
(213, 1, 'User.1.19.jpg', 0),
(214, 1, 'User.1.20.jpg', 0),
(215, 1, 'User.1.21.jpg', 0),
(216, 1, 'User.1.22.jpg', 0),
(217, 1, 'User.1.23.jpg', 0),
(218, 1, 'User.1.24.jpg', 0),
(219, 1, 'User.1.25.jpg', 0),
(220, 1, 'User.1.26.jpg', 0),
(221, 1, 'User.1.27.jpg', 0),
(222, 1, 'User.1.28.jpg', 0),
(223, 1, 'User.1.29.jpg', 0),
(224, 1, 'User.1.30.jpg', 0),
(225, 1, 'User.1.31.jpg', 0),
(226, 1, 'User.1.32.jpg', 0),
(227, 1, 'User.1.33.jpg', 0),
(228, 1, 'User.1.34.jpg', 0),
(229, 1, 'User.1.35.jpg', 0),
(230, 1, 'User.1.36.jpg', 0),
(231, 1, 'User.1.37.jpg', 0),
(232, 1, 'User.1.38.jpg', 0),
(233, 1, 'User.1.39.jpg', 0),
(234, 1, 'User.1.40.jpg', 0),
(235, 1, 'User.1.41.jpg', 0),
(236, 1, 'User.1.42.jpg', 0),
(237, 1, 'User.1.43.jpg', 0),
(238, 1, 'User.1.44.jpg', 0),
(239, 1, 'User.1.45.jpg', 0),
(240, 1, 'User.1.46.jpg', 0),
(241, 1, 'User.1.47.jpg', 0),
(242, 1, 'User.1.48.jpg', 0),
(243, 1, 'User.1.49.jpg', 0),
(244, 1, 'User.1.50.jpg', 0),
(245, 1, 'User.1.51.jpg', 0),
(246, 1, 'User.1.52.jpg', 0),
(247, 1, 'User.1.53.jpg', 0),
(248, 1, 'User.1.54.jpg', 0),
(249, 1, 'User.1.55.jpg', 0),
(250, 1, 'User.1.56.jpg', 0),
(251, 1, 'User.1.57.jpg', 0),
(252, 1, 'User.1.58.jpg', 0),
(253, 1, 'User.1.59.jpg', 0),
(254, 1, 'User.1.60.jpg', 0);
