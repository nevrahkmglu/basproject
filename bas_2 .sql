-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2023 at 08:14 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bas`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikelen`
--

CREATE TABLE `artikelen` (
  `artId` int(11) NOT NULL,
  `artOmschrijving` varchar(12) NOT NULL,
  `artInkoop` decimal(3,2) NOT NULL,
  `artVerkoop` decimal(3,2) NOT NULL,
  `artVoorraad` int(11) NOT NULL,
  `artMinVoorraad` int(11) NOT NULL,
  `artMaxVoorraad` int(11) NOT NULL,
  `artLocatie` int(11) DEFAULT NULL,
  `levId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikelen`
--

INSERT INTO `artikelen` (`artId`, `artOmschrijving`, `artInkoop`, `artVerkoop`, `artVoorraad`, `artMinVoorraad`, `artMaxVoorraad`, `artLocatie`, `levId`) VALUES
(3, '1', '1.00', '1.00', 11, 1, 1, 1, 1),
(4, 'Test', '0.00', '0.00', 0, 0, 0, 0, 2),
(5, 'omschrijving', '0.00', '0.00', 0, 0, 0, 0, 10),
(6, '1', '2.00', '3.00', 4, 5, 6, 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `inkooporders`
--

CREATE TABLE `inkooporders` (
  `inkOrdId` int(11) NOT NULL,
  `levId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `inkOrdDatum` date DEFAULT NULL,
  `inkOrdBestAantal` int(11) DEFAULT NULL,
  `inkOrdStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inkooporders`
--

INSERT INTO `inkooporders` (`inkOrdId`, `levId`, `artId`, `inkOrdDatum`, `inkOrdBestAantal`, `inkOrdStatus`) VALUES
(3, 11, 10, '2023-03-29', 2, 0),
(4, 2, 4, '2023-03-29', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `klanten`
--

CREATE TABLE `klanten` (
  `klantId` int(11) NOT NULL,
  `klantNaam` varchar(20) NOT NULL,
  `klantEmail` varchar(30) NOT NULL,
  `klantAdres` varchar(30) NOT NULL,
  `klantPostcode` varchar(6) DEFAULT NULL,
  `klantWoonplaats` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klanten`
--

INSERT INTO `klanten` (`klantId`, `klantNaam`, `klantEmail`, `klantAdres`, `klantPostcode`, `klantWoonplaats`) VALUES
(23, 'Joran', 'joran@joran.nl', 'joran', '2923EH', 'Krimpen aan den IJssel'),
(29, 'LOL', 'LOL@lol', 'fidelio', '1344LO', 'Testing'),
(31, 'Lukas Sliva', 'Lol@lol', 'Fidelio', '2907KE', 'woonplaats');

-- --------------------------------------------------------

--
-- Table structure for table `leveranciers`
--

CREATE TABLE `leveranciers` (
  `levId` int(11) NOT NULL,
  `levNaam` varchar(15) NOT NULL,
  `levContact` varchar(20) DEFAULT NULL,
  `levEmail` varchar(30) NOT NULL,
  `levAdres` varchar(30) DEFAULT NULL,
  `levPostcode` varchar(6) DEFAULT NULL,
  `levWoonplaats` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leveranciers`
--

INSERT INTO `leveranciers` (`levId`, `levNaam`, `levContact`, `levEmail`, `levAdres`, `levPostcode`, `levWoonplaats`) VALUES
(4, 'Naam', 'contactpersoon', 'email@email', 'adres', '0000OO', 'Test'),
(5, 'Lukas Sliva', 'niels', 'email@email', 'Fidelio', '2907KE', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `medewerkers`
--

CREATE TABLE `medewerkers` (
  `ID` int(11) NOT NULL,
  `surName` text,
  `lastName` varchar(50) DEFAULT NULL,
  `functie` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medewerkers`
--

INSERT INTO `medewerkers` (`ID`, `surName`, `lastName`, `functie`, `username`, `email`, `password`) VALUES
(4, 'peter', 'peter', 'inkoper', 'peter', 'peter@peter.nl', '$2y$10$IjCgnpi5qZ.QgZqsXF8fFu00gmxL9oZIAuAsBAFPcoWh8lk.32zcO'),
(5, 'Jan', 'vd Brugge', 'verkoper', 'JanvdBrugge', 'jan@vdbrugge.nl', '$2y$10$i/ZTnNoNR8TTpaB.koPo0ueupjXsNM2SFc3pZKpwLpf98o2nIv6sa'),
(6, 'Rens', 'Veldink', 'afdelingsHoofd', 'Rens011', 'henk@henk.nl', '$2y$10$KscQFLa0j3KeWY6XCe7m/.Iq.N5AvJtpCKSgYFxcPYR7wLoO83B5S'),
(7, 'Test', 'testing', 'verkoper', 'Test', 'testing@testing.nl', '$2y$10$a/OVW2rX59V7tfJRyaCO9.xPqv3mKeBOSbaKlVAqx7JCWBefRuZGu'),
(8, 'admin', 'admin', 'afdelingsHoofd', 'admin', 'admin@admin', '$2y$10$pq7CC0Fv513Xdl4U8qlVJOja/KJibYsUUCGUKnqL.9DWjRPCQrtsS'),
(9, 'Andesh', 'Harnam', 'magazijnMeester', 'A.Harnam', 'Andesh@Harnam.nl', '$2y$10$C95x/Y4hTv.99NYPRAZqD.Q3CuRhGtjUBVE7BWK3t5disPCvXtHb.'),
(10, 'Leonie', 'de Heer', 'magazijnMedewerker', 'LeoniedHeer', 'Leonie@deheer.nl', '$2y$10$GmeLA1gkQ5J1tLapgBxwd.Wx7xD9nF87bhnZYHz7cxItwO9kSLFcu'),
(11, 'Redouan', 'Sanussi', 'bezorger', 'RSanussi', 'redouan@sanussi.nl', '$2y$10$asr8LNjCT39W2tx0JSU2V.cY0PLjzpRMVdA/4u4gi/bfXSeOFVsr.'),
(12, 'Peter', 'de Jager', 'inkoper', 'PeterdeJager', 'peter@deJager.nl', '$2y$10$Y2nLUuMcav.XXsNY89lZ8OpMwmz5xrUXiymZLzAJxKsJXA5z59yDu'),
(13, 'Esra', 'Kostense', 'inkoper', 'Essie', 'EssieKostense@gmail.com', '$2y$10$8SLkl9LOdfTiuaiB01Nl0.e.dKzKAEaQr63E.IrUOHmnBfmOtaqNm');

-- --------------------------------------------------------

--
-- Table structure for table `verkooporders`
--

CREATE TABLE `verkooporders` (
  `verkOrdId` int(11) NOT NULL,
  `klantId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `verkOrdDatum` date NOT NULL,
  `verkOrdBestAantal` int(11) NOT NULL,
  `verkOrdStatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikelen`
--
ALTER TABLE `artikelen`
  ADD PRIMARY KEY (`artId`),
  ADD KEY `levId` (`levId`);

--
-- Indexes for table `inkooporders`
--
ALTER TABLE `inkooporders`
  ADD PRIMARY KEY (`inkOrdId`),
  ADD UNIQUE KEY `uq_inkooporders` (`levId`,`artId`);

--
-- Indexes for table `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`klantId`);

--
-- Indexes for table `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`levId`);

--
-- Indexes for table `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD PRIMARY KEY (`verkOrdId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikelen`
--
ALTER TABLE `artikelen`
  MODIFY `artId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inkooporders`
--
ALTER TABLE `inkooporders`
  MODIFY `inkOrdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `klanten`
--
ALTER TABLE `klanten`
  MODIFY `klantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `leveranciers`
--
ALTER TABLE `leveranciers`
  MODIFY `levId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `verkooporders`
--
ALTER TABLE `verkooporders`
  MODIFY `verkOrdId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
