-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 25, 2014 at 07:49 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pdpt`
--

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE IF NOT EXISTS `agama` (
  `kode_agama` char(1) NOT NULL,
  `nama_agama` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`kode_agama`, `nama_agama`) VALUES
('B', 'Budha'),
('C', 'Konghuchu'),
('H', 'Hindu'),
('I', 'Islam'),
('K', 'Katolik'),
('L', 'Lainnya'),
('P', 'Protestan');

-- --------------------------------------------------------

--
-- Table structure for table `akreditasi`
--

CREATE TABLE IF NOT EXISTS `akreditasi` (
  `kode_akreditasi` int(4) NOT NULL AUTO_INCREMENT,
  `status_akreditasi` char(1) NOT NULL,
  `keterangan_akreditasi` varchar(50) DEFAULT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_akreditasi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `akreditasi`
--

INSERT INTO `akreditasi` (`kode_akreditasi`, `status_akreditasi`, `keterangan_akreditasi`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
(1, 'B', 'Baik', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `aktivitas_kuliah_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `aktivitas_kuliah_mahasiswa` (
  `kode_kuliah_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `ips` double NOT NULL,
  `sks_semester` int(1) DEFAULT NULL,
  `ipk` double NOT NULL,
  `sks_total` int(3) DEFAULT NULL,
  PRIMARY KEY (`kode_kuliah_mahasiswa`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `tahun_pelaporan` (`tahun_pelaporan`),
  KEY `nim` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aktivitas_mengajar_dosen`
--

CREATE TABLE IF NOT EXISTS `aktivitas_mengajar_dosen` (
  `kode_kegiatan_mengajar_dosen` int(11) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) DEFAULT NULL,
  `kode_program_studi` varchar(5) DEFAULT NULL,
  `kode_jenjang_pendidikan` int(11) DEFAULT NULL,
  `kode_mata_kuliah` varchar(10) NOT NULL,
  `kode_kelas` varchar(2) NOT NULL,
  `jumlah_tatap_muka_rencana` int(2) NOT NULL,
  `jumlah_tatap_muka_realisasi` int(2) NOT NULL,
  `jenis_evaluasi` char(1) DEFAULT NULL,
  `cara_evaluasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_kegiatan_mengajar_dosen`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_program_studi_2` (`kode_program_studi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_mata_kuliah` (`kode_mata_kuliah`),
  KEY `nidn` (`nidn`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggota_penelitian_dosen`
--

CREATE TABLE IF NOT EXISTS `anggota_penelitian_dosen` (
  `kode_anggota_penelitian_dosen` int(11) NOT NULL,
  `kode_publikasi_dosen_tetap` int(11) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_anggota_penelitian_dosen`),
  KEY `nidn` (`nidn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggota_penelitian_tenaga_ahli`
--

CREATE TABLE IF NOT EXISTS `anggota_penelitian_tenaga_ahli` (
  `kode_anggota_peneliti_tenaga_ahli` int(11) NOT NULL,
  `kode_publikasi_dosen_tetap` int(11) NOT NULL,
  `kode_tenaga_ahli` int(11) NOT NULL,
  PRIMARY KEY (`kode_anggota_peneliti_tenaga_ahli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggota_penelitian_tenaga_pendukung`
--

CREATE TABLE IF NOT EXISTS `anggota_penelitian_tenaga_pendukung` (
  `kode_anggota_peneliti_tenaga_pendukung` int(11) NOT NULL,
  `kode_publikasi_dosen_tetap` int(11) NOT NULL,
  `kode_tenaga_pendukung` int(11) NOT NULL,
  PRIMARY KEY (`kode_anggota_peneliti_tenaga_pendukung`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `badan_hukum`
--

CREATE TABLE IF NOT EXISTS `badan_hukum` (
  `kode_badan_hukum` varchar(7) NOT NULL,
  `nama_badan_hukum` varchar(50) NOT NULL,
  `tanggal_awal_berdiri` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kode_kota` int(11) NOT NULL,
  `kode_provinsi` int(11) NOT NULL,
  `kode_negara` int(11) NOT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `website` varchar(40) DEFAULT NULL,
  `no_akta_terakhir` varchar(30) NOT NULL,
  `tanggal_akta_terakhir` date NOT NULL,
  `no_pengesahan_pn_ln` varchar(30) NOT NULL,
  `tanggal_pengesahan_pn_ln` date NOT NULL,
  `status_validasi` int(1) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_badan_hukum`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_kota_2` (`kode_kota`),
  KEY `kode_provinsi` (`kode_provinsi`),
  KEY `kode_negara` (`kode_negara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

CREATE TABLE IF NOT EXISTS `beasiswa` (
  `kode_beasiswa` int(11) NOT NULL,
  `jenis_beasiswa` varchar(50) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_beasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bobot_nilai`
--

CREATE TABLE IF NOT EXISTS `bobot_nilai` (
  `kode_bobot_nilai` int(1) NOT NULL AUTO_INCREMENT,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `bobot_nilai_minimum` double NOT NULL,
  `bobot_nilai_maksimum` double NOT NULL,
  `nilai` char(1) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_bobot_nilai`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_default`
--

CREATE TABLE IF NOT EXISTS `data_default` (
  `nama` varchar(25) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `nidn` varchar(50) NOT NULL,
  `prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_default`
--

INSERT INTO `data_default` (`nama`, `nip`, `nidn`, `prodi`) VALUES
('M. FICKY DUSKARNAEN', '19730924 200604 1 001', '0024097304', 'Pendidikan Teknik Informatika dan Komputer'),
('HAMIDILLAH AJIE', '19740824 200501 1 001', '0024087402', 'Pendidikan Teknik Informatika dan Komputer'),
('MOCHAMMAD DJAOHAR', '19700303 200604 1 001', '0003037004', 'Pendidikan Teknik Informatika dan Komputer'),
('SOEPRIJANTO', '19581225 198703 1 001', '0025125811', 'Pendidikan Teknik Elektronika');

-- --------------------------------------------------------

--
-- Table structure for table `daya_tampung`
--

CREATE TABLE IF NOT EXISTS `daya_tampung` (
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `target_mahasiswa_baru` int(11) NOT NULL,
  `calon_ikut_seleksi` int(4) NOT NULL,
  `calon_lulus_seleksi` int(4) NOT NULL,
  `mendaftar_sebagai_mahasiswa` int(11) NOT NULL,
  `peserta_mengundurkan_diri` int(11) DEFAULT NULL,
  `tanggal_awal_kuliah_semester_ganjil` date DEFAULT NULL,
  `tanggal_akhir_kuliah_semester_ganjil` date DEFAULT NULL,
  `jumlah_minggu_kuliah_semester_ganjil` int(11) DEFAULT NULL,
  `tanggal_awal_kuliah_semester_genap` date DEFAULT NULL,
  `tanggal_akhir_kuliah_semester_genap` date DEFAULT NULL,
  `jumlah_minggu_kuliah_semester_genap` int(11) DEFAULT NULL,
  `metode_kuliah` char(1) DEFAULT NULL,
  `metode_kuliah_ekstensi` char(1) DEFAULT NULL,
  `jumlah_sp_setahun` int(11) DEFAULT NULL,
  `metode_sp` char(1) DEFAULT NULL,
  PRIMARY KEY (`tahun_pelaporan`,`semester_pelaporan`,`kode_perguruan_tinggi`,`kode_program_studi`,`kode_jenjang_pendidikan`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `nidn` varchar(10) NOT NULL,
  `nip_lama` varchar(9) DEFAULT NULL,
  `nip_baru` varchar(30) DEFAULT NULL,
  `golongan` varchar(5) DEFAULT NULL,
  `pangkat` char(1) DEFAULT NULL,
  `jabatan_fungsional` varchar(50) NOT NULL,
  `jabatan_struktural` varchar(50) DEFAULT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_fakultas` varchar(2) NOT NULL,
  `kode_jurusan` varchar(5) NOT NULL,
  `kode_program_studi` varchar(5) DEFAULT NULL,
  `nama_dosen` varchar(30) NOT NULL,
  `no_ktp` varchar(25) NOT NULL,
  `gelar_akademik_depan` varchar(30) DEFAULT NULL,
  `gelar_akademik_belakang` varchar(30) DEFAULT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `status_aktif` char(1) NOT NULL,
  `mulai_masuk_dosen` date NOT NULL,
  `mulai_semester` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `kode_jabatan_akademik` char(1) NOT NULL,
  `ikatan_kerja` char(1) NOT NULL,
  `akta_dan_ijin_mengajar` char(1) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `kode_kota` int(11) DEFAULT NULL,
  `kode_provinsi` int(11) DEFAULT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `kode_negara` int(11) DEFAULT NULL,
  `no_sertifikasi_dosen` int(11) NOT NULL,
  `tanggal_keluar_sertifikasi_dosen` date NOT NULL,
  `nira` varchar(30) DEFAULT NULL,
  `status_validasi` int(1) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nidn`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_negara` (`kode_negara`),
  KEY `kode_provinsi` (`kode_provinsi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_fakultas` (`kode_fakultas`),
  KEY `kode_program_studi_2` (`kode_program_studi`),
  KEY `kode_jurusan` (`kode_jurusan`),
  KEY `kode_fakultas_2` (`kode_fakultas`),
  KEY `kode_jabatan_akademik` (`kode_jabatan_akademik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nidn`, `nip_lama`, `nip_baru`, `golongan`, `pangkat`, `jabatan_fungsional`, `jabatan_struktural`, `kode_perguruan_tinggi`, `kode_fakultas`, `kode_jurusan`, `kode_program_studi`, `nama_dosen`, `no_ktp`, `gelar_akademik_depan`, `gelar_akademik_belakang`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `status_aktif`, `mulai_masuk_dosen`, `mulai_semester`, `kode_jenjang_pendidikan`, `kode_jabatan_akademik`, `ikatan_kerja`, `akta_dan_ijin_mengajar`, `alamat`, `kode_kota`, `kode_provinsi`, `kode_pos`, `kode_negara`, `no_sertifikasi_dosen`, `tanggal_keluar_sertifikasi_dosen`, `nira`, `status_validasi`, `telepon`, `hp`) VALUES
('123456789', '111111111', '112233445', NULL, NULL, '', NULL, '1', '1', '1', '1', 'Agung Surya Bangsa', '', NULL, NULL, '', '', '0000-00-00', '', '0000-00-00', '', 1, '1', '', '', NULL, 1, 1, NULL, 1, 0, '0000-00-00', NULL, 0, '02199454431', '085711042755');

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE IF NOT EXISTS `fakultas` (
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_fakultas` varchar(2) NOT NULL,
  `singkatan` varchar(50) NOT NULL,
  `nama_fakultas` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kode_pos` int(5) NOT NULL,
  `kode_kota` int(11) NOT NULL,
  `kode_provinsi` int(11) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_perguruan_tinggi`,`kode_fakultas`),
  KEY `kode_fakultas` (`kode_fakultas`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_provinsi` (`kode_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`kode_perguruan_tinggi`, `kode_fakultas`, `singkatan`, `nama_fakultas`, `alamat`, `kode_pos`, `kode_kota`, `kode_provinsi`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`, `status_validasi`) VALUES
('1', '1', 'FT', 'Fakultas Teknik', '', 0, 1, 1, '0000-00-00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_penunjang_akademik`
--

CREATE TABLE IF NOT EXISTS `fasilitas_penunjang_akademik` (
  `kode_fakultas_penunjang_akademik` int(11) NOT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `jenis_sarjana` varchar(50) NOT NULL,
  `satuan_sarana` varchar(50) NOT NULL,
  `luas_sarana` int(11) NOT NULL,
  `luas_yang_digunakan_diakses_oleh_program_studi` int(11) DEFAULT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_fakultas_penunjang_akademik`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `frekuensi_kurikulum`
--

CREATE TABLE IF NOT EXISTS `frekuensi_kurikulum` (
  `kode_frekuensi_kurikulum` int(11) NOT NULL,
  `nama_frekuensi_kurikulum` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_frekuensi_kurikulum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fte_dosen`
--

CREATE TABLE IF NOT EXISTS `fte_dosen` (
  `kode_fte_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `jenis_fte` int(1) NOT NULL,
  `jumlah_fte` int(11) NOT NULL,
  PRIMARY KEY (`kode_fte_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fungsi_lab`
--

CREATE TABLE IF NOT EXISTS `fungsi_lab` (
  `kode_fungsi_lab` int(11) NOT NULL AUTO_INCREMENT,
  `fungsi_lab` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_fungsi_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hki`
--

CREATE TABLE IF NOT EXISTS `hki` (
  `kode_hki` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `nama_hki` varchar(50) NOT NULL,
  `nomor_register_hki` varchar(50) NOT NULL,
  `nomor_hki` varchar(50) DEFAULT NULL,
  `kategori_hki` int(1) DEFAULT NULL,
  PRIMARY KEY (`kode_hki`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ikatan_kerja`
--

CREATE TABLE IF NOT EXISTS `ikatan_kerja` (
  `kode_ikatan_kerja` int(11) NOT NULL,
  `ikatan_kerja` char(1) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_ikatan_kerja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan_akademik`
--

CREATE TABLE IF NOT EXISTS `jabatan_akademik` (
  `kode_jabatan_akademik` char(1) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_jabatan_akademik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan_akademik`
--

INSERT INTO `jabatan_akademik` (`kode_jabatan_akademik`, `deskripsi`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
('1', 'Dosen', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_perguruan_tinggi`
--

CREATE TABLE IF NOT EXISTS `jenis_perguruan_tinggi` (
  `kode_jenis_pt` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_pt` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_jenis_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jenjang_pendidikan`
--

CREATE TABLE IF NOT EXISTS `jenjang_pendidikan` (
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `waktu_pelaksanaan_jenjang` varchar(40) NOT NULL,
  `group_jenjang_studi` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenjang_pendidikan`
--

INSERT INTO `jenjang_pendidikan` (`kode_jenjang_pendidikan`, `deskripsi`, `waktu_pelaksanaan_jenjang`, `group_jenjang_studi`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
(1, 'S1', '', '', '2010-11-01', '2014-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
  `kode_jurusan` varchar(5) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `kode_fakultas` varchar(2) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `program_studi_yang_diasuh` varchar(5) NOT NULL,
  `tanggal_awal_berdiri` date NOT NULL,
  `no_sk_penyelenggara` varchar(40) NOT NULL,
  `tanggal_sk_penyelenggara` date NOT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_jurusan`),
  KEY `kode_fakultas` (`kode_fakultas`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_fakultas`, `kode_perguruan_tinggi`, `program_studi_yang_diasuh`, `tanggal_awal_berdiri`, `no_sk_penyelenggara`, `tanggal_sk_penyelenggara`, `status_validasi`) VALUES
('1', 'Teknik Elektro', '1', '1', '', '0000-00-00', '', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_penghasilan`
--

CREATE TABLE IF NOT EXISTS `kategori_penghasilan` (
  `kode_kategori_penghasilan` int(11) NOT NULL AUTO_INCREMENT,
  `range_penghasilan_minimum` int(11) NOT NULL,
  `range_penghasilan_maksimum` int(11) NOT NULL,
  `sumber_penghasilan` varchar(50) DEFAULT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_kategori_penghasilan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_bidang_ilmu`
--

CREATE TABLE IF NOT EXISTS `kelompok_bidang_ilmu` (
  `kode_kelompok_bidang_ilmu` char(1) NOT NULL,
  `nama_bidang_ilmu` int(11) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_kelompok_bidang_ilmu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kementrian`
--

CREATE TABLE IF NOT EXISTS `kementrian` (
  `kode_kementrian` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kementrian` varchar(100) NOT NULL,
  `singkatan` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_kementrian`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kementrian`
--

INSERT INTO `kementrian` (`kode_kementrian`, `nama_kementrian`, `singkatan`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
(1, 'Kementrian Pendidikan dan Kebudayaan', 'Kemendikbud', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `kerjasama_instansi`
--

CREATE TABLE IF NOT EXISTS `kerjasama_instansi` (
  `kode_kerjasama_instansi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kerjasama_instansi` varchar(255) NOT NULL,
  `nama_kegiatan` varchar(50) NOT NULL,
  `mulai_kerjasama` date DEFAULT NULL,
  `akhir_kerjasama` date DEFAULT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  PRIMARY KEY (`kode_kerjasama_instansi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kerjasama_ptln`
--

CREATE TABLE IF NOT EXISTS `kerjasama_ptln` (
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_perguruan_tinggi_asing` varchar(6) NOT NULL,
  `kode_kerjasama_ptln` int(11) NOT NULL,
  `uraian_bentuk_kerjasama` varchar(255) NOT NULL,
  PRIMARY KEY (`kode_kerjasama_ptln`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kinerja_dosen`
--

CREATE TABLE IF NOT EXISTS `kinerja_dosen` (
  `kode_kinerja_dosen` int(11) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `nip_lama` varchar(9) DEFAULT NULL,
  `nip_baru` varchar(30) DEFAULT NULL,
  `no_dosen` varchar(10) DEFAULT NULL,
  `kode_perguruan_tinggi` varchar(6) DEFAULT NULL,
  `kode_program_studi` varchar(5) DEFAULT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nidn_assesor_1` varchar(10) NOT NULL,
  `nidn_assesor_2` varchar(10) NOT NULL,
  `kategori_evaluasi` int(1) NOT NULL,
  `jenis_kegiatan` char(1) NOT NULL,
  `bukti_penugasan` varchar(50) NOT NULL,
  `sks_beban_kerja` int(1) NOT NULL,
  `masa_pelaksanaan_tugas_awal` date NOT NULL,
  `masa_pelaksanaan_tugas_akhir` date NOT NULL,
  `bukti_dokumen_kinerja` blob NOT NULL,
  `persentase_capaian_kinerja` double NOT NULL,
  `sks_capaian_kinerja` int(1) NOT NULL,
  `penilaian_asesor` double NOT NULL,
  `rekomendasi_asesor` varchar(50) DEFAULT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_kinerja_dosen`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `nidn` (`nidn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kopertis`
--

CREATE TABLE IF NOT EXISTS `kopertis` (
  `kode_kopertis` int(11) NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(255) NOT NULL,
  `group_kopertis` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kode_kota` int(11) NOT NULL,
  `kode_provinsi` int(11) NOT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `website` varchar(40) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_kopertis`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_provinsi` (`kode_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `kode_kota` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kabupaten` varchar(50) NOT NULL,
  `kode_provinsi` int(11) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_kota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`kode_kota`, `nama_kabupaten`, `kode_provinsi`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
(1, '', 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `laboratorium`
--

CREATE TABLE IF NOT EXISTS `laboratorium` (
  `kode_lab` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut_lab` varchar(2) NOT NULL,
  `nama_lab` varchar(40) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kepemilikan_lab` char(1) NOT NULL,
  `lokasi_lab` char(1) NOT NULL,
  `luas_lab` int(11) DEFAULT NULL,
  `kapasitas_praktikum_satu_shift` int(11) DEFAULT NULL,
  `lab_penggunaan_mhs` int(11) DEFAULT NULL,
  `lab_penggunaan_jam` int(11) DEFAULT NULL,
  `jumlah_ps_pengguna` int(11) DEFAULT NULL,
  `jumlah_modul_praktikum_ps_sendiri` int(11) DEFAULT NULL,
  `jumlah_modul_praktikum_ps_lain` int(11) DEFAULT NULL,
  `fungsi_selain_praktikum` int(11) DEFAULT NULL,
  `penggunaan_lab` char(1) DEFAULT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_lab`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_program_studi` (`kode_program_studi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `nama_mahasiswa` varchar(30) NOT NULL,
  `kelas` char(1) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `kode_kota` int(11) DEFAULT NULL,
  `kode_provinsi` int(11) DEFAULT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `kode_negara` int(11) DEFAULT NULL,
  `status_mahasiswa` char(1) NOT NULL,
  `tahun_masuk` int(4) NOT NULL,
  `nilai_semester` varchar(5) NOT NULL,
  `batas_studi` int(5) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_lulus` date NOT NULL,
  `ipk_akhir` double NOT NULL,
  `no_sk_yudisium` varchar(30) NOT NULL,
  `tanggal_sk_yudisium` date NOT NULL,
  `no_seri_ijazah` varchar(40) NOT NULL,
  `kode_provinsi_asal_pendidikan_sebelumnya` int(11) DEFAULT NULL,
  `status_awal_mahasiswa` char(1) NOT NULL,
  `sks_diakui` int(3) NOT NULL,
  `kode_perguruan_tinggi_asal` varchar(6) NOT NULL,
  `kode_program_studi_asal` varchar(5) NOT NULL,
  `kode_beasiswa` int(11) DEFAULT NULL,
  `kode_jenjang_pendidikan_sebelumnya` int(11) DEFAULT NULL,
  `nim_asal` varchar(15) DEFAULT NULL,
  `kode_biaya_studi` char(1) DEFAULT NULL,
  `kode_pekerjaan` char(1) DEFAULT NULL,
  `nama_tempat_bekerja` varchar(40) DEFAULT NULL,
  `kode_pt_bekerja` varchar(6) DEFAULT NULL,
  `kode_ps_bekerja` varchar(5) DEFAULT NULL,
  `nidn_promotor` varchar(10) DEFAULT NULL,
  `nidn_kopromotor_1` varchar(10) DEFAULT NULL,
  `nidn_kopromotor_2` varchar(10) DEFAULT NULL,
  `nidn_kopromotor_3` varchar(10) DEFAULT NULL,
  `nidn_kopromotor_4` varchar(10) DEFAULT NULL,
  `jalur_skripsi` int(1) DEFAULT NULL,
  `judul_skripsi` varchar(100) DEFAULT NULL,
  `bulan_awal_bimbingan` int(6) DEFAULT NULL,
  `bulan_akhir_bimbingan` int(6) DEFAULT NULL,
  `nisn` int(10) DEFAULT NULL,
  `kode_kategori_penghasilan` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_perguruan_tinggi`,`kode_program_studi`,`nim`),
  KEY `nim` (`nim`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_provinsi` (`kode_provinsi`),
  KEY `kode_negara` (`kode_negara`),
  KEY `kode_beasiswa` (`kode_beasiswa`),
  KEY `kode_kategori_penghasilan` (`kode_kategori_penghasilan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `kode_mata_kuliah` varchar(10) NOT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nama_mata_kuliah` varchar(40) NOT NULL,
  `jenis_mata_kuliah` char(1) DEFAULT NULL,
  `semester` int(1) DEFAULT NULL,
  `kelompok_mata_kuliah` char(1) DEFAULT NULL,
  `sks_mata_kuliah` int(1) DEFAULT NULL,
  `sks_tatap_muka` int(1) DEFAULT NULL,
  `sks_praktikum` int(1) DEFAULT NULL,
  `sk_praktek_lapangan` int(1) DEFAULT NULL,
  `sks_simulasi` int(1) DEFAULT NULL,
  `metode_pelaksanaan_kuliah` varchar(50) DEFAULT NULL,
  `status_mata_kuliah` varchar(50) DEFAULT NULL,
  `kode_kurikulum` char(1) DEFAULT NULL,
  `kode_kelas` varchar(2) DEFAULT NULL,
  `sap` int(1) DEFAULT NULL,
  `silabus` char(1) DEFAULT NULL,
  `bahan_ajar` char(1) DEFAULT NULL,
  `acara_praktek` int(11) DEFAULT NULL,
  `diktat` char(1) DEFAULT NULL,
  `nidn` char(1) DEFAULT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_mata_kuliah`,`tahun_pelaporan`,`semester_pelaporan`,`kode_perguruan_tinggi`,`kode_program_studi`,`kode_jenjang_pendidikan`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `nidn` (`nidn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `negara`
--

CREATE TABLE IF NOT EXISTS `negara` (
  `kode_negara` int(11) NOT NULL AUTO_INCREMENT,
  `nama_negara` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_negara`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `negara`
--

INSERT INTO `negara` (`kode_negara`, `nama_negara`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
(1, 'Indonesia', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_semester_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `nilai_semester_mahasiswa` (
  `kode_nilai_mahasiswa` int(1) NOT NULL AUTO_INCREMENT,
  `kode_kuliah_mahasiswa` int(11) NOT NULL,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_mata_kuliah` varchar(10) NOT NULL,
  `bobot_nilai` double NOT NULL,
  `kode_kelas` varchar(2) NOT NULL,
  PRIMARY KEY (`kode_nilai_mahasiswa`,`kode_kuliah_mahasiswa`),
  KEY `kode_kuliah_mahasiswa` (`kode_kuliah_mahasiswa`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_studi` (`kode_jenjang_pendidikan`),
  KEY `kode_mata_kuliah` (`kode_mata_kuliah`),
  KEY `nim` (`nim`),
  KEY `kode_mata_kuliah_2` (`kode_mata_kuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE IF NOT EXISTS `penduduk` (
  `kode_penduduk` int(11) NOT NULL AUTO_INCREMENT,
  `jumlah_penduduk` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `kategori_penduduk` varchar(50) NOT NULL,
  `nilai_kategori_penduduk` varchar(50) DEFAULT NULL,
  `kode_provinsi` int(11) DEFAULT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `referensi` varchar(50) DEFAULT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_penduduk`),
  KEY `kode_provinsi` (`kode_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `perguruan_tinggi`
--

CREATE TABLE IF NOT EXISTS `perguruan_tinggi` (
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_badan_hukum` varchar(7) DEFAULT NULL,
  `nama_pt` varchar(50) NOT NULL,
  `singkatan` varchar(50) DEFAULT NULL,
  `jenis_pt` char(1) NOT NULL,
  `kategori_pt` int(1) NOT NULL,
  `status_pt` char(1) NOT NULL,
  `tanggal_awal_berdiri` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kode_pos` int(5) NOT NULL,
  `kode_kota` int(11) NOT NULL,
  `kode_provinsi` int(11) NOT NULL,
  `kode_negara` int(11) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `website` varchar(40) DEFAULT NULL,
  `no_akta_sk_pendirian` varchar(30) NOT NULL,
  `tanggal_akta` date NOT NULL,
  `kode_akreditasi` int(11) NOT NULL,
  `no_sk_banpt` varchar(40) NOT NULL,
  `tanggal_sk_banpt` date NOT NULL,
  `visi` varchar(255) DEFAULT NULL,
  `misi` varchar(255) DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `sasaran` varchar(255) DEFAULT NULL,
  `kode_kopertis` int(11) DEFAULT NULL,
  `kode_wilayah` int(11) DEFAULT NULL,
  `seleksi_penerimaan` varchar(255) DEFAULT NULL,
  `pola_kepemimpinan` varchar(255) DEFAULT NULL,
  `sistem_pengelolaan` varchar(255) DEFAULT NULL,
  `sistem_penjaminan_mutu` varchar(255) DEFAULT NULL,
  `alasan_transfer_mahasiswa` varchar(100) DEFAULT NULL,
  `peran_pt_dalam_pembelajaran` varchar(255) DEFAULT NULL,
  `peran_pt_dalam_penyusunan_kurikulum` varchar(255) DEFAULT NULL,
  `peran_pt_dalam_suasana_akademik` varchar(255) DEFAULT NULL,
  `pemanfaatan_tik` varchar(50) DEFAULT NULL,
  `penyeberan_informasi` varchar(255) DEFAULT NULL,
  `rencana_pengembangan_si` varchar(255) DEFAULT NULL,
  `evaluasi_lulusan` varchar(255) DEFAULT NULL,
  `mekanisme_evaluasi_lulusan` varchar(50) DEFAULT NULL,
  `kode_kementrian` int(11) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_perguruan_tinggi`),
  KEY `kode_badan_hukum` (`kode_badan_hukum`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_provinsi` (`kode_provinsi`),
  KEY `kode_negara` (`kode_negara`),
  KEY `kode_akreditasi` (`kode_akreditasi`),
  KEY `kode_kopertis` (`kode_kopertis`),
  KEY `kode_wilayah` (`kode_wilayah`),
  KEY `kode_kementrian` (`kode_kementrian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perguruan_tinggi`
--

INSERT INTO `perguruan_tinggi` (`kode_perguruan_tinggi`, `kode_badan_hukum`, `nama_pt`, `singkatan`, `jenis_pt`, `kategori_pt`, `status_pt`, `tanggal_awal_berdiri`, `alamat`, `kode_pos`, `kode_kota`, `kode_provinsi`, `kode_negara`, `telepon`, `fax`, `email`, `website`, `no_akta_sk_pendirian`, `tanggal_akta`, `kode_akreditasi`, `no_sk_banpt`, `tanggal_sk_banpt`, `visi`, `misi`, `tujuan`, `sasaran`, `kode_kopertis`, `kode_wilayah`, `seleksi_penerimaan`, `pola_kepemimpinan`, `sistem_pengelolaan`, `sistem_penjaminan_mutu`, `alasan_transfer_mahasiswa`, `peran_pt_dalam_pembelajaran`, `peran_pt_dalam_penyusunan_kurikulum`, `peran_pt_dalam_suasana_akademik`, `pemanfaatan_tik`, `penyeberan_informasi`, `rencana_pengembangan_si`, `evaluasi_lulusan`, `mekanisme_evaluasi_lulusan`, `kode_kementrian`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`, `status_validasi`) VALUES
('1', NULL, 'Universitas Negeri Jakarta', 'UNJ', '', 0, '', '0000-00-00', '', 0, 1, 1, 1, NULL, NULL, NULL, NULL, '', '0000-00-00', 1, '', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0000-00-00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pindahan_mahasiswa_asing`
--

CREATE TABLE IF NOT EXISTS `pindahan_mahasiswa_asing` (
  `kode_program_studi` varchar(4) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_pt_asal` varchar(6) NOT NULL,
  `kode_ps_asal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kode_program_studi`,`kode_perguruan_tinggi`,`kode_jenjang_pendidikan`,`nim`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `nim` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `prestasi_mahasiswa` (
  `kode_prestasi_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `nomor_penelitian` int(11) NOT NULL,
  `jenis_penelitian` char(1) NOT NULL,
  `kode_pengarang` char(1) NOT NULL,
  `hasil_penelitian` int(1) NOT NULL,
  `media_publikasi` char(1) NOT NULL,
  `penelitian_dilaksanakan_secara` char(1) NOT NULL,
  `jumlah_pembiayaan` int(11) DEFAULT NULL,
  `jenis_pembiayaan` char(1) DEFAULT NULL,
  `periode_penelitian` varchar(10) DEFAULT NULL,
  `judul_penelitian` varchar(100) DEFAULT NULL,
  `waktu_pelaksanaan_penelitian` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_prestasi_mahasiswa`),
  KEY `nim` (`nim`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE IF NOT EXISTS `program_studi` (
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_fakultas` varchar(2) NOT NULL DEFAULT '',
  `kode_jurusan` varchar(5) DEFAULT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kode_kota` int(11) NOT NULL,
  `kode_provinsi` int(11) NOT NULL,
  `kode_negara` int(11) NOT NULL,
  `kode_pos` int(5) NOT NULL,
  `tanggal_berdiri` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `bidang_ilmu` char(1) NOT NULL,
  `sks_lulus` int(3) NOT NULL,
  `status_program_studi` char(1) NOT NULL,
  `mulai_semester` varchar(5) NOT NULL,
  `no_sk_dikti` varchar(40) NOT NULL,
  `tanggal_sk_dikti` date NOT NULL,
  `tanggal_akhir_sk_dikti` date NOT NULL,
  `nidn` varchar(10) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `telepon_kantor` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `nama_operator` varchar(30) DEFAULT NULL,
  `frekuensi_pemutakhiran_kurikulum` char(1) DEFAULT NULL,
  `pelaksanaan_pemutakhiran_kurikulum` char(1) DEFAULT NULL,
  `kode_akreditasi` int(11) NOT NULL,
  `no_sk_ban` varchar(40) NOT NULL,
  `tanggal_sk_ban` date NOT NULL,
  `tanggal_akhri_sk_ban` date NOT NULL,
  `kapasitas_mahasiswa` int(11) DEFAULT NULL,
  `visi` varchar(255) DEFAULT NULL,
  `misi` varchar(255) DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `sasaran` varchar(255) DEFAULT NULL,
  `upaya_penyebaran` varchar(255) DEFAULT NULL,
  `keberlanjutan` varchar(255) DEFAULT NULL,
  `himpunan_alumni` varchar(255) DEFAULT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_program_studi`,`kode_perguruan_tinggi`,`kode_fakultas`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_fakultas` (`kode_fakultas`),
  KEY `kode_kota` (`kode_kota`),
  KEY `kode_provinsi` (`kode_provinsi`),
  KEY `kode_negara` (`kode_negara`),
  KEY `kode_akreditasi` (`kode_akreditasi`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`kode_program_studi`, `kode_perguruan_tinggi`, `kode_fakultas`, `kode_jurusan`, `nama_program_studi`, `kode_jenjang_pendidikan`, `alamat`, `kode_kota`, `kode_provinsi`, `kode_negara`, `kode_pos`, `tanggal_berdiri`, `email`, `bidang_ilmu`, `sks_lulus`, `status_program_studi`, `mulai_semester`, `no_sk_dikti`, `tanggal_sk_dikti`, `tanggal_akhir_sk_dikti`, `nidn`, `hp`, `telepon_kantor`, `fax`, `nama_operator`, `frekuensi_pemutakhiran_kurikulum`, `pelaksanaan_pemutakhiran_kurikulum`, `kode_akreditasi`, `no_sk_ban`, `tanggal_sk_ban`, `tanggal_akhri_sk_ban`, `kapasitas_mahasiswa`, `visi`, `misi`, `tujuan`, `sasaran`, `upaya_penyebaran`, `keberlanjutan`, `himpunan_alumni`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`, `status_validasi`) VALUES
('1', '1', '1', '1', 'Pendidikan Teknik Informatika dan Komputer', 1, '', 1, 1, 1, 0, '0000-00-00', '', '', 0, '', '', '', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
  `kode_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_provinsi` varchar(50) NOT NULL,
  `kode_negara` int(11) NOT NULL,
  `singkatan` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  `kode_pulau` int(11) NOT NULL,
  PRIMARY KEY (`kode_provinsi`),
  KEY `kode_negara` (`kode_negara`),
  KEY `kode_pulau` (`kode_pulau`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`kode_provinsi`, `nama_provinsi`, `kode_negara`, `singkatan`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`, `kode_pulau`) VALUES
(1, 'DKI Jakarta', 1, 'DKI Jakarta', '0000-00-00', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `publikasi_dosen_tetap`
--

CREATE TABLE IF NOT EXISTS `publikasi_dosen_tetap` (
  `kode_publikasi_dosen_tetap` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nomor_penelitian` int(11) NOT NULL,
  `jenis_penelitian` char(1) NOT NULL,
  `kode_pengarang` char(1) NOT NULL,
  `hasil_penelitian` int(1) NOT NULL,
  `bidang_penelitian` varchar(255) NOT NULL,
  `media_publikasi` char(1) NOT NULL,
  `penelitian_dilaksanakan_secara` char(1) NOT NULL,
  `jumlah_pembiayaan_tahun_1` int(11) NOT NULL,
  `jumlah_pembiayaan_tahun_2` int(11) DEFAULT NULL,
  `jumlah_pembiayaan_tahun_3` int(11) DEFAULT NULL,
  `jenis_pembiayaan` char(1) NOT NULL,
  `periode_penelitian` varchar(10) NOT NULL,
  `judul_penelitian` varchar(100) NOT NULL,
  `posisi_peneliti` int(1) NOT NULL,
  `kata_kunci` varchar(100) NOT NULL,
  `abstrak` longtext NOT NULL,
  `waktu_pelaksanaan` int(11) NOT NULL,
  `lokasi_penelitian` varchar(50) DEFAULT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_publikasi_dosen_tetap`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pulau`
--

CREATE TABLE IF NOT EXISTS `pulau` (
  `kode_pulau` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pulau` varchar(50) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_pulau`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pulau`
--

INSERT INTO `pulau` (`kode_pulau`, `nama_pulau`, `tanggal_mulai_efektif`, `tanggal_akhir_efektif`) VALUES
(1, 'Jawa', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `pustaka_pt`
--

CREATE TABLE IF NOT EXISTS `pustaka_pt` (
  `kode_pustaka_pt` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `jml_judul_pustaka` int(11) NOT NULL,
  `jml_judul_pustaka_digunakan` int(11) NOT NULL,
  `jenis_pustaka` varchar(50) NOT NULL,
  `nama_pustaka` varchar(50) NOT NULL,
  `tahun_terbit_pustaka` int(4) NOT NULL,
  `fungsi_pustaka` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_pustaka_pt`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_akreditasi_perguruan_tinggi`
--

CREATE TABLE IF NOT EXISTS `riwayat_akreditasi_perguruan_tinggi` (
  `kode_riwayat_akreditasi_perguruan_tinggi` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_akreditasi` int(11) NOT NULL,
  `no_sk_ban` varchar(40) NOT NULL,
  `tgl_sk_ban` date NOT NULL,
  PRIMARY KEY (`kode_riwayat_akreditasi_perguruan_tinggi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_akreditasi` (`kode_akreditasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_akreditasi_prodi`
--

CREATE TABLE IF NOT EXISTS `riwayat_akreditasi_prodi` (
  `kode_riwayat_akreditasi_prodi` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_akreditasi` int(11) NOT NULL,
  `no_sk_ban` varchar(40) NOT NULL,
  `tgl_sk_ban` date NOT NULL,
  PRIMARY KEY (`kode_riwayat_akreditasi_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_kepemilikan_pt`
--

CREATE TABLE IF NOT EXISTS `riwayat_kepemilikan_pt` (
  `kode_riwayat_kepemilikan_pt` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_badan_hukum` varchar(7) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_riwayat_kepemilikan_pt`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_badan_hukum` (`kode_badan_hukum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_mahasiswa_beasiswa`
--

CREATE TABLE IF NOT EXISTS `riwayat_mahasiswa_beasiswa` (
  `kode_riwayat_mahasiswa_beasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_beasiswa` int(11) NOT NULL,
  PRIMARY KEY (`kode_riwayat_mahasiswa_beasiswa`),
  KEY `kode_beasiswa` (`kode_beasiswa`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pendidikan_dosen`
--

CREATE TABLE IF NOT EXISTS `riwayat_pendidikan_dosen` (
  `kode_riwayat_pendidikan_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `no_urut_dosen` char(1) DEFAULT NULL,
  `gelar_akademik` varchar(30) NOT NULL,
  `kode_kelompok_bidang_ilmu` char(1) NOT NULL,
  `tanggal_ijazah` date DEFAULT NULL,
  `sks_lulus` int(3) DEFAULT NULL,
  `ipk_akhir` double DEFAULT NULL,
  PRIMARY KEY (`kode_riwayat_pendidikan_dosen`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `nidn` (`nidn`),
  KEY `kode_kelompok_bidang_ilmu` (`kode_kelompok_bidang_ilmu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_sk_perguruan_tinggi`
--

CREATE TABLE IF NOT EXISTS `riwayat_sk_perguruan_tinggi` (
  `kode_riwayat_sk_perguruan_tinggi` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `no_sk_berdiri` varchar(40) NOT NULL,
  `tgl_sk_berdiri` date NOT NULL,
  `status_pt` char(1) NOT NULL,
  PRIMARY KEY (`kode_riwayat_sk_perguruan_tinggi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_sk_program_studi`
--

CREATE TABLE IF NOT EXISTS `riwayat_sk_program_studi` (
  `kode_riwayat_sk_prodi` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `no_sk_berdiri` varchar(40) NOT NULL,
  `tgl_sk_berdiri` date NOT NULL,
  `tgl_akhir_sk_berdiri` date DEFAULT NULL,
  `status_prodi` char(1) NOT NULL,
  PRIMARY KEY (`kode_riwayat_sk_prodi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_status_dosen`
--

CREATE TABLE IF NOT EXISTS `riwayat_status_dosen` (
  `kode_riwayat_status_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) DEFAULT NULL,
  `kode_program_studi` varchar(5) DEFAULT NULL,
  `kode_jenjang_pendidikan` int(11) DEFAULT NULL,
  `no_dosen_pt` varchar(10) DEFAULT NULL,
  `status_aktif` char(1) NOT NULL,
  PRIMARY KEY (`kode_riwayat_status_dosen`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_status_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `riwayat_status_mahasiswa` (
  `kode_riwayat_status_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `status_mahasiswa` char(1) NOT NULL,
  PRIMARY KEY (`kode_riwayat_status_mahasiswa`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  KEY `nim` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sarana_pt`
--

CREATE TABLE IF NOT EXISTS `sarana_pt` (
  `kode_sarana_pt` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_pelaporan` int(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_jenjang_pendidikan` int(11) NOT NULL,
  `nama_sarana` varchar(50) NOT NULL,
  `fungsi_sarana` varchar(50) NOT NULL,
  `kepemilikan_sarana` varchar(2) NOT NULL,
  `jumlah_sarana` int(11) NOT NULL,
  `luas_sarana` int(11) NOT NULL,
  `flag_penggunaan_sarana` int(11) NOT NULL,
  `kondisi` char(1) NOT NULL,
  `penggunaan_sarana_mhs` int(11) DEFAULT NULL,
  `penggunaan_jam_sarana` int(11) DEFAULT NULL,
  `sarana_dosen` int(1) DEFAULT NULL,
  `kapasitas_ruang_dosen` int(1) DEFAULT NULL,
  `status_validasi` int(1) NOT NULL,
  PRIMARY KEY (`kode_sarana_pt`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_ahli`
--

CREATE TABLE IF NOT EXISTS `tenaga_ahli` (
  `kode_tenaga_ahli` int(11) NOT NULL AUTO_INCREMENT,
  `nama_tenaga_ahli` varchar(50) NOT NULL,
  `posisi` char(1) NOT NULL,
  `profesi` varchar(50) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `kode_program_studi` varchar(5) NOT NULL,
  `kode_mata_kuliah` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_tenaga_ahli`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_program_studi` (`kode_program_studi`),
  KEY `kode_mata_kuliah` (`kode_mata_kuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_pendukung`
--

CREATE TABLE IF NOT EXISTS `tenaga_pendukung` (
  `kode_tenaga_pendukung` int(11) NOT NULL AUTO_INCREMENT,
  `nip_lama` varchar(9) DEFAULT NULL,
  `nip_baru` varchar(30) DEFAULT NULL,
  `nama_tenaga_pendukung` varchar(50) NOT NULL,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `no_ktp` varchar(25) DEFAULT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `jenis_tenaga_pendukung` int(1) NOT NULL,
  `kode_jenjang_pendidikan` int(11) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `jenis_sk` varchar(50) DEFAULT NULL,
  `no_sk` varchar(40) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `tanggal_akhir_sk` date DEFAULT NULL,
  PRIMARY KEY (`kode_tenaga_pendukung`),
  KEY `kode_jenjang_pendidikan` (`kode_jenjang_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `validasi_total_pt`
--

CREATE TABLE IF NOT EXISTS `validasi_total_pt` (
  `kode_validasi_total_pt` int(11) NOT NULL AUTO_INCREMENT,
  `kode_perguruan_tinggi` varchar(6) NOT NULL,
  `tahun_pelaporan` varchar(5) NOT NULL,
  `semester_pelaporan` int(1) NOT NULL,
  `flag_validasi` int(1) NOT NULL,
  `jumlah_total_validasi_pt` int(11) NOT NULL,
  PRIMARY KEY (`kode_validasi_total_pt`),
  KEY `kode_perguruan_tinggi` (`kode_perguruan_tinggi`),
  KEY `kode_perguruan_tinggi_2` (`kode_perguruan_tinggi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE IF NOT EXISTS `wilayah` (
  `kode_wilayah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_wilayah` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tanggal_mulai_efektif` date NOT NULL,
  `tanggal_akhir_efektif` date NOT NULL,
  PRIMARY KEY (`kode_wilayah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktivitas_kuliah_mahasiswa`
--
ALTER TABLE `aktivitas_kuliah_mahasiswa`
  ADD CONSTRAINT `aktivitas_kuliah_mahasiswa_ibfk_1` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `aktivitas_kuliah_mahasiswa_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `aktivitas_kuliah_mahasiswa_ibfk_3` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `aktivitas_kuliah_mahasiswa_ibfk_5` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `aktivitas_mengajar_dosen`
--
ALTER TABLE `aktivitas_mengajar_dosen`
  ADD CONSTRAINT `aktivitas_mengajar_dosen_ibfk_1` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `aktivitas_mengajar_dosen_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `aktivitas_mengajar_dosen_ibfk_3` FOREIGN KEY (`kode_mata_kuliah`) REFERENCES `mata_kuliah` (`kode_mata_kuliah`),
  ADD CONSTRAINT `aktivitas_mengajar_dosen_ibfk_4` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`),
  ADD CONSTRAINT `aktivitas_mengajar_dosen_ibfk_5` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `anggota_penelitian_dosen`
--
ALTER TABLE `anggota_penelitian_dosen`
  ADD CONSTRAINT `anggota_penelitian_dosen_ibfk_1` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`);

--
-- Constraints for table `badan_hukum`
--
ALTER TABLE `badan_hukum`
  ADD CONSTRAINT `badan_hukum_ibfk_1` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`),
  ADD CONSTRAINT `badan_hukum_ibfk_2` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`),
  ADD CONSTRAINT `badan_hukum_ibfk_3` FOREIGN KEY (`kode_negara`) REFERENCES `negara` (`kode_negara`);

--
-- Constraints for table `bobot_nilai`
--
ALTER TABLE `bobot_nilai`
  ADD CONSTRAINT `bobot_nilai_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `bobot_nilai_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `bobot_nilai_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `daya_tampung`
--
ALTER TABLE `daya_tampung`
  ADD CONSTRAINT `daya_tampung_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `daya_tampung_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `daya_tampung_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `dosen_ibfk_3` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`),
  ADD CONSTRAINT `dosen_ibfk_4` FOREIGN KEY (`kode_negara`) REFERENCES `negara` (`kode_negara`),
  ADD CONSTRAINT `dosen_ibfk_5` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`),
  ADD CONSTRAINT `dosen_ibfk_6` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `dosen_ibfk_7` FOREIGN KEY (`kode_fakultas`) REFERENCES `fakultas` (`kode_fakultas`),
  ADD CONSTRAINT `dosen_ibfk_8` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`),
  ADD CONSTRAINT `dosen_ibfk_9` FOREIGN KEY (`kode_jabatan_akademik`) REFERENCES `jabatan_akademik` (`kode_jabatan_akademik`);

--
-- Constraints for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD CONSTRAINT `fakultas_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `fakultas_ibfk_2` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`),
  ADD CONSTRAINT `fakultas_ibfk_3` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`);

--
-- Constraints for table `fasilitas_penunjang_akademik`
--
ALTER TABLE `fasilitas_penunjang_akademik`
  ADD CONSTRAINT `fasilitas_penunjang_akademik_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kode_fakultas`) REFERENCES `fakultas` (`kode_fakultas`),
  ADD CONSTRAINT `jurusan_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

--
-- Constraints for table `kerjasama_instansi`
--
ALTER TABLE `kerjasama_instansi`
  ADD CONSTRAINT `kerjasama_instansi_ibfk_1` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `kerjasama_instansi_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

--
-- Constraints for table `kerjasama_ptln`
--
ALTER TABLE `kerjasama_ptln`
  ADD CONSTRAINT `kerjasama_ptln_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

--
-- Constraints for table `kinerja_dosen`
--
ALTER TABLE `kinerja_dosen`
  ADD CONSTRAINT `kinerja_dosen_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `kinerja_dosen_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `kinerja_dosen_ibfk_3` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`);

--
-- Constraints for table `kopertis`
--
ALTER TABLE `kopertis`
  ADD CONSTRAINT `kopertis_ibfk_1` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`),
  ADD CONSTRAINT `kopertis_ibfk_2` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`);

--
-- Constraints for table `laboratorium`
--
ALTER TABLE `laboratorium`
  ADD CONSTRAINT `laboratorium_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `laboratorium_ibfk_2` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `laboratorium_ibfk_3` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `mahasiswa_ibfk_4` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`),
  ADD CONSTRAINT `mahasiswa_ibfk_5` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`),
  ADD CONSTRAINT `mahasiswa_ibfk_6` FOREIGN KEY (`kode_negara`) REFERENCES `negara` (`kode_negara`),
  ADD CONSTRAINT `mahasiswa_ibfk_7` FOREIGN KEY (`kode_beasiswa`) REFERENCES `beasiswa` (`kode_beasiswa`),
  ADD CONSTRAINT `mahasiswa_ibfk_8` FOREIGN KEY (`kode_kategori_penghasilan`) REFERENCES `kategori_penghasilan` (`kode_kategori_penghasilan`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `mata_kuliah_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `mata_kuliah_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `mata_kuliah_ibfk_4` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`);

--
-- Constraints for table `nilai_semester_mahasiswa`
--
ALTER TABLE `nilai_semester_mahasiswa`
  ADD CONSTRAINT `nilai_semester_mahasiswa_ibfk_1` FOREIGN KEY (`kode_kuliah_mahasiswa`) REFERENCES `aktivitas_kuliah_mahasiswa` (`kode_kuliah_mahasiswa`),
  ADD CONSTRAINT `nilai_semester_mahasiswa_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `nilai_semester_mahasiswa_ibfk_3` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `nilai_semester_mahasiswa_ibfk_4` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `nilai_semester_mahasiswa_ibfk_5` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `nilai_semester_mahasiswa_ibfk_6` FOREIGN KEY (`kode_mata_kuliah`) REFERENCES `mata_kuliah` (`kode_mata_kuliah`);

--
-- Constraints for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD CONSTRAINT `penduduk_ibfk_1` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`);

--
-- Constraints for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
  ADD CONSTRAINT `perguruan_tinggi_ibfk_1` FOREIGN KEY (`kode_badan_hukum`) REFERENCES `badan_hukum` (`kode_badan_hukum`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_2` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_3` FOREIGN KEY (`kode_negara`) REFERENCES `negara` (`kode_negara`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_4` FOREIGN KEY (`kode_akreditasi`) REFERENCES `akreditasi` (`kode_akreditasi`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_5` FOREIGN KEY (`kode_kopertis`) REFERENCES `kopertis` (`kode_kopertis`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_6` FOREIGN KEY (`kode_wilayah`) REFERENCES `wilayah` (`kode_wilayah`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_7` FOREIGN KEY (`kode_kementrian`) REFERENCES `kementrian` (`kode_kementrian`),
  ADD CONSTRAINT `perguruan_tinggi_ibfk_8` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`);

--
-- Constraints for table `pindahan_mahasiswa_asing`
--
ALTER TABLE `pindahan_mahasiswa_asing`
  ADD CONSTRAINT `pindahan_mahasiswa_asing_ibfk_1` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `pindahan_mahasiswa_asing_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `pindahan_mahasiswa_asing_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `pindahan_mahasiswa_asing_ibfk_4` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `prestasi_mahasiswa`
--
ALTER TABLE `prestasi_mahasiswa`
  ADD CONSTRAINT `prestasi_mahasiswa_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `prestasi_mahasiswa_ibfk_2` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `prestasi_mahasiswa_ibfk_3` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `prestasi_mahasiswa_ibfk_4` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`);

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `program_studi_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `program_studi_ibfk_2` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `program_studi_ibfk_3` FOREIGN KEY (`kode_fakultas`) REFERENCES `fakultas` (`kode_fakultas`),
  ADD CONSTRAINT `program_studi_ibfk_4` FOREIGN KEY (`kode_kota`) REFERENCES `kota` (`kode_kota`),
  ADD CONSTRAINT `program_studi_ibfk_5` FOREIGN KEY (`kode_provinsi`) REFERENCES `provinsi` (`kode_provinsi`),
  ADD CONSTRAINT `program_studi_ibfk_6` FOREIGN KEY (`kode_negara`) REFERENCES `negara` (`kode_negara`),
  ADD CONSTRAINT `program_studi_ibfk_7` FOREIGN KEY (`kode_akreditasi`) REFERENCES `akreditasi` (`kode_akreditasi`),
  ADD CONSTRAINT `program_studi_ibfk_8` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);

--
-- Constraints for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD CONSTRAINT `provinsi_ibfk_1` FOREIGN KEY (`kode_negara`) REFERENCES `negara` (`kode_negara`),
  ADD CONSTRAINT `provinsi_ibfk_2` FOREIGN KEY (`kode_pulau`) REFERENCES `pulau` (`kode_pulau`);

--
-- Constraints for table `publikasi_dosen_tetap`
--
ALTER TABLE `publikasi_dosen_tetap`
  ADD CONSTRAINT `publikasi_dosen_tetap_ibfk_1` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `pustaka_pt`
--
ALTER TABLE `pustaka_pt`
  ADD CONSTRAINT `pustaka_pt_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `pustaka_pt_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `pustaka_pt_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `riwayat_akreditasi_perguruan_tinggi`
--
ALTER TABLE `riwayat_akreditasi_perguruan_tinggi`
  ADD CONSTRAINT `riwayat_akreditasi_perguruan_tinggi_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `riwayat_akreditasi_perguruan_tinggi_ibfk_2` FOREIGN KEY (`kode_akreditasi`) REFERENCES `akreditasi` (`kode_akreditasi`);

--
-- Constraints for table `riwayat_kepemilikan_pt`
--
ALTER TABLE `riwayat_kepemilikan_pt`
  ADD CONSTRAINT `riwayat_kepemilikan_pt_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `riwayat_kepemilikan_pt_ibfk_2` FOREIGN KEY (`kode_badan_hukum`) REFERENCES `badan_hukum` (`kode_badan_hukum`);

--
-- Constraints for table `riwayat_mahasiswa_beasiswa`
--
ALTER TABLE `riwayat_mahasiswa_beasiswa`
  ADD CONSTRAINT `riwayat_mahasiswa_beasiswa_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `riwayat_mahasiswa_beasiswa_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `riwayat_mahasiswa_beasiswa_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `riwayat_mahasiswa_beasiswa_ibfk_4` FOREIGN KEY (`kode_beasiswa`) REFERENCES `beasiswa` (`kode_beasiswa`);

--
-- Constraints for table `riwayat_pendidikan_dosen`
--
ALTER TABLE `riwayat_pendidikan_dosen`
  ADD CONSTRAINT `riwayat_pendidikan_dosen_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `riwayat_pendidikan_dosen_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `riwayat_pendidikan_dosen_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`),
  ADD CONSTRAINT `riwayat_pendidikan_dosen_ibfk_4` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`),
  ADD CONSTRAINT `riwayat_pendidikan_dosen_ibfk_5` FOREIGN KEY (`kode_kelompok_bidang_ilmu`) REFERENCES `kelompok_bidang_ilmu` (`kode_kelompok_bidang_ilmu`);

--
-- Constraints for table `riwayat_sk_perguruan_tinggi`
--
ALTER TABLE `riwayat_sk_perguruan_tinggi`
  ADD CONSTRAINT `riwayat_sk_perguruan_tinggi_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

--
-- Constraints for table `riwayat_sk_program_studi`
--
ALTER TABLE `riwayat_sk_program_studi`
  ADD CONSTRAINT `riwayat_sk_program_studi_ibfk_1` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `riwayat_sk_program_studi_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

--
-- Constraints for table `riwayat_status_dosen`
--
ALTER TABLE `riwayat_status_dosen`
  ADD CONSTRAINT `riwayat_status_dosen_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `riwayat_status_dosen_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `riwayat_status_dosen_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `riwayat_status_mahasiswa`
--
ALTER TABLE `riwayat_status_mahasiswa`
  ADD CONSTRAINT `riwayat_status_mahasiswa_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `riwayat_status_mahasiswa_ibfk_2` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `riwayat_status_mahasiswa_ibfk_3` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `riwayat_status_mahasiswa_ibfk_4` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `sarana_pt`
--
ALTER TABLE `sarana_pt`
  ADD CONSTRAINT `sarana_pt_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `sarana_pt_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `sarana_pt_ibfk_3` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `tenaga_ahli`
--
ALTER TABLE `tenaga_ahli`
  ADD CONSTRAINT `tenaga_ahli_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`),
  ADD CONSTRAINT `tenaga_ahli_ibfk_2` FOREIGN KEY (`kode_program_studi`) REFERENCES `program_studi` (`kode_program_studi`),
  ADD CONSTRAINT `tenaga_ahli_ibfk_3` FOREIGN KEY (`kode_mata_kuliah`) REFERENCES `mata_kuliah` (`kode_mata_kuliah`);

--
-- Constraints for table `tenaga_pendukung`
--
ALTER TABLE `tenaga_pendukung`
  ADD CONSTRAINT `tenaga_pendukung_ibfk_1` FOREIGN KEY (`kode_jenjang_pendidikan`) REFERENCES `jenjang_pendidikan` (`kode_jenjang_pendidikan`);

--
-- Constraints for table `validasi_total_pt`
--
ALTER TABLE `validasi_total_pt`
  ADD CONSTRAINT `validasi_total_pt_ibfk_1` FOREIGN KEY (`kode_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`kode_perguruan_tinggi`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
