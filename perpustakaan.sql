/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : perpustakaan

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 01/09/2019 14:21:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anggota
-- ----------------------------
DROP TABLE IF EXISTS `anggota`;
CREATE TABLE `anggota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `npm` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anggota_user_id_foreign` (`user_id`),
  CONSTRAINT `anggota_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of anggota
-- ----------------------------
BEGIN;
INSERT INTO `anggota` VALUES (1, 1, 10000353, 'Admin GC', 'Banjarmasin', '2018-01-01', 'L', 'TI', '2019-07-13 16:13:57', '2019-07-13 16:13:57');
INSERT INTO `anggota` VALUES (2, 2, 10000375, 'User GC', 'Banjarmasin', '2019-01-01', 'L', 'TI', '2019-07-13 16:13:57', '2019-07-13 16:13:57');
COMMIT;

-- ----------------------------
-- Table structure for buku
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengarang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penerbit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `jumlah_buku` int(11) NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `lokasi` enum('rak1','rak2','rak3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `denda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of buku
-- ----------------------------
BEGIN;
INSERT INTO `buku` VALUES (1, 'Belajar Pemrograman Java', '9920392749', 'Abdul Kadir', 'PT. Restu Ibu', 2018, 21, 'Buku Pertama Belajar Pemrograman Java Utk Pemula', 'rak1', NULL, '2019-07-13 16:13:57', '2019-09-01 07:15:36', 10000, 1000);
INSERT INTO `buku` VALUES (2, 'Pemrograman Android', '9920395559', 'Muhammad Nurhidayat', 'PT. Restu Guru', 2018, 14, 'Jurus Rahasia Menguasai Pemrograman Android', 'rak2', NULL, '2019-07-13 16:13:57', '2019-09-01 06:39:43', 10000, 1000);
INSERT INTO `buku` VALUES (3, 'Android Application', '9920392000', 'Dina Aulia', 'PT. Restu Ayah', 2018, 10, 'Buku Pertama Belajar Pemrograman Java Utk Pemula', 'rak2', NULL, '2019-07-13 16:13:57', '2019-09-01 07:12:04', 10000, 1000);
INSERT INTO `buku` VALUES (4, 'Kalkulius', '0092992', 'ABC', 'ABC', 2019, 1, 'ABC', 'rak1', '34973-2019-09-01-07-21-09.jpeg', '2019-09-01 07:21:09', '2019-09-01 07:21:09', 100000, 1000);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2018_06_17_070037_create_anggotas_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_06_17_130244_create_bukus_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_06_18_014155_create_transaksis_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anggota_id` int(10) unsigned NOT NULL,
  `buku_id` int(10) unsigned NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `dikembalikan` date DEFAULT NULL,
  `denda` int(11) DEFAULT '0',
  `status` enum('pinjam','kembali') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaksi_anggota_id_foreign` (`anggota_id`),
  KEY `transaksi_buku_id_foreign` (`buku_id`),
  CONSTRAINT `transaksi_anggota_id_foreign` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaksi_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
BEGIN;
INSERT INTO `transaksi` VALUES (1, 'TR00001', 2, 3, '2019-08-03', '2019-08-10', '2019-09-01', 22000, 'kembali', NULL, '2019-08-03 10:37:52', '2019-09-01 07:12:04');
INSERT INTO `transaksi` VALUES (2, 'TR00002', 1, 1, '2019-08-03', '2019-08-10', '2019-09-01', 22000, 'kembali', NULL, '2019-08-03 10:39:40', '2019-09-01 07:15:36');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'Admin', 'admin', 'admin@cariprogram.id', '$2y$10$wZGCoZ75XXpFogZH8GjWUeb/G71oSpp6.LVe5367oYa/tVG.rGfxK', NULL, 'admin', 'zDnhD50NLeqbywed8iEZguMfo77TRZ9tEEO6G6qnvtcymVXs8sl8V1jC79kE', '2019-07-13 16:13:57', '2019-07-13 16:13:57');
INSERT INTO `users` VALUES (2, 'User', 'user', 'user@cariprogram.id', '$2y$10$UefTBOSBa7Uv6sDL253IpelIgABpEEPKgAlsm3eTjuPzEu6S6.WPy', NULL, 'user', NULL, '2019-07-13 16:13:57', '2019-07-13 16:13:57');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
