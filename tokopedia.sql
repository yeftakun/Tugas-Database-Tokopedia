-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tokopedia
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detail_transaksi`
--

DROP TABLE IF EXISTS `detail_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_transaksi` (
  `detail_transaksi_id` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_transaksi_id`),
  KEY `idx_detail_transaksi_transaksi_id` (`transaksi_id`),
  KEY `idx_detail_transaksi_produk_id` (`produk_id`),
  CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_transaksi`
--

LOCK TABLES `detail_transaksi` WRITE;
/*!40000 ALTER TABLE `detail_transaksi` DISABLE KEYS */;
INSERT INTO `detail_transaksi` VALUES
(1,1,1,1),
(2,1,11,1),
(3,2,3,2),
(4,2,13,1),
(5,3,8,2),
(6,3,15,1),
(7,4,6,1),
(8,4,7,1),
(9,5,1,1),
(10,5,9,2),
(11,6,3,5),
(12,6,8,2),
(13,6,7,1),
(14,7,13,3),
(15,8,13,2),
(16,8,8,4),
(17,9,14,1),
(18,10,1,1),
(19,11,2,1),
(20,11,12,1),
(21,11,4,1),
(22,12,6,1),
(23,13,14,1),
(24,14,1,1),
(25,15,11,1);
/*!40000 ALTER TABLE `detail_transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ekspedisi`
--

DROP TABLE IF EXISTS `ekspedisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ekspedisi` (
  `ekspedisi_id` int(11) NOT NULL,
  `nama_ekspedisi` varchar(255) DEFAULT NULL,
  `biaya_kg` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ekspedisi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ekspedisi`
--

LOCK TABLES `ekspedisi` WRITE;
/*!40000 ALTER TABLE `ekspedisi` DISABLE KEYS */;
INSERT INTO `ekspedisi` VALUES
(1,'JNE',5000.00),
(2,'J&T',6000.00),
(3,'Pos Indonesia',4500.00),
(4,'SiCepat',5500.00),
(5,'Ninja Xpress',7000.00);
/*!40000 ALTER TABLE `ekspedisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `jenis_ktg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES
(1,'Elektronik'),
(2,'Fashion'),
(3,'Makanan'),
(4,'Olahraga'),
(5,'Buku');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `metode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES
(1,'Transfer Bank'),
(2,'Kartu Kredit'),
(3,'OVO'),
(4,'GoPay'),
(5,'Dana');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `bobot` decimal(10,2) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`produk_id`),
  KEY `idx_produk_user_id` (`user_id`),
  KEY `idx_produk_kategori_id` (`kategori_id`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES
(1,1,1,'Samsung Galaxy S21',10,0.20,10000000.00,'Smartphone terbaru dengan fitur canggih'),
(2,2,2,'Dress Wanita Floral',5,0.30,500000.00,'Dress wanita dengan motif bunga yang indah'),
(3,3,3,'Snack Box Assorted',20,0.50,75000.00,'Box snack berisi berbagai macam camilan favorit'),
(4,4,4,'Sepatu Lari Nike',8,0.60,800000.00,'Sepatu khusus untuk olahraga lari'),
(5,5,5,'Novel Best Seller',15,0.80,150000.00,'Novel terlaris dengan cerita yang menarik'),
(6,6,1,'Apple MacBook Pro',12,2.50,20000000.00,'Laptop canggih dengan performa tinggi'),
(7,7,2,'Tas Selempang Kulit',6,0.40,400000.00,'Tas selempang elegan dari bahan kulit asli'),
(8,8,3,'Kue Lapis Legit',25,1.00,120000.00,'Kue tradisional dengan tekstur yang lembut dan enak'),
(9,1,4,'Raket Badminton Yonex',10,0.90,900000.00,'Raket badminton berkualitas tinggi'),
(10,2,5,'Buku Panduan Fotografi',8,0.70,250000.00,'Buku panduan praktis untuk fotografi pemula'),
(11,3,1,'Xiaomi Mi Band 6',15,0.10,400000.00,'Smartband dengan berbagai fitur pendukung kebugaran'),
(12,4,2,'Kemeja Pria Slim Fit',5,0.30,300000.00,'Kemeja pria dengan model slim fit'),
(13,5,3,'Coklat Swiss Chocolate',20,0.20,100000.00,'Coklat premium dengan rasa lezat'),
(14,6,4,'Treadmill Elektrik',3,50.00,5000000.00,'Alat olahraga treadmill untuk latihan di rumah'),
(15,7,5,'Buku Motivasi Terbaik',12,0.60,150000.00,'Buku motivasi untuk menginspirasi dan memberi semangat');
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `detail_transaksi_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `komentar` varchar(300) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `idx_rating_detail_transaksi_id` (`detail_transaksi_id`),
  KEY `idx_rating_produk_id` (`produk_id`),
  KEY `idx_rating_user_id` (`user_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`detail_transaksi_id`) REFERENCES `detail_transaksi` (`detail_transaksi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES
(1,1,1,2,'Produk bagus, pengiriman cepat!',5),
(2,2,11,2,'Sudah di test, kualitas sesuai harga',5),
(3,3,3,1,'Enak min, mantappu jiwa!!!',5),
(4,4,13,1,'Coklatnya enak',5),
(5,5,8,3,'Lapis legitnya enak sih, tapi pengiriman lambat:(',2),
(6,6,15,3,'Bukunya bagus, aku akan merekomendasikan ke temanku tentang buku ini',4),
(7,7,6,2,'Baru nyoba migrasi ke ekosistem apple, ternyata enak juga',5),
(8,8,7,2,'Sesuai ekspektasi',5),
(9,9,1,5,'Hpnya bagus, saya cuman iseng aja:v',1),
(10,10,9,5,'Saya beli 2 kenaoa cuman datang 1',1),
(11,11,3,4,'Pengirimannya lama:(',4),
(12,12,8,4,'Kuenya enak',5),
(13,13,7,4,'Tasnya bagus, kualitas mantap',4),
(14,14,13,6,'Coklat!!! Coklat!!!',5),
(15,15,13,6,'Untuk rasanya enak! Tapi pengiriman lambat',3),
(16,16,8,6,'Lapis Legitnya enak, mantap',4),
(17,17,14,7,'Alatnya berfungsi dengan baik',5),
(18,18,1,4,'Hpnya bagus, pengiriman agak lama',2),
(19,19,2,8,'Sangat cocok, warnanya juga bagus',5),
(20,20,12,8,'Sangat cocok, pas di badan',5),
(21,21,4,8,'Sepatu yang bagus, dan nyaman. Untuk kualitas ya sesuai hargalah',5),
(22,22,6,7,'Pengiriman selamat sampai tujuan, packing rapi, dan berfungsi baik',4),
(23,23,14,8,'Joss',4),
(24,24,1,8,'Akhirnya bisa nyoba main genshin',4),
(25,25,11,5,'Pas di pergelangan tangan',4);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `total_dibayar` decimal(10,2) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `ekspedisi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaksi_id`),
  KEY `idx_transaksi_user_id` (`user_id`),
  KEY `idx_transaksi_payment_id` (`payment_id`),
  KEY `idx_transaksi_ekspedisi_id` (`ekspedisi_id`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ekspedisi_id`) REFERENCES `ekspedisi` (`ekspedisi_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES
(1,2,'2023-04-29',10400000.00,10400000.00,1,1),
(2,1,'2023-04-29',250000.00,250000.00,2,2),
(3,3,'2023-04-30',390000.00,390000.00,1,3),
(4,2,'2023-04-30',20400000.00,20400000.00,3,2),
(5,5,'2023-04-30',11800000.00,11800000.00,4,4),
(6,4,'2023-04-30',1015000.00,1015000.00,2,5),
(7,6,'2023-05-01',300000.00,300000.00,3,1),
(8,6,'2023-05-01',680000.00,680000.00,5,3),
(9,7,'2023-05-01',5000000.00,5000000.00,4,2),
(10,4,'2023-05-02',10000000.00,10000000.00,1,4),
(11,8,'2023-05-02',1600000.00,1600000.00,3,5),
(12,7,'2023-05-03',20000000.00,20000000.00,2,1),
(13,8,'2023-05-04',5000000.00,5000000.00,5,4),
(14,8,'2023-05-04',10000000.00,10000000.00,1,3),
(15,5,'2023-05-04',400000.00,400000.00,4,2);
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'Rudi Santoso','e2!ka76E1','rudi.santoso@gmail.com','Jakarta','1990-02-10'),
(2,'Yefta Asyel','s@d54fQ2!','yeftaasyel@gmail.com','Manado','1995-06-25'),
(3,'Bambang Suryanto','hR5@lD32','bambang.suryanto@outlook.co.id','Surabaya','1988-11-03'),
(4,'Theodorus Lahea','C9#m!k85','theodoruslahea@gmail.com','Jakarta','1992-09-18'),
(5,'Agus Prabowo','T$3t#m67','agus.prabowo@gmail.com','Semarang','1991-04-15'),
(6,'Dayen Manoppo','b8*ka2R!','dayenmanoppo@outlook.co.id','Surabaya','1994-07-29'),
(7,'Emanuel Mongkol','w6@!pQ5s','emanuelmongkol@gmail.com','Manado','1989-12-07'),
(8,'Gerald Takalamingan','L@#r5s3D','geraldtakalamingan@gmail.com','Jakarta','1993-03-22');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 20:32:22
