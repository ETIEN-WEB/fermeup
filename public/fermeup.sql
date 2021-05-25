-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 25 mai 2021 à 19:49
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fermeup`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Fruit', '2020-09-17 09:36:31', '2020-09-17 09:36:31'),
(2, 'Vegetale', '2020-09-17 09:43:26', '2020-09-17 09:43:26');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'siema47@gmail.com', '$2y$10$ncew6xymdQw.7eagnTQvWuT7Uly6wo42zzC70QtBgLso/lOBhWxcS', '2020-09-24 18:50:17', '2020-09-24 18:50:17'),
(6, 'screto45@gmail.com', '$2y$10$6DNX403.iGQjskUMUz6p/uSOBtFeSCHtwLI1YBOF.9RyVoSF7oZ9O', '2020-09-25 13:02:28', '2020-09-25 13:02:28'),
(7, 'etienblog@gmail.com', '$2y$10$f5toUT4L4i.b1YfMpQnOWOoqJnx3kkvQsrtAPpOl7TQyxo417POOC', '2020-09-25 18:28:57', '2020-09-25 18:28:57'),
(8, 'etien015@gmail.com', '$2y$10$lrjmTLZGS/IbGH5HPas2jOTb74EPUqZoErvJ05gWw6HohDmioqhVa', '2020-12-01 23:20:08', '2020-12-01 23:20:08');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_09_16_165025_create_categories_table', 1),
(4, '2020_09_17_093041_create_categories_table', 2),
(5, '2020_09_17_152402_create_products_table', 3),
(6, '2020_09_18_083125_create_sliders_table', 4),
(7, '2020_09_22_234006_create_orders_table', 5),
(8, '2020_09_23_221720_create_orders_table', 6),
(9, '2020_09_24_172544_create_clients_table', 7),
(10, '2014_10_12_100000_create_password_resets_table', 8);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `panier` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payement_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `nom`, `adresse`, `panier`, `payement_id`, `created_at`, `updated_at`) VALUES
(1, 'ETIEN', 'Abj 011bp', 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:2:{i:8;a:6:{s:3:\"qty\";i:1;s:10:\"product_id\";s:1:\"8\";s:12:\"product_name\";s:6:\"oignon\";s:13:\"product_price\";i:400;s:13:\"product_image\";s:24:\"product-9_1600479152.jpg\";s:4:\"item\";O:11:\"App\\Product\":27:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:8;s:12:\"product_name\";s:6:\"oignon\";s:13:\"product_price\";i:400;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:24:\"product-9_1600479152.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 01:32:32\";s:10:\"updated_at\";s:19:\"2020-09-21 11:57:55\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:8;s:12:\"product_name\";s:6:\"oignon\";s:13:\"product_price\";i:400;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:24:\"product-9_1600479152.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 01:32:32\";s:10:\"updated_at\";s:19:\"2020-09-21 11:57:55\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:9;a:6:{s:3:\"qty\";i:1;s:10:\"product_id\";s:1:\"9\";s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:4:\"item\";O:11:\"App\\Product\":27:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:9;s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 18:09:15\";s:10:\"updated_at\";s:19:\"2020-09-19 18:09:15\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:9;s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 18:09:15\";s:10:\"updated_at\";s:19:\"2020-09-19 18:09:15\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:2;s:10:\"totalPrice\";i:900;}', 'ch_1HUrBkGf4lUyrBwoBxbu2WwS', '2020-09-24 09:56:28', '2020-09-24 09:56:28'),
(2, 'ETIEN', 'Abj 011bp', 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:9;a:6:{s:3:\"qty\";i:1;s:10:\"product_id\";s:1:\"9\";s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:4:\"item\";O:11:\"App\\Product\":27:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:9;s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 18:09:15\";s:10:\"updated_at\";s:19:\"2020-09-19 18:09:15\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:9;s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 18:09:15\";s:10:\"updated_at\";s:19:\"2020-09-19 18:09:15\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";i:500;}', 'ch_1HUuz4Gf4lUyrBwo8mNR6spA', '2020-09-24 13:59:37', '2020-09-24 13:59:37'),
(6, 'SIEMA', 'Abj 011bp', 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:2:{i:8;a:6:{s:3:\"qty\";i:1;s:10:\"product_id\";s:1:\"8\";s:12:\"product_name\";s:6:\"oignon\";s:13:\"product_price\";i:400;s:13:\"product_image\";s:24:\"product-9_1600479152.jpg\";s:4:\"item\";O:11:\"App\\Product\":27:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:8;s:12:\"product_name\";s:6:\"oignon\";s:13:\"product_price\";i:400;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:24:\"product-9_1600479152.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 01:32:32\";s:10:\"updated_at\";s:19:\"2020-09-21 11:57:55\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:8;s:12:\"product_name\";s:6:\"oignon\";s:13:\"product_price\";i:400;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:24:\"product-9_1600479152.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 01:32:32\";s:10:\"updated_at\";s:19:\"2020-09-21 11:57:55\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:9;a:6:{s:3:\"qty\";i:1;s:10:\"product_id\";s:1:\"9\";s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:4:\"item\";O:11:\"App\\Product\":27:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:9;s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 18:09:15\";s:10:\"updated_at\";s:19:\"2020-09-19 18:09:15\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:9;s:12:\"product_name\";s:6:\"Piment\";s:13:\"product_price\";i:500;s:16:\"product_category\";s:8:\"Vegetale\";s:13:\"product_image\";s:25:\"product-12_1600538954.jpg\";s:6:\"status\";i:1;s:10:\"created_at\";s:19:\"2020-09-19 18:09:15\";s:10:\"updated_at\";s:19:\"2020-09-19 18:09:15\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:2;s:10:\"totalPrice\";i:900;}', 'ch_1HVMp7Gf4lUyrBwogbXmPs9X', '2020-09-25 19:43:17', '2020-09-25 19:43:17');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ira47@gmail.com', '$2y$10$SB5MKTWwRAqCLv5JvfJQTucuOvrA3hKUK0vzTr.zAEK4fe5/GblYO', '2020-09-26 16:43:44'),
('etienblog@gmail.com', '$2y$10$HIWBEx1wAWDbxXsS/Gfbd.yg19Yh64zmG.oCgKfjMTyBYXV1CWqbK', '2021-02-02 10:42:09');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_price`, `product_category`, `product_image`, `status`, `created_at`, `updated_at`) VALUES
(8, 'oignon', 400, 'Vegetale', 'product-9_1600479152.jpg', 1, '2020-09-19 01:32:32', '2020-09-21 11:57:55'),
(9, 'Piment', 500, 'Vegetale', 'product-12_1600538954.jpg', 1, '2020-09-19 18:09:15', '2020-09-19 18:09:15'),
(10, 'Papaye', 500, 'Fruit', 'product-6_1600688179.jpg', 1, '2020-09-21 11:36:21', '2020-09-21 11:36:21'),
(12, 'piment de garba', 500, 'Vegetale', 'product-1_1606871218.jpg', 1, '2020-12-02 00:54:17', '2020-12-02 01:06:58'),
(13, 'appetit', 2000, 'Vegetale', 'product-2_1606871086.jpg', 1, '2020-12-02 00:57:32', '2020-12-02 01:04:46'),
(14, 'choux', 1500, 'Vegetale', 'product-4_1606870738.jpg', 1, '2020-12-02 00:58:58', '2020-12-02 00:58:58'),
(15, 'carottes', 1000, 'Vegetale', 'product-7_1606870878.jpg', 1, '2020-12-02 01:01:18', '2020-12-02 01:01:18'),
(16, 'pomme', 500, 'Fruit', 'product-10_1606870977.jpg', 1, '2020-12-02 01:02:57', '2020-12-02 01:02:57'),
(17, 'jus', 1000, 'Fruit', 'product-8_1606871027.jpg', 1, '2020-12-02 01:03:47', '2020-12-02 01:03:47'),
(18, 'hum', 1500, 'Fruit', 'product-2_1606871339.jpg', 1, '2020-12-02 01:08:59', '2020-12-02 01:08:59'),
(19, 'fraise', 2000, 'Fruit', 'category-2_1606871396.jpg', 1, '2020-12-02 01:09:56', '2020-12-02 01:09:56'),
(20, 'céréals', 2000, 'Vegetale', 'category-4_1606871597.jpg', 1, '2020-12-02 01:12:08', '2020-12-02 01:13:17'),
(21, 'tout', 3000, 'Fruit', 'category-3_1606871688.jpg', 1, '2020-12-02 01:14:48', '2020-12-02 01:14:48');

-- --------------------------------------------------------

--
-- Structure de la table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sliders`
--

INSERT INTO `sliders` (`id`, `description1`, `description2`, `slider_image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'We deliver organic vegetables  fruits', 'We deliver organic vegetables  fruits', 'about_1600434519.jpg', 1, '2020-09-18 13:08:40', '2020-09-19 23:12:31'),
(5, 'We deliver organic vegetables  fruits', 'We deliver organic vegetables  fruits', 'bg_3_1600558518.jpg', 1, '2020-09-19 23:35:18', '2020-09-19 23:35:18');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'DEVELOPPEUR', 'ira47@gmail.com', NULL, '$2y$10$8/fcfoE9ZPFXdkIyw.wsH./b94EuM0ykSHQV.11yCOs1ZiEHVUmRe', NULL, '2020-09-26 10:30:12', '2020-09-26 10:30:12'),
(2, 'DEVCOM', 'devcom12@gmail.com', NULL, '$2y$10$J5Je4Dxi1p/V5G12hjH.MO3iYBZsIAZa1dFS4.80M8seesm2kYOPC', NULL, '2020-09-26 10:50:43', '2020-09-26 10:50:43'),
(3, 'ETIEN', 'etienblog@gmail.com', NULL, '$2y$10$qIRAaWaLBrp/I/zsCsWOG.AOJIMxgtqqj42PZYZlaoyNcOoLkI5OO', '1Wr8utRBEm3D57E5yYGOyfjp9tU8pjin2BBLtFZ2p1g6RCQTCuLB6e6PcaZi', '2020-09-26 16:48:44', '2020-09-26 17:11:10'),
(4, 'sorbone', 'screto45@gmail.com', NULL, '$2y$10$AupPx/ZM6v245uR/FTKNn.WviqQAm5uf4D212txux2krbI4HSt51W', NULL, '2020-09-26 17:06:22', '2020-09-26 17:06:22'),
(5, 'ETIEN015', 'etien015@gmail.com', NULL, '$2y$10$uHXdKiKi2Xi3AUGRybKtxOTdieCDNry9nMBuZLxotT58LIpwucfOu', NULL, '2020-11-25 01:28:49', '2020-11-25 01:28:49'),
(6, 'ETIEN THOMAS', 'thom14@gmail.com', NULL, '$2y$10$z/sLL0bhBSNwPpFepZLxk.CAQa4rQGLSxaIId000RvnGCxfnkWQZO', NULL, '2020-12-01 23:31:31', '2020-12-01 23:31:31');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_name_unique` (`product_name`);

--
-- Index pour la table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
