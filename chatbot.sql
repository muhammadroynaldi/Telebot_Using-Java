-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2023 at 04:38 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '12345'),
(2, 'roynaldi', 'roy'),
(3, 'samuel', 'samuel'),
(6, 'aku', 'aku'),
(7, 'saya', 'saya'),
(9, 'dia', 'dia');

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `broadcast`
--

INSERT INTO `broadcast` (`id`, `message`, `username`) VALUES
(21, 'ashhfhagsahgfhgaf', 'mroynaldi'),
(22, 'hei ini broadcast ', 'mroynaldi'),
(23, 'hai', 'mroynaldi');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `keyword`, `response`) VALUES
(11, '/tentang', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.'),
(12, '/syntax', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}'),
(13, '/comment', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");'),
(14, '/variabel', 'Variabel Java!\r\n\r\nVariabel adalah wadah untuk menyimpan nilai data.\r\n\r\nDi Java, ada berbagai jenis variabel, misalnya:\r\n\r\nString - menyimpan teks, seperti \"Halo\". Nilai string dikelilingi oleh tanda kutip ganda.\r\n\r\nint - menyimpan bilangan bulat (bilangan bulat), tanpa desimal, seperti 123 atau -123.\r\n\r\nfloat - menyimpan angka floating point, dengan desimal, seperti 19,99 atau -19,99.\r\n\r\nchar - menyimpan karakter tunggal, seperti \'a\' atau \'B\'. Nilai karakter dikelilingi oleh tanda kutip tunggal.\r\n\r\nboolean - menyimpan nilai dengan dua status: benar atau salah.\r\n'),
(15, '/type', 'Tipe Data Java\r\n\r\nSeperti yang dijelaskan pada bab sebelumnya, sebuah variabel di Java harus berupa tipe data yang ditentukan:\r\n\r\nint myNum = 5;               // Integer (whole number)\r\nfloat myFloatNum = 5.99f;    // Floating point number\r\nchar myLetter = \'D\';         // Character\r\nboolean myBool = true;       // Boolean\r\nString myText = \"Hello\";     // String'),
(16, '/casting', 'Casting Tipe Java\r\n\r\nCasting tipe adalah saat Anda menetapkan nilai dari satu tipe data primitif ke tipe lain.\r\n\r\nDi Java, ada dua jenis casting:\r\n\r\nWidening Casting (secara otomatis) - mengonversi jenis yang lebih kecil ke ukuran jenis yang lebih besar\r\nbyte -> short -> char -> int -> long -> float -> double\r\n\r\nNarrowing Casting (secara manual) - mengonversi tipe yang lebih besar ke tipe ukuran yang lebih kecil\r\nganda -> float -> panjang -> int -> char -> pendek -> byte\r\n\r\ncontoh Widening Casting:\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    int myInt = 9;\r\n    double myDouble = myInt; // Automatic casting: int to double\r\n\r\n    System.out.println(myInt);      // Outputs 9\r\n    System.out.println(myDouble);   // Outputs 9.0\r\n  }\r\n}\r\n\r\nContoh Narrowing Casting:\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    double myDouble = 9.78d;\r\n    int myInt = (int) myDouble; // Manual casting: double to int\r\n\r\n    System.out.println(myDouble);   // Outputs 9.78\r\n    System.out.println(myInt);      // Outputs 9\r\n  }\r\n}'),
(17, '/operator', 'Operator Java\r\n\r\nOperator digunakan untuk melakukan operasi pada variabel dan nilai.\r\n\r\nDalam contoh di bawah ini, kami menggunakan operator + untuk menjumlahkan dua nilai:\r\nint x = 100 + 50;\r\n\r\nJava membagi operator menjadi beberapa grup berikut:\r\n\r\noperator aritmatika\r\nOperator penugasan\r\noperator perbandingan\r\nOperator logis\r\nOperator bitwise\r\n\r\nuntuk pembelajaran lanjut dapat melalui link \"https://www.w3schools.com/java/java_operators.asp\"');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `userId` bigint(50) DEFAULT NULL,
  `welcome_message_id` int(11) DEFAULT NULL,
  `tipe_pesan` enum('Masuk','Keluar') NOT NULL,
  `pesan` text NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `userId`, `welcome_message_id`, `tipe_pesan`, `pesan`, `waktu`) VALUES
(274, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:17'),
(275, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:17'),
(277, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:17'),
(278, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:17'),
(280, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:20'),
(281, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:20'),
(282, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:20'),
(283, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:20'),
(285, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:24'),
(287, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:25'),
(288, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:28'),
(289, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:28'),
(290, 1847285486, NULL, 'Masuk', '/key', '2023-07-03 13:08:33'),
(291, 1847285486, NULL, 'Masuk', '/key', '2023-07-03 13:08:33'),
(292, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-03 13:08:33'),
(293, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-03 13:08:33'),
(294, 1847285486, NULL, 'Masuk', '/key', '2023-07-03 13:08:33'),
(295, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-03 13:08:33'),
(296, 1847285486, NULL, 'Masuk', '/key', '2023-07-03 13:08:36'),
(297, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-03 13:08:36'),
(298, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-03 13:08:38'),
(299, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-03 13:08:39'),
(300, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-03 13:08:40'),
(301, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-03 13:08:40'),
(302, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-03 13:08:41'),
(303, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-03 13:08:41'),
(304, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:08:46'),
(305, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:08:46'),
(306, 1847285486, NULL, 'Masuk', 'aku', '2023-07-03 13:15:23'),
(307, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-03 13:15:24'),
(308, 1847285486, NULL, 'Masuk', '/start', '2023-07-03 13:15:25'),
(309, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-03 13:15:25'),
(310, 1847285486, NULL, 'Masuk', '/key', '2023-07-03 13:15:27'),
(311, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-03 13:15:27'),
(312, 1847285486, NULL, 'Masuk', '/start', '2023-07-04 03:57:47'),
(313, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-04 03:57:48'),
(314, 1344122685, NULL, 'Masuk', 'Jwjsnsjs', '2023-07-04 04:05:30'),
(315, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-04 04:05:31'),
(317, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-04 04:13:42'),
(319, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-04 04:13:43'),
(321, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-04 04:13:44'),
(323, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-04 04:13:50'),
(325, NULL, NULL, 'Keluar', 'Operator Java\r\n\r\nOperator digunakan untuk melakukan operasi pada variabel dan nilai.\r\n\r\nDalam contoh di bawah ini, kami menggunakan operator + untuk menjumlahkan dua nilai:\r\nint x = 100 + 50;\r\n\r\nJava membagi operator menjadi beberapa grup berikut:\r\n\r\noperator aritmatika\r\nOperator penugasan\r\noperator perbandingan\r\nOperator logis\r\nOperator bitwise\r\n\r\nuntuk pembelajaran lanjut dapat melalui link \"https://www.w3schools.com/java/java_operators.asp\"', '2023-07-04 04:14:30'),
(327, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-04 04:18:42'),
(328, 201575235, NULL, 'Masuk', '/hai', '2023-07-04 04:19:00'),
(329, NULL, NULL, 'Keluar', 'hello', '2023-07-04 04:19:00'),
(330, 1847285486, NULL, 'Masuk', '/start', '2023-07-06 01:10:44'),
(331, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-06 01:10:44'),
(332, 1847285486, NULL, 'Masuk', '/key', '2023-07-06 01:10:45'),
(333, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-06 01:10:45'),
(334, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-06 01:10:47'),
(335, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-06 01:10:47'),
(337, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-06 09:58:41'),
(338, 735390054, NULL, 'Masuk', '/start', '2023-07-06 12:31:04'),
(339, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-06 12:31:04'),
(340, 1236807269, NULL, 'Masuk', 'apaaaaaa', '2023-07-06 12:32:47'),
(341, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-06 12:32:48'),
(342, 735390054, NULL, 'Masuk', '/key', '2023-07-06 12:35:51'),
(343, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-06 12:35:51'),
(344, 735390054, NULL, 'Masuk', '/tentang', '2023-07-06 12:36:12'),
(345, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-06 12:36:12'),
(346, 1847285486, NULL, 'Masuk', '/variabel', '2023-07-06 12:40:22'),
(347, NULL, NULL, 'Keluar', 'Variabel Java!\r\n\r\nVariabel adalah wadah untuk menyimpan nilai data.\r\n\r\nDi Java, ada berbagai jenis variabel, misalnya:\r\n\r\nString - menyimpan teks, seperti \"Halo\". Nilai string dikelilingi oleh tanda kutip ganda.\r\n\r\nint - menyimpan bilangan bulat (bilangan bulat), tanpa desimal, seperti 123 atau -123.\r\n\r\nfloat - menyimpan angka floating point, dengan desimal, seperti 19,99 atau -19,99.\r\n\r\nchar - menyimpan karakter tunggal, seperti \'a\' atau \'B\'. Nilai karakter dikelilingi oleh tanda kutip tunggal.\r\n\r\nboolean - menyimpan nilai dengan dua status: benar atau salah.\r\n', '2023-07-06 12:40:22'),
(348, 1847285486, NULL, 'Masuk', '/key', '2023-07-06 12:40:35'),
(349, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-06 12:40:35'),
(350, 1344122685, NULL, 'Masuk', 'Jsjss', '2023-07-06 12:51:04'),
(351, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-06 12:51:05'),
(352, 1344122685, NULL, 'Masuk', '/start', '2023-07-06 12:51:18'),
(353, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-06 12:51:18'),
(354, 1344122685, NULL, 'Masuk', '/key', '2023-07-06 12:52:07'),
(355, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-06 12:52:07'),
(356, 201575235, NULL, 'Masuk', 'Hola', '2023-07-07 11:04:03'),
(357, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-07 11:04:04'),
(358, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 02:36:14'),
(359, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 02:36:14'),
(360, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 02:37:52'),
(361, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 02:37:52'),
(362, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 02:40:13'),
(363, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 02:40:14'),
(364, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 02:40:16'),
(365, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 02:40:16'),
(366, 1847285486, NULL, 'Masuk', 'aku suka kamu', '2023-07-08 02:40:58'),
(367, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-08 02:40:59'),
(368, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 03:15:30'),
(369, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 03:15:30'),
(370, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:15:33'),
(371, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:15:33'),
(372, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:15:33'),
(373, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:15:33'),
(374, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 03:15:36'),
(375, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 03:15:36'),
(376, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:15:39'),
(377, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:15:39'),
(378, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 03:15:43'),
(379, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 03:15:43'),
(380, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:15:49'),
(381, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:15:49'),
(382, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:15:49'),
(383, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:15:49'),
(384, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:15:49'),
(385, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:15:49'),
(386, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 03:16:41'),
(387, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 03:16:41'),
(388, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:16:45'),
(389, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:16:45'),
(390, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 03:17:07'),
(391, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 03:17:07'),
(392, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 03:17:08'),
(393, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 03:17:08'),
(394, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:17:13'),
(395, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:17:13'),
(396, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 03:17:15'),
(397, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 03:17:15'),
(398, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 03:20:00'),
(399, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 03:20:00'),
(400, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 03:20:00'),
(401, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 03:20:00'),
(402, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 03:20:05'),
(403, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 03:20:05'),
(404, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-08 03:20:07'),
(405, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-08 03:20:08'),
(406, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-08 03:20:08'),
(407, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-08 03:20:08'),
(408, 1847285486, NULL, 'Masuk', '/comment', '2023-07-08 03:20:26'),
(409, 1847285486, NULL, 'Masuk', '/comment', '2023-07-08 03:20:26'),
(410, NULL, NULL, 'Keluar', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");', '2023-07-08 03:20:26'),
(411, NULL, NULL, 'Keluar', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");', '2023-07-08 03:20:26'),
(412, 1847285486, NULL, 'Masuk', '/comment', '2023-07-08 03:20:26'),
(413, 1847285486, NULL, 'Masuk', '/comment', '2023-07-08 03:20:26'),
(414, NULL, NULL, 'Keluar', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");', '2023-07-08 03:20:26'),
(415, NULL, NULL, 'Keluar', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");', '2023-07-08 03:20:26'),
(416, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 03:20:31'),
(417, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 03:20:31'),
(418, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 11:07:39'),
(419, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 11:07:39'),
(420, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:07:43'),
(421, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:07:43'),
(422, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:07:45'),
(423, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:07:45'),
(424, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 11:08:03'),
(425, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 11:08:03'),
(426, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:08:06'),
(427, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:08:06'),
(428, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-08 11:08:18'),
(429, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-08 11:08:18'),
(430, 1847285486, NULL, 'Masuk', '/variabel', '2023-07-08 11:08:21'),
(431, NULL, NULL, 'Keluar', 'Variabel Java!\r\n\r\nVariabel adalah wadah untuk menyimpan nilai data.\r\n\r\nDi Java, ada berbagai jenis variabel, misalnya:\r\n\r\nString - menyimpan teks, seperti \"Halo\". Nilai string dikelilingi oleh tanda kutip ganda.\r\n\r\nint - menyimpan bilangan bulat (bilangan bulat), tanpa desimal, seperti 123 atau -123.\r\n\r\nfloat - menyimpan angka floating point, dengan desimal, seperti 19,99 atau -19,99.\r\n\r\nchar - menyimpan karakter tunggal, seperti \'a\' atau \'B\'. Nilai karakter dikelilingi oleh tanda kutip tunggal.\r\n\r\nboolean - menyimpan nilai dengan dua status: benar atau salah.\r\n', '2023-07-08 11:08:21'),
(432, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 11:10:12'),
(433, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 11:10:13'),
(434, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:10:29'),
(435, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:10:29'),
(436, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:10:35'),
(437, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:10:36'),
(438, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-08 11:10:39'),
(439, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-08 11:10:39'),
(440, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:10:43'),
(441, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:10:43'),
(442, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:10:47'),
(443, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:10:48'),
(444, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:11:29'),
(445, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:11:30'),
(446, 1847285486, NULL, 'Masuk', '/syntax', '2023-07-08 11:11:31'),
(447, NULL, NULL, 'Keluar', 'Sintaks Java!\r\nkita membuat file Java bernama Main.java, dan kita menggunakan kode berikut untuk mencetak \"Hello World\" ke layar:\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}', '2023-07-08 11:11:31'),
(448, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:11:56'),
(449, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:11:56'),
(450, 1847285486, NULL, 'Masuk', '/type', '2023-07-08 11:12:17'),
(451, NULL, NULL, 'Keluar', 'Tipe Data Java\r\n\r\nSeperti yang dijelaskan pada bab sebelumnya, sebuah variabel di Java harus berupa tipe data yang ditentukan:\r\n\r\nint myNum = 5;               // Integer (whole number)\r\nfloat myFloatNum = 5.99f;    // Floating point number\r\nchar myLetter = \'D\';         // Character\r\nboolean myBool = true;       // Boolean\r\nString myText = \"Hello\";     // String', '2023-07-08 11:12:17'),
(452, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:13:53'),
(453, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:13:53'),
(454, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:13:53'),
(455, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:13:53'),
(456, 1847285486, NULL, 'Masuk', '/variabel', '2023-07-08 11:14:01'),
(457, NULL, NULL, 'Keluar', 'Variabel Java!\r\n\r\nVariabel adalah wadah untuk menyimpan nilai data.\r\n\r\nDi Java, ada berbagai jenis variabel, misalnya:\r\n\r\nString - menyimpan teks, seperti \"Halo\". Nilai string dikelilingi oleh tanda kutip ganda.\r\n\r\nint - menyimpan bilangan bulat (bilangan bulat), tanpa desimal, seperti 123 atau -123.\r\n\r\nfloat - menyimpan angka floating point, dengan desimal, seperti 19,99 atau -19,99.\r\n\r\nchar - menyimpan karakter tunggal, seperti \'a\' atau \'B\'. Nilai karakter dikelilingi oleh tanda kutip tunggal.\r\n\r\nboolean - menyimpan nilai dengan dua status: benar atau salah.\r\n', '2023-07-08 11:14:01'),
(458, 1847285486, NULL, 'Masuk', '/variabel', '2023-07-08 11:14:02'),
(459, NULL, NULL, 'Keluar', 'Variabel Java!\r\n\r\nVariabel adalah wadah untuk menyimpan nilai data.\r\n\r\nDi Java, ada berbagai jenis variabel, misalnya:\r\n\r\nString - menyimpan teks, seperti \"Halo\". Nilai string dikelilingi oleh tanda kutip ganda.\r\n\r\nint - menyimpan bilangan bulat (bilangan bulat), tanpa desimal, seperti 123 atau -123.\r\n\r\nfloat - menyimpan angka floating point, dengan desimal, seperti 19,99 atau -19,99.\r\n\r\nchar - menyimpan karakter tunggal, seperti \'a\' atau \'B\'. Nilai karakter dikelilingi oleh tanda kutip tunggal.\r\n\r\nboolean - menyimpan nilai dengan dua status: benar atau salah.\r\n', '2023-07-08 11:14:02'),
(460, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 11:21:34'),
(461, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 11:21:34'),
(462, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 11:21:34'),
(463, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 11:21:34'),
(464, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:21:38'),
(465, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:21:38'),
(466, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:21:38'),
(467, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:21:38'),
(468, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:21:42'),
(469, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:21:42'),
(470, 1847285486, NULL, 'Masuk', '/variabel', '2023-07-08 11:21:44'),
(471, NULL, NULL, 'Keluar', 'Variabel Java!\r\n\r\nVariabel adalah wadah untuk menyimpan nilai data.\r\n\r\nDi Java, ada berbagai jenis variabel, misalnya:\r\n\r\nString - menyimpan teks, seperti \"Halo\". Nilai string dikelilingi oleh tanda kutip ganda.\r\n\r\nint - menyimpan bilangan bulat (bilangan bulat), tanpa desimal, seperti 123 atau -123.\r\n\r\nfloat - menyimpan angka floating point, dengan desimal, seperti 19,99 atau -19,99.\r\n\r\nchar - menyimpan karakter tunggal, seperti \'a\' atau \'B\'. Nilai karakter dikelilingi oleh tanda kutip tunggal.\r\n\r\nboolean - menyimpan nilai dengan dua status: benar atau salah.\r\n', '2023-07-08 11:21:44'),
(472, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-08 11:21:49'),
(473, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-08 11:21:50'),
(474, 1847285486, NULL, 'Masuk', '/start', '2023-07-08 11:22:24'),
(475, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-08 11:22:24'),
(476, 1847285486, NULL, 'Masuk', '/key', '2023-07-08 11:22:27'),
(477, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-08 11:22:28'),
(478, 1847285486, NULL, 'Masuk', '/start', '2023-07-10 02:22:48'),
(479, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-10 02:22:48'),
(480, 1847285486, NULL, 'Masuk', '/key', '2023-07-10 02:22:55'),
(481, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-10 02:22:55'),
(482, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-10 02:22:57'),
(483, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 02:22:57'),
(484, 1847285486, NULL, 'Masuk', '/comment', '2023-07-10 02:23:06'),
(485, NULL, NULL, 'Keluar', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");', '2023-07-10 02:23:06'),
(486, 1847285486, NULL, 'Masuk', '/comment', '2023-07-10 02:23:28'),
(487, NULL, NULL, 'Keluar', 'Komentar Java\r\n\r\nKomentar dapat digunakan untuk menjelaskan kode Java, dan membuatnya lebih mudah dibaca. Itu juga dapat digunakan untuk mencegah eksekusi saat menguji kode alternatif.\r\n\r\nKomentar baris tunggal\r\nKomentar satu baris dimulai dengan dua garis miring ke depan (//).\r\n\r\nTeks apa pun antara // dan akhir baris akan diabaikan oleh Java (tidak akan dieksekusi).\r\n\r\nContoh ini menggunakan komentar baris tunggal sebelum baris kode:\r\n\r\n// This is a comment\r\nSystem.out.println(\"Hello World\");', '2023-07-10 02:23:28'),
(488, 1847285486, NULL, 'Masuk', '/casting', '2023-07-10 02:23:53'),
(489, NULL, NULL, 'Keluar', 'Casting Tipe Java\r\n\r\nCasting tipe adalah saat Anda menetapkan nilai dari satu tipe data primitif ke tipe lain.\r\n\r\nDi Java, ada dua jenis casting:\r\n\r\nWidening Casting (secara otomatis) - mengonversi jenis yang lebih kecil ke ukuran jenis yang lebih besar\r\nbyte -> short -> char -> int -> long -> float -> double\r\n\r\nNarrowing Casting (secara manual) - mengonversi tipe yang lebih besar ke tipe ukuran yang lebih kecil\r\nganda -> float -> panjang -> int -> char -> pendek -> byte\r\n\r\ncontoh Widening Casting:\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    int myInt = 9;\r\n    double myDouble = myInt; // Automatic casting: int to double\r\n\r\n    System.out.println(myInt);      // Outputs 9\r\n    System.out.println(myDouble);   // Outputs 9.0\r\n  }\r\n}\r\n\r\nContoh Narrowing Casting:\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    double myDouble = 9.78d;\r\n    int myInt = (int) myDouble; // Manual casting: double to int\r\n\r\n    System.out.println(myDouble);   // Outputs 9.78\r\n    System.out.println(myInt);      // Outputs 9\r\n  }\r\n}', '2023-07-10 02:23:53'),
(490, 1847285486, NULL, 'Masuk', '/casting', '2023-07-10 02:23:53'),
(491, NULL, NULL, 'Keluar', 'Casting Tipe Java\r\n\r\nCasting tipe adalah saat Anda menetapkan nilai dari satu tipe data primitif ke tipe lain.\r\n\r\nDi Java, ada dua jenis casting:\r\n\r\nWidening Casting (secara otomatis) - mengonversi jenis yang lebih kecil ke ukuran jenis yang lebih besar\r\nbyte -> short -> char -> int -> long -> float -> double\r\n\r\nNarrowing Casting (secara manual) - mengonversi tipe yang lebih besar ke tipe ukuran yang lebih kecil\r\nganda -> float -> panjang -> int -> char -> pendek -> byte\r\n\r\ncontoh Widening Casting:\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    int myInt = 9;\r\n    double myDouble = myInt; // Automatic casting: int to double\r\n\r\n    System.out.println(myInt);      // Outputs 9\r\n    System.out.println(myDouble);   // Outputs 9.0\r\n  }\r\n}\r\n\r\nContoh Narrowing Casting:\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    double myDouble = 9.78d;\r\n    int myInt = (int) myDouble; // Manual casting: double to int\r\n\r\n    System.out.println(myDouble);   // Outputs 9.78\r\n    System.out.println(myInt);      // Outputs 9\r\n  }\r\n}', '2023-07-10 02:23:53'),
(492, 1847285486, NULL, 'Masuk', '/start', '2023-07-10 02:29:44'),
(493, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-10 02:29:44'),
(494, 1847285486, NULL, 'Masuk', '/key', '2023-07-10 02:29:46'),
(495, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-10 02:29:46'),
(496, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-10 02:29:47'),
(497, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 02:29:47'),
(498, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-10 02:29:53'),
(499, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 02:29:53'),
(500, 1847285486, NULL, 'Masuk', '/key', '2023-07-10 02:29:57'),
(501, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-10 02:29:57'),
(502, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-10 02:30:05'),
(503, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 02:30:05'),
(504, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-10 02:30:05'),
(505, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 02:30:06'),
(506, 1847285486, NULL, 'Masuk', '/tentang', '2023-07-10 02:30:13'),
(507, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 02:30:13'),
(508, 201575235, NULL, 'Masuk', 'khh', '2023-07-10 03:23:31'),
(509, NULL, 3, 'Keluar', 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.', '2023-07-10 03:23:32'),
(510, 201575235, NULL, 'Masuk', '/start', '2023-07-10 03:23:39'),
(511, NULL, 1, 'Keluar', 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n', '2023-07-10 03:23:39'),
(512, 201575235, NULL, 'Masuk', '/key', '2023-07-10 03:23:43'),
(513, NULL, 2, 'Keluar', 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java', '2023-07-10 03:23:43'),
(514, 201575235, NULL, 'Masuk', '/tentang', '2023-07-10 03:23:50'),
(515, NULL, NULL, 'Keluar', 'Java adalah bahasa pemrograman yang populer.\r\n\r\nJava digunakan untuk mengembangkan aplikasi seluler, aplikasi web, aplikasi desktop, game, dan banyak lagi.', '2023-07-10 03:23:50'),
(516, 201575235, NULL, 'Masuk', '/operator', '2023-07-10 03:24:09'),
(517, NULL, NULL, 'Keluar', 'Operator Java\r\n\r\nOperator digunakan untuk melakukan operasi pada variabel dan nilai.\r\n\r\nDalam contoh di bawah ini, kami menggunakan operator + untuk menjumlahkan dua nilai:\r\nint x = 100 + 50;\r\n\r\nJava membagi operator menjadi beberapa grup berikut:\r\n\r\noperator aritmatika\r\nOperator penugasan\r\noperator perbandingan\r\nOperator logis\r\nOperator bitwise\r\n\r\nuntuk pembelajaran lanjut dapat melalui link \"https://www.w3schools.com/java/java_operators.asp\"', '2023-07-10 03:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `userId` bigint(20) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`userId`, `username`, `firstname`, `lastname`) VALUES
(201575235, 'ajibsusanto', 'Ajib', 'Susanto'),
(735390054, '', 'Bunga', 'Arum'),
(1220637501, 'AyatullahMaarif', 'Ayatullah', 'Ma\'arif'),
(1236807269, 'Firlaulya', 'Firla', 'Ulya'),
(1344122685, 'samuelandrey', 'Samuel', 'Andrey'),
(1847285486, 'mroynaldi', 'Roy', 'Aldi');

-- --------------------------------------------------------

--
-- Table structure for table `welcome_message`
--

CREATE TABLE `welcome_message` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `welcome_message`
--

INSERT INTO `welcome_message` (`id`, `message`) VALUES
(1, 'Selamat Datang di MR_bots!!\r\nketik \"/key\" untuk mulai pembelajaran java :)\r\n'),
(2, 'Hai perkenalkan saya MR_bots 👋🏻👋🏻\r\nuntuk pelajaran java anda dapat mengetikan kata kunci dibawah ini:\r\n1. \"/tentang\" tentang bahasa java\r\n2. \"/syntax\" tentang kode main.java hello world\r\n3. \"/comment\" tentang comment java\r\n4. \"/variabel\" tentang variabel java\r\n5. \"/type\" tentang tipe data java\r\n6. \"/casting\" tentang casting tipe data\r\n7. \"/operator\" tentang operator java'),
(3, 'Hai Selamat Datang di MR_bots!!\r\nklik \"/start\" jika ingin melanjutkan.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_ibfk_1` (`userId`),
  ADD KEY `welcome_message_id` (`welcome_message_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `welcome_message`
--
ALTER TABLE `welcome_message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD CONSTRAINT `broadcast_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `member` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `log_ibfk_3` FOREIGN KEY (`welcome_message_id`) REFERENCES `welcome_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
