-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Fev-2018 às 21:05
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cursolaravel55_saldo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `balances`
--

CREATE TABLE `balances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amoount` double(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `balances`
--

INSERT INTO `balances` (`id`, `user_id`, `amoount`) VALUES
(5, 1, 344.00),
(6, 2, 456.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historics`
--

CREATE TABLE `historics` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('I','O','T') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `total_before` double(10,2) NOT NULL,
  `total_after` double(10,2) NOT NULL,
  `user_id_transaction` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `historics`
--

INSERT INTO `historics` (`id`, `user_id`, `type`, `amount`, `total_before`, `total_after`, `user_id_transaction`, `date`, `created_at`, `updated_at`) VALUES
(2, 1, 'I', 20.00, 0.00, 20.00, NULL, '2018-02-27', '2018-02-27 21:39:07', '2018-02-27 21:39:07'),
(3, 1, 'I', 30.00, 20.00, 50.00, NULL, '2018-02-27', '2018-02-27 21:39:15', '2018-02-27 21:39:15'),
(4, 1, 'I', 20.00, 50.00, 70.00, NULL, '2018-02-27', '2018-02-27 21:50:03', '2018-02-27 21:50:03'),
(5, 1, 'I', 30.00, 70.00, 100.00, NULL, '2018-02-27', '2018-02-27 22:02:00', '2018-02-27 22:02:00'),
(6, 1, 'I', 35.00, 100.00, 135.00, NULL, '2018-02-27', '2018-02-27 22:12:38', '2018-02-27 22:12:38'),
(7, 1, 'I', 15.00, 135.00, 150.00, NULL, '2018-02-27', '2018-02-27 22:24:23', '2018-02-27 22:24:23'),
(8, 1, 'O', 30.00, 150.00, 120.00, NULL, '2018-02-27', '2018-02-27 22:44:18', '2018-02-27 22:44:18'),
(9, 1, 'O', 120.00, 120.00, 0.00, NULL, '2018-02-27', '2018-02-27 22:56:09', '2018-02-27 22:56:09'),
(10, 1, 'I', 20.00, 0.00, 20.00, NULL, '2018-02-27', '2018-02-27 22:57:45', '2018-02-27 22:57:45'),
(11, 1, 'T', 5.00, 20.00, 15.00, 2, '2018-02-28', '2018-02-28 21:38:19', '2018-02-28 21:38:19'),
(12, 2, 'I', 5.00, 0.00, 5.00, 1, '2018-02-28', '2018-02-28 21:38:19', '2018-02-28 21:38:19'),
(13, 2, 'T', 5.00, 5.00, 0.00, 1, '2018-02-28', '2018-02-28 21:50:50', '2018-02-28 21:50:50'),
(14, 1, 'I', 5.00, 15.00, 20.00, 2, '2018-02-28', '2018-02-28 21:50:50', '2018-02-28 21:50:50'),
(15, 2, 'I', 1000.00, 0.00, 1000.00, NULL, '2018-02-28', '2018-02-28 21:53:27', '2018-02-28 21:53:27'),
(16, 2, 'T', 200.00, 1000.00, 800.00, 1, '2018-02-28', '2018-02-28 21:55:38', '2018-02-28 21:55:38'),
(17, 1, 'I', 200.00, 20.00, 220.00, 2, '2018-02-28', '2018-02-28 21:55:38', '2018-02-28 21:55:38'),
(18, 2, 'O', 150.00, 800.00, 650.00, NULL, '2018-02-28', '2018-02-28 21:59:04', '2018-02-28 21:59:04'),
(19, 2, 'T', 150.00, 650.00, 500.00, 1, '2018-02-28', '2018-02-28 22:51:57', '2018-02-28 22:51:57'),
(20, 1, 'I', 150.00, 220.00, 370.00, 2, '2018-02-28', '2018-02-28 22:51:57', '2018-02-28 22:51:57'),
(21, 2, 'T', 100.00, 500.00, 400.00, 1, '2018-02-28', '2018-02-28 22:52:58', '2018-02-28 22:52:58'),
(22, 1, 'I', 100.00, 370.00, 470.00, 2, '2018-02-28', '2018-02-28 22:52:58', '2018-02-28 22:52:58'),
(23, 1, 'O', 70.00, 470.00, 400.00, NULL, '2018-02-28', '2018-02-28 22:54:42', '2018-02-28 22:54:42'),
(24, 1, 'T', 56.00, 400.00, 344.00, 2, '2018-02-28', '2018-02-28 22:55:57', '2018-02-28 22:55:57'),
(25, 2, 'I', 56.00, 400.00, 456.00, 1, '2018-02-28', '2018-02-28 22:55:57', '2018-02-28 22:55:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_26_190702_create_balances_table', 1),
(4, '2018_02_26_190821_create_historics_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marco Tulio', 'marco.tulio95@hotmail.com', '$2y$10$9eWRII7XBfX5ancC3swVKOwblZA1Fhj7DpWpN3mZICeMzb2O0yuNO', NULL, 'lpekTMFl2tmdzSjMuomCtNdprjc5SjJNRtyTHzLa1JnCXbH6F8hVFhFf8Zp4', '2018-02-27 15:31:53', '2018-02-27 15:31:53'),
(2, 'Celina Macedo Pereira', 'abadiocelina@hotmail.com', '$2y$10$uLCyX07o/sJKOPXF0NB.tONrD55Qcc6nEWGuyBEx9X4pCcmTBjQcq', NULL, 'BfXvgbzvIQ7anSssNtROtBzxRzNXC4IXUSFtrGaKnvSgpW0LtbGCaQuqsmhP', '2018-02-27 16:07:30', '2018-02-27 16:07:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balances_user_id_foreign` (`user_id`);

--
-- Indexes for table `historics`
--
ALTER TABLE `historics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historics_user_id_foreign` (`user_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `historics`
--
ALTER TABLE `historics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `historics`
--
ALTER TABLE `historics`
  ADD CONSTRAINT `historics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
