-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2024 at 10:45 AM
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
-- Database: `laravel10_vue_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Football2', '2024-06-27 08:42:57', '2024-06-27 08:42:57'),
(3, 'Laptop', '2024-06-27 13:46:24', '2024-06-27 13:46:24'),
(4, 'Mobile', '2024-06-27 13:46:31', '2024-06-27 13:46:31'),
(5, 'Food', '2024-06-27 13:46:38', '2024-06-27 13:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Zakir BDt', 'zakir@gmail.com', '01775814898', 'Dhaka', 'admins/customer/1719807385.png', '2024-06-30 22:16:26', '2024-06-30 22:16:26'),
(3, 'Riad', 'riad@gmail.com', '230937545', 'Pabna', 'admins/customer/1719837566.jpeg', '2024-07-01 06:39:27', '2024-07-01 06:39:27'),
(4, 'Parvez', 'parvez@gmail.com', '454545', 'pabna', 'admins/customer/1719837602.jpeg', '2024-07-01 06:40:02', '2024-07-01 06:40:02'),
(5, 'Shajol', 'Shajol@gmail.com', '43434', 'dhaka', 'admins/customer/1719837632.jpeg', '2024-07-01 06:40:32', '2024-07-01 06:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `salary` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `nid` varchar(191) DEFAULT NULL,
  `joining_date` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `address`, `salary`, `photo`, `nid`, `joining_date`, `created_at`, `updated_at`) VALUES
(1, 'Zakir BDt', 'zakir@gmail.com', '01775814898', 'Dhaka', '646656', 'admins/employee/1719471190.jpeg', '656546', '2024-06-20', '2024-06-25 15:26:21', '2024-06-25 15:26:21'),
(3, 'Sagor', 'sagor@gmail.com', '096767775', 'pabna', '20000', 'admins/employee/1719465592.jpeg', '574657455', '2024-06-15', '2024-06-26 23:19:52', '2024-06-26 23:19:52'),
(4, 'Sakib', 'sakib@gmail.com', '01675433', 'sakib@gmail.com', '30000', 'admins/employee/1719465639.jpeg', '5656565', '2024-06-10', '2024-06-26 23:20:39', '2024-06-26 23:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text NOT NULL,
  `amount` varchar(191) NOT NULL,
  `expense_date` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `details`, `amount`, `expense_date`, `created_at`, `updated_at`) VALUES
(1, 'Current Bills', '650', '28/06/24', '2024-06-28 00:05:20', '2024-06-28 00:05:20');

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat` int(11) NOT NULL,
  `logo` varchar(191) NOT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `vat`, `logo`, `favicon`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 5, '', NULL, '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2024_06_25_075046_create_employees_table', 2),
(12, '2024_06_27_065429_create_suppliers_table', 3),
(13, '2024_06_27_142345_create_categories_table', 4),
(14, '2024_06_27_190022_create_products_table', 5),
(15, '2024_06_28_053757_create_expenses_table', 6),
(16, '2024_06_28_063951_create_salaries_table', 7),
(17, '2024_07_01_035824_create_customers_table', 8),
(18, '2024_07_01_155706_create_pos_table', 9),
(19, '2024_07_02_071800_create_extras_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(191) DEFAULT NULL,
  `pro_quantity` varchar(191) DEFAULT NULL,
  `product_price` varchar(191) DEFAULT NULL,
  `sub_total` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `pro_id`, `pro_name`, `pro_quantity`, `product_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(5, 5, 'Product four', '1', '260', '260', NULL, NULL),
(7, 4, 'Product Three', '1', '180', '180', NULL, NULL),
(9, 10, 'Product nine', '2', '300', '600', NULL, NULL),
(10, 6, 'Product five', '2', '390', '780', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_code` varchar(191) DEFAULT NULL,
  `root` varchar(191) DEFAULT NULL,
  `buying_price` varchar(191) DEFAULT NULL,
  `selling_price` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `buying_date` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `product_quantity` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `root`, `buying_price`, `selling_price`, `supplier_id`, `buying_date`, `image`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, 4, 'Product one', 'fdfd544', 'B', '300', '200', 4, '2024-06-27', 'admins/product/1719549354.jpeg', '100', '2024-06-27 22:35:54', '2024-06-27 22:35:54'),
(3, 3, 'Product Two', '45435435', 'A', '500', '200', 6, '2024-06-14', 'admins/product/1719552922.jpeg', '50', '2024-06-27 23:27:58', '2024-06-27 23:27:58'),
(4, 4, 'Product Three', '4345435', 'B', '200', '180', 6, '2024-07-01', 'admins/product/1719812310.jpeg', '10', '2024-06-30 23:38:30', '2024-06-30 23:38:30'),
(5, 1, 'Product four', '4353454', 'C', '300', '260', 4, '2024-06-30', 'admins/product/1719812369.jpeg', '30', '2024-06-30 23:39:29', '2024-06-30 23:39:29'),
(6, 1, 'Product five', '546546546', 'A', '400', '390', 7, '2024-07-01', 'admins/product/1719812405.jpeg', '40', '2024-06-30 23:40:05', '2024-06-30 23:40:05'),
(7, 5, 'Product six', '556546', 'D', '500', '470', 6, '2024-07-01', 'admins/product/1719812458.jpeg', '50', '2024-06-30 23:40:58', '2024-06-30 23:40:58'),
(8, 3, 'Product seven', '5435435', 'C', '600', '570', 6, '2024-07-01', 'admins/product/1719812498.jpeg', '60', '2024-06-30 23:41:38', '2024-06-30 23:41:38'),
(9, 3, 'Product eight', '354546', 'B', '700', '650', 7, '2024-07-01', 'admins/product/1719812537.jpeg', '34', '2024-06-30 23:42:17', '2024-06-30 23:42:17'),
(10, 3, 'Product nine', '435435', 'A', '435', '300', 4, '2024-07-01', 'admins/product/1719812574.jpeg', '32', '2024-06-30 23:42:54', '2024-06-30 23:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `salary_date` varchar(191) DEFAULT NULL,
  `salary_month` varchar(191) DEFAULT NULL,
  `salary_year` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `amount`, `salary_date`, `salary_month`, `salary_year`, `created_at`, `updated_at`) VALUES
(1, 1, '646656', '28/06/2024', 'June', '2024', NULL, NULL),
(2, 3, '20500', '28/06/2024', 'July', '2024', NULL, NULL),
(3, 4, '30000', '28/06/2024', 'June', '2024', NULL, NULL),
(4, 4, '30000', '29/06/2024', 'June', '2024', NULL, NULL),
(5, 1, '646656', '29/06/2024', 'June', '2024', NULL, NULL),
(6, 1, '646656', '29/06/2024', 'March', '2024', NULL, NULL),
(7, 3, '20000', '29/06/2024', 'September', '2024', NULL, NULL),
(8, 4, '30000', '29/06/2024', 'December', '2024', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `shopname` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `shopname`, `created_at`, `updated_at`) VALUES
(4, 'Zakir BD', 'zakir@gmail.com', '01775814898', 'Dhaka', 'admins/supplier/1719497830.jpeg', 'shop bd', '2024-06-27 02:39:24', '2024-06-27 02:39:24'),
(6, 'Riad', 'riad@gmail.com', '01775814890', 'Dhaka', 'admins/supplier/1719517541.jpeg', 'Riad bd shop', '2024-06-27 13:45:41', '2024-06-27 13:45:41'),
(7, 'Parvez1', 'parvez@gmail.com', '01775814893', 'Dhaka', 'admins/supplier/1719517571.jpeg', 'parvaz shop', '2024-06-27 13:46:11', '2024-06-27 13:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'zakir', 'zakir@gmail.com', NULL, '$2y$12$Nl1iDzWmJDM9lL5NzC4YruZRUKTOHokw96M1c2cbO.iLTfAz89z5y', NULL, NULL, NULL),
(2, 'Parvez', 'parvez@gmail.com', NULL, '$2y$12$VZV6NHL2nwwAOPJQ7jDJhu1P5SjyYVk8zDWchQXvx0qIZNxNJTAbm', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
