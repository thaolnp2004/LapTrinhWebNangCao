-- Sun Cosmetic — Database export
--
-- Host: localhost    Database: sun_cosmetic
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Current Database: `sun_cosmetic`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sun_cosmetic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `sun_cosmetic`;

--
-- Table structure for table `anh_san_pham`
--

DROP TABLE IF EXISTS `anh_san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anh_san_pham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_san_pham` int(11) NOT NULL,
  `duong_dan_anh` varchar(255) NOT NULL,
  `thu_tu` int(11) DEFAULT 0,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_san_pham` (`id_san_pham`),
  CONSTRAINT `anh_san_pham_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anh_san_pham`
--

LOCK TABLES `anh_san_pham` WRITE;
/*!40000 ALTER TABLE `anh_san_pham` DISABLE KEYS */;
INSERT INTO `anh_san_pham` VALUES (1,1,'assets/images/cosmetics/nuoc-tay-trang-hoa-hong-500ml-1-1.jpg',1,'2026-10-13 07:02:57'),(2,1,'assets/images/cosmetics/nuoc-tay-trang-hoa-hong-500ml-1-2.jpg',2,'2026-10-13 07:02:57'),(3,1,'assets/images/cosmetics/nuoc-tay-trang-hoa-hong-500ml-1-3.jpg',3,'2026-10-13 07:02:57'),(4,2,'assets/images/cosmetics/nuoc-tay-trang-sen-hau-giang-500ml-1.jpg',1,'2026-10-13 07:02:57'),(5,2,'assets/images/cosmetics/nuoc-tay-trang-sen-hau-giang-500ml-2.jpg',2,'2026-10-13 07:02:57'),(6,2,'assets/images/cosmetics/nuoc-tay-trang-sen-hau-giang-500ml-3.jpg',3,'2026-10-13 07:02:57'),(7,3,'assets/images/cosmetics/sua-rua-mat-sen-hau-giang-310ml-1.jpg',1,'2026-10-13 07:02:57'),(8,3,'assets/images/cosmetics/sua-rua-mat-sen-hau-giang-310ml-2.jpg',2,'2026-10-13 07:02:57'),(9,3,'assets/images/cosmetics/sua-rua-mat-sen-hau-giang-310ml-3.png',3,'2026-10-13 07:02:57'),(10,4,'assets/images/cosmetics/gel-rua-mat-ca-phe-dak-lak-140ml-1.jpg',1,'2026-10-13 07:02:57'),(11,4,'assets/images/cosmetics/gel-rua-mat-ca-phe-dak-lak-140ml-2.jpg',2,'2026-10-13 07:02:57'),(12,4,'assets/images/cosmetics/gel-rua-mat-ca-phe-dak-lak-140ml-3.jpg',3,'2026-10-13 07:02:57'),(13,5,'assets/images/cosmetics/nuoc-sen-hau-giang-310ml-1.jpg',1,'2026-10-13 07:02:57'),(14,5,'assets/images/cosmetics/nuoc-sen-hau-giang-310ml-2.jpg',2,'2026-10-13 07:02:57'),(15,5,'assets/images/cosmetics/nuoc-sen-hau-giang-310ml-3.jpg',3,'2026-10-13 07:02:57'),(16,6,'assets/images/cosmetics/nuoc-nghe-hung-yen-140ml-1.jpg',1,'2026-10-13 07:02:57'),(17,6,'assets/images/cosmetics/nuoc-nghe-hung-yen-140ml-2.jpg',2,'2026-10-13 07:02:57'),(18,6,'assets/images/cosmetics/nuoc-nghe-hung-yen-140ml-3.png',3,'2026-10-13 07:02:57'),(19,7,'assets/images/cosmetics/tinh-chat-hoa-hong-30ml-1.jpg',1,'2026-10-13 07:02:57'),(20,7,'assets/images/cosmetics/tinh-chat-hoa-hong-30ml-2.jpg',2,'2026-10-13 07:02:57'),(21,7,'assets/images/cosmetics/tinh-chat-hoa-hong-30ml-3.jpg',3,'2026-10-13 07:02:57'),(22,8,'assets/images/cosmetics/tinh-chat-xit-duong-sen-hau-giang-100ml-1.jpg',1,'2026-10-13 07:02:57'),(23,8,'assets/images/cosmetics/tinh-chat-xit-duong-sen-hau-giang-100ml-2.jpg',2,'2026-10-13 07:02:57'),(24,8,'assets/images/cosmetics/tinh-chat-xit-duong-sen-hau-giang-100ml-3.jpg',3,'2026-10-13 07:02:57'),(25,9,'assets/images/cosmetics/thach-hoa-hong-duong-am-30ml-1.jpg',1,'2026-10-13 07:02:57'),(26,9,'assets/images/cosmetics/thach-hoa-hong-duong-am-30ml-2.jpg',2,'2026-10-13 07:02:57'),(27,9,'assets/images/cosmetics/thach-hoa-hong-duong-am-30ml-3.jpg',3,'2026-10-13 07:02:57'),(28,10,'assets/images/cosmetics/thach-nghe-hung-yen-30ml-1.png',1,'2026-10-13 07:02:57'),(29,10,'assets/images/cosmetics/thach-nghe-hung-yen-30ml-2.png',2,'2026-10-13 07:02:57'),(30,10,'assets/images/cosmetics/thach-nghe-hung-yen-30ml-3.png',3,'2026-10-13 07:02:57'),(31,11,'assets/images/cosmetics/sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink-1.jpg',1,'2026-10-13 07:02:57'),(32,11,'assets/images/cosmetics/sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink-2.jpg',2,'2026-10-13 07:02:57'),(33,11,'assets/images/cosmetics/sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink-3.jpg',3,'2026-10-13 07:02:57'),(34,12,'assets/images/cosmetics/sua-chong-nang-bi-dao-50ml-1.png',1,'2026-10-13 07:02:57'),(35,12,'assets/images/cosmetics/sua-chong-nang-bi-dao-50ml-2.png',2,'2026-10-13 07:02:57'),(36,12,'assets/images/cosmetics/sua-chong-nang-bi-dao-50ml-3.png',3,'2026-10-13 07:02:57'),(37,13,'assets/images/cosmetics/mat-na-nghe-hung-yen-30ml-1.jpg',1,'2026-10-13 07:02:57'),(38,13,'assets/images/cosmetics/mat-na-nghe-hung-yen-30ml-2.jpg',2,'2026-10-13 07:02:57'),(39,13,'assets/images/cosmetics/mat-na-nghe-hung-yen-30ml-3.jpg',3,'2026-10-13 07:02:57'),(40,14,'assets/images/cosmetics/son-duong-dau-dua-ben-tre-5g-1.jpg',1,'2026-10-13 07:02:57'),(41,14,'assets/images/cosmetics/son-duong-dau-dua-ben-tre-5g-2.jpg',2,'2026-10-13 07:02:57'),(42,14,'assets/images/cosmetics/son-duong-dau-dua-ben-tre-5g-3.jpg',3,'2026-10-13 07:02:57'),(43,15,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-moi-5g-1.jpg',1,'2026-10-13 07:02:57'),(44,15,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-moi-5g-2.jpg',2,'2026-10-13 07:02:57'),(45,15,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-moi-5g-3.png',3,'2026-10-13 07:02:57'),(46,16,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml-1.jpg',1,'2026-10-13 07:02:57'),(47,16,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml-2.jpg',2,'2026-10-13 07:02:57'),(48,16,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml-3.jpg',3,'2026-10-13 07:02:57'),(49,17,'assets/images/cosmetics/gel-tam-duong-thot-not-an-giang-500ml-1.png',1,'2026-10-13 07:02:57'),(50,17,'assets/images/cosmetics/gel-tam-duong-thot-not-an-giang-500ml-2.png',2,'2026-10-13 07:02:57'),(51,17,'assets/images/cosmetics/gel-tam-duong-thot-not-an-giang-500ml-3.png',3,'2026-10-13 07:02:57'),(52,18,'assets/images/cosmetics/nuoc-duong-toc-tinh-dau-buoi-140ml-1-1.jpg',1,'2026-10-13 07:02:57'),(53,18,'assets/images/cosmetics/nuoc-duong-toc-tinh-dau-buoi-140ml-1-2.jpg',2,'2026-10-13 07:02:57'),(54,18,'assets/images/cosmetics/nuoc-duong-toc-tinh-dau-buoi-140ml-1-3.jpg',3,'2026-10-13 07:02:57'),(55,19,'assets/images/cosmetics/dau-goi-bo-ket-310ml-1.jpg',1,'2026-10-13 07:02:57'),(56,19,'assets/images/cosmetics/dau-goi-bo-ket-310ml-2.jpg',2,'2026-10-13 07:02:57'),(57,19,'assets/images/cosmetics/dau-goi-bo-ket-310ml-3.jpg',3,'2026-10-13 07:02:58'),(58,20,'assets/images/cosmetics/mat-na-bi-dao-30ml-1.jpg',1,'2026-10-13 07:02:58'),(59,20,'assets/images/cosmetics/mat-na-bi-dao-30ml-2.jpg',2,'2026-10-13 07:02:58'),(60,20,'assets/images/cosmetics/mat-na-bi-dao-30ml-3.jpg',3,'2026-10-13 07:02:58');
/*!40000 ALTER TABLE `anh_san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bang_quang_cao`
--

DROP TABLE IF EXISTS `bang_quang_cao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bang_quang_cao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(255) DEFAULT NULL,
  `tieu_de_phu` varchar(255) DEFAULT NULL,
  `hinh_anh` varchar(255) NOT NULL,
  `lien_ket` varchar(255) DEFAULT NULL,
  `vi_tri` varchar(50) DEFAULT 'hero',
  `thu_tu` int(11) DEFAULT 0,
  `trang_thai` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_quang_cao`
--

LOCK TABLES `bang_quang_cao` WRITE;
/*!40000 ALTER TABLE `bang_quang_cao` DISABLE KEYS */;
INSERT INTO `bang_quang_cao` VALUES (1,'Một chút nắng. Một chút yêu mình.','Chăm da cùng Sun Cosmetic','assets/images/sun-hero.png','/products','hero',1,'active'),(2,'Ưu đãi từ Sun','Mã SUN10','assets/images/sun-hero.png','/khuyen-mai','promo',1,'active');
/*!40000 ALTER TABLE `bang_quang_cao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binh_luan`
--

DROP TABLE IF EXISTS `binh_luan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binh_luan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_san_pham` int(11) NOT NULL,
  `id_nguoi_dung` int(11) NOT NULL,
  `id_cha` int(11) DEFAULT NULL,
  `noi_dung` text NOT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_san_pham` (`id_san_pham`),
  KEY `idx_cha` (`id_cha`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE,
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binh_luan`
--

LOCK TABLES `binh_luan` WRITE;
/*!40000 ALTER TABLE `binh_luan` DISABLE KEYS */;
/*!40000 ALTER TABLE `binh_luan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_don`
--

DROP TABLE IF EXISTS `chi_tiet_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chi_tiet_don` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_don_hang` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `hinh_thu_nho` varchar(255) DEFAULT NULL,
  `gia` decimal(15,2) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `tam_tinh` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_don_hang` (`id_don_hang`),
  KEY `idx_san_pham` (`id_san_pham`),
  CONSTRAINT `chi_tiet_don_ibfk_1` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hang` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don`
--

LOCK TABLES `chi_tiet_don` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don` DISABLE KEYS */;
INSERT INTO `chi_tiet_don` VALUES (5,7,7,'Cocoon Tinh chất hoa hồng 30ml','assets/images/cosmetics/tinh-chat-hoa-hong-30ml-1.jpg',261000.00,1,261000.00),(6,7,16,'Cocoon Cà phê Đắk Lắk làm sạch da chết cơ thể 200ml','assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml-1.jpg',133000.00,1,133000.00),(7,7,17,'Cocoon Gel tắm đường thốt nốt An Giang 500ml','assets/images/cosmetics/gel-tam-duong-thot-not-an-giang-500ml-1.png',241000.00,1,241000.00);
/*!40000 ALTER TABLE `chi_tiet_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dang_ky_nhan_tin`
--

DROP TABLE IF EXISTS `dang_ky_nhan_tin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dang_ky_nhan_tin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thu_dien_tu` varchar(255) NOT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `thu_dien_tu` (`thu_dien_tu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dang_ky_nhan_tin`
--

LOCK TABLES `dang_ky_nhan_tin` WRITE;
/*!40000 ALTER TABLE `dang_ky_nhan_tin` DISABLE KEYS */;
/*!40000 ALTER TABLE `dang_ky_nhan_tin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_gia`
--

DROP TABLE IF EXISTS `danh_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `danh_gia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_san_pham` int(11) NOT NULL,
  `id_nguoi_dung` int(11) NOT NULL,
  `diem_so` tinyint(4) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_san_pham` (`id_san_pham`),
  KEY `id_nguoi_dung` (`id_nguoi_dung`),
  CONSTRAINT `danh_gia_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE,
  CONSTRAINT `danh_gia_ibfk_2` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_gia`
--

LOCK TABLES `danh_gia` WRITE;
/*!40000 ALTER TABLE `danh_gia` DISABLE KEYS */;
/*!40000 ALTER TABLE `danh_gia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `danh_muc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  `duong_dan` varchar(150) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `bieu_tuong` varchar(50) DEFAULT 'folder',
  `hinh_anh` varchar(255) DEFAULT NULL,
  `id_cha` int(11) DEFAULT NULL,
  `thu_tu` int(11) DEFAULT 0,
  `trang_thai` enum('active','inactive') DEFAULT 'active',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `duong_dan` (`duong_dan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc`
--

LOCK TABLES `danh_muc` WRITE;
/*!40000 ALTER TABLE `danh_muc` DISABLE KEYS */;
INSERT INTO `danh_muc` VALUES (1,'Tẩy trang','tay-trang','Khám phá sản phẩm tẩy trang tại Sun Cosmetic','spa','assets/images/cosmetics/nuoc-tay-trang-hoa-hong-500ml-1-1.jpg',NULL,1,'active','2026-10-13 07:02:57'),(2,'Làm sạch','lam-sach','Khám phá sản phẩm làm sạch tại Sun Cosmetic','spa','assets/images/cosmetics/sua-rua-mat-sen-hau-giang-310ml-1.jpg',NULL,2,'active','2026-10-13 07:02:57'),(3,'Toner','toner','Khám phá sản phẩm toner tại Sun Cosmetic','spa','assets/images/cosmetics/nuoc-sen-hau-giang-310ml-1.jpg',NULL,3,'active','2026-10-13 07:02:57'),(4,'Serum & tinh chất','serum-tinh-chat','Khám phá sản phẩm serum & tinh chất tại Sun Cosmetic','spa','assets/images/cosmetics/tinh-chat-hoa-hong-30ml-1.jpg',NULL,4,'active','2026-10-13 07:02:57'),(5,'Dưỡng ẩm','duong-am','Khám phá sản phẩm dưỡng ẩm tại Sun Cosmetic','spa','assets/images/cosmetics/thach-hoa-hong-duong-am-30ml-1.jpg',NULL,5,'active','2026-10-13 07:02:57'),(6,'Chống nắng','chong-nang','Khám phá sản phẩm chống nắng tại Sun Cosmetic','spa','assets/images/cosmetics/sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink-1.jpg',NULL,6,'active','2026-10-13 07:02:57'),(7,'Mặt nạ','mat-na','Khám phá sản phẩm mặt nạ tại Sun Cosmetic','spa','assets/images/cosmetics/mat-na-nghe-hung-yen-30ml-1.jpg',NULL,7,'active','2026-10-13 07:02:57'),(8,'Dưỡng môi','duong-moi','Khám phá sản phẩm dưỡng môi tại Sun Cosmetic','spa','assets/images/cosmetics/son-duong-dau-dua-ben-tre-5g-1.jpg',NULL,8,'active','2026-10-13 07:02:57'),(9,'Chăm sóc cơ thể','co-the','Khám phá sản phẩm chăm sóc cơ thể tại Sun Cosmetic','spa','assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml-1.jpg',NULL,9,'active','2026-10-13 07:02:57'),(10,'Chăm sóc tóc','cham-soc-toc','Khám phá sản phẩm chăm sóc tóc tại Sun Cosmetic','spa','assets/images/cosmetics/nuoc-duong-toc-tinh-dau-buoi-140ml-1-1.jpg',NULL,10,'active','2026-10-13 07:02:57');
/*!40000 ALTER TABLE `danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `don_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_don_hang` varchar(50) NOT NULL,
  `id_nguoi_dung` int(11) DEFAULT NULL,
  `ten_giao_hang` varchar(100) NOT NULL,
  `sdt_giao_hang` varchar(20) NOT NULL,
  `thu_dien_tu_giao_hang` varchar(100) DEFAULT NULL,
  `dia_chi_giao_hang` text NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `tam_tinh` decimal(15,2) NOT NULL,
  `so_tien_giam` decimal(15,2) DEFAULT 0.00,
  `phi_van_chuyen` decimal(15,2) DEFAULT 0.00,
  `tong_tien` decimal(15,2) NOT NULL,
  `id_phieu_giam` int(11) DEFAULT NULL,
  `ma_phieu_giam` varchar(50) DEFAULT NULL,
  `phuong_thuc_thanh_toan` enum('cod','vnpay') NOT NULL DEFAULT 'cod',
  `trang_thai_thanh_toan` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `trang_thai` enum('pending','confirmed','shipping','delivered','completed','cancelled') DEFAULT 'pending',
  `ly_do_huy` text DEFAULT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ngay_cap_nhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_don_hang` (`ma_don_hang`),
  KEY `idx_nguoi_dung` (`id_nguoi_dung`),
  KEY `idx_trang_thai` (`trang_thai`),
  KEY `idx_ma_don` (`ma_don_hang`),
  CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
INSERT INTO `don_hang` VALUES (7,'SUN26101380636',6,'nguyen le hoang quan','0901696147','hoangquan05122006@gmail.com','123jdj','jdkd',635000.00,30000.00,0.00,605000.00,2,'SUN30K','cod','pending','pending',NULL,'2026-10-13 09:02:49','2026-10-13 09:02:49');
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gio_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `so_luong` int(11) DEFAULT 1,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_user_product` (`id_nguoi_dung`,`id_san_pham`),
  KEY `id_san_pham` (`id_san_pham`),
  CONSTRAINT `gio_hang_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gio_hang_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gio_hang`
--

LOCK TABLES `gio_hang` WRITE;
/*!40000 ALTER TABLE `gio_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lien_he`
--

DROP TABLE IF EXISTS `lien_he`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lien_he` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  `thu_dien_tu` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `id_don_hang` varchar(50) DEFAULT NULL,
  `chu_de` varchar(255) DEFAULT NULL,
  `noi_dung` text NOT NULL,
  `trang_thai` enum('new','read','replied') DEFAULT 'new',
  `noi_dung_tra_loi` text DEFAULT NULL,
  `nguoi_tra_loi` varchar(100) DEFAULT NULL,
  `ngay_tra_loi` datetime DEFAULT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_trang_thai` (`trang_thai`),
  KEY `idx_thu_dien_tu` (`thu_dien_tu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lien_he`
--

LOCK TABLES `lien_he` WRITE;
/*!40000 ALTER TABLE `lien_he` DISABLE KEYS */;
INSERT INTO `lien_he` VALUES (1,'Quân Nguyễn','hoangquan05122006@gmail.com','0901696147','fjjdkd','Tư vấn sản phẩm','lss','new',NULL,NULL,NULL,'2026-10-13 08:58:48');
/*!40000 ALTER TABLE `lien_he` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(100) NOT NULL,
  `thu_dien_tu` varchar(100) NOT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` enum('male','female','other') DEFAULT NULL,
  `dia_chi` text DEFAULT NULL,
  `hang` enum('silver','gold','diamond') DEFAULT 'silver',
  `tong_chi_tieu` decimal(15,2) DEFAULT 0.00,
  `tong_don_hang` int(11) DEFAULT 0,
  `id_google` varchar(100) DEFAULT NULL,
  `ma_dat_lai` varchar(100) DEFAULT NULL,
  `han_dat_lai` datetime DEFAULT NULL,
  `trang_thai` enum('active','blocked') DEFAULT 'active',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ngay_cap_nhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `thu_dien_tu` (`thu_dien_tu`),
  KEY `idx_thu_dien_tu` (`thu_dien_tu`),
  KEY `idx_google` (`id_google`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (6,'nguyen le hoang quan','hoangquan05122006@gmail.com','$2y$10$SyYgHgpwNerRBzzUZ8Fyg.H9zqiu5yq.TVIOvdeK8ibxTRdpTyIy.','0901696147',NULL,NULL,NULL,NULL,'silver',605000.00,1,NULL,NULL,NULL,'active','2026-10-13 09:00:24','2026-10-13 09:02:49');
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhan_vien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(100) NOT NULL,
  `thu_dien_tu` varchar(100) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `vai_tro` varchar(50) DEFAULT 'Nhân viên bán hàng',
  `trang_thai` enum('active','blocked') DEFAULT 'active',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `thu_dien_tu` (`thu_dien_tu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_giam_gia`
--

DROP TABLE IF EXISTS `phieu_giam_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phieu_giam_gia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_phieu` varchar(50) NOT NULL,
  `loai` enum('percent','fixed') DEFAULT 'percent',
  `gia_tri` decimal(15,2) NOT NULL,
  `don_hang_toi_thieu` decimal(15,2) DEFAULT 0.00,
  `giam_toi_da` decimal(15,2) DEFAULT NULL,
  `so_luong` int(11) DEFAULT 0,
  `so_lan_dung` int(11) DEFAULT 0,
  `ngay_het_han` datetime DEFAULT NULL,
  `dang_hoat_dong` tinyint(1) DEFAULT 1,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_phieu` (`ma_phieu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_giam_gia`
--

LOCK TABLES `phieu_giam_gia` WRITE;
/*!40000 ALTER TABLE `phieu_giam_gia` DISABLE KEYS */;
INSERT INTO `phieu_giam_gia` VALUES (1,'SUN10','percent',10.00,299000.00,50000.00,200,0,'2026-12-31 23:59:59',1,'2026-10-13 07:02:58'),(2,'SUN30K','fixed',30000.00,399000.00,30000.00,100,1,'2026-12-31 23:59:59',1,'2026-10-13 07:02:58');
/*!40000 ALTER TABLE `phieu_giam_gia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quan_tri_vien`
--

DROP TABLE IF EXISTS `quan_tri_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quan_tri_vien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(100) NOT NULL,
  `thu_dien_tu` varchar(100) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `vai_tro` varchar(50) DEFAULT 'super_admin',
  `trang_thai` enum('active','blocked') DEFAULT 'active',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `thu_dien_tu` (`thu_dien_tu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quan_tri_vien`
--

LOCK TABLES `quan_tri_vien` WRITE;
/*!40000 ALTER TABLE `quan_tri_vien` DISABLE KEYS */;
INSERT INTO `quan_tri_vien` VALUES (1,'Sun Cosmetic','thaolnpt04102004@gmail.com','$2y$10$xVGjmrV6XJhN7ju.Ij89BuRzjIKPa0uBSB6y7isosKLmL7IbiM3J.',NULL,'super_admin','active','2026-10-13 07:02:57');
/*!40000 ALTER TABLE `quan_tri_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `san_pham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_danh_muc` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `duong_dan` varchar(255) NOT NULL,
  `ma_san_pham` varchar(100) DEFAULT NULL,
  `thuong_hieu` varchar(100) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `thong_so` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thong_so`)),
  `gia` decimal(15,2) NOT NULL,
  `gia_khuyen_mai` decimal(15,2) DEFAULT NULL,
  `ton_kho` int(11) DEFAULT 0,
  `hinh_thu_nho` varchar(255) DEFAULT NULL,
  `luot_xem` int(11) DEFAULT 0,
  `so_luong_ban` int(11) DEFAULT 0,
  `diem_danh_gia` decimal(3,2) DEFAULT 0.00,
  `so_danh_gia` int(11) DEFAULT 0,
  `la_noi_bat` tinyint(1) DEFAULT 0,
  `la_flash_sale` tinyint(1) DEFAULT 0,
  `la_moi` tinyint(1) DEFAULT 0,
  `ket_thuc_flash_sale` datetime DEFAULT NULL,
  `trang_thai` enum('active','inactive') DEFAULT 'active',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ngay_cap_nhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nhom_bien_the` varchar(100) DEFAULT NULL,
  `dung_tich` varchar(100) DEFAULT NULL,
  `loai_da` varchar(255) DEFAULT NULL,
  `xuat_xu` varchar(100) DEFAULT NULL,
  `thanh_phan` text DEFAULT NULL,
  `huong_dan_su_dung` text DEFAULT NULL,
  `nguon_thong_tin` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `duong_dan` (`duong_dan`),
  KEY `idx_danh_muc` (`id_danh_muc`),
  KEY `idx_duong_dan` (`duong_dan`),
  KEY `idx_trang_thai` (`trang_thai`),
  CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,1,'Cocoon Nước tẩy trang hoa hồng 500ml','nuoc-tay-trang-hoa-hong-500ml-1','SUN-001','Cocoon','Làm sạch lớp trang điểm, bụi bẩn và giữ cảm giác mềm mại sau khi sử dụng.\n\nCách dùng: Thấm vào bông tẩy trang, lau nhẹ trên da.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Dung tích\":\"500ml\",\"Phù hợp\":\"Da thường, da khô\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thấm vào bông tẩy trang, lau nhẹ trên da.\"}',345000.00,NULL,40,'assets/images/cosmetics/nuoc-tay-trang-hoa-hong-500ml-1-1.jpg',4,0,0.00,0,1,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'500ml','Da thường, da khô','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thấm vào bông tẩy trang, lau nhẹ trên da.','https://cocoonvietnam.com/san-pham/nuoc-tay-trang-hoa-hong-500ml-1'),(2,1,'Cocoon Nước tẩy trang sen Hậu Giang 500ml','nuoc-tay-trang-sen-hau-giang-500ml','SUN-002','Cocoon','Nước tẩy trang với sen Hậu Giang cho bước làm sạch hằng ngày.\n\nCách dùng: Thấm vào bông tẩy trang, lau nhẹ trên da.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"500ml\",\"Phù hợp\":\"Da thường, da nhạy cảm\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thấm vào bông tẩy trang, lau nhẹ trên da.\"}',309000.00,NULL,40,'assets/images/cosmetics/nuoc-tay-trang-sen-hau-giang-500ml-1.jpg',2,0,0.00,0,0,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'500ml','Da thường, da nhạy cảm','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thấm vào bông tẩy trang, lau nhẹ trên da.','https://cocoonvietnam.com/san-pham/nuoc-tay-trang-sen-hau-giang-500ml'),(3,2,'Cocoon Sữa rửa mặt sen Hậu Giang 310ml','sua-rua-mat-sen-hau-giang-310ml','SUN-003','Cocoon','Sữa rửa mặt sen Hậu Giang với kết cấu dịu nhẹ, dễ sử dụng mỗi ngày.\n\nCách dùng: Làm ướt mặt, massage nhẹ với lượng vừa đủ rồi rửa lại.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"310ml\",\"Phù hợp\":\"Da thường, da nhạy cảm\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Làm ướt mặt, massage nhẹ với lượng vừa đủ rồi rửa lại.\"}',339000.00,305000.00,40,'assets/images/cosmetics/sua-rua-mat-sen-hau-giang-310ml-1.jpg',2,0,0.00,0,1,1,0,'2026-12-31 23:59:59','active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'310ml','Da thường, da nhạy cảm','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Làm ướt mặt, massage nhẹ với lượng vừa đủ rồi rửa lại.','https://cocoonvietnam.com/san-pham/sua-rua-mat-sen-hau-giang-310ml'),(4,2,'Cocoon Gel rửa mặt cà phê Đắk Lắk 140ml','gel-rua-mat-ca-phe-dak-lak-140ml','SUN-004','Cocoon','Gel rửa mặt cà phê Đắk Lắk cho bước làm sạch da mỗi sáng và tối.\n\nCách dùng: Massage nhẹ trên da ướt rồi rửa sạch với nước.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"140ml\",\"Phù hợp\":\"Da thường\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Massage nhẹ trên da ướt rồi rửa sạch với nước.\"}',192000.00,NULL,40,'assets/images/cosmetics/gel-rua-mat-ca-phe-dak-lak-140ml-1.jpg',2,0,0.00,0,0,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'140ml','Da thường','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Massage nhẹ trên da ướt rồi rửa sạch với nước.','https://cocoonvietnam.com/san-pham/gel-rua-mat-ca-phe-dak-lak-140ml'),(5,3,'Cocoon Nước sen Hậu Giang 310ml','nuoc-sen-hau-giang-310ml','SUN-005','Cocoon','Nước cân bằng sen Hậu Giang cho bước chăm sóc sau khi rửa mặt.\n\nCách dùng: Thoa lượng vừa đủ lên da sạch trước bước tinh chất.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"310ml\",\"Phù hợp\":\"Da thường, da nhạy cảm\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lượng vừa đủ lên da sạch trước bước tinh chất.\"}',299000.00,NULL,40,'assets/images/cosmetics/nuoc-sen-hau-giang-310ml-1.jpg',2,0,0.00,0,1,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'310ml','Da thường, da nhạy cảm','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lượng vừa đủ lên da sạch trước bước tinh chất.','https://cocoonvietnam.com/san-pham/nuoc-sen-hau-giang-310ml'),(6,3,'Cocoon Nước nghệ Hưng Yên 140ml','nuoc-nghe-hung-yen-140ml','SUN-006','Cocoon','Nước cân bằng nghệ Hưng Yên, bổ sung độ ẩm cho chu trình chăm sóc da.\n\nCách dùng: Thoa lượng vừa đủ lên da sạch trước bước tinh chất.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"140ml\",\"Phù hợp\":\"Da thường\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lượng vừa đủ lên da sạch trước bước tinh chất.\"}',192000.00,173000.00,40,'assets/images/cosmetics/nuoc-nghe-hung-yen-140ml-1.jpg',2,0,0.00,0,0,1,0,'2026-12-31 23:59:59','active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'140ml','Da thường','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lượng vừa đủ lên da sạch trước bước tinh chất.','https://cocoonvietnam.com/san-pham/nuoc-nghe-hung-yen-140ml'),(7,4,'Cocoon Tinh chất hoa hồng 30ml','tinh-chat-hoa-hong-30ml','SUN-007','Cocoon','Tinh chất hoa hồng giúp cấp ẩm và mang lại cảm giác mềm mịn.\n\nCách dùng: Thoa lượng vừa đủ sau nước cân bằng, trước kem dưỡng.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"30ml\",\"Phù hợp\":\"Da thường, da khô\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lượng vừa đủ sau nước cân bằng, trước kem dưỡng.\"}',261000.00,NULL,39,'assets/images/cosmetics/tinh-chat-hoa-hong-30ml-1.jpg',15,1,0.00,0,1,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 09:02:49',NULL,'30ml','Da thường, da khô','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lượng vừa đủ sau nước cân bằng, trước kem dưỡng.','https://cocoonvietnam.com/san-pham/tinh-chat-hoa-hong-30ml'),(8,4,'Cocoon Tinh chất xịt dưỡng Sen Hậu Giang 100ml','tinh-chat-xit-duong-sen-hau-giang-100ml','SUN-008','Cocoon','Tinh chất dạng xịt với sen Hậu Giang, thuận tiện bổ sung độ ẩm.\n\nCách dùng: Sử dụng theo hướng dẫn trên bao bì; tránh tiếp xúc trực tiếp với mắt.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"100ml\",\"Phù hợp\":\"Da thường, da nhạy cảm\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Sử dụng theo hướng dẫn trên bao bì; tránh tiếp xúc trực tiếp với mắt.\"}',241000.00,NULL,40,'assets/images/cosmetics/tinh-chat-xit-duong-sen-hau-giang-100ml-1.jpg',2,0,0.00,0,0,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'100ml','Da thường, da nhạy cảm','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Sử dụng theo hướng dẫn trên bao bì; tránh tiếp xúc trực tiếp với mắt.','https://cocoonvietnam.com/san-pham/tinh-chat-xit-duong-sen-hau-giang-100ml'),(9,5,'Cocoon Thạch hoa hồng dưỡng ẩm 30ml','thach-hoa-hong-duong-am-30ml','SUN-009','Cocoon','Thạch hoa hồng với kết cấu mềm nhẹ cho bước dưỡng ẩm hằng ngày.\n\nCách dùng: Thoa lớp mỏng sau bước tinh chất trên da sạch.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"30ml\",\"Phù hợp\":\"Da thường, da khô\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lớp mỏng sau bước tinh chất trên da sạch.\"}',192000.00,173000.00,40,'assets/images/cosmetics/thach-hoa-hong-duong-am-30ml-1.jpg',2,0,0.00,0,1,1,0,'2026-12-31 23:59:59','active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'30ml','Da thường, da khô','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lớp mỏng sau bước tinh chất trên da sạch.','https://cocoonvietnam.com/san-pham/thach-hoa-hong-duong-am-30ml'),(10,5,'Cocoon Thạch nghệ Hưng Yên 30ml','thach-nghe-hung-yen-30ml','SUN-010','Cocoon','Thạch dưỡng nghệ Hưng Yên cho chu trình dưỡng da buổi sáng và tối.\n\nCách dùng: Thoa lớp mỏng trên da sạch sau bước tinh chất.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"30ml\",\"Phù hợp\":\"Da thường\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lớp mỏng trên da sạch sau bước tinh chất.\"}',192000.00,NULL,40,'assets/images/cosmetics/thach-nghe-hung-yen-30ml-1.png',2,0,0.00,0,0,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'30ml','Da thường','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lớp mỏng trên da sạch sau bước tinh chất.','https://cocoonvietnam.com/san-pham/thach-nghe-hung-yen-30ml'),(11,6,'Cocoon Sữa chống nắng vô cơ Sen Hậu Giang 50ml - Tone up Pink','sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink','SUN-011','Cocoon','Sữa chống nắng sen Hậu Giang phiên bản Tone up Pink.\n\nCách dùng: Thoa đều trước khi ra ngoài và thoa lại theo hướng dẫn trên bao bì.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"50ml\",\"Phù hợp\":\"Da thường, da nhạy cảm\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa đều trước khi ra ngoài và thoa lại theo hướng dẫn trên bao bì.\"}',449000.00,NULL,40,'assets/images/cosmetics/sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink-1.jpg',2,0,0.00,0,1,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'50ml','Da thường, da nhạy cảm','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa đều trước khi ra ngoài và thoa lại theo hướng dẫn trên bao bì.','https://cocoonvietnam.com/san-pham/sua-chong-nang-vo-co-sen-hau-giang-50ml-tone-up-pink'),(12,6,'Cocoon Sữa chống nắng bí đao 50ml','sua-chong-nang-bi-dao-50ml','SUN-012','Cocoon','Sữa chống nắng bí đao cho bước bảo vệ da vào ban ngày.\n\nCách dùng: Thoa đều trước khi ra ngoài và thoa lại theo hướng dẫn trên bao bì.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"50ml\",\"Phù hợp\":\"Da dầu, da hỗn hợp\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa đều trước khi ra ngoài và thoa lại theo hướng dẫn trên bao bì.\"}',432000.00,389000.00,40,'assets/images/cosmetics/sua-chong-nang-bi-dao-50ml-1.png',2,0,0.00,0,0,1,0,'2026-12-31 23:59:59','active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'50ml','Da dầu, da hỗn hợp','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa đều trước khi ra ngoài và thoa lại theo hướng dẫn trên bao bì.','https://cocoonvietnam.com/san-pham/sua-chong-nang-bi-dao-50ml'),(13,7,'Cocoon Mặt nạ nghệ Hưng Yên 30ml','mat-na-nghe-hung-yen-30ml','SUN-013','Cocoon','Mặt nạ nghệ Hưng Yên cho bước chăm sóc da định kỳ.\n\nCách dùng: Thoa lượng vừa đủ và rửa lại theo hướng dẫn trên bao bì.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"30ml\",\"Phù hợp\":\"Da thường\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lượng vừa đủ và rửa lại theo hướng dẫn trên bao bì.\"}',152000.00,NULL,40,'assets/images/cosmetics/mat-na-nghe-hung-yen-30ml-1.jpg',2,0,0.00,0,1,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'30ml','Da thường','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lượng vừa đủ và rửa lại theo hướng dẫn trên bao bì.','https://cocoonvietnam.com/san-pham/mat-na-nghe-hung-yen-30ml'),(14,8,'Cocoon Son dưỡng dầu dừa Bến Tre 5g','son-duong-dau-dua-ben-tre-5g','SUN-014','Cocoon','Son dưỡng dầu dừa Bến Tre để chăm sóc và giữ đôi môi mềm mại.\n\nCách dùng: Thoa lên môi sạch, sử dụng lại khi cần.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"5g\",\"Phù hợp\":\"Môi khô\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Thoa lên môi sạch, sử dụng lại khi cần.\"}',32000.00,NULL,40,'assets/images/cosmetics/son-duong-dau-dua-ben-tre-5g-1.jpg',2,0,0.00,0,1,0,0,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:33',NULL,'5g','Môi khô','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Thoa lên môi sạch, sử dụng lại khi cần.','https://cocoonvietnam.com/san-pham/son-duong-dau-dua-ben-tre-5g'),(15,8,'Cocoon Cà phê Đắk Lắk làm sạch da chết môi 5g','ca-phe-dak-lak-lam-sach-da-chet-moi-5g','SUN-015','Cocoon','Sản phẩm làm sạch tế bào chết môi từ cà phê Đắk Lắk.\n\nCách dùng: Massage nhẹ trên môi và lau sạch theo hướng dẫn trên bao bì.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"5g\",\"Phù hợp\":\"Môi khô\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Massage nhẹ trên môi và lau sạch theo hướng dẫn trên bao bì.\"}',74000.00,67000.00,40,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-moi-5g-1.jpg',2,0,0.00,0,0,1,1,'2026-12-31 23:59:59','active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'5g','Môi khô','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Massage nhẹ trên môi và lau sạch theo hướng dẫn trên bao bì.','https://cocoonvietnam.com/san-pham/ca-phe-dak-lak-lam-sach-da-chet-moi-5g'),(16,9,'Cocoon Cà phê Đắk Lắk làm sạch da chết cơ thể 200ml','ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml','SUN-016','Cocoon','Sản phẩm làm sạch tế bào chết cơ thể với cà phê Đắk Lắk.\n\nCách dùng: Massage nhẹ trên da ướt rồi rửa lại với nước.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"200ml\",\"Phù hợp\":\"Da cơ thể\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Massage nhẹ trên da ướt rồi rửa lại với nước.\"}',133000.00,NULL,39,'assets/images/cosmetics/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml-1.jpg',2,1,0.00,0,0,0,1,NULL,'active','2026-10-13 07:02:57','2026-10-13 09:02:49',NULL,'200ml','Da cơ thể','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Massage nhẹ trên da ướt rồi rửa lại với nước.','https://cocoonvietnam.com/san-pham/ca-phe-dak-lak-lam-sach-da-chet-co-the-200ml'),(17,9,'Cocoon Gel tắm đường thốt nốt An Giang 500ml','gel-tam-duong-thot-not-an-giang-500ml','SUN-017','Cocoon','Gel tắm đường thốt nốt An Giang cho bước chăm sóc cơ thể hằng ngày.\n\nCách dùng: Tạo bọt trên da ướt rồi rửa sạch với nước.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"500ml\",\"Phù hợp\":\"Da cơ thể\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Tạo bọt trên da ướt rồi rửa sạch với nước.\"}',241000.00,NULL,39,'assets/images/cosmetics/gel-tam-duong-thot-not-an-giang-500ml-1.png',2,1,0.00,0,0,0,1,NULL,'active','2026-10-13 07:02:57','2026-10-13 09:02:49',NULL,'500ml','Da cơ thể','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Tạo bọt trên da ướt rồi rửa sạch với nước.','https://cocoonvietnam.com/san-pham/gel-tam-duong-thot-not-an-giang-500ml'),(18,10,'Cocoon Nước dưỡng tóc tinh dầu bưởi 140ml','nuoc-duong-toc-tinh-dau-buoi-140ml-1','SUN-018','Cocoon','Nước dưỡng tóc tinh dầu bưởi, dùng trong chu trình chăm sóc tóc.\n\nCách dùng: Dùng theo hướng dẫn trên bao bì, tránh tiếp xúc với mắt.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"140ml\",\"Phù hợp\":\"Tóc và da đầu\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Dùng theo hướng dẫn trên bao bì, tránh tiếp xúc với mắt.\"}',162000.00,146000.00,40,'assets/images/cosmetics/nuoc-duong-toc-tinh-dau-buoi-140ml-1-1.jpg',2,0,0.00,0,0,1,1,'2026-12-31 23:59:59','active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'140ml','Tóc và da đầu','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Dùng theo hướng dẫn trên bao bì, tránh tiếp xúc với mắt.','https://cocoonvietnam.com/san-pham/nuoc-duong-toc-tinh-dau-buoi-140ml-1'),(19,10,'Cocoon Dầu gội bồ kết 310ml','dau-goi-bo-ket-310ml','SUN-019','Cocoon','Dầu gội bồ kết giúp làm sạch tóc và da đầu.\n\nCách dùng: Massage nhẹ trên tóc ướt rồi xả sạch với nước.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"310ml\",\"Phù hợp\":\"Tóc và da đầu\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Massage nhẹ trên tóc ướt rồi xả sạch với nước.\"}',290000.00,NULL,40,'assets/images/cosmetics/dau-goi-bo-ket-310ml-1.jpg',2,0,0.00,0,0,0,1,NULL,'active','2026-10-13 07:02:57','2026-10-13 08:43:34',NULL,'310ml','Tóc và da đầu','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Massage nhẹ trên tóc ướt rồi xả sạch với nước.','https://cocoonvietnam.com/san-pham/dau-goi-bo-ket-310ml'),(20,7,'Cocoon Mặt nạ bí đao 30ml','mat-na-bi-dao-30ml','SUN-020','Cocoon','Mặt nạ bí đao cho bước chăm sóc da định kỳ.\n\nCách dùng: Dùng theo thời gian hướng dẫn trên bao bì rồi rửa sạch.\n\nBảo quản: để nơi khô ráo, tránh ánh nắng trực tiếp. Đọc hướng dẫn trên bao bì trước khi sử dụng.','{\"Thương hiệu\":\"Cocoon\",\"Dung tích\":\"30ml\",\"Phù hợp\":\"Da dầu, da hỗn hợp\",\"Xuất xứ\":\"Việt Nam\",\"Thành phần\":\"Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.\",\"Cách dùng\":\"Dùng theo thời gian hướng dẫn trên bao bì rồi rửa sạch.\"}',152000.00,NULL,40,'assets/images/cosmetics/mat-na-bi-dao-30ml-1.jpg',2,0,0.00,0,0,0,1,NULL,'active','2026-10-13 07:02:58','2026-10-13 12:32:21',NULL,'30ml','Da dầu, da hỗn hợp','Việt Nam','Xem danh sách thành phần đầy đủ trên bao bì sản phẩm.','Dùng theo thời gian hướng dẫn trên bao bì rồi rửa sạch.','https://cocoonvietnam.com/san-pham/mat-na-bi-dao-30ml');
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanh_toan`
--

DROP TABLE IF EXISTS `thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thanh_toan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_don_hang` int(11) NOT NULL,
  `phuong_thuc` enum('cod','vnpay') NOT NULL,
  `so_tien` decimal(15,2) NOT NULL,
  `ma_giao_dich` varchar(100) DEFAULT NULL,
  `trang_thai` enum('pending','success','failed') DEFAULT 'pending',
  `ngay_thanh_toan` datetime DEFAULT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ma_tham_chieu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_tham_chieu` (`ma_tham_chieu`),
  KEY `id_don_hang` (`id_don_hang`),
  CONSTRAINT `thanh_toan_ibfk_1` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hang` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanh_toan`
--

LOCK TABLES `thanh_toan` WRITE;
/*!40000 ALTER TABLE `thanh_toan` DISABLE KEYS */;
INSERT INTO `thanh_toan` VALUES (7,7,'cod',605000.00,NULL,'pending',NULL,'2026-10-13 09:02:49',NULL);
/*!40000 ALTER TABLE `thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thong_bao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int(11) NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `loai` varchar(50) DEFAULT 'info',
  `lien_ket` varchar(255) DEFAULT NULL,
  `da_doc` tinyint(1) DEFAULT 0,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_nguoi_dung` (`id_nguoi_dung`),
  CONSTRAINT `thong_bao_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thong_bao`
--

LOCK TABLES `thong_bao` WRITE;
/*!40000 ALTER TABLE `thong_bao` DISABLE KEYS */;
INSERT INTO `thong_bao` VALUES (9,6,'Chào mừng đến với Sun Cosmetic!','Cảm ơn bạn đã đăng ký tài khoản. Hãy khám phá ngay các sản phẩm hot!','info',NULL,1,'2026-10-13 09:00:24'),(10,6,'Đặt hàng thành công','Đơn hàng #SUN26101380636 đã được tạo thành công. Cảm ơn bạn đã mua hàng!','order','http://localhost/sun_cosmetic/order/detail/7',0,'2026-10-13 09:02:49');
/*!40000 ALTER TABLE `thong_bao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yeu_thich`
--

DROP TABLE IF EXISTS `yeu_thich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yeu_thich` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_user_product` (`id_nguoi_dung`,`id_san_pham`),
  KEY `id_san_pham` (`id_san_pham`),
  CONSTRAINT `yeu_thich_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yeu_thich_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yeu_thich`
--

LOCK TABLES `yeu_thich` WRITE;
/*!40000 ALTER TABLE `yeu_thich` DISABLE KEYS */;
/*!40000 ALTER TABLE `yeu_thich` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-13 19:35:39
