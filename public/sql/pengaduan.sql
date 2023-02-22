-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 22, 2023 at 07:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
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
  `migration` varchar(255) NOT NULL,
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
(5, '2023_02_14_055648_create_registers_table', 2),
(6, '2023_02_16_005421_create_pengaduans_table', 3),
(7, '2023_02_20_013928_create_tanggapans_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengaduans`
--

CREATE TABLE `pengaduans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `id_masyarakat` bigint(20) UNSIGNED NOT NULL,
  `isi` text NOT NULL,
  `foto` text DEFAULT NULL,
  `status` enum('0','proses','selesai') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengaduans`
--

INSERT INTO `pengaduans` (`id`, `tgl_pengaduan`, `id_masyarakat`, `isi`, `foto`, `status`, `created_at`, `updated_at`) VALUES
(1, '2023-02-16', 11, '<p>wibu</p>', 'pengaduan/AX3bAdAUHC0nk6EIwxD4Ru2wCqI8Eiw0gyVjKUrw.jpg', 'proses', '2023-02-15 19:23:22', '2023-02-19 20:25:21'),
(4, '2023-02-16', 11, '<p>banjir makassar</p>', 'pengaduan/HITQ8mXtfXYHVt70c1zi44FB5ZIwY5oK9vLrBt3W.jpg', 'proses', '2023-02-15 22:33:30', '2023-02-19 20:21:07'),
(6, '2023-02-20', 13, '<p>sonda pasuuangggg</p>', 'pengaduan/mwxldpzJmWgfoQAnUPdH5YsWKZF9pM09aXshd8uv.jpg', 'proses', '2023-02-19 20:26:54', '2023-02-19 20:27:16'),
(8, '2023-02-20', 13, '<p>hslin bortak super</p>', 'pengaduan/S5OX4FSoT8frnkE2MsZnEZ1BMNuhc439oMk1ioba.jpg', 'selesai', '2023-02-19 20:37:01', '2023-02-19 20:37:51'),
(9, '2023-02-20', 13, '<p>sahrul</p>', 'pengaduan/CLMQErOSdf7buCOBPbWxTTvaQ9VAlcPCjlmn363n.jpg', 'selesai', '2023-02-19 20:51:18', '2023-02-19 20:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registers`
--

CREATE TABLE `registers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nik` char(16) NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registers`
--

INSERT INTO `registers` (`id`, `nama`, `nik`, `tlp`, `username`, `password`, `created_at`, `updated_at`) VALUES
(4, 'erereerer', '0932890432', '0823823293', 'erere', 'erere', '2023-02-14 02:18:08', '2023-02-14 02:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapans`
--

CREATE TABLE `tanggapans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pengaduan` bigint(20) UNSIGNED NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` bigint(20) UNSIGNED NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tanggapans`
--

INSERT INTO `tanggapans` (`id`, `id_pengaduan`, `tanggapan`, `id_petugas`, `tgl_tanggapan`, `created_at`, `updated_at`) VALUES
(1, 6, '<p>maaf nek</p>', 12, '2023-02-20', '2023-02-19 20:27:16', '2023-02-19 20:27:16'),
(3, 8, '<p>botak super kw</p>', 12, '2023-02-20', '2023-02-19 20:37:36', '2023-02-19 20:37:51'),
(4, 9, '<p>aoidbuiaiufhaif</p>', 12, '2023-02-20', '2023-02-19 20:51:46', '2023-02-19 20:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `level` enum('admin','petugas','masyarakat') NOT NULL,
  `nik` char(16) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`, `tlp`, `level`, `nik`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '$2y$10$/2tEwIr6Ilf4dbjJ2dO9zOaLvjD.A6qwOjrGODqcOPKpni8Xeb.4q', '08112345678', 'admin', '732081051', NULL, '2023-02-08 17:59:16', '2023-02-08 17:59:16'),
(2, 'gulung', 'dadar', '$2y$10$QgL1cYN.XztuTDLyRJ/dwuXf/zrHFxoCMxG37zrSra88Wte9I6e2m', '0819239232', 'masyarakat', '732123123', NULL, '2023-02-08 22:57:34', '2023-02-08 22:57:34'),
(6, 'wekofnwkenf', 'webfiwbfo', '$2y$10$PZTESlPczVIJMfqWFPuGneFXpHHqa7b4C7wn0VTZsIISsj/7iGk3G', '081304813134', 'masyarakat', '238429384', NULL, '2023-02-13 20:24:29', '2023-02-13 20:24:29'),
(8, 'adudu', 'sikepala kotak adudu', '$2y$10$MMq41MMDklmT6MSXEb.N2uK2vLzLg6YxNIOUYkJ9DFyEI8G3AazZO', '08123123234', 'admin', '727271327', NULL, '2023-02-13 21:44:18', '2023-02-13 21:44:18'),
(9, 'bowo', 'bowo wibu', '$2y$10$ZK2L6wPUj0D8YMFxLWDE1u720rXFUWjenEwdnfjlbzs5s.78TnOvu', '0819283839', 'masyarakat', '123123123', NULL, '2023-02-13 23:34:14', '2023-02-13 23:34:14'),
(10, 'wkwk', 'muehehe', '$2y$10$Pie56a7l.wbalQKUtfGr7OrYEBTt9zP.FVeo6t4wBQa.ttIfiR8QS', '089999999', 'masyarakat', '72313234234', NULL, '2023-02-13 23:36:17', '2023-02-13 23:36:17'),
(11, 'apa', 'apaan', '$2y$10$wZedqaH.M.5dQkIJZjlbguWmCGARoAT1sWxfdlq/FIL/X1rhZLURu', '768908778123', 'masyarakat', '091283790', NULL, '2023-02-15 16:12:32', '2023-02-15 16:12:32'),
(12, 'petugas', 'aku', '$2y$10$2Pi5M.Q/WYKe00r5ZxYg.eWvQPi3qCA1OASradXS5br8WZfnXmiDa', '081982938', 'petugas', '9087657893', NULL, '2023-02-19 16:24:14', '2023-02-19 16:24:14'),
(13, 'sonda', 'sonda', '$2y$10$3KywEd16G6YMfg2K82cAQ.X4.pu4Z9N3HH7CY4.XaPT5TTdm03qOy', '123', 'masyarakat', '123', NULL, '2023-02-19 19:00:59', '2023-02-19 19:00:59');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengaduans`
--
ALTER TABLE `pengaduans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaduans_id_masyarakat_foreign` (`id_masyarakat`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanggapans`
--
ALTER TABLE `tanggapans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tanggapans_id_pengaduan_foreign` (`id_pengaduan`),
  ADD KEY `tanggapans_id_petugas_foreign` (`id_petugas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengaduans`
--
ALTER TABLE `pengaduans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registers`
--
ALTER TABLE `registers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tanggapans`
--
ALTER TABLE `tanggapans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengaduans`
--
ALTER TABLE `pengaduans`
  ADD CONSTRAINT `pengaduans_id_masyarakat_foreign` FOREIGN KEY (`id_masyarakat`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tanggapans`
--
ALTER TABLE `tanggapans`
  ADD CONSTRAINT `tanggapans_id_pengaduan_foreign` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tanggapans_id_petugas_foreign` FOREIGN KEY (`id_petugas`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
