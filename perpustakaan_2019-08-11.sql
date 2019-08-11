# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Database: perpustakaan
# Generation Time: 2019-08-11 12:47:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table anggota
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;

INSERT INTO `anggota` (`id`, `user_id`, `npm`, `nama`, `tempat_lahir`, `tgl_lahir`, `jk`, `prodi`, `created_at`, `updated_at`)
VALUES
	(1,1,10000353,'Admin GC','Banjarmasin','2018-01-01','L','TI','2019-07-13 16:13:57','2019-07-13 16:13:57'),
	(2,2,10000375,'User GC','Banjarmasin','2019-01-01','L','TI','2019-07-13 16:13:57','2019-07-13 16:13:57');

/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table buku
# ------------------------------------------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;

INSERT INTO `buku` (`id`, `judul`, `isbn`, `pengarang`, `penerbit`, `tahun_terbit`, `jumlah_buku`, `deskripsi`, `lokasi`, `cover`, `created_at`, `updated_at`, `harga`)
VALUES
	(1,'Belajar Pemrograman Java','9920392749','Abdul Kadir','PT. Restu Ibu',2018,20,'Buku Pertama Belajar Pemrograman Java Utk Pemula','rak1','buku_java.jpg','2019-07-13 16:13:57','2019-08-03 10:39:48',10000),
	(2,'Pemrograman Android','9920395559','Muhammad Nurhidayat','PT. Restu Guru',2018,14,'Jurus Rahasia Menguasai Pemrograman Android','rak2','jurus_rahasia.jpg','2019-07-13 16:13:57','2019-07-13 16:13:57',10000),
	(3,'Android Application','9920392000','Dina Aulia','PT. Restu Ayah',2018,6,'Buku Pertama Belajar Pemrograman Java Utk Pemula','rak2',NULL,'2019-07-13 16:13:57','2019-08-03 10:41:21',10000);

/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2018_06_17_070037_create_anggotas_table',1),
	(3,'2018_06_17_130244_create_bukus_table',1),
	(4,'2018_06_18_014155_create_transaksis_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transaksi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anggota_id` int(10) unsigned NOT NULL,
  `buku_id` int(10) unsigned NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` enum('pinjam','kembali') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `denda` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `transaksi_anggota_id_foreign` (`anggota_id`),
  KEY `transaksi_buku_id_foreign` (`buku_id`),
  CONSTRAINT `transaksi_anggota_id_foreign` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaksi_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;

INSERT INTO `transaksi` (`id`, `kode_transaksi`, `anggota_id`, `buku_id`, `tgl_pinjam`, `tgl_kembali`, `status`, `ket`, `created_at`, `updated_at`, `denda`)
VALUES
	(1,'TR00001',2,3,'2019-08-03','2019-08-08','kembali',NULL,'2019-08-03 10:37:52','2019-08-03 10:41:21',0),
	(2,'TR00002',1,1,'2019-08-03','2019-08-08','kembali',NULL,'2019-08-03 10:39:40','2019-08-03 10:39:48',0);

/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `gambar`, `level`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin','admin@cariprogram.id','$2y$10$wZGCoZ75XXpFogZH8GjWUeb/G71oSpp6.LVe5367oYa/tVG.rGfxK',NULL,'admin','3VSF99ZyrSInuDL9bcjWz2vcDApEcxScSrp0Mv1CSq5JXf1q2vigUXwfySmC','2019-07-13 16:13:57','2019-07-13 16:13:57'),
	(2,'User','user','user@cariprogram.id','$2y$10$UefTBOSBa7Uv6sDL253IpelIgABpEEPKgAlsm3eTjuPzEu6S6.WPy',NULL,'user',NULL,'2019-07-13 16:13:57','2019-07-13 16:13:57');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
