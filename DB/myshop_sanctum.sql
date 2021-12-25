-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2021 at 12:03 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myshop_sanctum`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_uid`, `category_name`, `category_slug`, `category_content`) VALUES
(1, 'CID00001', 'Laptop', 'laptop', NULL),
(2, 'CID00002', 'Smartphone', 'smartphone', NULL),
(3, 'CID00003', 'Smartwatch', 'smartwatch', NULL),
(4, 'CID00004', 'Television', 'television', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_26_010008_laratrust_setup_tables', 2),
(6, '2021_11_02_080933_product_table', 3),
(7, '2021_11_02_080941_product_table', 4),
(8, '2021_11_23_110836_order_table', 5),
(9, '2019_05_03_000001_create_customer_columns', 6),
(10, '2019_05_03_000002_create_subscriptions_table', 6),
(11, '2019_05_03_000003_create_subscription_items_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_transaction_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tracking_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_courier` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` enum('Processed','Delivered','Recieved','Rejected','Refund') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Processed',
  `order_sub_total` double(10,2) NOT NULL DEFAULT 0.00,
  `order_item_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `order_tax` double(10,2) NOT NULL DEFAULT 0.00,
  `order_shipping` double(10,2) NOT NULL DEFAULT 0.00,
  `order_total` double(10,2) NOT NULL DEFAULT 0.00,
  `order_promo` double(10,2) NOT NULL DEFAULT 0.00,
  `order_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `order_grand_total` double(10,2) NOT NULL DEFAULT 0.00,
  `order_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_zip_postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `order_uid`, `order_transaction_id`, `order_tracking_no`, `order_courier`, `order_token`, `order_status`, `order_sub_total`, `order_item_discount`, `order_tax`, `order_shipping`, `order_total`, `order_promo`, `order_discount`, `order_grand_total`, `order_first_name`, `order_last_name`, `order_phone`, `order_email`, `order_country`, `order_province`, `order_city`, `order_address`, `order_zip_postal`, `created_at`, `updated_at`) VALUES
(1, 45, NULL, 'OID00001', 'ch_3K2sxYBtRQ1cyR7J1PCHJfxE', 'DH22311123131232121', 'DHL', NULL, 'Delivered', 0.00, 0.00, 0.00, 0.00, 3400.00, 0.00, 0.00, 3400.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-04 00:47:05', '2021-12-11 19:15:20'),
(2, 56, NULL, 'OID00002', 'ch_3K2thLBtRQ1cyR7J2Rn1KvIK', NULL, NULL, NULL, 'Processed', 0.00, 0.00, 0.00, 0.00, 425.00, 0.00, 0.00, 425.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-04 01:34:25', '2021-12-10 20:46:30'),
(3, 57, NULL, 'OID00003', 'ch_3K5Md7BtRQ1cyR7J1xavvt2u', NULL, NULL, NULL, 'Processed', 0.00, 0.00, 0.00, 0.00, 1550.00, 0.00, 0.00, 1550.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-10 20:52:18', '2021-12-11 05:02:36'),
(4, 58, NULL, 'OID00004', 'ch_3K5MkNBtRQ1cyR7J2grzQSG5', NULL, NULL, NULL, 'Processed', 0.00, 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, 1200.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-10 20:59:45', '2021-12-11 05:03:17'),
(5, 45, NULL, 'OID00005', 'ch_3K5Mq3BtRQ1cyR7J3nLYJZD6', NULL, NULL, NULL, 'Processed', 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-10 21:05:37', '2021-12-10 21:05:37'),
(6, 45, NULL, 'OID00006', 'ch_3K5i8zBtRQ1cyR7J33GM8IjI', NULL, NULL, NULL, 'Processed', 0.00, 0.00, 0.00, 0.00, 610.00, 0.00, 0.00, 610.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 19:50:41', '2021-12-11 19:50:41'),
(7, 45, NULL, 'OID00007', 'ch_3K7boUBtRQ1cyR7J3thVKmEb', NULL, NULL, NULL, 'Processed', 0.00, 0.00, 0.00, 0.00, 950.00, 0.00, 0.00, 950.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-17 01:29:21', '2021-12-17 01:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders_product`
--

CREATE TABLE `orders_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orders_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `orders_detail_uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orders_detail_price` double(10,2) NOT NULL DEFAULT 0.00,
  `orders_detail_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `orders_detail_quantity` int(11) NOT NULL DEFAULT 1,
  `orders_detail_total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_product`
--

INSERT INTO `orders_product` (`id`, `orders_id`, `product_id`, `orders_detail_uid`, `orders_detail_price`, `orders_detail_discount`, `orders_detail_quantity`, `orders_detail_total_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 21, NULL, 750.00, 0.00, 2, '1500.00', NULL, NULL),
(2, 1, 14, NULL, 425.00, 0.00, 2, '850.00', NULL, NULL),
(3, 1, 20, NULL, 50.00, 0.00, 1, '50.00', NULL, NULL),
(4, 1, 11, NULL, 500.00, 0.00, 2, '1000.00', NULL, NULL),
(5, 2, 14, NULL, 425.00, 0.00, 1, '425.00', NULL, NULL),
(6, 3, 22, NULL, 950.00, 0.00, 1, '950.00', NULL, NULL),
(7, 3, 12, NULL, 300.00, 0.00, 2, '600.00', NULL, NULL),
(8, 4, 19, NULL, 1200.00, 0.00, 1, '1200.00', NULL, NULL),
(9, 5, 11, NULL, 500.00, 0.00, 1, '500.00', NULL, NULL),
(10, 6, 18, NULL, 55.00, 0.00, 2, '110.00', NULL, NULL),
(11, 6, 11, NULL, 500.00, 0.00, 1, '500.00', NULL, NULL),
(12, 7, 22, NULL, 950.00, 0.00, 1, '950.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-create', 'Create Users', 'Create Users', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(2, 'users-read', 'Read Users', 'Read Users', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(3, 'users-update', 'Update Users', 'Update Users', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(4, 'users-delete', 'Delete Users', 'Delete Users', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(5, 'payments-create', 'Create Payments', 'Create Payments', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(6, 'payments-read', 'Read Payments', 'Read Payments', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(7, 'payments-update', 'Update Payments', 'Update Payments', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(8, 'payments-delete', 'Delete Payments', 'Delete Payments', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(9, 'profile-read', 'Read Profile', 'Read Profile', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(10, 'profile-update', 'Update Profile', 'Update Profile', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(11, 'module_1_name-create', 'Create Module_1_name', 'Create Module_1_name', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(12, 'module_1_name-read', 'Read Module_1_name', 'Read Module_1_name', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(13, 'module_1_name-update', 'Update Module_1_name', 'Update Module_1_name', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(14, 'module_1_name-delete', 'Delete Module_1_name', 'Delete Module_1_name', '2021-10-25 18:11:07', '2021-10-25 18:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3),
(11, 4),
(12, 4),
(13, 4),
(14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myapptoken', '6496bb0abe09484e3a399a7d8830b1c43d72f783dea402f19787e1d3baf22584', '[\"*\"]', NULL, '2021-10-25 16:47:53', '2021-10-25 16:47:53'),
(2, 'App\\Models\\User', 1, 'myapptoken', '51dae8b9ca85b5e8615beff0268e26e22c751e3bf70871928c10054e0a555fd0', '[\"*\"]', '2021-10-25 17:47:23', '2021-10-25 17:31:11', '2021-10-25 17:47:23'),
(3, 'App\\Models\\User', 10, 'myapptoken', '33ed17e521700bdabeab28e1842e49f2bfc372684a5dd0fa849249a94ace865f', '[\"*\"]', NULL, '2021-10-25 18:40:46', '2021-10-25 18:40:46'),
(4, 'App\\Models\\User', 10, 'myapptoken', '05bd53a892c67230a4d955d26fd16620ecb9b04eebe377253728a173eac34159', '[\"*\"]', NULL, '2021-10-25 19:12:58', '2021-10-25 19:12:58'),
(5, 'App\\Models\\User', 10, 'myapptoken', '5524a3af0ca9ceec47a6f468899f49d3d62ea8eda39b1e4ff048617de0e68cef', '[\"*\"]', NULL, '2021-10-25 19:14:05', '2021-10-25 19:14:05'),
(6, 'App\\Models\\User', 10, 'myapptoken', '29777447a7e7b4f9901bc9e1ffc1e0f77564215596cd3df5accfe08bb3b6f759', '[\"*\"]', '2021-10-25 19:19:26', '2021-10-25 19:14:56', '2021-10-25 19:19:26'),
(7, 'App\\Models\\User', 10, 'myapptoken', '0cc60d85f6ccee9b7b9905e8fc0b3540d6359bb38bc7924e450a62dc0f04e8c4', '[\"*\"]', '2021-10-26 05:16:03', '2021-10-25 19:19:42', '2021-10-26 05:16:03'),
(8, 'App\\Models\\User', 10, 'myapptoken', '12b01dba76d0a0c36d52f4ed411cd534671636b8109df34207d5e5e06061f3df', '[\"*\"]', NULL, '2021-10-25 22:06:29', '2021-10-25 22:06:29'),
(9, 'App\\Models\\User', 10, 'myapptoken', '88c3d1474aa76dcaa9bab571e7ae7ae8f51fbe629121157e168e7a29fb6ed3aa', '[\"*\"]', NULL, '2021-10-25 22:56:10', '2021-10-25 22:56:10'),
(10, 'App\\Models\\User', 13, 'myapptoken', 'c119b176439fb0164e243458cac293eefc84b56752cf1970dc6d9e729fb83c0e', '[\"*\"]', NULL, '2021-10-28 02:11:27', '2021-10-28 02:11:27'),
(11, 'App\\Models\\User', 13, 'myapptoken', '6cb29f280d07257ddb2fead198271c862a404caa248dc9b683bb88ec2bb5c188', '[\"*\"]', NULL, '2021-10-28 02:16:52', '2021-10-28 02:16:52'),
(12, 'App\\Models\\User', 13, 'myapptoken', '938f25f0e4b5d7c78523212f6e4a58a75f0e2228ec8a614d8f00dffde8975ae2', '[\"*\"]', NULL, '2021-10-28 02:18:53', '2021-10-28 02:18:53'),
(13, 'App\\Models\\User', 13, 'myapptoken', '38732ff2593a4b57a15f4e0fb049db6c46face017524aebae411a36ea75f7e3f', '[\"*\"]', NULL, '2021-10-28 03:32:10', '2021-10-28 03:32:10'),
(14, 'App\\Models\\User', 13, 'myapptoken', '49fa2c1164ff4a06ba43207192a725893f0748a4838f3e8d830d069f4545cff6', '[\"*\"]', NULL, '2021-10-28 03:34:21', '2021-10-28 03:34:21'),
(15, 'App\\Models\\User', 13, 'myapptoken', '8821d5febb6d50c5cf1405e0b99a49262084d0b0f85b74413521b0dd304ffcaf', '[\"*\"]', NULL, '2021-10-28 04:17:09', '2021-10-28 04:17:09'),
(16, 'App\\Models\\User', 13, 'myapptoken', '6f5244e8bd567f9cbcebb1dfbb3776b2add46af0e25b24242e5302719438268b', '[\"*\"]', NULL, '2021-10-28 04:18:52', '2021-10-28 04:18:52'),
(17, 'App\\Models\\User', 13, 'myapptoken', '3adcfcb35ee769f8b8fe64f8cd693b9ab63ddf0b9360278c7aa15c3c3d813fe5', '[\"*\"]', NULL, '2021-10-28 04:34:10', '2021-10-28 04:34:10'),
(18, 'App\\Models\\User', 13, 'myapptoken', 'fdadbf4c56af86729387eaafe41ea06d86601699e2517fb87917e49081fb054c', '[\"*\"]', NULL, '2021-10-28 04:34:23', '2021-10-28 04:34:23'),
(19, 'App\\Models\\User', 13, 'myapptoken', '91481183933f060cd3701a51555ee563e96c8b9e7ddb5a005a1d9b341d8de6b0', '[\"*\"]', NULL, '2021-10-28 04:35:35', '2021-10-28 04:35:35'),
(20, 'App\\Models\\User', 13, 'myapptoken', '853feb08b634139ae3c5d2cd9aab7f20292f5d81200f1270a3a88612939c1c41', '[\"*\"]', NULL, '2021-10-28 04:36:29', '2021-10-28 04:36:29'),
(21, 'App\\Models\\User', 13, 'myapptoken', 'd8863611c8305eb605c0be2dae23f1911370754465131b1c1a0b47a16997a57c', '[\"*\"]', NULL, '2021-10-28 04:49:14', '2021-10-28 04:49:14'),
(22, 'App\\Models\\User', 13, 'myapptoken', 'c15ef3f515b28cf235370038a6c4c1e2e395a267100cc342fa2a743ca6734a49', '[\"*\"]', NULL, '2021-10-28 05:22:00', '2021-10-28 05:22:00'),
(23, 'App\\Models\\User', 13, 'myapptoken', '56270398740fe69e3a5bbdceb5244016274abed4185bb40f39e206dcd107a7c2', '[\"*\"]', NULL, '2021-10-28 05:28:57', '2021-10-28 05:28:57'),
(24, 'App\\Models\\User', 13, 'myapptoken', '61f22b51dc63135e9e9770217ab948a18ad4c7fb7d1fd951fd1805c3b960656a', '[\"*\"]', NULL, '2021-10-28 05:30:45', '2021-10-28 05:30:45'),
(25, 'App\\Models\\User', 13, 'myapptoken', 'ec9c3be09d5a22f6ab344da5509fd3a57daed4691f8ed890855271418c99c053', '[\"*\"]', NULL, '2021-10-28 05:38:46', '2021-10-28 05:38:46'),
(26, 'App\\Models\\User', 13, 'myapptoken', '1c754e7f4be50eac50aca1f1b3ac935f993477010a50cfc5d3f1a846cbc90351', '[\"*\"]', NULL, '2021-10-28 05:45:46', '2021-10-28 05:45:46'),
(27, 'App\\Models\\User', 13, 'myapptoken', 'aa4bcaa4dd79ad89ec16f501abdb8f51b6b5c3a646d10231df78c8c1812e14de', '[\"*\"]', NULL, '2021-10-28 05:49:48', '2021-10-28 05:49:48'),
(28, 'App\\Models\\User', 13, 'myapptoken', '7e16db3f759d920bdfaec61dac028fcee054ee34f3ef122966f82276828e2e86', '[\"*\"]', NULL, '2021-10-28 06:17:12', '2021-10-28 06:17:12'),
(29, 'App\\Models\\User', 13, 'myapptoken', '73296e52ee329be1d30ccc522060dc8f5d827f49fd0a6c83b0f4fa55fadec435', '[\"*\"]', NULL, '2021-10-28 06:17:41', '2021-10-28 06:17:41'),
(30, 'App\\Models\\User', 13, 'myapptoken', 'a4f69c52627c2e4dac34ae9b8b7f946c2319c4ca7de53cdce84c49df1f6a66a4', '[\"*\"]', NULL, '2021-10-28 06:44:48', '2021-10-28 06:44:48'),
(31, 'App\\Models\\User', 13, 'myapptoken', '2d707b4684b3d7db21dff5c4b4fad5826f87d4c2054c9f97ba81a985b67b413e', '[\"*\"]', NULL, '2021-10-28 06:46:46', '2021-10-28 06:46:46'),
(32, 'App\\Models\\User', 13, 'myapptoken', '8c74cd1110698693d33da60caf7df3e08270a1f0ef031a21c9aa27e7fcceb2ce', '[\"*\"]', NULL, '2021-10-28 06:58:12', '2021-10-28 06:58:12'),
(33, 'App\\Models\\User', 13, 'myapptoken', '1b32d27cb068276a2c9227f74a5379267b4a5c41196cd4f2c776df98b9eeea94', '[\"*\"]', NULL, '2021-10-28 17:58:58', '2021-10-28 17:58:58'),
(34, 'App\\Models\\User', 13, 'myapptoken', 'ca1c1190f38214452f5dcb0db5410429ff5758d1260d280cd0b1ce211ad0d7cb', '[\"*\"]', NULL, '2021-10-28 18:06:48', '2021-10-28 18:06:48'),
(35, 'App\\Models\\User', 13, 'myapptoken', 'b9ae25a3c4be237d4d188d3296d3ddef37840c204e275ee4c1618ee7a73088f0', '[\"*\"]', NULL, '2021-10-28 18:07:04', '2021-10-28 18:07:04'),
(36, 'App\\Models\\User', 13, 'myapptoken', '5bd4cc97525b55931bbd29197cf5090d15c2a81aaa049456bfda05a5b3e3ff7a', '[\"*\"]', NULL, '2021-10-28 18:17:36', '2021-10-28 18:17:36'),
(37, 'App\\Models\\User', 13, 'myapptoken', 'd62eae4546bbc1531eb4593a55b0a12581daea6e3e5f8a29e5da2e6d57d63fa5', '[\"*\"]', NULL, '2021-10-28 18:30:39', '2021-10-28 18:30:39'),
(38, 'App\\Models\\User', 13, 'myapptoken', '993f57cad76841e096b0ae24761889b313c27b1d574aaa7d78a911187ff7b04e', '[\"*\"]', NULL, '2021-10-28 18:32:36', '2021-10-28 18:32:36'),
(39, 'App\\Models\\User', 13, 'myapptoken', 'aacf47c297ba0634d3e0dd8b2f48e0ff7ae4ce2d0fea86e88f1a1571eb591f31', '[\"*\"]', NULL, '2021-10-28 18:33:45', '2021-10-28 18:33:45'),
(40, 'App\\Models\\User', 13, 'myapptoken', '87e7e4325dd8065b77e9877e4a9bcc359807946f83db7e362215fb16fc9446e2', '[\"*\"]', NULL, '2021-10-28 18:37:40', '2021-10-28 18:37:40'),
(41, 'App\\Models\\User', 25, 'myapptoken', '8bae697cc1b3701db8a54fc928a96e5a0dee775b596b384c8ab6631109bfff8a', '[\"*\"]', NULL, '2021-10-28 18:40:27', '2021-10-28 18:40:27'),
(42, 'App\\Models\\User', 13, 'myapptoken', '73561ef09186129dfe2d1355970ac593a7e5778df5ad2b7fad122a52a28a772a', '[\"*\"]', '2021-10-29 06:47:03', '2021-10-28 18:41:04', '2021-10-29 06:47:03'),
(43, 'App\\Models\\User', 13, 'myapptoken', '666750472bd55f50d4a77b26ceda84c5b48623063e0e124be9d21be37c52fd5c', '[\"*\"]', '2021-10-30 06:28:14', '2021-10-29 14:30:18', '2021-10-30 06:28:14'),
(44, 'App\\Models\\User', 13, 'myapptoken', '727b6bb247c09f4b3f271610da1a4f3de7a3046d76bb4442a3273695ce6d038a', '[\"*\"]', '2021-10-30 06:52:54', '2021-10-30 06:52:39', '2021-10-30 06:52:54'),
(45, 'App\\Models\\User', 28, 'myapptoken', '17ae7959d56bc7fd14508b1a5939eb571177c4948300b77277af31354355fc2a', '[\"*\"]', '2021-10-30 06:54:26', '2021-10-30 06:54:13', '2021-10-30 06:54:26'),
(46, 'App\\Models\\User', 31, 'myapptoken', '7647c47ab085a7e43a1935f203e520179479738fd283545a8165dda384ac483b', '[\"*\"]', '2021-10-30 06:55:12', '2021-10-30 06:55:03', '2021-10-30 06:55:12'),
(47, 'App\\Models\\User', 31, 'myapptoken', '2a80cba4f651d879aa704f2c0e517319e7dd6a1c5c0ec7d885bcbda1bec73bcc', '[\"*\"]', NULL, '2021-10-30 21:08:05', '2021-10-30 21:08:05'),
(48, 'App\\Models\\User', 31, 'myapptoken', '6f8e3e32f0e737d85e0b93319a7b289478a3f5e57b414ace19039ad8f5f745b7', '[\"*\"]', NULL, '2021-10-30 21:08:55', '2021-10-30 21:08:55'),
(49, 'App\\Models\\User', 13, 'myapptoken', '6624ecd9251092d79ce4b337d033faf94120c49ea380b1f22ba2aea6a9972057', '[\"*\"]', NULL, '2021-10-30 21:18:02', '2021-10-30 21:18:02'),
(50, 'App\\Models\\User', 23, 'myapptoken', '658cc22c9075b11a2ca7cfa5450b85fcb42c3eb1329b4c5106ff0329fb63fca5', '[\"*\"]', NULL, '2021-10-31 02:26:51', '2021-10-31 02:26:51'),
(51, 'App\\Models\\User', 31, 'myapptoken', '7993e040ae8b21d81914977da3b5af59b49a2cd4206c6afe5cd883afd45b60c4', '[\"*\"]', '2021-10-31 03:18:26', '2021-10-31 03:16:42', '2021-10-31 03:18:26'),
(52, 'App\\Models\\User', 31, 'myapptoken', '5ee4b38387f06ee05d29c8dcfc3c54a29add29f94648233f3341592b3bcd0bb4', '[\"*\"]', NULL, '2021-10-31 03:21:55', '2021-10-31 03:21:55'),
(53, 'App\\Models\\User', 23, 'myapptoken', 'f5354318e46c30cedbed89f88d1e6e731988707559be11b2412b1b3f87bd9d9b', '[\"*\"]', '2021-10-31 14:28:46', '2021-10-31 14:28:20', '2021-10-31 14:28:46'),
(54, 'App\\Models\\User', 31, 'myapptoken', 'b523ef6f34e1576c27465aec324fc895d9b6bf4210fe8947cd57af6c65e1ef26', '[\"*\"]', NULL, '2021-10-31 14:32:54', '2021-10-31 14:32:54'),
(55, 'App\\Models\\User', 31, 'myapptoken', '59e1693b204140a9cd094922226965f7069971ae86ddb059f87541eacde4405a', '[\"*\"]', NULL, '2021-10-31 14:43:04', '2021-10-31 14:43:04'),
(56, 'App\\Models\\User', 28, 'myapptoken', '079fccff593e3fbfe8847693100583b7c284c1d6f0f51759315d75ed9faec686', '[\"*\"]', '2021-10-31 14:56:02', '2021-10-31 14:55:45', '2021-10-31 14:56:02'),
(57, 'App\\Models\\User', 26, 'myapptoken', '3e7a8b84f2819b8af0856ef8eb20d3ca4f55ffe4e82d894460578852446c16af', '[\"*\"]', '2021-11-01 18:58:16', '2021-10-31 14:56:26', '2021-11-01 18:58:16'),
(58, 'App\\Models\\User', 38, 'myapptoken', '2adb7873e2730e77f2b0b6529ad0197610c0b5b3ca3ec84dadbff40285d536ea', '[\"*\"]', '2021-11-01 19:07:37', '2021-11-01 18:58:37', '2021-11-01 19:07:37'),
(59, 'App\\Models\\User', 13, 'myapptoken', 'a6e53f2583a29e34b20aab9804caf38ef7d23c32e86d89896fa79541b795a41f', '[\"*\"]', '2021-11-01 19:11:30', '2021-11-01 19:11:20', '2021-11-01 19:11:30'),
(60, 'App\\Models\\User', 13, 'myapptoken', '1157331560e376064cd4e3bc844a035f8c9d33002b310a56c7adb323de79e7d2', '[\"*\"]', '2021-11-01 19:18:33', '2021-11-01 19:16:25', '2021-11-01 19:18:33'),
(61, 'App\\Models\\User', 38, 'myapptoken', '7477fe8c4a01f8bb705f481291e127874f2507b1865b0df1808f26bc3a248c10', '[\"*\"]', '2021-11-01 23:51:25', '2021-11-01 19:18:50', '2021-11-01 23:51:25'),
(62, 'App\\Models\\User', 13, 'myapptoken', '5900ab50442907dd3c84089fa53d5a3584270e23240a30b124cca45a6a696fce', '[\"*\"]', '2021-11-02 05:56:13', '2021-11-01 23:52:48', '2021-11-02 05:56:13'),
(63, 'App\\Models\\User', 13, 'myapptoken', '6f5983dfd3323da25a35480efbe2e9e19b8021eb571c15a5ef8262fcdd5c1f25', '[\"*\"]', '2021-11-02 06:24:39', '2021-11-02 06:01:47', '2021-11-02 06:24:39'),
(64, 'App\\Models\\User', 13, 'myapptoken', '81f6797a898151536074f97bddafb4b76a371d82411e38cdcaaaad9aa4c0515f', '[\"*\"]', '2021-11-03 06:09:55', '2021-11-02 18:25:48', '2021-11-03 06:09:55'),
(65, 'App\\Models\\User', 13, 'myapptoken', '7fe4c00a2840fd84cae97128b7db1ee086a541c9055bedd7f8f7463402c5e2c7', '[\"*\"]', '2021-11-07 23:41:56', '2021-11-05 01:12:47', '2021-11-07 23:41:56'),
(66, 'App\\Models\\User', 13, 'myapptoken', '024ca0f9aa956d1871ed6270be2943859d5ab28c81f0f9c7f58c9a8cfe9700cf', '[\"*\"]', '2021-11-08 19:58:04', '2021-11-08 19:57:43', '2021-11-08 19:58:04'),
(67, 'App\\Models\\User', 26, 'myapptoken', '7d45d617ae86560c40e657a9256cd4f6c56a6897f0fb0733982f25b5b1c2973d', '[\"*\"]', '2021-11-09 06:33:09', '2021-11-08 19:58:29', '2021-11-09 06:33:09'),
(68, 'App\\Models\\User', 13, 'myapptoken', '679f0209405b021b75b0a384bad4f86ba0adb1f3c04299d770d21203a49219cf', '[\"*\"]', '2021-11-13 22:29:38', '2021-11-13 22:27:34', '2021-11-13 22:29:38'),
(69, 'App\\Models\\User', 13, 'myapptoken', 'a13ff3e9cccc4245bab7e5ded5932e8ce752c907b1fd06e995f9decfd4fb6eb5', '[\"*\"]', '2021-11-14 01:37:57', '2021-11-14 01:37:08', '2021-11-14 01:37:57'),
(70, 'App\\Models\\User', 13, 'myapptoken', '8a113c4569200002548f716cfa0fdb3e3c102f9e8000d2399c0dd222d96ddf48', '[\"*\"]', '2021-11-14 01:54:52', '2021-11-14 01:47:37', '2021-11-14 01:54:52'),
(71, 'App\\Models\\User', 13, 'myapptoken', 'f72df7c33639650bb7d24f774c780c052e8d78ba09f7a10718abd22fad37d3f8', '[\"*\"]', '2021-11-15 02:04:04', '2021-11-15 01:59:45', '2021-11-15 02:04:04'),
(72, 'App\\Models\\User', 13, 'myapptoken', '07e0f5496d8d76149b9cc9ee013c99dd2d57c81991c336c7cc2c6816102c6e85', '[\"*\"]', '2021-11-15 18:47:24', '2021-11-15 18:46:24', '2021-11-15 18:47:24'),
(73, 'App\\Models\\User', 13, 'myapptoken', '3282fc4bea936f2c0bb51eac544717e4a6ec7cfa6c6ae28d7bdb7bce578ae2a5', '[\"*\"]', '2021-11-19 07:09:14', '2021-11-19 06:11:07', '2021-11-19 07:09:14'),
(74, 'App\\Models\\User', 13, 'myapptoken', '01b57bfb43c80dd3b024e3796f7312ead78d11bd296966d4d5c2a2cb0821dfe4', '[\"*\"]', '2021-11-25 23:39:31', '2021-11-25 23:36:51', '2021-11-25 23:39:31'),
(75, 'App\\Models\\User', 13, 'myapptoken', 'e6b48d4e42541e02e904a17aebcb61badad4817f91861a2454e4ededdc5e52cc', '[\"*\"]', '2021-11-26 00:10:27', '2021-11-25 23:40:24', '2021-11-26 00:10:27'),
(76, 'App\\Models\\User', 10, 'myapptoken', 'a9077b447a83ddca252f6c26c1c43a3df3116979cd64b068c334083b8b432c42', '[\"*\"]', '2021-11-26 00:23:41', '2021-11-26 00:11:06', '2021-11-26 00:23:41'),
(77, 'App\\Models\\User', 13, 'myapptoken', '8b4e05dc329ca1671aa515042968f76a8c33ebd4ca65828201c745d3ee2f34fc', '[\"*\"]', '2021-11-26 00:32:19', '2021-11-26 00:26:40', '2021-11-26 00:32:19'),
(78, 'App\\Models\\User', 15, 'myapptoken', '4652b5d59092e4c802f7e980e49b3b5fd3858ce76a6e5b0cb64eebf67af117da', '[\"*\"]', '2021-11-26 01:32:54', '2021-11-26 00:33:13', '2021-11-26 01:32:54'),
(79, 'App\\Models\\User', 10, 'myapptoken', 'c6f6f619816933cf0231f012f33b665e4549596c1a2bbaadebf5b27410251e02', '[\"*\"]', '2021-11-26 01:41:57', '2021-11-26 01:39:15', '2021-11-26 01:41:57'),
(80, 'App\\Models\\User', 10, 'myapptoken', '1d653587ea7eb2fb9486e983fb6df95ab82791dc3a45c9cbe557f16056aa6310', '[\"*\"]', '2021-12-01 05:52:55', '2021-11-26 01:45:44', '2021-12-01 05:52:55'),
(81, 'App\\Models\\User', 13, 'myapptoken', 'e7848466891a62755f0bec72f56b8fcd01918541f1560cc6211a66593586375d', '[\"*\"]', '2021-12-03 17:32:06', '2021-12-03 17:31:10', '2021-12-03 17:32:06'),
(82, 'App\\Models\\User', 10, 'myapptoken', '23711ca9822f5a4bdfdd2e57de5f8edddb78b1f4573a428c36e7f28972c3ca2b', '[\"*\"]', '2021-12-04 00:40:58', '2021-12-03 17:32:38', '2021-12-04 00:40:58'),
(83, 'App\\Models\\User', 10, 'myapptoken', '8e1cf338aefb96fca5d27cb9df2f8055a7f68bee334ef49ec75bb7328e01471a', '[\"*\"]', '2021-12-04 20:18:31', '2021-12-04 20:17:18', '2021-12-04 20:18:31'),
(84, 'App\\Models\\User', 10, 'myapptoken', 'db13204bbd289a6f6c40176f932e9bf0bcfce302ce4198f903183aa41f495099', '[\"*\"]', '2021-12-10 20:50:01', '2021-12-04 20:19:02', '2021-12-10 20:50:01'),
(85, 'App\\Models\\User', 10, 'myapptoken', '2af9ae725fac1c6c94ce9e15bfda43f5cc57c5a1699429ae9ede201b7a4384f9', '[\"*\"]', '2021-12-12 03:27:09', '2021-12-10 20:53:13', '2021-12-12 03:27:09'),
(86, 'App\\Models\\User', 10, 'myapptoken', 'fe855ba210b7f4e4dc3d56a663c24b7bc05706d56b4b033377cd18d8a386a1df', '[\"*\"]', '2021-12-17 01:33:19', '2021-12-17 01:31:48', '2021-12-17 01:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `product_image_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_vendor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` double(10,2) NOT NULL DEFAULT 0.00,
  `product_weight` double(4,2) NOT NULL DEFAULT 0.00,
  `product_discount` double(4,2) DEFAULT 0.00,
  `product_quantity` int(11) NOT NULL DEFAULT 0,
  `product_barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `product_status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_uid`, `product_name`, `product_slug`, `product_content`, `product_image`, `product_image_url`, `product_vendor`, `product_type`, `product_price`, `product_weight`, `product_discount`, `product_quantity`, `product_barcode`, `product_status`, `created_at`, `updated_at`) VALUES
(2, 2, 'UID00002', 'Redmi 9C', 'redmi-9c', '<p>Lorem ipsum sit amet</p><ul><li>List 1</li><li>List 2</li><li>List 3</li><li>List 4</li><li class=\"ql-direction-rtl ql-align-right\"><br></li></ul>', 'Redmi 9C-1636867775.jpg', 'http://127.0.0.1:8000/assets/image/product/Redmi 9C-1636867775.jpg', 'Redmi', NULL, 180.00, 0.20, NULL, 96, '89877555444401', 'Active', '2021-11-07 01:54:06', '2021-12-11 19:50:41'),
(3, 1, 'UID00003', 'Lenovo Thinkpad 2233', 'lenovo-thinkpad-2233', '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></p>', 'Lenovo Thinkpad 2233-1636275824.jpg', 'http://127.0.0.1:8000/assets/image/product/Lenovo Thinkpad 2233-1636275824.jpg', 'Lenovo', NULL, 520.00, 1.80, NULL, 0, '554887779', 'Active', '2021-11-07 02:03:44', '2021-11-13 22:28:23'),
(4, 1, 'UID00004', 'Asus MX-xxxxxxx - Black', 'asus-mx-xxxxxxx-black', '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></p><ul><li>Intel core i3 gen 11</li><li>8Gb DDR 4 Ram</li><li>500 Gb SSD Nvme</li><li>15\" LED ips monitor</li><li>Warranty 1 years</li></ul>', 'Asus MX-xxxxxxx-1636462058.jpg', 'http://127.0.0.1:8000/assets/image/product/Asus MX-xxxxxxx-1636462058.jpg', 'Asus', NULL, 700.00, 1.70, NULL, 15, '66987774445578', 'Active', '2021-11-07 02:09:34', '2021-11-19 06:38:40'),
(6, 2, 'UID00006', 'Iphone 9 - Grey', 'iphone-9-grey', '<p>asdfsadfsadf</p>', 'LJHFjdsjafas-1636428829.jpg', 'http://127.0.0.1:8000/assets/image/product/LJHFjdsjafas-1636428829.jpg', 'Iphone', NULL, 500.00, 0.20, NULL, 20, '88797944484', 'Inactive', '2021-11-08 20:33:49', '2021-12-03 17:34:06'),
(9, 1, 'UID00009', 'Dell Xsss-000011 - Black', 'dell-xsss-000011-black', '<p class=\"ql-align-justify\">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'Dell Xsss-000011-1636457326.jpg', 'http://127.0.0.1:8000/assets/image/product/Dell Xsss-000011-1636457326.jpg', 'Dell', NULL, 650.00, 1.80, 10.00, 30, '55544477979', 'Active', '2021-11-08 23:55:28', '2021-11-19 06:38:18'),
(11, 2, 'UID00010', 'Oppo A12', 'oppo-a12', 'null', 'Oppo A12-1636464093.jpg', 'http://127.0.0.1:8000/assets/image/product/Oppo A12-1636464093.jpg', 'Oppo', NULL, 500.00, 0.20, 10.00, 70, '578232213312', 'Active', '2021-11-09 06:21:33', '2021-12-11 19:50:41'),
(12, 2, 'UID00012', 'Samsung Ss1xxxxx - Green', 'samsung-ss1xxxxx-green', '<h2>Where does it come from?</h2><p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cic</p>', 'Samsung Ss1xxxxx-1637327620.jpg', 'http://127.0.0.1:8000/assets/image/product/Samsung Ss1xxxxx-1637327620.jpg', 'Samsung', NULL, 300.00, 0.20, NULL, 48, '5646546546', 'Active', '2021-11-19 06:13:40', '2021-12-10 20:52:19'),
(13, 2, 'UID00013', 'Iphone 11 - White', 'iphone-11-white', '<p><span style=\"color: rgb(0, 0, 0);\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p><ul><li><span style=\"color: rgb(0, 0, 0);\">Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</span></li><li><span style=\"color: rgb(0, 0, 0);\">Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</span></li><li><span style=\"color: rgb(0, 0, 0);\">Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</span></li><li><span style=\"color: rgb(0, 0, 0);\">Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</span></li></ul><p><span style=\"color: rgb(0, 0, 0);\">﻿The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', 'Iphone 11-1637327839.jpg', 'http://127.0.0.1:8000/assets/image/product/Iphone 11-1637327839.jpg', 'Iphone', NULL, 1000.00, 0.20, NULL, 30, '5574779779900100', 'Active', '2021-11-19 06:17:19', '2021-11-19 06:38:01'),
(14, 2, 'UID00014', 'Oppo A9 2020', 'oppo-a9-2020', '<p><span style=\"color: rgb(0, 0, 0);\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\"><span class=\"ql-cursor\">﻿</span>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', 'Oppo A9 2020-1637327946.jpg', 'http://127.0.0.1:8000/assets/image/product/Oppo A9 2020-1637327946.jpg', 'Oppo', NULL, 425.00, 0.20, NULL, 75, '88794555', 'Active', '2021-11-19 06:19:06', '2021-12-04 01:34:25'),
(15, 1, 'UID00015', 'Asus T3st-xxxxxxx1 - White', 'asus-t3st-xxxxxxx1-white', '<p><span style=\"color: rgb(0, 0, 0);\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', 'Asus T3st-xxxxxxx1-1637328114.png', 'http://127.0.0.1:8000/assets/image/product/Asus T3st-xxxxxxx1-1637328114.png', 'Asus', NULL, 720.00, 2.00, NULL, 20, '252416464444', 'Active', '2021-11-19 06:21:54', '2021-11-19 06:37:49'),
(16, 2, 'UID00016', 'Xiaomi AA888B - Grey', 'xiaomi-aa888b-grey', '<p><span style=\"color: rgb(0, 0, 0);\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', 'Xiaomi AA888B-1637328331.jpg', 'http://127.0.0.1:8000/assets/image/product/Xiaomi AA888B-1637328331.jpg', 'Xiaomi', NULL, 300.00, 0.20, NULL, 200, '55777979797', 'Active', '2021-11-19 06:25:31', '2021-11-19 06:37:20'),
(17, 2, 'UID00017', 'Oppo Find XX Ocean - Blue', 'oppo-find-xx-ocean-blue', '<p><span style=\"color: rgb(0, 0, 0);\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>', 'Oppo Find XX Ocean-1637328474.jpg', 'http://127.0.0.1:8000/assets/image/product/Oppo Find XX Ocean-1637328474.jpg', 'Oppo', NULL, 530.00, 0.25, NULL, 20, '55544666879', 'Active', '2021-11-19 06:27:54', '2021-11-19 06:37:32'),
(18, 3, 'UID00018', 'Advan Star GO S1 - Red', 'advan-star-go-s1-red', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris molestie bibendum elit eget tristique. In nec risus eget diam molestie pharetra vulputate eu ipsum. Morbi dui justo, maximus eu tristique non, luctus in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec euismod turpis odio, et hendrerit ipsum tempor at. Ut ac condimentum ante, commodo eleifend lacus. Fusce ac nulla accumsan, hendrerit mi et, dictum leo. Mauris eu nunc congue, dictum dui non, dapibus nisl. Fusce iaculis odio in sem dignissim, eget molestie nunc malesuada. Etiam leo sem, ullamcorper fringilla fermentum in, rhoncus nec velit. Nunc ultrices dui sed semper vehicula.</span></p>', 'Advan Star GO S1 - Red-1637329695.jpg', 'http://127.0.0.1:8000/assets/image/product/Advan Star GO S1 - Red-1637329695.jpg', 'Advan', NULL, 55.00, 0.10, NULL, 98, '5544477000001', 'Active', '2021-11-19 06:48:15', '2021-12-11 19:50:41'),
(19, 2, 'UID00019', 'Iphone 12 - Blue', 'iphone-12-blue', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris molestie bibendum elit eget tristique. In nec risus eget diam molestie pharetra vulputate eu ipsum. Morbi dui justo, maximus eu tristique non, luctus in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec euismod turpis odio, et hendrerit ipsum tempor at. Ut ac condimentum ante, commodo eleifend lacus. Fusce ac nulla accumsan, hendrerit mi et, dictum leo. Mauris eu nunc congue, dictum dui non, dapibus nisl. Fusce iaculis odio in sem dignissim, eget molestie nunc malesuada. Etiam leo sem, ullamcorper fringilla fermentum in, rhoncus nec velit. Nunc ultrices dui sed semper vehicula.</span></p>', 'Iphone 12 - Blue-1637329761.jpg', 'http://127.0.0.1:8000/assets/image/product/Iphone 12 - Blue-1637329761.jpg', 'Iphone', NULL, 1200.00, 0.20, NULL, 99, '99988777711', 'Active', '2021-11-19 06:49:21', '2021-12-10 20:59:45'),
(20, 3, 'UID00020', 'SPC SW-34 Smart Watch - Grey', 'spc-sw-34-smart-watch-grey', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris molestie bibendum elit eget tristique. In nec risus eget diam molestie pharetra vulputate eu ipsum. Morbi dui justo, maximus eu tristique non, luctus in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec euismod turpis odio, et hendrerit ipsum tempor at. Ut ac condimentum ante, commodo eleifend lacus. Fusce ac nulla accumsan, hendrerit mi et, dictum leo. Mauris eu nunc congue, dictum dui non, dapibus nisl. Fusce iaculis odio in sem dignissim, eget molestie nunc malesuada. Etiam leo sem, ullamcorper fringilla fermentum in, rhoncus nec velit. Nunc ultrices dui sed semper vehicula.</span></p>', 'SPC SW-34 Smart Watch - Grey-1637329828.jpg', 'http://127.0.0.1:8000/assets/image/product/SPC SW-34 Smart Watch - Grey-1637329828.jpg', 'SPC', NULL, 50.00, 0.10, NULL, 77, '64465465465', 'Active', '2021-11-19 06:50:28', '2021-12-04 00:47:05'),
(21, 1, 'UID00021', 'Lenovo Ideapad Slim Pro - Grey', 'lenovo-ideapad-slim-pro-grey', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris molestie bibendum elit eget tristique. In nec risus eget diam molestie pharetra vulputate eu ipsum. Morbi dui justo, maximus eu tristique non, luctus in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec euismod turpis odio, et hendrerit ipsum tempor at. Ut ac condimentum ante, commodo eleifend lacus. Fusce ac nulla accumsan, hendrerit mi et, dictum leo. Mauris eu nunc congue, dictum dui non, dapibus nisl. Fusce iaculis odio in sem dignissim, eget molestie nunc malesuada. Etiam leo sem, ullamcorper fringilla fermentum in, rhoncus nec velit. Nunc ultrices dui sed semper vehicula.</span></p>', 'Lenovo Ideapad Slim Pro - Grey-1637330848.jpg', 'http://127.0.0.1:8000/assets/image/product/Lenovo Ideapad Slim Pro - Grey-1637330848.jpg', 'Lenovo', NULL, 750.00, 1.80, NULL, 56, '55497979755', 'Active', '2021-11-19 07:07:28', '2021-12-04 00:47:05'),
(22, 1, 'UID00022', 'Dell Inspiron Intel core i7', 'dell-inspiron-intel-core-i7', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris molestie bibendum elit eget tristique. In nec risus eget diam molestie pharetra vulputate eu ipsum. Morbi dui justo, maximus eu tristique non, luctus in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec euismod turpis odio, et hendrerit ipsum tempor at. Ut ac condimentum ante, commodo eleifend lacus. Fusce ac nulla accumsan, hendrerit mi et, dictum leo. Mauris eu nunc congue, dictum dui non, dapibus nisl. Fusce iaculis odio in sem dignissim, eget molestie nunc malesuada. Etiam leo sem, ullamcorper fringilla fermentum in, rhoncus nec velit. Nunc ultrices dui sed semper vehicula.</span></p>', 'Dell Inspiron Intel core i7-1638583523.jpg', 'http://127.0.0.1:8000/assets/image/product/Dell Inspiron Intel core i7-1638583523.jpg', 'Dell', NULL, 950.00, 1.50, NULL, 98, '949293293219319239', 'Active', '2021-12-03 19:05:23', '2021-12-17 01:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proudct_variant_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variant_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Super Administrator', 'Superadministrator', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(2, 'admin', 'Administrator', 'Administrator', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(3, 'user', 'User', 'User', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(4, 'guest', 'Guest', 'Guest', '2021-10-25 18:11:06', '2021-10-25 18:11:06'),
(5, 'customer', 'Customer', 'Customer', '2021-11-24 05:18:59', '2021-11-24 05:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(3, 8, 'App\\Models\\User'),
(1, 10, 'App\\Models\\User'),
(3, 13, 'App\\Models\\User'),
(2, 15, 'App\\Models\\User'),
(1, 26, 'App\\Models\\User'),
(2, 32, 'App\\Models\\User'),
(2, 35, 'App\\Models\\User'),
(2, 39, 'App\\Models\\User'),
(2, 41, 'App\\Models\\User'),
(5, 45, 'App\\Models\\User'),
(5, 47, 'App\\Models\\User'),
(5, 49, ''),
(5, 54, 'App\\Models\\User'),
(5, 55, 'App\\Models\\User'),
(5, 56, 'App\\Models\\User'),
(5, 57, 'App\\Models\\User'),
(5, 58, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `user_image_url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `user_status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_uid`, `user_fullname`, `user_username`, `email`, `user_image`, `user_image_url`, `user_status`, `email_verified_at`, `password`, `country`, `address`, `city`, `state`, `province`, `zip_code`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(8, 'UID00008', 'Shaun Sheep', 'user7', 'user7@gmail.com', 'default.jpg', 'http://127.0.0.1:8000/assets/image/profile/default.jpg', 'Inactive', NULL, '$2y$10$qw5vGam7qqVLdU0L2TgQ/ezx/59qCrSKDiwoUMk2YbxdkqaPzujQW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-25 18:19:30', '2021-11-26 00:32:17', NULL, NULL, NULL, NULL),
(10, 'UID00009', 'Dzulfikar Sauki', 'superadmin', 'superadmin@email.com', 'Dzulfikar Sauki-1637910624.jpg', 'http://127.0.0.1:8000/assets/image/profile/Dzulfikar Sauki-1637910624.jpg', 'Active', NULL, '$2y$10$XrDDfRIPJlUIhn2afmO4peVSjadIPJCMFCOzBGxDqXSEwR8D80iI6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-25 18:36:14', '2021-11-26 00:10:24', NULL, NULL, NULL, NULL),
(13, 'UID00011', 'Spongebob Squarepants', 'user', 'user@gmail.com', 'Spongebob Squarepants-1637908731.jpg', 'http://127.0.0.1:8000/assets/image/profile/Spongebob Squarepants-1637908731.jpg', 'Active', NULL, '$2y$10$caNOkg.LiudC9cRh8qaRw.O8KpJRKdxek9TTlVnCKJDrEQZ6w7j4q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-25 23:36:35', '2021-11-25 23:38:51', NULL, NULL, NULL, NULL),
(15, 'UID00014', 'Dzulfikar Sauki Akmal', 'ukidzulfikar', 'admin@email.com', 'default.jpg', 'http://127.0.0.1:8000/assets/image/profile/default.jpg', 'Active', NULL, '$2y$10$ljlvJePWKx.RTi5cTYneJ.YOBWu3ocpMhHmf0FSaLareR7WUbztlG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-26 21:23:43', '2021-11-26 00:31:48', NULL, NULL, NULL, NULL),
(26, 'UID00026', 'Patrick Star', 'user9', 'user9@gmail.com', 'sadfsdf3112312213.jpg', 'http://127.0.0.1:8000/assets/image/profile/sadfsdf3112312213.jpg', 'Active', NULL, '$2y$10$ZVFjmTbPviSEnIah1mk0zOvKISZollkM0khJaZqTQr/ANGz.FWb4C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-30 02:51:19', '2021-11-01 20:09:16', NULL, NULL, NULL, NULL),
(32, 'UID00032', 'Squidward Tentacle', 'user14', 'user14@gmail.com', 'Fefefee23-1635598025.jpg', 'http://127.0.0.1:8000/assets/image/profile/Fefefee23-1635598025.jpg', 'Active', NULL, '$2y$10$sj6TZ4eSY01L5OccxI6eI.ijmvy//cBMaPYAqeQjmJ2UsbGqjbSvC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-30 05:47:05', '2021-11-01 20:10:03', NULL, NULL, NULL, NULL),
(35, 'UID00035', 'Larry Lobster', 'user17', 'user17@gmail.com', 'Larry Lobster-1635728604.jpg', 'http://127.0.0.1:8000/assets/image/profile/Larry Lobster-1635728604.jpg', 'Active', NULL, '$2y$10$TSxntSBasGa/x4rELvSDc.IdqWOSgAAKlSXtH12.IHwFPKxyNICGC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-31 18:03:24', '2021-10-31 18:03:24', NULL, NULL, NULL, NULL),
(39, 'UID00039', 'Eugene Krabs', 'user1', 'user1@gmail.com', 'Eugene Krabs-1635823031.jpg', 'http://127.0.0.1:8000/assets/image/profile/Eugene Krabs-1635823031.jpg', 'Active', NULL, '$2y$10$EphKuCupBpyxKJqmZo58ceXaegENvIrCy3MDjitlw9Pbg4IAeeBTa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-01 20:17:12', '2021-11-01 20:17:12', NULL, NULL, NULL, NULL),
(41, 'UID00041', 'Sandy Cheeks', 'user20', 'user20@gmail.com', 'Sandy Cheeks-1635823346.jpg', 'http://127.0.0.1:8000/assets/image/profile/Sandy Cheeks-1635823346.jpg', 'Active', NULL, '$2y$10$TMAT/phH/ANY/VY./o26puyrK/T8YuJ4ld6dRXa3/XXB/p.oiRYMK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-01 20:22:26', '2021-11-01 20:22:26', NULL, NULL, NULL, NULL),
(45, 'UID00042', 'Dzulfikar Akmal', NULL, 'uki.muscle@gmail.com', 'default.jpg', 'default.jpg', 'Active', NULL, '$2y$10$zFVIPrxNtThh2ZqcVXcDk.2HZWYQdyzULwC1uVORbgm4gj4gRA4b.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-28 19:28:09', '2021-11-28 19:28:09', NULL, NULL, NULL, NULL),
(46, 'UID00046', 'Dzulfikar Akmal', NULL, 'dzulfikar.sauki@gmail.com', 'default.jpg', 'http://127.0.0.1:8000/assets/image/profile/default.jpg', 'Active', NULL, '$2y$10$7FcGJz2JGEPQS3FHdA3o0u2w5knf3wIAb/fSMM.wnd.CiMulN3CQG', 'Indonesia', 'jl. borobudur selatan 1 no.13', 'Semarang', 'Kalimantan Tengah', NULL, '50183', NULL, '2021-11-29 03:03:09', '2021-11-29 03:03:09', NULL, NULL, NULL, NULL),
(56, 'UID00047', 'Zuni Anifah', NULL, 'zuni_ann@gmail.com', 'default.jpg', 'http://127.0.0.1:8000/assets/image/profile/default.jpg', 'Active', NULL, '$2y$10$z7j7isRFGGUwXX80vn/BPudnAbVoqIi0DM5t/Ijvl53dMdaSAIF1G', 'Indonesia', 'jl. borobudur selatan 1 no.13', 'Semarang', 'Kalimantan Tengah', NULL, '50183', NULL, '2021-12-04 01:34:21', '2021-12-04 01:34:21', NULL, NULL, NULL, NULL),
(57, 'UID00057', 'Testt Test', NULL, 'dzulfikardev@gmail.com', 'default.jpg', 'http://127.0.0.1:8000/assets/image/profile/default.jpg', 'Active', NULL, '$2y$10$0e0nzKO0x4oTVUiWNXC0kO0z6mfAZc9v9ixIulAM/a4eK6cwwZBqS', 'Indonesia', 'jl. borobudur selatan 1 no.13', 'Semarang', 'Kalimantan Tengah', NULL, '50183', NULL, '2021-12-10 20:52:11', '2021-12-10 20:52:11', NULL, NULL, NULL, NULL),
(58, 'UID00058', 'Testname Testlastname', NULL, 'dzulfikardev2@gmail.com', 'default.jpg', 'http://127.0.0.1:8000/assets/image/profile/default.jpg', 'Active', NULL, '$2y$10$VFURCBqu3V.CBjhzqy.hgOOIUcB00Ev.EyxVc7AuOQoQ80Jl30g9W', 'Indonesia', 'jl. borobudur selatan 1 no.13', 'Semarang', 'Kalimantan Tengah', NULL, '50183', NULL, '2021-12-10 20:59:43', '2021-12-10 20:59:43', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_category_slug_unique` (`category_slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_uid_unique` (`order_uid`);

--
-- Indexes for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_detail_orders_id_foreign` (`orders_id`),
  ADD KEY `orders_detail_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_uid_unique` (`product_uid`),
  ADD UNIQUE KEY `products_product_slug_unique` (`product_slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders_product`
--
ALTER TABLE `orders_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `orders_detail_orders_id_foreign` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `product_variant_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
