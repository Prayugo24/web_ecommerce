-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2017 at 01:56 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `id_katalog` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(90) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `hal` varchar(4) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `harga` varchar(11) NOT NULL,
  `deskripsi` varchar(300) NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_edit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_katalog`, `id_kategori`, `judul`, `pengarang`, `penerbit`, `hal`, `gambar`, `harga`, `deskripsi`, `tanggal`, `tanggal_edit`) VALUES
(5, 4, 1, 'kimia', 'erlangga', 'erlangga', '20', '20170527091007.jpg', '20000', 'buku mengenai kimia', '2017-05-18', '0000-00-00'),
(6, 4, 4, 'IPA', 'Erlangga', 'Erlangga', '120', '20170527093227.jpg', '50000', 'Buku pengetahuan mengenai IPA', '2017-05-18', '0000-00-00'),
(7, 1, 3, 'naruto', 'kamazuki', 'erlangga', '20', '20170527093903.jpg', '50000', 'Komik manga', '2017-05-24', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_cus` int(11) NOT NULL,
  `nama_cus` varchar(40) NOT NULL,
  `email_cus` varchar(40) NOT NULL,
  `password_cus` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_cus`, `nama_cus`, `email_cus`, `password_cus`) VALUES
(1, 'Pak Zen', 'ziedanalfahrizy@gmail.com', '12345'),
(9, 'fulan bin fulan', 'fulan@yahoo.co.id', 'fulan'),
(10, 'Zaki', 'zakiucrut@gmail.com', 'ucrut'),
(11, 'zuzu', 'zuzu@gmail.com', 'zuzu'),
(13, 'Muhammad Abdullah bin Sulaiman', 'alfa@gmail.com', 'alfa');

-- --------------------------------------------------------

--
-- Table structure for table `katalog`
--

CREATE TABLE `katalog` (
  `id_katalog` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `katalog` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `katalog`
--

INSERT INTO `katalog` (`id_katalog`, `id_kategori`, `katalog`) VALUES
(1, 2, 'Komikk'),
(2, 3, 'Novel'),
(3, 4, 'Informatika'),
(4, 4, 'LKS SMK');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Dewasa'),
(2, 'Anakk'),
(3, 'Remaja'),
(4, 'Pendidikan');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_beli` varchar(100) NOT NULL,
  `id_cus` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `qty` varchar(5) NOT NULL,
  `harga` varchar(12) NOT NULL,
  `total_harga` varchar(12) NOT NULL,
  `total_bayar` varchar(20) NOT NULL,
  `qty_total` varchar(10) NOT NULL,
  `status_beli` enum('order','lunas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `kode_beli`, `id_cus`, `id_buku`, `qty`, `harga`, `total_harga`, `total_bayar`, `qty_total`, `status_beli`) VALUES
(1, '12478', 14, 4, '3', '20000', '60000', '', '', 'order'),
(2, '12478', 14, 2, '3', '80500', '241500', '', '', 'order'),
(3, '12478', 14, 5, '1', '60000', '60000', '', '', 'order'),
(4, '10653', 14, 2, '3', '80500', '241500', '', '', 'order'),
(6, '19466', 11, 2, '3', '80500', '241500', '', '', 'order');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_beli` int(11) NOT NULL,
  `kode_beli` varchar(100) NOT NULL,
  `id_cus` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `harga` varchar(15) NOT NULL,
  `total_harga` varchar(15) NOT NULL,
  `total_bayar` varchar(15) NOT NULL,
  `qty_total` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_beli`, `kode_beli`, `id_cus`, `id_buku`, `qty`, `harga`, `total_harga`, `total_bayar`, `qty_total`) VALUES
(16, '23131', 11, 2, '3', '80500', '241500', '', ''),
(17, '23131', 11, 1, '1', '56000', '56000', '', ''),
(18, '12786', 11, 1, '11', '56000', '616000', '', ''),
(19, '30870', 12, 2, '3', '80500', '241500', '', ''),
(20, '30870', 12, 3, '1', '90000', '90000', '', ''),
(21, '21850', 11, 2, '3', '80500', '241500', '', ''),
(22, '12478', 14, 4, '3', '20000', '60000', '', ''),
(23, '12478', 14, 2, '3', '80500', '241500', '', ''),
(24, '12478', 14, 5, '1', '60000', '60000', '', ''),
(25, '10653', 14, 2, '3', '80500', '241500', '', ''),
(26, '10653', 14, 4, '3', '20000', '60000', '', ''),
(27, '19466', 11, 2, '3', '80500', '241500', '', ''),
(28, '19466', 11, 1, '1', '56000', '56000', '', ''),
(29, '19466', 11, 4, '3', '20000', '60000', '', ''),
(30, '28991', 10, 2, '3', '80500', '241500', '', ''),
(31, '28991', 10, 4, '3', '20000', '60000', '', ''),
(32, '28991', 10, 4, '3', '20000', '60000', '', ''),
(33, '27434', 10, 4, '1', '20000', '20000', '', ''),
(34, '27434', 10, 2, '1', '80500', '80500', '', ''),
(35, '13837', 10, 2, '1', '80500', '80500', '', ''),
(36, '28501', 10, 2, '1', '80500', '80500', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `provinsi` varchar(30) NOT NULL,
  `tarif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `provinsi`, `tarif`) VALUES
(1, 'Jawa Timur', '11000'),
(2, 'Jawa Tengah', '12500'),
(3, 'Jawa Barat', '18000'),
(4, 'Kalimantan Barat', '48500');

-- --------------------------------------------------------

--
-- Table structure for table `selesai`
--

CREATE TABLE `selesai` (
  `kode_beli` varchar(100) NOT NULL,
  `id_cus` int(11) NOT NULL,
  `qty_total` varchar(10) NOT NULL,
  `bayar` varchar(15) NOT NULL,
  `total_bayar` varchar(15) NOT NULL,
  `tgl_order` text NOT NULL,
  `status_beli` enum('order','lunas') NOT NULL,
  `status_pengiriman` enum('belum dikirim','dikirim','diterima') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selesai`
--

INSERT INTO `selesai` (`kode_beli`, `id_cus`, `qty_total`, `bayar`, `total_bayar`, `tgl_order`, `status_beli`, `status_pengiriman`) VALUES
('28501', 10, '', '', '121501', '2017-05-26', 'order', 'belum dikirim');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `stok` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_stok`, `id_buku`, `stok`) VALUES
(5, 5, '50'),
(6, 6, '50'),
(7, 7, '45');

-- --------------------------------------------------------

--
-- Table structure for table `superuser`
--

CREATE TABLE `superuser` (
  `id_su` int(11) NOT NULL,
  `nama_su` varchar(40) NOT NULL,
  `email_su` varchar(40) NOT NULL,
  `password_su` varchar(40) NOT NULL,
  `level` enum('owner','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `superuser`
--

INSERT INTO `superuser` (`id_su`, `nama_su`, `email_su`, `password_su`, `level`) VALUES
(1, 'Prayugo', 'prayugo@gmail.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

CREATE TABLE `tujuan` (
  `id_tujuan` int(11) NOT NULL,
  `kode_beli` varchar(110) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `provinsi` varchar(30) NOT NULL,
  `kabupaten` varchar(25) NOT NULL,
  `kecamatan` varchar(25) NOT NULL,
  `kode_pos` varchar(5) NOT NULL,
  `desa` varchar(25) NOT NULL,
  `rw` varchar(3) NOT NULL,
  `rt` varchar(3) NOT NULL,
  `no_rumah` varchar(5) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `tarif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tujuan`
--

INSERT INTO `tujuan` (`id_tujuan`, `kode_beli`, `nama_penerima`, `provinsi`, `kabupaten`, `kecamatan`, `kode_pos`, `desa`, `rw`, `rt`, `no_rumah`, `no_telp`, `tarif`) VALUES
(1, '2994', 'Atokillah', 'Jawa Tengah', 'xx', 'xxx', 'xxxx', 'xxxxx', '5', '6', '32', '082453456754', '12500'),
(2, '10472', 'Fulan', 'Jawa Tengah', 'xx', 'xxxx', 'xxxxx', 'xxxxxx', '2', '5', '27', '081252258465', '12500'),
(3, '21628', 'Fulan bin Fulan', 'Jawa Barat', 'ciamis', 'ciamos', '87654', 'cibadut', '9', '6', '24', '081234567678', '18000'),
(4, '19201', 'Zaki', 'Jawa Tengah', 'xx', 'xxx', 'xxx', 'xx', '6', '7', '43', '08123456634', '12500'),
(5, '27569', 'zakia', 'Kalimantan Barat', 'x', 'x', 'x', 'x', '6', '7', '25', '085676554123', '48500'),
(6, '21866', 'siti zulaikha', 'Jawa Barat', 'xx', 'xx', 'xx', 'xx', '6', '4', '47', '086576542341', '18000'),
(7, '23131', 'Siti Zulaikha', 'Jawa Tengah', 'xxx', 'xx', 'xx', 'xx', '6', '5', '76', '085678765345', '12500'),
(8, '12786', 'bang boby', 'Jawa Tengah', 'x', 'x', 'x', 'x', '4', '2', '12', '085853480591', '12500'),
(9, '30870', 'AHMAD', 'Jawa Timur', 'nganjuk', 'baron', '64394', 'jekek', '09', '02', '22', '085853480591', '11000'),
(10, '13837', 'susanoo', '', 'malang', 'malang', '12212', 'sukabumi', '2', '23', '09019', '2322', ''),
(11, '28501', 'sasuke', 'Jawa Tengah', 'sumedang', 'sumedang', '222', 'sumedang', '2', '2', '00000', '33333', '12500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cus`);

--
-- Indexes for table `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id_katalog`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_beli`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `selesai`
--
ALTER TABLE `selesai`
  ADD PRIMARY KEY (`kode_beli`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indexes for table `superuser`
--
ALTER TABLE `superuser`
  ADD PRIMARY KEY (`id_su`);

--
-- Indexes for table `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id_tujuan`),
  ADD KEY `kode_beli` (`kode_beli`),
  ADD KEY `kode_beli_2` (`kode_beli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_cus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `katalog`
--
ALTER TABLE `katalog`
  MODIFY `id_katalog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_beli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id_provinsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `superuser`
--
ALTER TABLE `superuser`
  MODIFY `id_su` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id_tujuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
