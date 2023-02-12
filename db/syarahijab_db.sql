-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2022 at 06:35 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `syarahijab_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adm`
--

CREATE TABLE `adm` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adm`
--

INSERT INTO `adm` (`id_admin`, `username`, `pass`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `kategori` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Hijab'),
(2, 'Inner'),
(3, 'Dress'),
(4, 'Top'),
(5, 'Bottom');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(3) NOT NULL,
  `nama_kota` varchar(10) NOT NULL,
  `tarif` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jakarta', 10000),
(2, 'Tangerang', 15000),
(3, 'Bogor', 25000),
(4, 'Depok', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(30) NOT NULL,
  `password_pelanggan` varchar(15) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telpon_pelanggan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telpon_pelanggan`) VALUES
(16, 'early@gmail.com', '123456', 'early', '0812334556777'),
(17, 'tarisya@gmail.com', 'tarisya', 'tarisya', '0212222222222');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(5) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `bank` varchar(30) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(8, 28, 'early', 'danamon', 164000, '2022-04-23', '20220423185312Screenshot (44).png'),
(9, 29, 'early', 'bank dki', 95000, '2022-05-28', '20220528164159Screenshot (128).png'),
(13, 35, 'early123', 'jenius', 115000, '2022-06-10', '20220610182254HD3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(5) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(30) NOT NULL,
  `tarif` int(5) NOT NULL,
  `alamat_pengiriman` varchar(50) NOT NULL,
  `status_pembelian` varchar(20) NOT NULL DEFAULT 'PENDING',
  `resi_pengiriman` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(35, 16, 1, '2022-06-10', 115000, 'Jakarta', 10000, 'jkt no 48', 'SUCCESS', '');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `harga` int(9) NOT NULL,
  `berat` int(3) NOT NULL,
  `subharga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah_produk`, `nama`, `harga`, `berat`, `subharga`) VALUES
(1, 1, 1, 10, '', 0, 0, 0),
(2, 1, 1, 5, '', 0, 0, 0),
(3, 8, 17, 1, '', 0, 0, 0),
(4, 8, 16, 1, '', 0, 0, 0),
(5, 9, 17, 1, '', 0, 0, 0),
(6, 9, 16, 1, '', 0, 0, 0),
(7, 10, 10, 1, '', 0, 0, 0),
(8, 0, 7, 1, '', 0, 0, 0),
(9, 11, 7, 1, '', 0, 0, 0),
(10, 0, 1, 1, '', 0, 0, 0),
(11, 12, 1, 1, '', 0, 0, 0),
(12, 13, 1, 1, '', 0, 0, 0),
(13, 13, 10, 1, '', 0, 0, 0),
(14, 14, 10, 1, '', 0, 0, 0),
(15, 14, 7, 1, '', 0, 0, 0),
(16, 15, 7, 1, 'Motor Vespa Super 76', 30000000, 20, 30000000),
(17, 15, 16, 1, 'Vespa Sprint Tahun 2015 Matic', 40000000, 30, 40000000),
(18, 16, 7, 1, 'Motor Vespa Super 76', 35000000, 20, 35000000),
(19, 16, 10, 1, 'Body Vespa 150 Super Tahun 190', 40000000, 30, 40000000),
(20, 17, 10, 1, 'Body Vespa 150 Super Tahun 190', 40000000, 30, 40000000),
(21, 18, 16, 1, 'Vespa Sprint Tahun 2015 Matic', 40000000, 30, 40000000),
(22, 18, 10, 1, 'Body Vespa 150 Super Tahun 190', 40000000, 30, 40000000),
(23, 19, 15, 1, 'Velg Vespa Sprint Tahun 1970', 1200000, 2, 1200000),
(24, 19, 7, 1, 'Motor Vespa Super 76', 35000000, 20, 35000000),
(25, 20, 10, 1, 'Body Vespa 150 Super Tahun 190', 40000000, 30, 40000000),
(26, 21, 15, 2, 'Velg Vespa Sprint 70', 1200000, 2, 2400000),
(27, 22, 15, 2, 'Velg Vespa Sprint 70', 1200000, 2, 2400000),
(28, 23, 7, 1, 'Motor Vespa Super 76', 35000000, 20, 35000000),
(29, 24, 7, 1, 'Motor Vespa Super 76', 35000000, 20, 35000000),
(30, 25, 15, 1, 'Velg Vespa Sprint 70', 1200000, 2, 1200000),
(31, 26, 28, 2, 'Blodar', 40000, 1, 80000),
(32, 26, 29, 1, 'Bomboloni', 45000, 1, 45000),
(33, 27, 28, 1, 'Blodar', 40000, 1, 40000),
(34, 28, 28, 1, 'Hijab Paris Premium - Cream', 19000, 1, 19000),
(35, 28, 30, 3, 'Turkish Shawl - Maroon', 45000, 1, 135000),
(36, 29, 33, 1, 'Turkish Shawl - Black', 45000, 1, 45000),
(37, 29, 40, 1, 'Inner Basic Tanktop - Grey', 40000, 1, 40000),
(38, 30, 39, 1, 'Bergo Shanum - Creamy', 60000, 1, 60000),
(39, 31, 39, 0, 'Bergo Shanum - Creamy', 60000, 1, 0),
(40, 32, 37, 1, 'Turkish Shawl - Sky Blue', 45000, 1, 45000),
(41, 33, 37, 2, 'Turkish Shawl - Sky Blue', 45000, 1, 90000),
(42, 34, 33, 1, 'Turkish Shawl - Black', 45000, 1, 45000),
(43, 35, 45, 1, ' Kala Top - Beige', 105000, 350, 105000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `kat_produk` varchar(15) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(4) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `kat_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(27, 'Hijab', 'Hijab Paris Premium - Abu Muda', 19000, 80, 'HPPAM.jpg', '                        Daily hijab segi empat yang bisa digunakan sehari-hari dan cocok dengan segala bentuk wajah.<p>\r\n<br>\r\nHarga : 19.000 <p>\r\nUkuran 110 x 110 cm <p>\r\nBahan Paris (Premium) <p>\r\n<br>\r\nHijab Paris Premium: <p>\r\n• Sangat mudah dibentuk, <p>\r\n• Sangat nyaman dan tegak saat digunakan, <p>\r\n• Lembut dan tidak licin. <p>\r\n<br>\r\nNOTE : kemiripan warna barang dengan gambar 80-90% karena bergantung pada resolusi layar monitor atau handphone, pencahayaan dan editing pada saat dokumentasi. Dan bisa digunakan untuk berbagai acara lhooo!                                        ', 7),
(28, 'Hijab', 'Hijab Paris Premium - Cream', 19000, 80, 'HPPCOK.jpg', '                Daily hijab segi empat yang bisa digunakan sehari-hari dan cocok dengan segala bentuk wajah.<p>\r\n<br>\r\nHarga : 19.000 <p>\r\nUkuran 110 x 110 cm <p>\r\nBahan Paris (Premium) <p>\r\n<br>\r\nHijab Paris Premium: <p>\r\n• Sangat mudah dibentuk, <p>\r\n• Sangat nyaman dan tegak saat digunakan, <p>\r\n• Lembut dan tidak licin. <p>\r\n<br>\r\nNOTE : kemiripan warna barang dengan gambar 80-90% karena bergantung pada resolusi layar monitor atau handphone, pencahayaan dan editing pada saat dokumentasi. Dan bisa digunakan untuk berbagai acara lhooo!                  ', 4),
(29, 'Hijab', 'Hijab Paris Premium - Abu Tua', 19000, 80, 'HPPAT.jpg', '                Daily hijab segi empat yang bisa digunakan sehari-hari dan cocok dengan segala bentuk wajah.<p>\r\n<br>\r\nHarga : 19.000 <p>\r\nUkuran 110 x 110 cm <p>\r\nBahan Paris (Premium) <p>\r\n<br>\r\nHijab Paris Premium: <p>\r\n• Sangat mudah dibentuk, <p>\r\n• Sangat nyaman dan tegak saat digunakan, <p>\r\n• Lembut dan tidak licin. <p>\r\n<br>\r\nNOTE : kemiripan warna barang dengan gambar 80-90% karena bergantung pada resolusi layar monitor atau handphone, pencahayaan dan editing pada saat dokumentasi. Dan bisa digunakan untuk berbagai acara lhooo!                    ', 5),
(30, 'Hijab', 'Turkish Shawl - Maroon', 45000, 155, 'TSMAR.jpg', '        Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.        ', 10),
(31, 'Hijab', 'Turkish Shawl - Navy', 45000, 155, 'TSN.jpg', '        Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.        ', 11),
(32, 'Hijab', 'Turkish Shawl - Army', 45000, 155, 'TSDA.jpg', '                                Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.                                ', 1),
(33, 'Hijab', 'Turkish Shawl - Black', 45000, 155, 'TSBK.jpg', '                Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.                ', 5),
(34, 'Hijab', 'Turkish Shawl - White', 45000, 155, 'TSBW.jpg', '                Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.                ', 5),
(35, 'Hijab', 'Turkish Shawl - Dusty Pink', 45000, 155, 'TSDPINK.jpg', '                Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.                ', 2),
(36, 'Hijab', 'Turkish Shawl - Lavender', 45000, 155, 'TSLAV.jpg', '        Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.        ', 2),
(37, 'Hijab', 'Turkish Shawl - Sky Blue', 45000, 155, 'TSSB.jpg', '                        Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.                        ', 3),
(38, 'Hijab', 'Turkish Shawl -  Stone Cold', 45000, 155, 'TSS.jpg', '        Material Ceruty Babydoll yang lagi trend banget sekarang, karena dia punya karakteristik sendiri yaitu bahan super jatuh dan bertekstur pasir sehingga sangat mudah di atur.<p>\r\n<br>\r\n• Size (180x75) <p>\r\n• Kualitas Premium. <p>\r\n• Finishing JAHIT TEPI KECIL RAPIH. <p>\r\n• Ringan dan jatuh. <p>\r\n• Price 45.000/pcs.        ', 3),
(39, 'Hijab', 'Bergo Shanum - Creamy', 60000, 118, 'BSC.jpg', '        Material Bahan : High Quality Jersey. <p>\r\nP. Belakang: 78 <p>\r\nP. Depan: 75 <p>\r\nLingkar Muka: 50cm <p>\r\n<br>\r\nHarga 60.000\r\n                      ', 6),
(40, 'Inner', 'Inner Basic Tanktop - Grey', 40000, 150, 'IBTDG.jpg', '        Material : Rib Katun. <p>\r\nHarga : 40.000 <p>\r\n<br>\r\n-Bahan Rib Katun yang lembut, strecth serta tebal namun tidak bikin gerah. <p>\r\n- Nyaman digunakan sehari-hari. <p>\r\n- All size fit to XL        ', 6),
(41, 'Inner', 'Inner Basic Tanktop - Navy', 40000, 150, 'IBTN.jpg', '                Material : Rib Katun. <p>\r\nHarga : 40.000 <p>\r\n<br>\r\n-Bahan Rib Katun yang lembut, strecth serta tebal namun tidak bikin gerah. <p>\r\n- Nyaman digunakan sehari-hari. <p>\r\n- All size fit to XL                ', 11),
(42, 'Inner', 'Inner Basic  Tanktop - White', 40000, 150, 'IBTW.jpg', '        Material : Rib Katun. <p>\r\nHarga : 40.000 <p>\r\n<br>\r\n-Bahan Rib Katun yang lembut, strecth serta tebal namun tidak bikin gerah. <p>\r\n- Nyaman digunakan sehari-hari. <p>\r\n- All size fit to XL        ', 17),
(43, 'Top', 'Kala Top - Black', 105000, 350, 'KTBK.jpg', '        Bahan jatuh, ringan, dan adem. Full kancing (wudhu friendly dan busui friendly) <p>\r\n<br>\r\nHarga: 105.000 <p>\r\n<br>\r\nDetail Size: <p>\r\nLingkar dada 110cm <p>\r\nLebar pundak 40cm <p>\r\nPanjang lengan 60cm <p>\r\nPanjang baju 70cm <p>\r\nLingkar ketiak 48cm\r\n        ', 14),
(44, 'Top', 'Kala Top - Navy', 105000, 350, 'KTN.jpg', '        Bahan jatuh, ringan, dan adem. Full kancing (wudhu friendly dan busui friendly) <p>\r\n<br>\r\nHarga: 105.000 <p>\r\n<br>\r\nDetail Size: <p>\r\nLingkar dada 110cm <p>\r\nLebar pundak 40cm <p>\r\nPanjang lengan 60cm <p>\r\nPanjang baju 70cm <p>\r\nLingkar ketiak 48cm\r\n        ', 1),
(45, 'Top', ' Kala Top - Beige', 105000, 350, 'KTBG.jpg', '                Bahan jatuh, ringan, dan adem. Full kancing (wudhu friendly dan busui friendly) <p>\r\n<br>\r\nHarga: 105.000 <p>\r\n<br>\r\nDetail Size: <p>\r\nLingkar dada 110cm <p>\r\nLebar pundak 40cm <p>\r\nPanjang lengan 60cm <p>\r\nPanjang baju 70cm <p>\r\nLingkar ketiak 48cm\r\n                ', 2),
(46, 'Bottom', 'Flowy Cullote ', 99000, 400, 'FCH.jpg', '        Material bahan : Cotton Polyester. <p>\r\nModel : Highwaist <p>\r\nWarna: White <p>\r\n<br>\r\nHarga: 99.000 <P>\r\n<br>\r\nDetail size:  <P>\r\nLingkar Pinggang 76-90cm  <P>\r\nPanjang Celana 100cm  <P>\r\nLebar Bawah 24cm  <P>\r\nLebar Pinggul 100cm  <P>\r\nPesak 68cm        ', 7),
(47, 'Dress', 'Aruna Dress - Polka Black', 160000, 500, 'ADB.jpg', '        Ukuran: ALL SIZE. <p>\r\nMaterial bahan : High Quality Jersey (stretchable) Ikat pinggang bisa di lepas pasang, saku kanan dan kiri, wudhu friendly. <p>\r\n<br>\r\nHarga: 160.000 <p>\r\n<br>\r\nDetail size: <p>\r\nLingkar dada 110cm <p>\r\nPanjang lengan 60 cm <p>\r\nPanjang baju 140 cm <p>\r\nLebar pinggang 108cm <p>        ', 18),
(48, 'Dress', 'Aruna Dress - Polca Terracota', 160000, 500, 'ADT.jpg', '        Ukuran: ALL SIZE. <p>\r\nMaterial bahan : High Quality Jersey (stretchable) Ikat pinggang bisa di lepas pasang, saku kanan dan kiri, wudhu friendly. <p>\r\n<br>\r\nHarga: 160.000 <p>\r\n<br>\r\nDetail size: <p>\r\nLingkar dada 110cm <p>\r\nPanjang lengan 60 cm <p>\r\nPanjang baju 140 cm <p>\r\nLebar pinggang 108cm <p>        ', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adm`
--
ALTER TABLE `adm`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
