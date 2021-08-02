-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2021 at 05:51 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arapmakeup`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `contents` text DEFAULT NULL,
  `lang_code` varchar(150) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `extra` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `contents` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `lang_code` varchar(250) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `pairent_id` int(11) DEFAULT NULL,
  `others` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comments` text DEFAULT NULL,
  `product_title` varchar(250) NOT NULL,
  `author` varchar(150) NOT NULL,
  `author_email` varchar(250) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `extra` varchar(150) DEFAULT NULL,
  `extra1` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crosssell`
--

CREATE TABLE `crosssell` (
  `id` int(11) NOT NULL,
  `crosssell_for_post_id` int(11) NOT NULL,
  `crosssell_in_post_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `cur_symbols` varchar(10) NOT NULL,
  `country_name` varchar(120) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `extra` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `images_gallery`
--

CREATE TABLE `images_gallery` (
  `id` int(11) NOT NULL,
  `product_id` varchar(250) NOT NULL,
  `img_url` text DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `extra` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(150) NOT NULL,
  `country_name` varchar(250) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `sku` varchar(250) NOT NULL,
  `post_type` varchar(250) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `tax_status` tinyint(1) NOT NULL DEFAULT 0,
  `weight` decimal(11,0) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `width` decimal(10,0) DEFAULT NULL,
  `height` decimal(10,0) DEFAULT NULL,
  `others` varchar(250) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_comment_details`
--

CREATE TABLE `post_comment_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_details`
--

CREATE TABLE `post_details` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `lang_code` varchar(20) DEFAULT NULL,
  `cur_code` varchar(20) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sub_title` varchar(250) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `sub_contents` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `cat_id` int(11) NOT NULL DEFAULT 1,
  `sub_cat_id` int(11) DEFAULT NULL,
  `brd_id` int(11) DEFAULT NULL,
  `sub_brd_id` int(11) DEFAULT NULL,
  `var_id` int(11) DEFAULT NULL,
  `tax_class_id` int(11) DEFAULT NULL,
  `regular_price` double DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `extra` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `count`, `created_date`, `extra`) VALUES
(1, 1, '2021-07-06 02:12:37', NULL),
(2, 2, '2021-07-06 02:12:37', NULL),
(3, 3, '2021-07-06 02:12:43', NULL),
(4, 4, '2021-07-06 02:12:43', NULL),
(5, 5, '2021-07-06 02:12:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_brand`
--

CREATE TABLE `sub_brand` (
  `id` int(11) NOT NULL,
  `pairentid` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `contents` text DEFAULT NULL,
  `lang_code` varchar(150) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `extra` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `contents` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `lang_code` varchar(250) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `pairent_id` int(11) DEFAULT NULL,
  `others` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE `tax_class` (
  `id` int(11) NOT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `states_code` varchar(20) DEFAULT NULL,
  `city_code` varchar(250) DEFAULT NULL,
  `pin_code` varchar(100) DEFAULT NULL,
  `tax_type` varchar(150) DEFAULT NULL,
  `tax_pre` decimal(10,0) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `extra` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `upsell`
--

CREATE TABLE `upsell` (
  `id` int(11) NOT NULL,
  `upsell_for_post_id` int(11) NOT NULL,
  `upsell_in_post_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_login` varchar(150) DEFAULT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_role` varchar(150) NOT NULL DEFAULT '0',
  `user_nicename` varchar(150) DEFAULT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_phone` int(10) NOT NULL,
  `user_registered` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_activation_key` text NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) DEFAULT NULL,
  `extra` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_login`, `user_pass`, `user_role`, `user_nicename`, `user_email`, `user_phone`, `user_registered`, `user_activation_key`, `user_status`, `display_name`, `extra`) VALUES
(1, 'test', '$2b$10$coDqRso9babpuCSOXPuv7.oxw3Kzvi3NsedAGRYd2vYgCPzaw.kFq', '0', 'test', 'test@gmail.com', 0, '2021-07-15 08:53:56', '', 0, NULL, NULL),
(4, 'test1t', '$2b$10$oBigja.c1SbnOgiROQc8gO/Gip1njWHGZjwQg/.TtEnMFLQUouEAu', '0', 'test1', 'test1@gmail.om', 874857487, '2021-07-16 01:36:33', '', 0, NULL, NULL),
(5, 'arapmakeup', '$2b$10$lGc60CP.swTuu/oaptdlI.SX3hAtewat8snNyAdpBTEYxrlaT2HvK', '1', 'arapmakeup', 'arapmakeup@arapmakeup.com', 888888888, '2021-07-16 02:08:15', '', 0, NULL, NULL),
(7, 'tew', '$2b$10$NTmfBnK8zqi3DwpETv4IXu70cKlUoTr309Dx5y4xCISTi8vtcO1we', '0', 'test', 'test@gamil.com', 2147483647, '2021-07-16 03:28:53', '', 0, NULL, NULL),
(10, 'tesst', '$2b$10$fF0Ya0KmelyCAIQWFwloTesd0T8xwsKkqSmi.vYTVSR9XvqJS61em', '0', 'test', 'test@gmail.com', 85875454, '2021-07-16 03:38:09', '', 0, NULL, NULL),
(11, 'testddd', '$2b$10$fz1NCfKG/ErdxCaey6TSXu5zTZCyYFf5x9v1PU.EaNY/DD1I5QQfe', '0', 'testdd', 'testddd@gmail.com', 8552445, '2021-07-16 03:54:56', '', 0, NULL, NULL),
(21, 'testtest', '$2b$10$1wOiSJVYJakPaQtz0BpUy.5DRxewgqrErHz08jy7EwU8TcLdKS93C', '0', 'test', 'test@gamil.com', 888545121, '2021-07-16 07:06:38', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `block` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `avenue` varchar(50) DEFAULT NULL,
  `house_building` varchar(50) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `flat` varchar(50) DEFAULT NULL,
  `extra` varchar(50) DEFAULT NULL,
  `extra1` varchar(50) DEFAULT NULL,
  `extra2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `lang_code` varchar(250) DEFAULT NULL,
  `prices` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `extra1` varchar(250) DEFAULT NULL,
  `extra2` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_name` (`title`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `lang_code` (`lang_code`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `au_email_p_id` (`author_email`,`product_title`);

--
-- Indexes for table `crosssell`
--
ALTER TABLE `crosssell`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country` (`cur_symbols`,`country_name`);

--
-- Indexes for table `images_gallery`
--
ALTER TABLE `images_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_comment_details`
--
ALTER TABLE `post_comment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_details`
--
ALTER TABLE `post_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_brand`
--
ALTER TABLE `sub_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_name` (`title`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `lang_code` (`lang_code`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upsell`
--
ALTER TABLE `upsell`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`user_phone`),
  ADD UNIQUE KEY `user_login` (`user_login`,`user_email`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crosssell`
--
ALTER TABLE `crosssell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_gallery`
--
ALTER TABLE `images_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comment_details`
--
ALTER TABLE `post_comment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_details`
--
ALTER TABLE `post_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_brand`
--
ALTER TABLE `sub_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upsell`
--
ALTER TABLE `upsell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
