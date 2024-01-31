-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 04:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngpdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `project_registration`
--

CREATE TABLE `project_registration` (
  `name` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `confirm_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_registration`
--

INSERT INTO `project_registration` (`name`, `number`, `email`, `gender`, `password`, `confirm_password`) VALUES
('Harsha', '98765432198', 'harsha@gmail.com', 'Female', 'Harsha', 'Harsha'),
('kavya', '9876543210', 'kavya@gamil.com', 'Female', 'kavya', 'kavya'),
('Kanishka', '9629030668', 'kanishka@gmail.com', 'Female', 'kani', 'kani'),
('Madhu', '9812345690', 'madhu@gmail.com', 'Female', 'madhu', 'madhu'),
('Madhu', '9812345690', 'madhu@gmail.com', 'Female', 'madhu', 'madhu'),
('User1', '9578439198', 'user1@gmail.com', 'Male', 'user1', 'user1'),
('user2', '98761236678', 'user2@gmail.com', 'Male', 'user2', 'user2'),
('user3', '987567890', 'user3@gmail.com', 'Male', 'user3', 'user3'),
('user4@gamil.com', '9123456784', 'user4@gmail.com', 'Male', 'user4', 'user4'),
('user4@gamil.com', '9123456784', 'user4@gmail.com', 'Male', 'user4', 'user4'),
('user5', '9234567810', 'user5@gmail.com', 'Female', 'user5', 'user5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
