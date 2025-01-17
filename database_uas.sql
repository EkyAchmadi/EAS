-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jan 2025 pada 09.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_uas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `nilai` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `jurusan`, `nilai`) VALUES
(4, 'l', 'Lforadrit@gmail.com', 'kedokteran', 4.00),
(5, 'P', 'Loser@gmail.com', 'Kedokteran', 4.00),
(6, 'L', 'Lol@gmail.com', 'Kedokteran', 2.00),
(9, 'L', 'Ll@gmail.com', 'Kedokteran', 2.00),
(10, 'Eku_septiansya', 'eku@gmail.com', 'Kedokteran', 2.00),
(13, 'Eky Achmadi', 'ekyachmadi3101@gmail.com', 'sistekin', 4.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(2, 'L', 'Lforadrit@gmail.com', 'scrypt:32768:8:1$isiGWO4DI8IgjYJe$450b1ff46ff9fdae4d6a9f17320671d48a13b6e7a7f3c3921d073386132ca72a002da65d832d5a7f97cb9bf1fe039cb952ca79cc40c9cbaae4742a31d84d9528'),
(4, 'p', 'Loser@gmail.com', 'scrypt:32768:8:1$OKebvQc5xD9GZLbe$cbafd7e00538b8827a76b9dc4c6bfd69cc80529cbd5a7d3c1cdfbae2d73f1e0a7c7cd125a705d274641193aef878deffe8c9a8e7389508fc1702aa3369378e59'),
(5, 'm', 'l@gmail.com', 'scrypt:32768:8:1$R1dLyIeOqfta6Spt$d6fadecb44c08ddfab770fa4cb69bf4823dbca985b4ce870d9251bd27eea94b7e0606589e54483cfce6e17e70baeaf980e1c334dd9e825cbd29fc1f9edeb39d4'),
(6, 'y', 'y@gmail.com', 'scrypt:32768:8:1$BP3oAoQLsmnRrNf7$89327a30bc5ca59ad8afe30818fb25aa4642f40eb7c0d2d1ecdf1a0ab007e1e229b29085ae71fa8d5424bd00374f5ae54df994b2c209c949714e674c723bca63'),
(7, 'z', 'z@gmail.com', 'scrypt:32768:8:1$GtvBA3cz9SI2rXll$2806086474c55cad17d7824185a37c90167890533b8c48296077dc277ddfa3989a82de85e35b8abe6ed5002c540b02c87fefd32563a88403df8e92b0d72e3a5e'),
(8, 'Eky Achmadi', 'ekyachmadi3101@gmail.com', 'scrypt:32768:8:1$lyEgVCfkdtLe8Jd4$794762a59f347e2f7d0993bf44bf5b5122e6e912fc3d9421479adddc67592097a403556bc8b5c98e8d641f8fa9307ed5315bce188123a9c27b3d431ad28c2a9a');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
