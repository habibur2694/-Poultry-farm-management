-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 09:57 PM
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
-- Database: `farm`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Late','Absent') DEFAULT 'Present'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `worker_id`, `attendance_date`, `status`) VALUES
(1, 1, '2025-06-17', 'Present'),
(3, 2, '2025-06-17', 'Late'),
(4, 3, '2025-06-08', 'Absent'),
(5, 4, '2025-06-12', 'Absent'),
(6, 5, '2025-06-12', 'Present'),
(7, 6, '2025-06-14', 'Late'),
(8, 7, '2025-06-02', 'Present'),
(9, 8, '2025-06-03', 'Late'),
(12, 9, '2025-06-05', 'Late'),
(14, 10, '2025-06-07', 'Present'),
(15, 11, '2025-06-13', 'Late'),
(18, 12, '2025-06-25', 'Present'),
(19, 13, '2025-06-26', 'Late'),
(21, 14, '2025-06-10', 'Present'),
(22, 15, '2025-06-08', 'Present'),
(23, 16, '2025-06-06', 'Present'),
(24, 17, '2025-06-11', 'Present'),
(26, 18, '2025-06-10', 'Absent'),
(27, 2, '2025-06-05', 'Present'),
(28, 3, '2025-06-07', 'Present'),
(29, 1, '2025-06-07', 'Present'),
(30, 7, '2025-06-09', 'Present'),
(31, 2, '2025-06-02', 'Present'),
(33, 19, '2025-06-02', 'Absent'),
(34, 20, '2025-06-02', 'Late'),
(35, 7, '2025-06-10', 'Present'),
(36, 7, '2025-06-12', 'Present'),
(37, 19, '2025-06-12', 'Present'),
(38, 16, '2025-06-04', 'Present'),
(39, 15, '2025-06-07', 'Absent'),
(40, 19, '2025-06-09', 'Present'),
(41, 7, '2025-06-03', 'Present'),
(42, 21, '2025-06-18', 'Present'),
(43, 22, '2025-06-23', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `market_prices`
--

CREATE TABLE `market_prices` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `market_location` varchar(100) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `current_price` decimal(5,2) DEFAULT NULL,
  `change_24h` decimal(4,2) DEFAULT NULL,
  `change_7d` decimal(4,2) DEFAULT NULL,
  `regional_avg` decimal(5,2) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `market_prices`
--

INSERT INTO `market_prices` (`id`, `product_name`, `market_location`, `unit`, `current_price`, `change_24h`, `change_7d`, `regional_avg`, `updated_at`) VALUES
(1, 'Broiler Chicken', 'Dhaka Central', 'kg', 5.00, 1.20, 5.20, 3.18, '2025-06-22 12:15:26'),
(2, 'Eggs', 'Dhaka North', 'dozen', 3.00, -0.80, -2.10, 1.48, '2025-06-22 12:15:26'),
(3, 'Poultry Feed', 'National Avg', 'kg', 1.30, 1.00, -1.20, 0.46, '2025-06-22 12:15:26'),
(8, 'Poultry Feed', 'National Avg', 'kg', 7.45, 2.78, 3.87, 1.83, '2025-06-22 19:21:59'),
(9, 'Eggs', 'Dhaka east', 'dozen', 2.36, 1.80, 2.95, 3.00, '2025-06-22 19:20:16'),
(10, 'Broiler Chicken', 'Dhaka West', 'kg', 5.05, 2.25, 3.30, 4.48, '2025-06-22 19:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `price_alerts`
--

CREATE TABLE `price_alerts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `market_location` varchar(100) DEFAULT NULL,
  `alert_type` enum('above','below','change') DEFAULT NULL,
  `alert_value` decimal(5,2) DEFAULT NULL,
  `notify_email` tinyint(1) DEFAULT 1,
  `notify_sms` tinyint(1) DEFAULT 0,
  `notify_app` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_alerts`
--

INSERT INTO `price_alerts` (`id`, `user_id`, `product_name`, `market_location`, `alert_type`, `alert_value`, `notify_email`, `notify_sms`, `notify_app`, `created_at`) VALUES
(1, 99, 'Eggs', 'Khulna', 'below', 1.50, 2, 0, 1, '2025-06-22 13:46:35'),
(2, 1, 'Broiler Chicken', 'Dhaka Central', 'above', 3.20, 1, 0, 1, '2025-06-22 13:48:54'),
(3, 1, 'Eggs', 'Chittagong Port', 'below', 1.40, 1, 1, 0, '2025-06-22 13:48:54'),
(4, 2, 'Poultry Feed', 'National Avg', 'change', 5.00, 0, 0, 1, '2025-06-21 13:48:54'),
(5, 2, 'Broiler Chicken', 'Rajshahi', 'above', 3.10, 1, 0, 1, '2025-06-22 13:48:54'),
(6, 3, 'Eggs', 'Sylhet', 'below', 1.38, 1, 1, 1, '2025-06-22 13:48:54'),
(7, 4, 'Poultry Feed', 'Barisal', 'change', 4.50, 0, 1, 1, '2025-06-22 13:48:54'),
(8, 5, 'Broiler Chicken', 'Khulna', 'below', 3.00, 1, 0, 1, '2025-06-22 13:48:54'),
(9, 6, 'Eggs', 'Dhaka Central', 'above', 1.60, 1, 1, 1, '2025-06-22 13:48:54'),
(10, 7, 'Poultry Feed', 'Chittagong Port', 'above', 0.50, 0, 0, 1, '2025-06-22 13:48:54'),
(11, 8, 'Broiler Chicken', 'Sylhet', 'change', 2.80, 1, 0, 0, '2025-06-22 13:48:54'),
(12, 12, 'Broiler chicken', 'Dhaka ', 'above', 1.69, 1, 0, 1, '2025-06-22 19:24:27'),
(13, 13, 'Eggs', 'Dhaka east', 'change', 1.67, 1, 0, 1, '2025-06-22 19:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `price_history`
--

CREATE TABLE `price_history` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `market_location` varchar(100) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `unit` varchar(10) DEFAULT '/kg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_history`
--

INSERT INTO `price_history` (`id`, `product_name`, `market_location`, `price`, `record_date`, `unit`) VALUES
(1, 'Broiler Chicken', 'Dhaka Central', 3.10, '2024-05-22', '/kg'),
(2, 'Broiler Chicken', 'Chittagong Port', 3.05, '2024-05-22', '/kg'),
(3, 'Broiler Chicken', 'Rajshahi', 3.00, '2024-05-22', '/kg'),
(4, 'Broiler Chicken', 'Khulna', 3.08, '2024-05-22', '/kg'),
(5, 'Broiler Chicken', 'Sylhet', 3.06, '2024-05-22', '/kg'),
(6, 'Broiler Chicken', 'Dhaka', 3.10, '2025-06-01', 'kg'),
(7, 'Eggs', 'Dhaka', 1.55, '2025-06-01', 'dozen'),
(8, 'Poultry Feed', 'National Avg', 0.46, '2025-06-01', 'kg'),
(9, 'Broiler Chicken', 'Dhaka', 3.25, '2025-06-08', 'kg'),
(10, 'Eggs', 'Dhaka', 1.60, '2025-06-08', 'dozen'),
(11, 'Poultry Feed', 'National Avg', 0.48, '2025-06-08', 'kg'),
(12, 'Eggs', 'chittagong', 3.40, '2025-06-24', '/dozen'),
(13, 'Eggs', 'Feni', 2.40, '2025-06-25', '/dozen'),
(14, 'Eggs', 'Tangail', 2.00, '2025-06-19', '/dozen'),
(15, 'Poultry Feed', 'Cumilla', 1.00, '2025-06-10', '/kg'),
(16, 'Poultry Feed', 'Chandpur', 4.40, '2025-06-23', '/kg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(3, 'Cleaner'),
(2, 'Feeder'),
(1, 'Field Worker'),
(4, 'Irrigation');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `worker_id` int(11) NOT NULL,
  `labor_id` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `employment_type` enum('Permanent','Contract','Probation') DEFAULT 'Contract',
  `task` varchar(100) DEFAULT 'General',
  `performance` varchar(50) DEFAULT 'Average',
  `payroll` varchar(50) DEFAULT '$300/month',
  `hour_per_day` varchar(20) DEFAULT '6h / day'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`worker_id`, `labor_id`, `name`, `role_id`, `employment_type`, `task`, `performance`, `payroll`, `hour_per_day`) VALUES
(1, '011', 'Sumiya ', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(2, '012', 'rahim', 3, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(3, '013', 'karim', 4, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(4, '014', 'noufal', 2, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(5, '1', 'd', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(6, '2', 'jamil', 3, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(7, '10', 'labib', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(8, '12', 'akash', 2, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(9, '154', 'bilal', 2, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(10, '23', 'nijam', 4, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(11, '16', 'akil', 3, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(12, '15', 'waisf', 2, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(13, '17', 'ka', 3, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(14, '18', 'david', 2, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(15, '20', 'fork', 3, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(16, '21', 'pabel', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(17, '22', 'jony', 3, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(18, '24', 'paul', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(19, '25', 'dav', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(20, '26', 'kavin', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(21, '31', 'rahman', 4, 'Contract', 'General', 'Average', '$300/month', '6h / day'),
(22, '100', 'labib', 1, 'Contract', 'General', 'Average', '$300/month', '6h / day');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `worker_id` (`worker_id`,`attendance_date`);

--
-- Indexes for table `market_prices`
--
ALTER TABLE `market_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_alerts`
--
ALTER TABLE `price_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_history`
--
ALTER TABLE `price_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`worker_id`),
  ADD UNIQUE KEY `labor_id` (`labor_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `market_prices`
--
ALTER TABLE `market_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `price_alerts`
--
ALTER TABLE `price_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `price_history`
--
ALTER TABLE `price_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`);

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
