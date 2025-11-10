-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2025 at 01:06 AM
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
-- Database: `laravelpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `id` int(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `login_at` time NOT NULL,
  `logout_at` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`id`, `user_id`, `login_at`, `logout_at`, `created_at`, `updated_at`) VALUES
(50, 16, '22:37:00', NULL, '2025-11-07 15:37:11', '2025-11-07 15:37:11'),
(51, 14, '23:07:00', '23:08:00', '2025-11-07 16:07:42', '2025-11-07 16:08:22'),
(52, 16, '23:08:00', NULL, '2025-11-07 16:08:28', '2025-11-07 16:08:28'),
(53, 16, '23:17:00', NULL, '2025-11-07 16:17:46', '2025-11-07 16:17:46'),
(54, 16, '23:29:00', NULL, '2025-11-07 16:29:21', '2025-11-07 16:29:21'),
(55, 15, '23:29:00', NULL, '2025-11-07 16:29:45', '2025-11-07 16:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 16, 314, 1, '2025-11-07 16:29:06', '2025-11-07 16:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(21, 'Makanan dan Minuman', NULL, '2025-11-04 23:20:03', '2025-11-04 23:20:03'),
(22, 'Buku dan alat tulis', NULL, '2025-11-04 23:22:17', '2025-11-04 23:22:17'),
(23, 'Peralatan rumah tangga', NULL, '2025-11-04 23:22:33', '2025-11-04 23:22:33'),
(24, 'Kosmetik dan perawatan diri', NULL, '2025-11-04 23:22:48', '2025-11-04 23:22:48'),
(25, 'Kesehatan & Obat-Obatan Ringan', NULL, '2025-11-04 23:24:24', '2025-11-04 23:24:24'),
(26, 'Lainnya', NULL, '2025-11-04 23:25:38', '2025-11-04 23:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `goods_receipts`
--

CREATE TABLE `goods_receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `gr_number` varchar(255) NOT NULL,
  `receipt_date` date NOT NULL,
  `received_by` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `receipt_document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goods_receipts`
--

INSERT INTO `goods_receipts` (`id`, `purchase_order_id`, `gr_number`, `receipt_date`, `received_by`, `status`, `notes`, `receipt_document`, `created_at`, `updated_at`) VALUES
(24, 30, 'GR-0001/11/2025', '2025-11-07', 12, 'completed', NULL, 'receipts/mjf96QzLhC2qU7lf6DHRGxduBJpXcLNX2X58spzo.jpg', '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(25, 32, 'GR-0002/11/2025', '2025-11-07', 12, 'completed', 'k', 'receipts/zbEqkStQMjLVGKyJrxfGvrLrJk4xY4MsXRet5zTc.png', '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(26, 31, 'GR-0003/11/2025', '2025-11-07', 12, 'completed', NULL, 'receipts/UnNuluhftJmFeUgnIzLEq4KNUqYcdvdMHK8UxY08.png', '2025-11-06 19:14:25', '2025-11-06 19:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `goods_receipt_items`
--

CREATE TABLE `goods_receipt_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goods_receipt_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `quantity_received` int(11) NOT NULL,
  `remaining_quantity` int(11) NOT NULL DEFAULT 0,
  `expiry_date` date DEFAULT NULL,
  `lot_code` varchar(255) DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `expiry_status` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goods_receipt_items`
--

INSERT INTO `goods_receipt_items` (`id`, `goods_receipt_id`, `item_id`, `product_name`, `unit`, `quantity_received`, `remaining_quantity`, `expiry_date`, `lot_code`, `batch_number`, `expiry_status`, `notes`, `created_at`, `updated_at`) VALUES
(28, 24, NULL, 'Oasis Air Minum Box of 330 mL', 'box', 10, 0, '2028-10-18', NULL, 'OAS251107001', 'safe', NULL, '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(29, 24, NULL, 'Oasis Air Minum Box of 240 mL', 'box', 5, 0, '2028-10-18', NULL, 'OAS251107002', 'safe', NULL, '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(30, 24, NULL, 'Oasis Air Minum Box of 600 mL', 'box', 5, 0, '2028-11-16', NULL, 'OAS251107003', 'safe', NULL, '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(31, 25, NULL, 'Isi Stapler No. 10 Kangaro', 'pcs', 15, 0, '2029-10-17', NULL, 'ISI251107001', 'safe', NULL, '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(32, 25, NULL, 'clip box binder clip 200 joyko', 'pcs', 22, 0, '2028-07-21', NULL, 'CLI251107001', 'safe', NULL, '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(33, 25, NULL, 'Pulpen dan Pensil Standard ST 009', 'box', 25, 0, '2028-12-15', NULL, 'PUL251107001', 'safe', NULL, '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(34, 26, NULL, 'Cairan Pembersih Lantai Wipol 750ML', 'pcs', 55, 0, '2028-10-19', NULL, 'CAI251107001', 'safe', NULL, '2025-11-06 19:14:25', '2025-11-06 19:14:25'),
(35, 26, NULL, 'Cairan Pembersih Lantai Porselen Vixal 750M', 'pcs', 55, 0, '2029-07-19', NULL, 'CAI251107002', 'safe', NULL, '2025-11-06 19:14:25', '2025-11-06 19:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_batches`
--

CREATE TABLE `inventory_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty_on_hand` decimal(12,2) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `lot_code` varchar(255) DEFAULT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `location_code` varchar(255) DEFAULT NULL,
  `status` enum('active','expired','quarantined') NOT NULL DEFAULT 'active',
  `last_tx_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goods_receipt_item_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('in','out','adjust') NOT NULL,
  `qty` decimal(12,2) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `ref_id` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_movements`
--

INSERT INTO `inventory_movements` (`id`, `goods_receipt_item_id`, `type`, `qty`, `ref_type`, `ref_id`, `note`, `created_at`, `updated_at`) VALUES
(10, 28, 'in', 10.00, 'GR', '24', 'Penerimaan barang dari GR #GR-0001/11/2025', '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(11, 29, 'in', 5.00, 'GR', '24', 'Penerimaan barang dari GR #GR-0001/11/2025', '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(12, 30, 'in', 5.00, 'GR', '24', 'Penerimaan barang dari GR #GR-0001/11/2025', '2025-11-06 18:27:55', '2025-11-06 18:27:55'),
(13, 31, 'in', 15.00, 'GR', '25', 'Penerimaan barang dari GR #GR-0002/11/2025', '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(14, 32, 'in', 22.00, 'GR', '25', 'Penerimaan barang dari GR #GR-0002/11/2025', '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(15, 33, 'in', 25.00, 'GR', '25', 'Penerimaan barang dari GR #GR-0002/11/2025', '2025-11-06 19:12:15', '2025-11-06 19:12:15'),
(16, 34, 'in', 55.00, 'GR', '26', 'Penerimaan barang dari GR #GR-0003/11/2025', '2025-11-06 19:14:25', '2025-11-06 19:14:25'),
(17, 35, 'in', 55.00, 'GR', '26', 'Penerimaan barang dari GR #GR-0003/11/2025', '2025-11-06 19:14:25', '2025-11-06 19:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_records`
--

CREATE TABLE `inventory_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goods_receipt_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_settings`
--

CREATE TABLE `inventory_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `analysis_period` int(11) NOT NULL DEFAULT 30,
  `fast_moving_threshold` decimal(8,2) NOT NULL DEFAULT 3.00,
  `slow_moving_threshold` decimal(8,2) NOT NULL DEFAULT 0.50,
  `lead_time_days` int(11) NOT NULL DEFAULT 5,
  `safety_stock_days` int(11) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `invoice_file` varchar(255) DEFAULT NULL,
  `payment_proof` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `purchase_order_id`, `invoice_number`, `invoice_date`, `due_date`, `amount`, `status`, `invoice_file`, `payment_proof`, `notes`, `created_at`, `updated_at`) VALUES
(7, 30, '333121123', '2025-11-07', '2025-12-07', 360000.00, 'paid', 'invoices/eWcYvLhYRjn3XFlVFoxaYpewSMKUSvXCRCN7Dupq.jpg', 'payment_proofs/zozQvGeXG8WD1equ9ind8MYQYfesPORG2QHEmUtI.png', NULL, '2025-11-06 18:28:14', '2025-11-06 18:28:14'),
(8, 32, '33256564', '2025-11-07', '2025-12-07', 1600000.00, 'paid', 'invoices/54Xk6MILWtxuZP5AP74VNUS6T5BjbIFHT2HLX2AI.jpg', 'payment_proofs/dfo9a8JmUPGhoEr2DzBULocqx6VvfIv3dOPGeiRP.jpg', NULL, '2025-11-06 19:12:49', '2025-11-06 19:12:49'),
(9, 31, '11233', '2025-11-07', '2025-12-07', 825000.00, 'paid', 'invoices/jOflS1gsDLDtzWszq6IaWWTZevlbU8l3rAFYuvlJ.png', 'payment_proofs/onvJFAYApzTd1jlJ1VnUBCrPIF640d9RD14g6Wx1.jpg', NULL, '2025-11-06 19:14:44', '2025-11-06 19:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `cost_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `picture` varchar(255) NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `requires_expiry` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `code`, `category_id`, `cost_price`, `selling_price`, `stock`, `picture`, `created_at`, `updated_at`, `requires_expiry`) VALUES
(311, 'Oasis Air Minum 1500 mL', 'BLPP9581', 21, 5000, 7000, 2, '1762468998.png', '2025-11-06 15:43:18', '2025-09-30 14:49:12', 0),
(312, 'Oasis Air Minum Box of 600 mL', 'DBAT0940', 21, 3000, 4000, 42, '1762485461.png', '2025-11-06 20:17:41', '2025-10-21 14:50:39', 0),
(313, 'Sunlight Sabun Cuci Piring Sunlight Lime 650ml', 'BMMT0482', 23, 10000, 12000, 48, '1761083578.png', '2025-10-21 14:53:00', '2025-08-21 15:27:50', 0),
(314, 'Batere ABC Alkaline Uk AAA', 'QPKT9114', 23, 20000, 22000, 97, '1761083638.jpeg', '2025-10-21 14:53:58', '2025-08-21 15:26:16', 0),
(315, 'Stopmap kertas Folio tipe 5001', 'XNCT8114', 22, 1000, 2000, 164, '1761083666.jpg', '2025-10-21 14:54:26', '2025-08-21 15:25:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_orders`
--

CREATE TABLE `marketplace_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `pickup_name` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `total_price` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketplace_orders`
--

INSERT INTO `marketplace_orders` (`id`, `user_id`, `code`, `status`, `pickup_name`, `phone`, `notes`, `total_price`, `created_at`, `updated_at`) VALUES
(3, 15, 'PO-E9F2VKG8', 'completed', 'abuya', '123122323221', 'ambil jam 2', 14000.00, '2025-11-06 18:24:46', '2025-11-06 18:26:48'),
(4, 16, 'PO-EXBKUK7I', 'completed', 'berlian permata suci', '089541064646', 'terima', 28000.00, '2025-11-07 15:48:03', '2025-11-07 16:08:17'),
(5, 15, 'PO-LTE3QTG4', 'pending_pickup', 'abuya', '9684654416', NULL, 18000.00, '2025-11-07 16:33:13', '2025-11-07 16:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_order_items`
--

CREATE TABLE `marketplace_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `price` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketplace_order_items`
--

INSERT INTO `marketplace_order_items` (`id`, `order_id`, `item_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(6, 3, 311, 2, 7000.00, '2025-11-06 18:24:46', '2025-11-06 18:24:46'),
(7, 4, 314, 1, 22000.00, '2025-11-07 15:48:03', '2025-11-07 15:48:03'),
(8, 4, 315, 1, 2000.00, '2025-11-07 15:48:03', '2025-11-07 15:48:03'),
(9, 4, 312, 1, 4000.00, '2025-11-07 15:48:03', '2025-11-07 15:48:03'),
(10, 5, 312, 1, 4000.00, '2025-11-07 16:33:13', '2025-11-07 16:33:13'),
(11, 5, 315, 1, 2000.00, '2025-11-07 16:33:13', '2025-11-07 16:33:13'),
(12, 5, 313, 1, 12000.00, '2025-11-07 16:33:13', '2025-11-07 16:33:13');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_21_174125_create_categories_table', 1),
(5, '2024_05_21_174227_create_customers_table', 1),
(6, '2024_05_21_174511_create_payment_methods_table', 1),
(7, '2024_05_21_175122_create_item_supplier_table', 1),
(8, '2024_05_21_175123_create_wholesale_prices_table', 1),
(9, '2024_05_21_182615_create_carts_table', 1),
(10, '2024_05_22_030109_create_transactions_table', 1),
(11, '2024_05_22_030902_create_transaction_details_table', 1),
(12, '2024_05_27_072011_create_absences_table', 1),
(13, '2024_10_28_000001_create_inventory_settings_table', 1),
(14, '2024_10_28_000002_create_stock_movement_analyses_table', 1),
(15, '2024_10_28_000003_create_sessions_table', 1),
(16, '2025_07_23_105030_create_supplier_products_table', 1),
(17, '2025_07_23_145713_create_purchase_orders_table', 1),
(18, '2025_07_23_145728_create_purchase_order_items_table', 1),
(19, '2025_09_03_000000_add_customer_role_and_contact_to_users_table', 1),
(20, '2025_09_04_000001_create_marketplace_orders_table', 1),
(21, '2025_09_04_000002_create_marketplace_order_items_table', 1),
(22, '2025_10_08_010229_add_online_fields_to_transactions_table', 1),
(23, '2025_10_13_000001_create_purchase_requests_table', 1),
(24, '2025_10_13_000002_create_purchase_request_items_table', 1),
(25, '2025_10_13_000004_create_goods_receipts_table', 1),
(26, '2025_10_13_000005_create_goods_receipt_items_table', 1),
(27, '2025_10_13_000006_create_invoices_table', 1),
(28, '2025_10_23_000007_add_required_columns_to_purchase_orders_and_items', 1),
(29, '2025_10_23_000008_make_purchase_order_items_item_id_nullable', 1),
(30, '2025_10_27_000001_add_username_and_picture_to_users', 1),
(31, '2025_11_05_234144_remove_unused_columns_from_goods_receipts', 2),
(32, '2025_11_05_234855_create_inventory_records_table', 3),
(33, '2025_11_06_000001_add_expiry_columns_to_goods_receipt_items', 4),
(34, '0001_01_01_000000_create_items_table', 5),
(35, '2025_11_07_232719_create_cart_items_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Tunai',
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tunai', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(2, 'Debit', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(3, 'Kredit', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(4, 'Transfer', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(5, 'OVO', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(6, 'GoPay', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(7, 'Dana', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(8, 'QRIS', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_number` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `po_date` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `supplier_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `supplier_notes` text DEFAULT NULL,
  `invoice_image_path` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prices_confirmed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `po_number`, `supplier_id`, `purchase_request_id`, `po_date`, `status`, `total_amount`, `supplier_confirmed`, `supplier_notes`, `invoice_image_path`, `created_by`, `created_at`, `updated_at`, `prices_confirmed`) VALUES
(30, 'PO/2025/11/0001', 26, 25, '2025-11-07', 'completed', 360000.00, 0, NULL, NULL, 12, '2025-11-06 17:09:57', '2025-11-06 18:28:14', 1),
(31, 'PO/2025/11/0002', 27, 27, '2025-11-07', 'completed', 825000.00, 0, NULL, NULL, 12, '2025-11-06 19:10:37', '2025-11-06 19:14:44', 1),
(32, 'PO/2025/11/0003', 29, 26, '2025-11-07', 'completed', 1600000.00, 0, NULL, NULL, 12, '2025-11-06 19:10:58', '2025-11-06 19:12:49', 1),
(33, 'PO/2025/11/0004', 28, 29, '2025-11-07', 'sent', 800000.00, 0, NULL, NULL, 12, '2025-11-06 20:34:08', '2025-11-06 20:34:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `item_id`, `product_name`, `quantity`, `unit`, `unit_price`, `notes`, `created_at`, `updated_at`) VALUES
(74, 30, NULL, 'Oasis Air Minum Box of 330 mL', 10, 'box', 15000.00, NULL, '2025-11-06 17:09:57', '2025-11-06 17:10:32'),
(75, 30, NULL, 'Oasis Air Minum Box of 240 mL', 5, 'box', 17000.00, NULL, '2025-11-06 17:09:57', '2025-11-06 17:10:32'),
(76, 30, NULL, 'Oasis Air Minum Box of 600 mL', 5, 'box', 25000.00, NULL, '2025-11-06 17:09:57', '2025-11-06 17:10:32'),
(77, 31, NULL, 'Cairan Pembersih Lantai Wipol 750ML', 55, 'pcs', 7000.00, NULL, '2025-11-06 19:10:37', '2025-11-06 19:14:02'),
(78, 31, NULL, 'Cairan Pembersih Lantai Porselen Vixal 750M', 55, 'pcs', 8000.00, NULL, '2025-11-06 19:10:37', '2025-11-06 19:14:02'),
(79, 32, NULL, 'Isi Stapler No. 10 Kangaro', 15, 'pcs', 20000.00, NULL, '2025-11-06 19:10:58', '2025-11-06 19:11:40'),
(80, 32, NULL, 'clip box binder clip 200 joyko', 22, 'pcs', 25000.00, NULL, '2025-11-06 19:10:58', '2025-11-06 19:11:40'),
(81, 32, NULL, 'Pulpen dan Pensil Standard ST 009', 25, 'box', 30000.00, NULL, '2025-11-06 19:10:58', '2025-11-06 19:11:40'),
(82, 33, NULL, 'Batere ABC Alkaline Uk AA', 20, 'pcs', 15000.00, NULL, '2025-11-06 20:34:08', '2025-11-06 20:34:30'),
(83, 33, NULL, 'Batere ABC Alkaline Uk AAA', 20, 'box', 20000.00, NULL, '2025-11-06 20:34:08', '2025-11-06 20:34:30'),
(84, 33, NULL, 'Post It Sign Here (Arrow) Tom dan Jerry', 10, 'box', 10000.00, NULL, '2025-11-06 20:34:08', '2025-11-06 20:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_requests`
--

CREATE TABLE `purchase_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pr_number` varchar(255) NOT NULL,
  `requested_by` bigint(20) UNSIGNED NOT NULL,
  `request_date` date NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `approval_status` varchar(255) NOT NULL DEFAULT 'pending',
  `approval_notes` text DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `validation_document_path` varchar(255) DEFAULT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_requests`
--

INSERT INTO `purchase_requests` (`id`, `pr_number`, `requested_by`, `request_date`, `supplier_id`, `status`, `approved_by`, `approved_at`, `approval_status`, `approval_notes`, `rejection_reason`, `validation_document_path`, `is_validated`, `description`, `created_at`, `updated_at`) VALUES
(25, 'PR-0001/11/2025', 12, '2025-11-07', 26, 'po_created', 12, '2025-11-06 17:09:54', 'approved', NULL, NULL, NULL, 0, NULL, '2025-11-06 17:09:46', '2025-11-06 17:09:57'),
(26, 'PR-0002/11/2025', 12, '2025-11-07', 29, 'po_created', 12, '2025-11-06 19:10:34', 'approved', NULL, NULL, NULL, 0, NULL, '2025-11-06 19:09:01', '2025-11-06 19:10:58'),
(27, 'PR-0003/11/2025', 12, '2025-11-07', 27, 'po_created', 12, '2025-11-06 19:10:25', 'approved', NULL, NULL, NULL, 0, NULL, '2025-11-06 19:09:21', '2025-11-06 19:10:37'),
(29, 'PR-0004/11/2025', 12, '2025-11-07', 28, 'po_created', 12, '2025-11-06 20:34:04', 'approved', NULL, NULL, NULL, 0, NULL, '2025-11-06 20:33:57', '2025-11-06 20:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request_items`
--

CREATE TABLE `purchase_request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(255) DEFAULT 'pcs',
  `current_stock` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_request_items`
--

INSERT INTO `purchase_request_items` (`id`, `purchase_request_id`, `product_name`, `quantity`, `unit`, `current_stock`, `notes`, `created_at`, `updated_at`) VALUES
(60, 25, 'Oasis Air Minum Box of 330 mL', 10, 'box', 0, NULL, '2025-11-06 17:09:46', '2025-11-06 17:09:46'),
(61, 25, 'Oasis Air Minum Box of 240 mL', 5, 'box', 0, NULL, '2025-11-06 17:09:46', '2025-11-06 17:09:46'),
(62, 25, 'Oasis Air Minum Box of 600 mL', 5, 'box', 0, NULL, '2025-11-06 17:09:46', '2025-11-06 17:09:46'),
(63, 26, 'Isi Stapler No. 10 Kangaro', 15, 'pcs', 0, NULL, '2025-11-06 19:09:01', '2025-11-06 19:09:01'),
(64, 26, 'clip box binder clip 200 joyko', 22, 'pcs', 0, NULL, '2025-11-06 19:09:01', '2025-11-06 19:09:01'),
(65, 26, 'Pulpen dan Pensil Standard ST 009', 25, 'box', 0, NULL, '2025-11-06 19:09:01', '2025-11-06 19:09:01'),
(66, 27, 'Cairan Pembersih Lantai Wipol 750ML', 55, 'pcs', 0, NULL, '2025-11-06 19:09:21', '2025-11-06 19:09:21'),
(67, 27, 'Cairan Pembersih Lantai Porselen Vixal 750M', 55, 'pcs', 0, NULL, '2025-11-06 19:09:21', '2025-11-06 19:09:21'),
(70, 29, 'Batere ABC Alkaline Uk AA', 20, 'pcs', 0, NULL, '2025-11-06 20:33:57', '2025-11-06 20:33:57'),
(71, 29, 'Batere ABC Alkaline Uk AAA', 20, 'box', 0, NULL, '2025-11-06 20:33:57', '2025-11-06 20:33:57'),
(72, 29, 'Post It Sign Here (Arrow) Tom dan Jerry', 10, 'box', 0, NULL, '2025-11-06 20:33:57', '2025-11-06 20:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BpbJdFYL5RKQTKbC5jO68LB041lBL0sGrz1Fci4p', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGtyb25VWDd6YkZheTRQVTZsb0Jac1Jac1ppS3g5dGVyemw4NWNJaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jdXN0b21lci9sb2dpbiI7fX0=', 1762558793),
('rSOPa8q39mAe6WCS1tTUnZLxA6ellJdZqIys1eXh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZVFzQzVlajZqdjRrdmQyQlRlZFNadnR6ZTI0V0luZnNFcXhFZlVSSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762554881);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movement_analyses`
--

CREATE TABLE `stock_movement_analyses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `total_sold_30_days` int(11) NOT NULL DEFAULT 0,
  `avg_daily_sales` decimal(8,2) NOT NULL DEFAULT 0.00,
  `movement_status` enum('FAST','NORMAL','SLOW') NOT NULL DEFAULT 'NORMAL',
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `days_until_empty` int(11) DEFAULT NULL,
  `non_moving_days` int(11) NOT NULL DEFAULT 0,
  `stuck_stock_value` decimal(15,2) NOT NULL DEFAULT 0.00,
  `recommendation` varchar(255) DEFAULT NULL,
  `suggested_reorder_qty` int(11) DEFAULT NULL,
  `last_sale_date` timestamp NULL DEFAULT NULL,
  `last_analysis_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`, `email`, `description`, `created_at`, `updated_at`) VALUES
(26, 'PT. Oasis Waters International', '0711432446', 'Jl. Kantor Lurah Lorong Anggrek RT 21 RW 04 Sukomoro Km. 18, Lawang Kidul, Kec. Ilir Tim. II, Kab. Banyuasin, Sumatera Selatan 30961', NULL, 'Pemesanan Barang Melalui Website resmi https://id1908657-pt-oasis-waters-international.contact.page/#google_vignette', '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(27, 'PT. Delta Muster Rise', '08125523455', 'Jl. Pangeran Ayin Komp. Sako Permai Blok E No. 5, Kel. Sako Baru Palembang, Sumatera Selatan, Indonesia', NULL, 'Barang di pesan Melalui website https://www.indotrading.com/deltamusterrise', '2025-11-04 23:32:33', '2025-11-04 23:32:57'),
(28, 'PT. Surya Vesakha Pamungkas', '0892444434544', 'Jl. Sei Itam No. 77 Kelurahan Bukit Lama Kecamatan Ilir Barat I Palembang, Sumatera Selatan, Indonesia', NULL, 'Produk dipesan melalui website resmi https://www.indotrading.com/suryavesakhapamungkas', '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(29, 'CV. Dempo Center', '089232555222', 'Jl. Sultan M Mansyur Toko Dempo Laundry, Bukit Lama, Ilir Barat 1, Kota palembang, Palembang, Sumatera Selatan', NULL, 'Produk dipesan melalui website resmi https://www.indotrading.com/dempocenter', '2025-11-04 23:47:54', '2025-11-04 23:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_products`
--

CREATE TABLE `supplier_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `min_order` int(11) NOT NULL DEFAULT 1,
  `lead_time` int(11) DEFAULT NULL COMMENT 'Lead time in days',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_products`
--

INSERT INTO `supplier_products` (`id`, `supplier_id`, `item_id`, `product_name`, `price`, `min_order`, `lead_time`, `created_at`, `updated_at`) VALUES
(1, 26, NULL, 'Oasis Air Minum 240 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(2, 26, NULL, 'Oasis Air Minum 300 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(3, 26, NULL, 'Oasis Air Minum 600 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(4, 26, NULL, 'Oasis Air Minum 1500 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(5, 26, NULL, 'Oasis Air Minum Box of 330 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(6, 26, NULL, 'Oasis Air Minum Box of 240 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(7, 26, NULL, 'Oasis Air Minum Box of 600 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(8, 26, NULL, 'Oasis Air Minum Box of 1500 mL', NULL, 1, NULL, '2025-11-04 23:28:32', '2025-11-04 23:28:32'),
(12, 27, NULL, 'Cairan Pembersih Lantai Porselen Vixal 750M', NULL, 1, NULL, '2025-11-04 23:33:35', '2025-11-04 23:33:35'),
(13, 27, NULL, 'Cairan Pembersih Lantai Wipol 750ML', NULL, 1, NULL, '2025-11-04 23:33:35', '2025-11-04 23:33:35'),
(14, 27, NULL, 'Sunlight Sabun Cuci Piring Sunlight Lime 650ml', NULL, 1, NULL, '2025-11-04 23:33:35', '2025-11-04 23:33:35'),
(15, 28, NULL, 'Post It Sign Here (Arrow) Tom dan Jerry', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(16, 28, NULL, 'Stopmap Folio Diamond Tipe 5002', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(17, 28, NULL, 'Pensil 2B Faber Castell 1 Pack', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(18, 28, NULL, 'Ballpoint K-1 Kenko 1 Pack', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(19, 28, NULL, 'Batere ABC Alkaline Uk AAA', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(20, 28, NULL, 'Batere ABC Alkaline Uk AA', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(21, 28, NULL, 'Stopmap kertas Folio tipe 5001', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(22, 28, NULL, 'Binder Clips Tipe 105 Kenko', NULL, 1, NULL, '2025-11-04 23:42:45', '2025-11-04 23:42:45'),
(33, 29, NULL, 'Note BANTEX FLEXI TAB 5 NEON COLOUR', NULL, 1, NULL, '2025-11-07 14:01:24', '2025-11-07 14:01:24'),
(34, 29, NULL, 'Lem Stick UHU 8 ram', NULL, 1, NULL, '2025-11-07 14:01:24', '2025-11-07 14:01:24'),
(35, 29, NULL, 'Lem Stick UHU 21 gram', NULL, 1, NULL, '2025-11-07 14:01:24', '2025-11-07 14:01:24'),
(36, 29, NULL, 'penghapus faber castell Putih KECIL 1872', NULL, 1, NULL, '2025-11-07 14:01:24', '2025-11-07 14:01:24'),
(37, 29, NULL, 'Spidol dan Highlighter spidol whiteboard snowman', NULL, 1, NULL, '2025-11-07 14:01:24', '2025-11-07 14:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice` varchar(255) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `change` int(11) NOT NULL DEFAULT 0,
  `status` enum('paid','debt') NOT NULL DEFAULT 'paid',
  `payment_status` varchar(255) DEFAULT NULL,
  `pickup_status` varchar(255) DEFAULT NULL,
  `pickup_code` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `customer_id`, `invoice`, `invoice_no`, `total`, `discount`, `payment_method_id`, `channel`, `amount`, `change`, `status`, `payment_status`, `pickup_status`, `pickup_code`, `note`, `created_at`, `updated_at`) VALUES
(19, 12, NULL, '0711250001', '1', 105000, 0, 1, NULL, 105000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 07/11/2025 00:06)', '2025-11-06 17:06:29', '2025-11-06 17:06:29'),
(22, 12, NULL, '0711250002', '2', 105000, 0, 1, NULL, 105000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 07/11/2025 01:21)', '2025-11-06 18:21:10', '2025-11-06 18:21:11'),
(23, 14, NULL, '0711250003', '3', 14000, 0, 1, 'online', 14000, 0, 'paid', 'paid', 'picked_up', 'PO-E9F2VKG8', 'Marketplace pickup: abuya (123122323221)', '2025-11-06 18:26:48', '2025-11-06 18:26:48'),
(24, 12, NULL, '0711250004', '4', 184000, 0, 7, NULL, 184000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 07/11/2025 03:24)', '2025-11-06 20:24:24', '2025-11-06 20:24:24'),
(25, 12, NULL, '0711250005', '5', 60000, 0, 1, NULL, 60000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 07/11/2025 21:04)', '2025-11-07 14:04:52', '2025-11-07 14:04:52'),
(28, 12, NULL, '0711250006', '6', 34000, 0, 1, NULL, 34000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 07/11/2025 21:27)', '2025-11-07 14:27:13', '2025-11-07 14:27:13'),
(29, 12, NULL, '0711250007', '7', 15000, 0, 7, NULL, 15000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 07/11/2025 21:40)', '2025-11-07 14:40:57', '2025-11-07 14:40:57'),
(30, 12, NULL, '3009250001', '1', 23000, 0, 7, NULL, 23000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 30/09/2025 21:49)', '2025-09-30 14:49:12', '2025-09-30 14:49:12'),
(31, 12, NULL, '2110250001', '1', 20000, 0, 7, NULL, 20000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/10/2025 21:50)', '2025-10-21 14:50:39', '2025-10-21 14:50:40'),
(32, 12, NULL, '2110250002', '2', 60000, 0, 7, NULL, 60000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/10/2025 21:54)', '2025-10-21 14:54:54', '2025-10-21 14:54:54'),
(33, 12, NULL, '2108250001', '1', 22000, 0, 7, NULL, 22000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/08/2025 22:25)', '2025-08-21 15:25:05', '2025-08-21 15:25:05'),
(34, 12, NULL, '2108250002', '2', 12000, 0, 1, NULL, 12000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/08/2025 22:25)', '2025-08-21 15:25:24', '2025-08-21 15:25:24'),
(35, 12, NULL, '2108250002', '2', 8000, 0, 1, NULL, 8000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/08/2025 22:25)', '2025-08-21 15:25:56', '2025-08-21 15:25:56'),
(36, 12, NULL, '2108250003', '3', 22000, 0, 1, NULL, 22000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/08/2025 22:26)', '2025-08-21 15:26:16', '2025-08-21 15:26:16'),
(37, 12, NULL, '2108250004', '4', 1200000, 0, 7, NULL, 1200000, 0, 'paid', NULL, NULL, NULL, '(diproses: syafiq Muhammad Alif, 21/08/2025 22:27)', '2025-08-21 15:27:50', '2025-08-21 15:27:50'),
(38, 14, NULL, '0711250008', '8', 28000, 0, 1, 'online', 28000, 0, 'paid', 'paid', 'picked_up', 'PO-EXBKUK7I', 'Marketplace pickup: berlian permata suci (089541064646)', '2025-11-07 16:08:17', '2025-11-07 16:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `item_price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `item_id`, `qty`, `item_price`, `total`, `created_at`, `updated_at`) VALUES
(10, 19, 311, 15, 7000, 105000, '2025-11-06 17:06:29', '2025-11-06 17:06:29'),
(11, 22, 311, 15, 7000, 105000, '2025-11-06 18:21:11', '2025-11-06 18:21:11'),
(12, 23, 311, 2, 7000, 14000, '2025-11-06 18:26:48', '2025-11-06 18:26:48'),
(13, 24, 312, 25, 4000, 100000, '2025-11-06 20:24:24', '2025-11-06 20:24:24'),
(14, 24, 311, 12, 7000, 84000, '2025-11-06 20:24:24', '2025-11-06 20:24:24'),
(15, 25, 312, 15, 4000, 60000, '2025-11-07 14:04:52', '2025-11-07 14:04:52'),
(16, 28, 311, 2, 7000, 14000, '2025-11-07 14:27:13', '2025-11-07 14:27:13'),
(17, 28, 312, 5, 4000, 20000, '2025-11-07 14:27:13', '2025-11-07 14:27:13'),
(18, 29, 311, 1, 7000, 7000, '2025-11-07 14:40:57', '2025-11-07 14:40:57'),
(19, 29, 312, 2, 4000, 8000, '2025-11-07 14:40:57', '2025-11-07 14:40:57'),
(20, 30, 311, 1, 7000, 7000, '2025-09-30 14:49:12', '2025-09-30 14:49:12'),
(21, 30, 312, 4, 4000, 16000, '2025-09-30 14:49:12', '2025-09-30 14:49:12'),
(22, 31, 312, 5, 4000, 20000, '2025-10-21 14:50:40', '2025-10-21 14:50:40'),
(23, 32, 315, 30, 2000, 60000, '2025-10-21 14:54:54', '2025-10-21 14:54:54'),
(24, 33, 314, 1, 22000, 22000, '2025-08-21 15:25:05', '2025-08-21 15:25:05'),
(25, 34, 313, 1, 12000, 12000, '2025-08-21 15:25:24', '2025-08-21 15:25:24'),
(26, 35, 315, 4, 2000, 8000, '2025-08-21 15:25:56', '2025-08-21 15:25:56'),
(27, 36, 314, 1, 22000, 22000, '2025-08-21 15:26:16', '2025-08-21 15:26:16'),
(28, 37, 313, 100, 12000, 1200000, '2025-08-21 15:27:50', '2025-08-21 15:27:50'),
(29, 38, 314, 1, 22000, 22000, '2025-11-07 16:08:17', '2025-11-07 16:08:17'),
(30, 38, 315, 1, 2000, 2000, '2025-11-07 16:08:17', '2025-11-07 16:08:17'),
(31, 38, 312, 1, 4000, 4000, '2025-11-07 16:08:17', '2025-11-07 16:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `position` varchar(255) DEFAULT NULL,
  `picture` varchar(255) NOT NULL DEFAULT 'profile.jpg',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `address`, `email_verified_at`, `password`, `role`, `position`, `picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 'Admin', 'admin', 'admin@example.com', NULL, NULL, NULL, '$2y$12$Fsrtrf5lhPBp7bvFsxlj5OYahk.W.5zPE0DWjqfrT/pO9563n3oJe', 'owner', 'Owner', 'profile.jpg', NULL, '2025-11-03 19:01:38', '2025-11-03 19:01:38'),
(12, 'syafiq Muhammad Alif', 'syafiq', 'syafiqma12@gmail.com', '0895701033483', NULL, NULL, '$2y$12$h4BahVKKSHlJi7wq4z0KUe4cBLF/N66WBRMk0Q2XvcErxMO13u1I2', 'supervisor', 'Manager Operasional', '1762323210.jpg', NULL, '2025-11-04 23:13:30', '2025-11-04 23:13:30'),
(14, 'riski halimawan', 'riski', 'Riskihal1221@gmail.com', '089211223322', NULL, NULL, '$2y$12$/HzTkTGEjwgiMqGj0WSFN.DtK0NTIjYP8Q0cbrEFKKOQ/UcjbJUt6', 'cashier', 'Kasir', '1762323377.jpg', NULL, '2025-11-04 23:16:17', '2025-11-04 23:16:17'),
(15, 'abuya', 'abuya', 'abuya12@gmail.com', '08923232', 'Jalan Griyas', NULL, '$2y$12$w9TB6wEzmqJoaHYHxZEWjOJUWRmwbhaH/IMMrmTnR0/maRxj51JQu', 'customer', NULL, 'profile.jpg', NULL, '2025-11-04 23:17:31', '2025-11-04 23:17:31'),
(16, 'berlian permata suci', 'berlian', 'berlianpsuci22@Gmail.com', '0892452222', 'perumahan mitra agung', NULL, '$2y$12$Dnv3MpN1dQQt3Qp.G.YJZO4IGqbWohtAL0FRjZt11Fp.WYBuWbzcC', 'customer', NULL, 'profile.jpg', NULL, '2025-11-04 23:18:04', '2025-11-04 23:18:04'),
(17, 'jihan kirana', 'jihank', 'jihank12@gmail.com', '08989612983', NULL, NULL, '$2y$12$.cpWDLmSbsHyDGCHoW5qROOhF/qhdVzdg3Hdf0a6yIow8BRoqbNvu', 'admin', 'Admin Gudang', '1762331727.jpg', NULL, '2025-11-05 01:35:27', '2025-11-05 01:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `wholesale_prices`
--

CREATE TABLE `wholesale_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `min_qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absences_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_item_id_foreign` (`item_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_items_user_id_item_id_unique` (`user_id`,`item_id`),
  ADD KEY `cart_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `goods_receipts`
--
ALTER TABLE `goods_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gr_number` (`gr_number`),
  ADD KEY `purchase_order_id` (`purchase_order_id`),
  ADD KEY `received_by` (`received_by`);

--
-- Indexes for table `goods_receipt_items`
--
ALTER TABLE `goods_receipt_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_receipt_id` (`goods_receipt_id`),
  ADD KEY `idx_lot_code` (`lot_code`),
  ADD KEY `idx_item_expiry` (`item_id`,`expiry_date`),
  ADD KEY `idx_batch_number` (`batch_number`);

--
-- Indexes for table `inventory_batches`
--
ALTER TABLE `inventory_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_batches_lot_code_index` (`lot_code`),
  ADD KEY `inventory_batches_item_id_expiry_date_index` (`item_id`,`expiry_date`);

--
-- Indexes for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gr_item_type` (`goods_receipt_item_id`,`type`),
  ADD KEY `idx_reference` (`ref_type`,`ref_id`);

--
-- Indexes for table `inventory_records`
--
ALTER TABLE `inventory_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_records_goods_receipt_id_foreign` (`goods_receipt_id`);

--
-- Indexes for table `inventory_settings`
--
ALTER TABLE `inventory_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoices_purchase_order_id_foreign` (`purchase_order_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_code_unique` (`code`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_supplier_item_id_supplier_id_unique` (`item_id`,`supplier_id`),
  ADD KEY `item_supplier_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketplace_orders`
--
ALTER TABLE `marketplace_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketplace_orders_code_unique` (`code`),
  ADD KEY `marketplace_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `marketplace_order_items`
--
ALTER TABLE `marketplace_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketplace_order_items_order_id_foreign` (`order_id`),
  ADD KEY `marketplace_order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`),
  ADD KEY `purchase_orders_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchase_orders_purchase_request_id_foreign` (`purchase_request_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  ADD KEY `purchase_order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_requests_pr_number_unique` (`pr_number`),
  ADD KEY `purchase_requests_requested_by_foreign` (`requested_by`),
  ADD KEY `purchase_requests_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchase_requests_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_request_items_purchase_request_id_foreign` (`purchase_request_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_movement_analyses`
--
ALTER TABLE `stock_movement_analyses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movement_analyses_item_id_foreign` (`item_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_products_supplier_id_foreign` (`supplier_id`),
  ADD KEY `supplier_products_item_id_foreign` (`item_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_customer_id_foreign` (`customer_id`),
  ADD KEY `transactions_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_details_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_details_item_id_foreign` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wholesale_prices`
--
ALTER TABLE `wholesale_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wholesale_prices_item_id_foreign` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goods_receipts`
--
ALTER TABLE `goods_receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `goods_receipt_items`
--
ALTER TABLE `goods_receipt_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `inventory_batches`
--
ALTER TABLE `inventory_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `inventory_records`
--
ALTER TABLE `inventory_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `inventory_settings`
--
ALTER TABLE `inventory_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketplace_orders`
--
ALTER TABLE `marketplace_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marketplace_order_items`
--
ALTER TABLE `marketplace_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `stock_movement_analyses`
--
ALTER TABLE `stock_movement_analyses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `supplier_products`
--
ALTER TABLE `supplier_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wholesale_prices`
--
ALTER TABLE `wholesale_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `goods_receipts`
--
ALTER TABLE `goods_receipts`
  ADD CONSTRAINT `goods_receipts_ibfk_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goods_receipts_ibfk_2` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `goods_receipt_items`
--
ALTER TABLE `goods_receipt_items`
  ADD CONSTRAINT `fk_gr_items_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `goods_receipt_items_ibfk_1` FOREIGN KEY (`goods_receipt_id`) REFERENCES `goods_receipts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_batches`
--
ALTER TABLE `inventory_batches`
  ADD CONSTRAINT `inventory_batches_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD CONSTRAINT `fk_movement_gr_item` FOREIGN KEY (`goods_receipt_item_id`) REFERENCES `goods_receipt_items` (`id`);

--
-- Constraints for table `inventory_records`
--
ALTER TABLE `inventory_records`
  ADD CONSTRAINT `inventory_records_goods_receipt_id_foreign` FOREIGN KEY (`goods_receipt_id`) REFERENCES `goods_receipts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD CONSTRAINT `item_supplier_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_supplier_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketplace_orders`
--
ALTER TABLE `marketplace_orders`
  ADD CONSTRAINT `marketplace_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketplace_order_items`
--
ALTER TABLE `marketplace_order_items`
  ADD CONSTRAINT `marketplace_order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `marketplace_order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `marketplace_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_purchase_request_id_foreign` FOREIGN KEY (`purchase_request_id`) REFERENCES `purchase_requests` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD CONSTRAINT `purchase_requests_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_requested_by_foreign` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_requests_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD CONSTRAINT `purchase_request_items_purchase_request_id_foreign` FOREIGN KEY (`purchase_request_id`) REFERENCES `purchase_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_movement_analyses`
--
ALTER TABLE `stock_movement_analyses`
  ADD CONSTRAINT `stock_movement_analyses_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD CONSTRAINT `supplier_products_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `supplier_products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_details_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wholesale_prices`
--
ALTER TABLE `wholesale_prices`
  ADD CONSTRAINT `wholesale_prices_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
