-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2025 at 08:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labguard1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `full_name`, `password`, `created_at`) VALUES
(1, 'Hemlata Kosare', '123', '2025-10-31 14:11:21'),
(2, 'Pragati Fatinge', '123', '2025-10-31 14:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `full_name`, `email`) VALUES
(1, 'Mr. Ravindra Kale', 'ravindrakale@gmail.com'),
(2, 'Ms. Ranjana Shende', 'ranjanashende@gmail.com'),
(3, 'Ms. Pushpa Chutel', 'pushpachutel@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `labs`
--

CREATE TABLE `labs` (
  `id` int(11) NOT NULL,
  `lab_name` varchar(120) NOT NULL,
  `room` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labs`
--

INSERT INTO `labs` (`id`, `lab_name`, `room`) VALUES
(1, 'Computer Lab 1', 'B-411'),
(2, 'Computer Lab 2', 'B-412'),
(3, 'Computer Lab 3', 'B-413');

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE `problems` (
  `id` int(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `lab_name` varchar(120) NOT NULL,
  `equipment` varchar(120) NOT NULL,
  `issue_type` enum('Equipment Issue','Damage','Missing Item','Hardware Issue','Software Issue','Network Issue','Peripheral Issue','General Issue') NOT NULL,
  `description` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Verified','Solved') NOT NULL DEFAULT 'Pending',
  `verified_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` datetime DEFAULT NULL,
  `solved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `room`, `student_id`, `lab_name`, `equipment`, `issue_type`, `description`, `image_path`, `status`, `verified_by`, `created_at`, `verified_at`, `solved_at`) VALUES
(2, 'B-411', '1', '', 'Mouse', 'Damage', 'mouse is not working properly', 'uploads/report_1761982948_51ba37f1.jpg', 'Solved', 2, '2025-11-01 07:42:28', '2025-11-01 13:13:00', '2025-11-01 13:13:03'),
(6, 'B-412', '1', '', 'Keyboard', 'Hardware Issue', 'buttons are unable to click', 'uploads/report_1762071156_8e5c5e47.jpg', 'Solved', 2, '2025-11-02 08:12:36', '2025-11-02 13:46:26', '2025-11-02 13:46:38'),
(7, 'B-411', '3', '', 'computer', 'Network Issue', 'LAN is unable to connect to the computer', 'uploads/report_1762071328_f9358fe1.jpg', 'Pending', NULL, '2025-11-02 08:15:28', NULL, NULL),
(8, 'B-411', '1', '', 'Mouse', 'Hardware Issue', 'mouse not working', 'uploads/report_1762153777_86be2348.jpg', 'Solved', 2, '2025-11-03 07:09:37', '2025-11-03 12:40:57', '2025-11-03 12:41:14'),
(16, 'B-412', '20', '', 'Keyboard', 'Missing Item', 'bdnd', 'uploads/report_1762413868_ede7887c.jpg', 'Solved', 2, '2025-11-06 07:24:28', '2025-11-06 12:54:51', '2025-11-06 12:54:54'),
(17, 'B-412', '0', '', 'CPU', 'Equipment Issue', 'CPU not working', 'uploads/report_1762415050_9916ada0.jpg', 'Pending', NULL, '2025-11-06 07:44:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `rollno` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `student_id`, `password`, `full_name`, `username`, `rollno`, `branch`, `sem`, `section`, `contact`, `email`, `created_at`) VALUES
(1, '1', '123', 'Bhagyashri Kapgate', 'bhagyashri', 'A36', 'cse', '3 sem', 'A', '7498921583', 'bhagyashrikapgate@gmail.com', '2025-10-31 14:11:21'),
(2, '2', '123', 'Aryan Bawane', 'aryanbawane', 'A25', 'cse', '3 sem', 'A', '8956434', 'aryanbawane@gmail.com', '2025-10-31 14:11:21'),
(3, '3', '123', 'Ayesha Yadav', 'ayesha', 'A33', 'cse', '3sem', 'A', '33', 'ayeshayadav@gmail.com', '2025-10-31 14:11:21'),
(4, '4', '123', 'Awadhi Rao', 'awadhi', 'A31', 'cse', '3 sem', 'A', '31', 'awadhirao@gmail.com', '2025-10-31 14:11:21'),
(5, '5', '123', 'Bhavik Titarmare', 'bhavik', 'A38', 'cse', '3 sem', 'A', '38', 'bhaviktitarmare@gmail.com', '2025-10-31 14:11:21'),
(6, '6', '123', 'Aryan Ojha', 'aryanojha', 'A27', 'cse', '3 sem', 'A', '27', 'aryanojha@gmail.com', '2025-10-31 14:11:21'),
(17, 'A39', '$2y$10$JoHvaJJlPC1BG36p4Whmnusp/Wn70chxdKkipyH04z1TOb0yxEPAW', 'Bhumi Shirke', 'bhumi', 'A39', 'CSE', '3rd', 'A', '39', 'bhumishirke@gmail.com', '2025-11-06 07:43:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labs`
--
ALTER TABLE `labs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_problems_admin` (`verified_by`),
  ADD KEY `fk_problems_student` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `labs`
--
ALTER TABLE `labs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `problems`
--
ALTER TABLE `problems`
  ADD CONSTRAINT `fk_problems_admin` FOREIGN KEY (`verified_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
