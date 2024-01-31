-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 04:44 AM
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
-- Table structure for table `task_list`
--

CREATE TABLE `task_list` (
  `name` varchar(100) NOT NULL,
  `taskname` varchar(1000) NOT NULL,
  `assignedto` varchar(1000) NOT NULL,
  `status` varchar(50) NOT NULL,
  `duedate` date NOT NULL,
  `action` tinyint(1) DEFAULT NULL,
  `entryId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_list`
--

INSERT INTO `task_list` (`name`, `taskname`, `assignedto`, `status`, `duedate`, `action`, `entryId`) VALUES
('kavya', 'complete project', 'madhu', 'InProgress', '2024-01-31', 0, 7),
('kavya', 'exercise', 'madhu', 'InProgress', '2024-02-01', 0, 11),
('kavya', 'Attend meeting', 'kani', 'InProgress', '2024-02-10', 0, 23),
('kavya', 'prepare seminar', 'kani', 'InProgress', '2024-01-31', 0, 25),
('kavya', 'kjhkj', 'kjhkj', 'Completed', '2024-01-10', 0, 26);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`entryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task_list`
--
ALTER TABLE `task_list`
  MODIFY `entryId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
