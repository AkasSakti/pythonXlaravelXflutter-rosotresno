-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2025 at 08:16 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klasifikasi_cinta`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2025_03_10_035323_create_responses_table', 2),
(5, '2025_03_10_035720_create_users_table', 3),
(6, '2025_03_10_113744_create_prediction_results_table', 3),
(8, '2025_03_10_114549_create_prediction_results_table', 4),
(9, '2025_03_10_120253_change_prediction_column_in_prediction_results_table', 5),
(10, '2025_03_10_121113_change_prediction_column_in_prediction_results_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prediction_results`
--

CREATE TABLE `prediction_results` (
  `id` bigint UNSIGNED NOT NULL,
  `input_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prediction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prediction_results`
--

INSERT INTO `prediction_results` (`id`, `input_data`, `prediction`, `created_at`, `updated_at`) VALUES
(1, '{\"sering_memikirkan\":\"Ya\",\"merasa_bahagia\":\"5\",\"cemburu\":\"Ya\",\"nyaman_berbicara\":\"4\",\"sering_chat\":\"Ya\",\"mencari_kesempatan\":\"Ya\",\"perhatian\":\"5\",\"frekuensi_nyebut\":\"Jarang\",\"jantung_berdebar\":\"Ya\",\"sering_menatap\":\"Ya\",\"gugup\":\"Ya\",\"senyum_saat_dengar_nama\":\"Ya\",\"membayangkan_masa_depan\":\"Ya\",\"prioritas\":\"5\",\"mudah_memaafkan\":\"Ya\",\"kehilangan_motivasi\":\"5\"}', 'Jatuh Cinta', '2025-03-10 05:12:28', '2025-03-10 05:12:28'),
(2, '{\"sering_memikirkan\":\"Ya\",\"merasa_bahagia\":\"5\",\"cemburu\":\"Ya\",\"nyaman_berbicara\":\"4\",\"sering_chat\":\"Ya\",\"mencari_kesempatan\":\"Ya\",\"perhatian\":\"5\",\"frekuensi_nyebut\":\"Jarang\",\"jantung_berdebar\":\"Ya\",\"sering_menatap\":\"Ya\",\"gugup\":\"Ya\",\"senyum_saat_dengar_nama\":\"Ya\",\"membayangkan_masa_depan\":\"Ya\",\"prioritas\":\"5\",\"mudah_memaafkan\":\"Ya\",\"kehilangan_motivasi\":\"5\"}', 'Jatuh Cinta', '2025-03-10 05:13:42', '2025-03-10 05:13:42'),
(3, '{\"sering_memikirkan\":\"Ya\",\"merasa_bahagia\":\"5\",\"cemburu\":\"Ya\",\"nyaman_berbicara\":\"5\",\"sering_chat\":\"Ya\",\"mencari_kesempatan\":\"Ya\",\"perhatian\":\"5\",\"frekuensi_nyebut\":\"Jarang\",\"jantung_berdebar\":\"Ya\",\"sering_menatap\":\"Ya\",\"gugup\":\"Ya\",\"senyum_saat_dengar_nama\":\"Ya\",\"membayangkan_masa_depan\":\"Ya\",\"prioritas\":\"4\",\"mudah_memaafkan\":\"Ya\",\"kehilangan_motivasi\":\"1\"}', 'Jatuh Cinta', '2025-03-10 05:18:44', '2025-03-10 05:18:44'),
(4, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"4\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"3\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"5\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"4\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"2\"\n}', 'Tidak Jatuh Cinta', '2025-03-10 06:46:00', '2025-03-10 06:46:00'),
(5, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"9\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"9\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"9\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"9\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-10 06:47:38', '2025-03-10 06:47:38'),
(6, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"10\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"10\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"10\",\n    \"frekuensi_nyebut\": \"Sering\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"10\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-10 06:48:39', '2025-03-10 06:48:39'),
(7, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"10\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"10\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"10\",\n    \"frekuensi_nyebut\": \"Sering\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"10\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-10 06:51:09', '2025-03-10 06:51:09'),
(8, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"6\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"9\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"7\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-10 06:55:11', '2025-03-10 06:55:11'),
(9, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"10\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"8\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"9\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"10\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-10 07:08:39', '2025-03-10 07:08:39'),
(10, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"5\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"5\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"5\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-11 22:17:03', '2025-03-11 22:17:03'),
(11, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"5\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"5\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"5\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-11 22:17:03', '2025-03-11 22:17:03'),
(12, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"5\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"5\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"5\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-11 22:17:03', '2025-03-11 22:17:03'),
(13, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"9\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"7\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"6\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"9\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-11 23:16:15', '2025-03-11 23:16:15'),
(14, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"5\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"5\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"2\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-12 19:37:25', '2025-03-12 19:37:25'),
(15, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"4\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"4\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"4\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-16 23:09:59', '2025-03-16 23:09:59'),
(16, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"5\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"5\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"4\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"5\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"3\"\n}', 'Tidak Jatuh Cinta', '2025-03-16 23:33:14', '2025-03-16 23:33:14'),
(17, '{\n    \"sering_memikirkan\": \"Ya\",\n    \"merasa_bahagia\": \"7\",\n    \"cemburu\": \"Ya\",\n    \"nyaman_berbicara\": \"7\",\n    \"sering_chat\": \"Ya\",\n    \"mencari_kesempatan\": \"Ya\",\n    \"perhatian\": \"7\",\n    \"frekuensi_nyebut\": \"Jarang\",\n    \"jantung_berdebar\": \"Ya\",\n    \"sering_menatap\": \"Ya\",\n    \"gugup\": \"Ya\",\n    \"senyum_saat_dengar_nama\": \"Ya\",\n    \"membayangkan_masa_depan\": \"Ya\",\n    \"prioritas\": \"6\",\n    \"mudah_memaafkan\": \"Ya\",\n    \"kehilangan_motivasi\": \"1\"\n}', 'Tidak Jatuh Cinta', '2025-03-22 08:57:20', '2025-03-22 08:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `sering_memikirkan` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `merasa_bahagia` int DEFAULT NULL,
  `cemburu` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nyaman_berbicara` int DEFAULT NULL,
  `sering_chat` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mencari_kesempatan` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `perhatian` int DEFAULT NULL,
  `frekuensi_nyebut` enum('Jarang','Sedang','Sering') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jantung_berdebar` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sering_menatap` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gugup` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `senyum_saat_dengar_nama` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `membayangkan_masa_depan` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioritas` int DEFAULT NULL,
  `mudah_memaafkan` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `kehilangan_motivasi` int DEFAULT NULL,
  `label` enum('Jatuh Cinta','Tidak Jatuh Cinta') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`id`, `user_id`, `sering_memikirkan`, `merasa_bahagia`, `cemburu`, `nyaman_berbicara`, `sering_chat`, `mencari_kesempatan`, `perhatian`, `frekuensi_nyebut`, `jantung_berdebar`, `sering_menatap`, `gugup`, `senyum_saat_dengar_nama`, `membayangkan_masa_depan`, `prioritas`, `mudah_memaafkan`, `kehilangan_motivasi`, `label`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ya', 4, 'Ya', 5, 'Ya', 'Ya', 5, 'Sering', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 5, 'Ya', 1, 'Jatuh Cinta', NULL, NULL),
(2, 2, 'Ya', 5, 'Ya', 5, 'Ya', 'Ya', 5, 'Jarang', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 5, 'Ya', 5, 'Jatuh Cinta', NULL, NULL),
(3, 1, 'Ya', 3, 'Tidak', 4, 'Ya', 'Tidak', 5, 'Sering', 'Ya', 'Ya', 'Tidak', 'Ya', 'Ya', 2, 'Ya', 1, 'Jatuh Cinta', NULL, NULL),
(5, 2, 'Tidak', 0, 'Tidak', 0, 'Tidak', 'Tidak', 0, 'Sedang', 'Tidak', 'Tidak', 'Tidak', 'Tidak', 'Tidak', 0, 'Tidak', 0, 'Jatuh Cinta', '2025-03-11 00:44:45', '2025-03-11 00:44:45'),
(9, 2, 'Ya', 5, 'Ya', 6, 'Ya', 'Ya', 6, 'Jarang', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 6, 'Ya', 4, 'Jatuh Cinta', '2025-03-11 05:46:38', '2025-03-11 05:46:38'),
(10, 2, 'Ya', 5, 'Ya', 6, 'Ya', 'Ya', 6, 'Jarang', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 6, 'Ya', 4, 'Jatuh Cinta', '2025-03-11 05:47:15', '2025-03-11 05:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usia` int NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `usia`, `jenis_kelamin`, `created_at`, `updated_at`) VALUES
(1, 'akas', '$2y$12$uyBb8VzpvoG/6suzKHs2N.cpEx/ROJXWJEt1uiFSXm38rmPORKEfS', 'akas', 34, 'Laki-laki', '2025-03-10 11:55:33', '2025-03-10 11:55:33'),
(2, 'widybp', 'widyanibepe', 'wbp', 33, 'Perempuan', '2025-03-10 11:59:16', '2025-03-10 11:59:16');

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
-- Indexes for table `prediction_results`
--
ALTER TABLE `prediction_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prediction_results`
--
ALTER TABLE `prediction_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
