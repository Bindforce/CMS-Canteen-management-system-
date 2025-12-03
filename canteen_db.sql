-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 01:11 PM
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
-- Database: `canteen_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:41:16'),
(2, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:41:36'),
(3, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:41:40'),
(4, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:42:21'),
(5, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:44:44'),
(6, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:44:49'),
(7, 'binod', 'binod@gmail.com', 'Service is good as I thought.', '2025-12-01 03:52:06'),
(8, 'bikash', 'binod@gmail.com', 'this canteen is ok for me\r\n', '2025-12-01 03:53:28'),
(9, 'bikash', 'binod@gmail.com', 'happy', '2025-12-01 03:59:38'),
(10, 'binod', 'binod@gmail.com', 'testing', '2025-12-02 04:02:17');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_id`, `name`, `price`, `category`, `image`, `availability`) VALUES
(1, 'Veg Chowmein', 80.00, 'Snacks', 'Veg Chowmein.jpg', 1),
(2, 'Chicken Momo', 120.00, 'Snacks', 'Chicken Momo.jpg', 1),
(3, 'Tea', 20.00, 'Beverages', 'tea.jpg', 1),
(4, 'Coffee', 30.00, 'Beverages', 'coffee.jpg', 1),
(5, 'Veg Thali', 150.00, 'Lunch', 'thali.jpg', 1),
(6, 'checken chowmein', 120.00, 'snack', 'checken chowmein.jpg', 1),
(8, 'samosa tarkali', 60.00, 'beverage', 'samosa tarkali.jpg', 1),
(70, 'bbbbbbb', 43.00, 'Lunch', '1764337401_5464.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `table_address` varchar(150) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Ongoing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `table_address`, `total_amount`, `order_time`, `status`) VALUES
(1, 'binod', '', 160.00, '2025-10-30 12:41:42', 'Finished'),
(2, 'binod', '', 160.00, '2025-10-30 12:42:38', 'Finished'),
(3, 'binod', '', 120.00, '2025-10-30 13:11:26', 'Finished'),
(4, 'hero', '', 80.00, '2025-10-31 04:53:33', 'Finished'),
(5, 'hora', '', 120.00, '2025-10-31 05:28:39', 'Finished'),
(6, 'admin', '', 20.00, '2025-10-31 05:35:22', 'Finished'),
(7, 'admin1', '', 20.00, '2025-10-31 05:36:56', 'Finished'),
(8, 'hnh', '', 30.00, '2025-10-31 05:37:35', 'Finished'),
(9, 'jhmjhmj', '', 80.00, '2025-10-31 05:37:47', 'Finished'),
(10, 'hoora', '', 60.00, '2025-10-31 05:55:13', 'Finished'),
(11, 'tyt', '', 120.00, '2025-11-03 02:43:54', 'Finished'),
(12, 'hbgf', '', 20.00, '2025-11-03 02:47:19', 'Finished'),
(13, 'sadsa', '', 30.00, '2025-11-03 02:59:19', 'Finished'),
(14, 'hjhg', '', 30.00, '2025-11-03 03:56:10', 'Finished'),
(15, 'l;lk', '', 80.00, '2025-11-03 14:51:16', 'Finished'),
(16, 'sadcsa', '', 120.00, '2025-11-03 14:51:40', 'Finished'),
(17, 'ggkghk', '', 20.00, '2025-11-03 14:51:51', 'Finished'),
(18, 'kmj', '', 80.00, '2025-11-03 14:52:09', 'Finished'),
(19, 'vfgfd', '', 20.00, '2025-11-05 03:04:42', 'Finished'),
(20, 'Website User', '', 80.00, '2025-11-05 03:46:05', 'Finished'),
(21, 'Website User', '', 820.00, '2025-11-05 03:47:37', 'Finished'),
(22, 'Website User', '', 300.00, '2025-11-05 03:56:43', 'Finished'),
(23, 'Website User', '', 200.00, '2025-11-05 04:21:01', 'Finished'),
(24, 'Website User', '', 200.00, '2025-11-05 09:05:12', 'Finished'),
(25, 'Website User', '', 220.00, '2025-11-06 12:58:52', 'Finished'),
(26, 'Website User', '', 140.00, '2025-11-06 13:11:26', 'Finished'),
(27, 'Website User', '', 560.00, '2025-11-17 03:24:08', 'Finished'),
(28, 'Website User', '', 460.00, '2025-11-17 13:10:16', 'Finished'),
(29, 'Website User', '', 240.00, '2025-11-17 13:12:47', 'Finished'),
(30, 'Website User', '', 120.00, '2025-11-17 13:15:31', 'Finished'),
(31, 'Website User', '', 80.00, '2025-11-17 13:16:19', 'Finished'),
(32, 'Website User', '', 740.00, '2025-11-17 13:20:35', 'Finished'),
(33, 'Website User', '', 120.00, '2025-11-21 12:43:31', 'Finished'),
(34, 'Website User', '', 20.00, '2025-11-21 12:43:43', 'Finished'),
(35, 'Website User', '', 120.00, '2025-11-22 05:02:31', 'Finished'),
(36, 'Website User', '', 80.00, '2025-11-24 11:15:46', 'Finished'),
(37, 'Website User', '', 890.00, '2025-11-28 13:47:29', 'Finished'),
(38, 'Website User', '', 60.00, '2025-11-28 13:55:33', 'Finished'),
(39, 'Website User', '', 120.00, '2025-11-28 14:19:19', 'Finished'),
(40, 'Website User', '', 300.00, '2025-11-28 14:24:42', 'Finished'),
(41, 'Website User', '', 120.00, '2025-11-28 14:27:12', 'Finished'),
(42, 'Website User', '', 220.00, '2025-11-29 12:56:59', 'Finished'),
(43, 'Website User', '', 120.00, '2025-11-29 13:02:41', 'Finished'),
(44, 'Website User', '', 360.00, '2025-11-29 13:13:34', 'Finished'),
(45, 'Website User', '', 140.00, '2025-11-29 13:13:57', 'Finished'),
(46, 'Website User', '', 140.00, '2025-11-29 13:16:26', 'Finished'),
(47, 'Website User', '', 120.00, '2025-11-29 13:25:30', 'Finished'),
(48, 'Website User', '', 80.00, '2025-11-29 13:26:59', 'Finished'),
(49, 'Website User', '', 20.00, '2025-11-29 13:27:06', 'Finished'),
(50, 'Website User', '', 120.00, '2025-11-29 13:27:19', 'Finished'),
(51, 'Website User', '', 120.00, '2025-11-29 13:29:01', 'Finished'),
(52, 'Website User', '', 120.00, '2025-11-29 13:30:55', 'Finished'),
(53, 'Website User', '', 120.00, '2025-11-29 13:31:07', 'Finished'),
(54, 'Website User', '', 120.00, '2025-11-29 13:37:04', 'Finished'),
(55, 'Website User', '', 120.00, '2025-11-29 13:37:26', 'Finished'),
(56, 'Website User', '', 220.00, '2025-11-29 13:40:39', 'Finished'),
(57, 'Website User', '', 120.00, '2025-11-29 13:42:16', 'Finished'),
(58, 'Website User', '', 43.00, '2025-11-29 13:43:25', 'Finished'),
(59, 'Website User', '', 120.00, '2025-11-29 13:49:48', 'Finished'),
(60, 'Website User', '', 20.00, '2025-11-29 13:50:50', 'Finished'),
(61, 'Website User', '', 200.00, '2025-11-29 14:03:52', 'Finished'),
(62, 'Website User', '', 120.00, '2025-11-29 14:04:23', 'Finished'),
(63, 'Website User', '', 20.00, '2025-11-29 14:04:30', 'Finished'),
(64, 'Website User', '', 80.00, '2025-11-29 14:08:50', 'Finished'),
(65, 'Website User', '', 80.00, '2025-11-29 14:09:11', 'Finished'),
(66, 'Website User', '', 410.00, '2025-11-29 14:20:55', 'Finished'),
(67, 'Website User', '', 20.00, '2025-11-30 04:18:52', 'Finished'),
(68, 'binod', 'dfdf', 80.00, '2025-11-30 04:32:31', 'Finished'),
(69, 'binod', 'dfdf', 43.00, '2025-11-30 04:33:21', 'Finished'),
(70, 'don', '4', 120.00, '2025-11-30 04:37:06', 'Finished'),
(71, 'binod', '2', 390.00, '2025-12-01 04:02:17', 'Ongoing'),
(72, 'binod', '5', 260.00, '2025-12-01 13:28:24', 'Finished'),
(73, 'hero', '123', 200.00, '2025-12-01 13:29:21', 'Finished'),
(74, 'binod', '8', 380.00, '2025-12-01 14:03:59', 'Finished'),
(75, 'jhg', '7', 80.00, '2025-12-01 14:14:20', 'Finished'),
(76, 'hero', 'efref', 520.00, '2025-12-01 14:23:47', 'Finished'),
(77, 'admin', 'b', 260.00, '2025-12-01 14:46:51', 'Finished'),
(78, 'binod', 'gaindakot', 300.00, '2025-12-02 04:02:44', 'Finished');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `quantity`, `subtotal`) VALUES
(1, 1, 1, 2, 160.00),
(2, 2, 1, 2, 160.00),
(3, 3, 2, 1, 120.00),
(5, 5, 2, 1, 120.00),
(6, 6, 3, 1, 20.00),
(7, 7, 3, 1, 20.00),
(8, 8, 4, 1, 30.00),
(9, 9, 1, 1, 80.00),
(10, 10, 8, 1, 60.00),
(11, 11, 2, 1, 120.00),
(12, 12, 3, 1, 20.00),
(13, 13, 4, 1, 30.00),
(14, 14, 4, 1, 30.00),
(15, 15, 1, 1, 80.00),
(16, 16, 2, 1, 120.00),
(17, 17, 3, 1, 20.00),
(18, 18, 1, 1, 80.00),
(19, 19, 3, 1, 20.00),
(20, 20, 1, 1, 80.00),
(21, 21, 1, 3, 240.00),
(22, 21, 3, 2, 40.00),
(23, 21, 8, 9, 540.00),
(25, 22, 2, 1, 120.00),
(26, 22, 3, 5, 100.00),
(27, 23, 1, 1, 80.00),
(28, 23, 2, 1, 120.00),
(29, 24, 1, 1, 80.00),
(30, 24, 2, 1, 120.00),
(31, 25, 1, 1, 80.00),
(32, 25, 2, 1, 120.00),
(33, 25, 3, 1, 20.00),
(34, 26, 3, 1, 20.00),
(35, 26, 2, 1, 120.00),
(36, 27, 1, 1, 80.00),
(37, 27, 2, 3, 360.00),
(38, 27, 3, 6, 120.00),
(39, 28, 2, 3, 360.00),
(40, 28, 1, 1, 80.00),
(41, 28, 3, 1, 20.00),
(42, 29, 1, 3, 240.00),
(43, 30, 2, 1, 120.00),
(44, 31, 1, 1, 80.00),
(45, 32, 2, 1, 120.00),
(46, 32, 3, 1, 20.00),
(47, 32, 6, 5, 600.00),
(48, 33, 2, 1, 120.00),
(49, 34, 3, 1, 20.00),
(50, 35, 2, 1, 120.00),
(51, 36, 1, 1, 80.00),
(52, 37, 2, 3, 360.00),
(53, 37, 1, 1, 80.00),
(54, 37, 4, 1, 30.00),
(55, 37, 5, 2, 300.00),
(56, 37, 6, 1, 120.00),
(57, 38, 8, 1, 60.00),
(58, 39, 2, 1, 120.00),
(59, 40, 1, 1, 80.00),
(60, 40, 2, 1, 120.00),
(61, 40, 3, 5, 100.00),
(62, 41, 2, 1, 120.00),
(63, 42, 2, 1, 120.00),
(64, 42, 3, 1, 20.00),
(65, 42, 1, 1, 80.00),
(66, 43, 2, 1, 120.00),
(67, 44, 2, 3, 360.00),
(68, 45, 2, 1, 120.00),
(69, 45, 3, 1, 20.00),
(70, 46, 2, 1, 120.00),
(71, 46, 3, 1, 20.00),
(72, 47, 2, 1, 120.00),
(73, 48, 1, 1, 80.00),
(74, 49, 3, 1, 20.00),
(75, 50, 2, 1, 120.00),
(76, 51, 2, 1, 120.00),
(77, 52, 2, 1, 120.00),
(78, 53, 2, 1, 120.00),
(79, 54, 2, 1, 120.00),
(80, 55, 2, 1, 120.00),
(81, 56, 1, 1, 80.00),
(82, 56, 2, 1, 120.00),
(83, 56, 3, 1, 20.00),
(84, 57, 2, 1, 120.00),
(85, 58, 70, 1, 43.00),
(86, 59, 2, 1, 120.00),
(87, 60, 3, 1, 20.00),
(88, 61, 2, 1, 120.00),
(89, 61, 1, 1, 80.00),
(90, 62, 2, 1, 120.00),
(91, 63, 3, 1, 20.00),
(92, 64, 1, 1, 80.00),
(93, 65, 1, 1, 80.00),
(94, 66, 2, 1, 120.00),
(95, 66, 3, 1, 20.00),
(96, 66, 6, 1, 120.00),
(97, 66, 5, 1, 150.00),
(98, 67, 3, 1, 20.00),
(99, 68, 1, 1, 80.00),
(100, 69, 70, 1, 43.00),
(101, 70, 2, 1, 120.00),
(102, 71, 2, 1, 120.00),
(103, 71, 3, 2, 40.00),
(104, 71, 1, 1, 80.00),
(105, 71, 4, 5, 150.00),
(106, 72, 2, 2, 240.00),
(107, 72, 3, 1, 20.00),
(108, 73, 1, 1, 80.00),
(109, 73, 2, 1, 120.00),
(110, 74, 2, 2, 240.00),
(111, 74, 3, 1, 20.00),
(112, 74, 6, 1, 120.00),
(113, 75, 1, 1, 80.00),
(114, 76, 1, 2, 160.00),
(115, 76, 2, 3, 360.00),
(116, 77, 2, 2, 240.00),
(117, 77, 3, 1, 20.00),
(118, 78, 5, 2, 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(6, 'admin', 'admin123', 'admin'),
(8, 'staff', 'staff123', 'staff'),
(18, 'staff1', 'staff123', 'staff'),
(20, 'waiter', 'waiter123', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
