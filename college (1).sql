-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2021 at 04:28 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `falied_jobs`
--

CREATE TABLE `falied_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` text DEFAULT NULL,
  `payload` longtext DEFAULT NULL,
  `exception` longtext DEFAULT NULL,
  `faliled_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `final_dicision`
--

CREATE TABLE `final_dicision` (
  `id` int(11) NOT NULL,
  `pre_decision_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `pdf` text DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pre_decision`
--

CREATE TABLE `pre_decision` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_id` int(11) NOT NULL,
  `program` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name_ar` text DEFAULT NULL,
  `social_id` bigint(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `schooltype` text DEFAULT NULL,
  `studentphone` varchar(11) DEFAULT NULL,
  `adress` text DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `mail` varchar(150) DEFAULT NULL,
  `fatherphone` varchar(11) DEFAULT NULL,
  `firstlangouge` varchar(10) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `finaltotal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_requirment`
--

CREATE TABLE `student_requirment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `raghbe_1` int(11) DEFAULT NULL,
  `raghbe_2` int(11) DEFAULT NULL,
  `raghbe_3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `theem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `falied_jobs`
--
ALTER TABLE `falied_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `final_dicision`
--
ALTER TABLE `final_dicision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_decision_id` (`pre_decision_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_decision`
--
ALTER TABLE `pre_decision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`program_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_requirment`
--
ALTER TABLE `student_requirment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `raghbe_1` (`raghbe_1`),
  ADD KEY `raghbe_2` (`raghbe_2`),
  ADD KEY `raghbe_3` (`raghbe_3`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `final_dicision`
--
ALTER TABLE `final_dicision`
  ADD CONSTRAINT `final_dicision_ibfk_1` FOREIGN KEY (`pre_decision_id`) REFERENCES `pre_decision` (`id`),
  ADD CONSTRAINT `final_dicision_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

--
-- Constraints for table `pre_decision`
--
ALTER TABLE `pre_decision`
  ADD CONSTRAINT `pre_decision_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_requirment`
--
ALTER TABLE `student_requirment`
  ADD CONSTRAINT `student_requirment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_requirment_ibfk_2` FOREIGN KEY (`raghbe_1`) REFERENCES `programs` (`program_id`),
  ADD CONSTRAINT `student_requirment_ibfk_3` FOREIGN KEY (`raghbe_2`) REFERENCES `programs` (`program_id`),
  ADD CONSTRAINT `student_requirment_ibfk_4` FOREIGN KEY (`raghbe_3`) REFERENCES `programs` (`program_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
