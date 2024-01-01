-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 30, 2023 at 06:59 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_27_164902_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `stock`, `created_at`, `updated_at`) VALUES
(15, 'test', 'Powerful blender for smoothies and food preparation.', '1.30', 'Kitchen Appliances', 60, '2023-12-27 12:07:07', '2023-12-27 12:07:07'),
(14, '12341', 'Powerful blender for smoothies and food preparation.', '1.30', 'Kitchen Appliances', 60, '2023-12-27 12:04:00', '2023-12-27 12:04:00'),
(13, '**#41234', 'Powerful blender for smoothies and food preparation.', '1.30', 'Kitchen Appliances', 60, '2023-12-27 12:03:42', '2023-12-27 12:03:42'),
(12, '**#41234', 'Powerful blender for smoothies and food preparation.', '89.99', 'Kitchen Appliances', 60, '2023-12-27 12:00:44', '2023-12-27 12:00:44'),
(5, 'Coffee Maker', 'Automatic coffee maker for brewing your favorite coffee at home.', '49.99', 'Appliances', 30, '2023-12-27 11:48:19', '2023-12-27 11:48:19'),
(6, 'Blender Test', 'Powerful blender for smoothies and food preparation.', '89.99', 'Kitchen Appliances', 60, '2023-12-27 11:48:24', '2023-12-30 12:45:22'),
(7, 'Bluetooth Speaker', 'Portable speaker with wireless connectivity for music on the go.', '59.99', 'Electronics', 90, '2023-12-27 11:48:29', '2023-12-27 11:48:29'),
(8, 'HD Television', 'High-definition smart TV with a large screen for immersive viewing.', '599.99', 'Electronics', 25, '2023-12-27 11:48:34', '2023-12-27 11:48:34'),
(9, 'Yoga Mat', 'Comfortable and non-slip yoga mat for your exercise routine.', '29.99', 'Fitness', 150, '2023-12-27 11:48:39', '2023-12-27 11:48:39'),
(10, 'Gaming Console', 'Next-gen gaming console for an immersive gaming experience.', '449.99', 'Electronics', 40, '2023-12-27 11:48:45', '2023-12-27 11:48:45'),
(11, 'Blender', 'Powerful blender for smoothies and food preparation.', '89.99', 'Kitchen Appliances', 60, '2023-12-27 11:48:51', '2023-12-27 11:48:51'),
(16, 'te33st', 'Powerful blender for smoothies and food preparation.', '1.30', 'Kitchen Appliances', 60, '2023-12-27 12:11:29', '2023-12-27 12:11:29'),
(17, 'sanjana test', 'Powerful blender for smoothies and food preparation.', '12.00', 'Kitchen Appliances', 0, '2023-12-27 12:14:44', '2023-12-27 12:14:44'),
(18, 'sanjana test', 'Powerful blender for smoothies and food preparation.', '12.00', 'Kitchen Appliances', 0, '2023-12-30 12:54:26', '2023-12-30 12:54:26'),
(19, 'sanjana test', 'Powerful blender for smoothies and food preparation.', '12.00', 'Kitchen Appliances', 0, '2023-12-30 12:54:46', '2023-12-30 12:54:46'),
(20, 'Powerful Blender', 'High-performance blender for smoothies and food preparation.', '89.99', 'Kitchen Appliances', 50, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(21, 'Coffee Maker', 'Automatic coffee maker for brewing your favorite coffee at home.', '49.99', 'Appliances', 30, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(22, 'Bluetooth Speaker', 'Portable speaker with wireless connectivity for music on the go.', '59.99', 'Electronics', 20, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(23, 'Smartphone', 'High-end smartphone with a powerful camera and advanced features.', '799.99', 'Electronics', 15, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(24, 'Laptop', 'Thin and lightweight laptop with a fast processor and long battery life.', '1299.99', 'Electronics', 10, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(25, 'Fitness Tracker', 'Wearable fitness tracker to monitor your daily activities and health.', '79.99', 'Wearables', 25, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(26, 'Gaming Mouse', 'High-precision gaming mouse with customizable buttons and RGB lighting.', '49.99', 'Gaming Accessories', 40, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(27, 'Durable Backpack', 'Spacious backpack with multiple compartments for daily use or travel.', '39.99', 'Fashion', 30, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(28, 'Digital Camera', 'Mirrorless digital camera with 4K video recording and interchangeable lenses.', '899.99', 'Photography', 12, '2023-12-30 13:10:06', '2023-12-30 13:10:06'),
(29, 'Wireless Earbuds', 'True wireless earbuds with noise cancellation and long battery life.', '129.99', 'Audio', 18, '2023-12-30 13:10:06', '2023-12-30 13:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
