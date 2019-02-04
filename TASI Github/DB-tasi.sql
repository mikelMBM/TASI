-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Feb 2019 um 15:33
-- Server-Version: 10.1.36-MariaDB
-- PHP-Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `tasi`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `achievements`
--

CREATE TABLE `achievements` (
  `AchievementID` int(11) NOT NULL,
  `UebungsID` int(11) NOT NULL,
  `UebungsattributID` int(11) NOT NULL,
  `NutzerID` int(11) NOT NULL,
  `Datum` datetime NOT NULL,
  `Wert` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `achievements`
--

INSERT INTO `achievements` (`AchievementID`, `UebungsID`, `UebungsattributID`, `NutzerID`, `Datum`, `Wert`) VALUES
(117, 1000, 2, 12, '2019-02-01 01:26:19', '20'),
(118, 1000, 2, 12, '2019-02-01 01:26:25', '18'),
(119, 1000, 2, 12, '2019-02-01 01:26:32', '26'),
(120, 1000, 2, 12, '2019-02-01 01:26:34', '23'),
(121, 1000, 2, 12, '2019-02-01 01:26:37', '25'),
(122, 400, 1, 12, '2019-02-01 01:26:48', '25'),
(123, 400, 1, 12, '2019-02-01 01:26:51', '26'),
(124, 400, 1, 12, '2019-02-01 01:26:54', '50'),
(125, 400, 1, 12, '2019-02-01 01:26:58', '40'),
(126, 400, 1, 12, '2019-02-01 01:27:00', '27'),
(127, 100, 1, 12, '2019-02-01 01:46:05', '24'),
(128, 100, 1, 12, '2019-02-01 01:46:09', '30'),
(129, 100, 1, 12, '2019-02-01 01:46:14', '24'),
(130, 100, 1, 12, '2019-02-01 01:46:17', '31'),
(131, 100, 1, 2, '2019-02-01 21:24:52', '12'),
(132, 100, 1, 2, '2019-02-01 21:24:55', '15'),
(133, 100, 1, 2, '2019-02-01 21:24:58', '23'),
(134, 100, 1, 2, '2019-02-01 21:25:01', '28'),
(135, 100, 1, 2, '2019-02-01 21:25:04', '14'),
(136, 100, 1, 2, '2019-02-01 21:25:07', '26'),
(137, 100, 1, 3, '2019-02-01 21:25:32', '30'),
(138, 100, 1, 3, '2019-02-01 21:25:35', '35'),
(139, 100, 1, 3, '2019-02-01 21:25:39', '39'),
(140, 100, 1, 3, '2019-02-01 21:25:42', '23'),
(141, 100, 1, 3, '2019-02-01 21:25:45', '24'),
(142, 100, 1, 3, '2019-02-01 21:25:48', '30'),
(143, 100, 1, 4, '2019-02-01 21:26:14', '26'),
(144, 100, 1, 4, '2019-02-01 21:26:17', '40'),
(145, 100, 1, 4, '2019-02-01 21:26:21', '56'),
(146, 100, 1, 4, '2019-02-01 21:26:24', '24'),
(147, 100, 1, 4, '2019-02-01 21:26:27', '35'),
(148, 100, 1, 6, '2019-02-01 21:27:49', '45'),
(149, 100, 1, 6, '2019-02-01 21:27:51', '34'),
(150, 100, 1, 6, '2019-02-01 21:27:54', '36'),
(151, 100, 1, 6, '2019-02-01 21:27:57', '38'),
(152, 100, 1, 6, '2019-02-01 21:27:59', '45'),
(153, 100, 1, 6, '2019-02-01 21:28:04', '50'),
(154, 100, 1, 12, '2019-02-04 12:28:12', '46'),
(155, 600, 2, 13, '2019-02-04 13:25:24', '1'),
(156, 600, 2, 13, '2019-02-04 13:25:30', '2'),
(157, 600, 2, 13, '2019-02-04 13:25:32', '1'),
(158, 600, 2, 13, '2019-02-04 13:25:40', '3'),
(159, 600, 2, 13, '2019-02-04 13:25:42', '2'),
(160, 600, 2, 13, '2019-02-04 13:25:44', '3'),
(161, 600, 2, 13, '2019-02-04 13:25:50', '1'),
(162, 600, 2, 13, '2019-02-04 13:25:53', '3'),
(163, 300, 1, 13, '2019-02-04 13:27:29', '20'),
(164, 300, 1, 13, '2019-02-04 13:27:31', '18'),
(165, 300, 1, 13, '2019-02-04 13:27:41', '15'),
(166, 300, 1, 13, '2019-02-04 13:27:44', '18'),
(167, 300, 1, 13, '2019-02-04 13:27:46', '16'),
(168, 300, 1, 13, '2019-02-04 13:27:48', '15'),
(169, 1500, 3, 13, '2019-02-04 13:28:15', '25'),
(170, 1500, 3, 13, '2019-02-04 13:28:20', '25'),
(171, 1500, 3, 13, '2019-02-04 13:28:22', '26'),
(172, 1500, 3, 13, '2019-02-04 13:28:28', '25'),
(173, 1500, 3, 13, '2019-02-04 13:28:31', '27'),
(174, 1500, 3, 13, '2019-02-04 13:28:33', '30'),
(175, 1500, 3, 13, '2019-02-04 13:28:38', '32'),
(176, 1500, 3, 13, '2019-02-04 13:28:40', '26'),
(177, 1500, 3, 13, '2019-02-04 13:28:44', '29'),
(178, 1700, 5, 13, '2019-02-04 13:29:02', '5'),
(179, 1700, 5, 13, '2019-02-04 13:29:06', '4'),
(180, 1700, 5, 13, '2019-02-04 13:29:08', '10'),
(181, 1700, 5, 13, '2019-02-04 13:29:11', '12'),
(182, 1700, 5, 13, '2019-02-04 13:29:13', '16'),
(183, 1700, 5, 13, '2019-02-04 13:29:16', '25'),
(184, 1700, 5, 13, '2019-02-04 13:29:20', '20'),
(185, 300, 1, 12, '2019-02-04 13:33:43', '25'),
(186, 300, 1, 12, '2019-02-04 13:33:46', '25'),
(187, 300, 1, 12, '2019-02-04 13:33:48', '30'),
(188, 300, 1, 12, '2019-02-04 13:33:51', '35'),
(189, 300, 1, 12, '2019-02-04 13:33:54', '40'),
(190, 300, 1, 12, '2019-02-04 13:33:56', '40'),
(191, 300, 1, 12, '2019-02-04 13:33:59', '35'),
(192, 300, 1, 12, '2019-02-04 14:22:54', '20'),
(193, 1000, 2, 12, '2019-02-04 14:31:02', '5'),
(194, 600, 2, 13, '2019-02-04 14:42:35', '4'),
(195, 300, 1, 13, '2019-02-04 15:22:29', '17'),
(196, 600, 2, 13, '2019-02-04 15:22:48', '2'),
(202, 1700, 5, 13, '2019-02-04 15:26:18', '34'),
(203, 100, 1, 12, '2019-02-04 15:28:11', '7');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `attributzuweisung`
--

CREATE TABLE `attributzuweisung` (
  `UebungsID` int(11) NOT NULL,
  `UebungsattributID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `attributzuweisung`
--

INSERT INTO `attributzuweisung` (`UebungsID`, `UebungsattributID`) VALUES
(200, 1),
(100, 1),
(101, 1),
(102, 1),
(201, 1),
(300, 1),
(400, 1),
(500, 1),
(501, 1),
(502, 1),
(600, 2),
(700, 2),
(800, 2),
(900, 2),
(1000, 2),
(1100, 3),
(1101, 3),
(1200, 3),
(1300, 3),
(1301, 3),
(1400, 3),
(1401, 3),
(1500, 3),
(1501, 3),
(1502, 3),
(1503, 3),
(1600, 4),
(1700, 5),
(1800, 5),
(1900, 5),
(2000, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hilfsmittel`
--

CREATE TABLE `hilfsmittel` (
  `HilfsmittelID` int(11) NOT NULL,
  `Bezeichnung` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `hilfsmittel`
--

INSERT INTO `hilfsmittel` (`HilfsmittelID`, `Bezeichnung`) VALUES
(1, 'Fliese'),
(2, 'Handball'),
(3, 'Medizinball'),
(4, 'Zuspieler'),
(5, 'Stoppuhr'),
(6, 'Langhantel'),
(7, 'Reckstange'),
(8, 'Kasten'),
(9, 'Kleinkasten'),
(10, 'Kastendeckel'),
(11, 'Langbank'),
(12, 'Matte'),
(13, 'Zauberschnur'),
(14, 'Deuserband'),
(15, 'Theraband'),
(16, 'Koordinationsleiter'),
(17, 'Pylonen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hilfsmittelzuweisung`
--

CREATE TABLE `hilfsmittelzuweisung` (
  `HilfsmittelID` int(11) NOT NULL,
  `uebungsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `hilfsmittelzuweisung`
--

INSERT INTO `hilfsmittelzuweisung` (`HilfsmittelID`, `uebungsID`) VALUES
(3, 100),
(3, 101),
(3, 102),
(9, 200),
(9, 201),
(12, 500),
(12, 501),
(12, 502),
(16, 1100),
(16, 1101),
(16, 1200),
(16, 1300),
(16, 1301),
(16, 1400),
(16, 1401),
(17, 1401),
(16, 1500),
(16, 1501),
(16, 1502),
(16, 1503),
(7, 1503);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mannschaften`
--

CREATE TABLE `mannschaften` (
  `MannschaftsID` int(11) NOT NULL,
  `Bezeichnung` varchar(30) NOT NULL,
  `SpielerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mannschaften`
--

INSERT INTO `mannschaften` (`MannschaftsID`, `Bezeichnung`, `SpielerID`) VALUES
(1, 'Männer 1', 1),
(2, 'Damen 1', 1),
(3, 'm Jugend B', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mannschaftszuweisung`
--

CREATE TABLE `mannschaftszuweisung` (
  `MannschaftsID` int(11) NOT NULL,
  `SpielerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mannschaftszuweisung`
--

INSERT INTO `mannschaftszuweisung` (`MannschaftsID`, `SpielerID`) VALUES
(2, 3),
(2, 12),
(1, 4),
(2, 5),
(1, 1),
(1, 2),
(2, 6),
(2, 13);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rolle`
--

CREATE TABLE `rolle` (
  `RollenID` int(11) NOT NULL,
  `Bezeichnung` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `rolle`
--

INSERT INTO `rolle` (`RollenID`, `Bezeichnung`) VALUES
(1, 'Trainer'),
(2, 'Spieler');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `training`
--

CREATE TABLE `training` (
  `TrainingsID` int(11) NOT NULL,
  `Bezeichnung` varchar(30) NOT NULL,
  `Zeitraum` datetime NOT NULL,
  `TrainerID` int(11) NOT NULL,
  `beschreibung` text,
  `MannschaftsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `training`
--

INSERT INTO `training` (`TrainingsID`, `Bezeichnung`, `Zeitraum`, `TrainerID`, `beschreibung`, `MannschaftsID`) VALUES
(1, 'Allgemein Damen 1', '2018-01-17 05:23:00', 1, 'Dieses Training ist gut für die Oberschenkelmuskulatur und unterstützt auch den Torwart beim Nachtreten bei zu guten Gegnern', NULL),
(2, 'Allgemein Herren 2', '2018-01-19 00:00:00', 1, 'Training der Allgemeinen Rumpfmuskulatur. Damit unser Spielmacher endlich seine Wampe verliert.', NULL),
(13, 'Alisas Powerworkout', '2019-01-26 05:05:32', 1, 'Nur für harte Kerle', NULL),
(15, 'Aufbau Beinmuskulatur', '2019-02-04 13:22:26', 1, 'Dieses Training dient zum Aufbau der Beinmuskulatur. Insbesondere geeignet für Spieler, die aufgrund einer Verletzung längerer Zeit aussetzen mussten.', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trainingszuweisung`
--

CREATE TABLE `trainingszuweisung` (
  `TrainingsID` int(11) NOT NULL,
  `SpielerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `trainingszuweisung`
--

INSERT INTO `trainingszuweisung` (`TrainingsID`, `SpielerID`) VALUES
(1, 2),
(2, 3),
(1, 3),
(13, 12),
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(15, 13),
(15, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungen`
--

CREATE TABLE `uebungen` (
  `UebungsID` int(11) NOT NULL,
  `Bezeichnung` varchar(40) NOT NULL,
  `Beschreibung` text NOT NULL,
  `Video` text NOT NULL,
  `Bild` varchar(40) NOT NULL,
  `Kategorie` varchar(30) NOT NULL,
  `Unterkategorie` varchar(30) NOT NULL,
  `Dauer` varchar(11) NOT NULL,
  `Niveau` varchar(11) NOT NULL,
  `Referenz` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `uebungen`
--

INSERT INTO `uebungen` (`UebungsID`, `Bezeichnung`, `Beschreibung`, `Video`, `Bild`, `Kategorie`, `Unterkategorie`, `Dauer`, `Niveau`, `Referenz`) VALUES
(100, 'Medizinball Wand 1 beidbeinig', 'Beidbeinig ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand werfen.\r\nVariante A: Linkes bzw. rechtes Bein nach vorne positionieren.\r\nVariante B: Beinwechsel nach jedem Wurf.', 'https://player.vimeo.com/video/177053507\r\n', '', 'Kraft', 'Wurfkraft', 'kurz', 'einfach', ''),
(101, 'Medizinball Wand 2 einbeinig', 'Ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand werfen.\r\nLinkes bzw. rechtes Bein nach vorne positionieren.\r\n', 'https://player.vimeo.com/video/177053507', '', 'Kraft', 'Wurfkraft', 'kurz', 'einfach', ''),
(102, 'Medizinball Wand 3 Bein wechsel', 'Ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand \r\nLinkes bzw. rechtes Bein nach vorne positionieren.\r\nBeinwechsel nach jedem Wurf.', 'https://player.vimeo.com/video/177053507', '', 'Kraft', 'Wurfkraft', 'kurz', 'einfach', ''),
(200, 'Liegestuetz 1', 'Positionierung ueber dem Kasten. Haende auf dem Kleinkasten. Untere Kante auf Hoehe Brustbein. Kontrolliert nach unten in den Liegestuetz gehen und nach oben abdruecken.\r\nVariante: Liegestuetz Ruecklinks.', 'https://player.vimeo.com/video/177041041', '', 'Kraft', 'Armmuskulatur', 'kurz', 'einfach', ''),
(201, 'Liegestuetz 2 Rücklings', 'Liegestuetz Ruecklings:\r\nPositionierung ueber dem Kasten. Haende auf dem Kleinkasten. Untere Kante auf Hoehe Brustbein. Kontrolliert nach unten in den Liegestuetz gehen und nach oben abdruecken. ', 'https://player.vimeo.com/video/177041041', '', 'Kraft', 'Armmuskulatur', 'kurz', 'einfach', ''),
(300, 'Hocksprünge Push', 'Hocksprünge mit Armeinsatz, Arme beim Sprung von vorne nach hinten ziehen; Knie und Fußspitzen zeigen minimal nach außen', 'https://player.vimeo.com/video/177274958', '', 'Kraft', 'Sprungkraft', 'kurz', 'einfach', ''),
(400, 'Burpees', 'In der Kniebeuge nach unten gehen, Hände nach vorne abstützen, Beine mit einem Sprung nach hinten positionieren, in den Liegestütz gehen, vor dem Abdrücken nach oben kurz vom Boden abheben, Beine nach vorne anziehen und mit einem kurzen schnellen Sprung nach oben aufrichten', 'https://player.vimeo.com/video/177266572', '', 'Kraft', 'Ganzkörper', 'kurz', 'mittel', ''),
(500, 'Situps 1', 'Knie abwechselnd zur Brust führen, dabei Oberkörper anheben.\r\nVariante A: Oberkörper anheben, Ellbogen diagonal zum Knie fuehren.\r\nVariante B: Beine durchgestreckt lassen und zum Oberkörper bewegen, dabei unter dem Bein klatschen.', 'https://player.vimeo.com/video/176951806', '', 'Kraft', 'Bauchmuskulatur', 'kurz', 'einfach', ''),
(501, 'Situps 2 Variante A', 'Knie abwechselnd zur Brust führen, dabei Oberkörper anheben.\r\nVariante A: Oberkörper anheben, Ellbogen diagonal zum Knie fuehren.\r\n', 'https://player.vimeo.com/video/176951806', '', 'Kraft', 'Bauchmuskulatur', 'kurz', 'einfach', ''),
(502, 'Situps 3 Variante B', 'Knie abwechselnd zur Brust führen, dabei Oberkörper anheben.\r\nVariante B: Beine durchgestreckt lassen und zum Oberkörper bewegen, dabei unter dem Bein klatschen.', 'https://player.vimeo.com/video/176951806', '', 'Kraft', 'Bauchmuskulatur', 'kurz', 'einfach', ''),
(600, 'Skorpion', 'Ein Skorpion ist ein Kriechtier. Es hat einen giftigen Stachel. Für die Übung, welche insbesondere für besonders giftige Außenspieler geeignet ist gilt: In Bauchlage (mit Arme seitlich ausgestreckt) eine kontrollierte Bewegung der linken Ferse zur rechten und dann der rechten Ferse zur linken Hand durchfuehren. Die Arme und das passive Bein sind immer gestreckt.', 'https://player.vimeo.com/video/177139350', '', 'Beweglichkeit', 'Rückenmuskulatur', 'kurz', 'einfach', ''),
(700, 'Skorpion Reverse', 'In Rückenlage die Arme ausstrecken und eine kontrollierte Bewegung des Fußes zur gegenüberligenden Hand ausführen. Die Arme und das nicht bewegte Bein dabei immer gestreckt lassen.', 'https://player.vimeo.com/video/177139348', '', 'Beweglichkeit', 'Rückenmuskulatur', 'kurz', 'einfach', ''),
(800, 'Ausfallschritt Drehung', 'Einen großen Ausfallschritt machen, dabei das Gewicht auf das vordere Bein sowie die vordere Hand verlagern. Der Oberkörper rotiert, wobei der Ellenbogen nach hinten oben geführt wird.', 'https://player.vimeo.com/video/177286484', '', 'Beweglichkeit', 'Stabilität', 'kurz', 'einfach', ''),
(900, 'Sumo-Hocke', 'Wie ein Sumo-Ringer stehen. Der Stand gerade mit leicht gespreizten Beinen, Oberkörper nach vorne beugen und unter die Fußsohlen greifen. Immer wieder in die Hocke gehen und die Beine wieder strecken. Die Fersen bleiben stets am Boden.', 'https://player.vimeo.com/video/177139352', '', 'Beweglichkeit', 'Stabilität', 'kurz', 'mittel', ''),
(1000, 'Handlauf', 'Hände auf den Boden direkt vor die Füße setzen, mit den Händen nach vorne laufen bis die Position gerade noch gehalten werden kann. Dann folgen die Füße, Beine immer gestreckt lassen und nur kleine Schritte machen. Das Becken bleibt dabei stets parallel zum Boden.', 'https://player.vimeo.com/video/177139351', '', 'Beweglichkeit', 'Oberkörpermuskulatur', 'kurz', 'mittel', ''),
(1100, 'KL Forward Back 1', 'In der Koordinationsleiter beidbeinige Sprünge ausführen. Zwei Sprünge vor und ein Sprung zurück.\r\nVariante: seitlich', 'https://player.vimeo.com/video/177379380', '', 'Koordination', 'Sprungkraft', 'kurz', 'einfach', ''),
(1101, 'KL Forward Back 2 seitlich', 'In der Koordinationsleiter beidbeinige Sprünge seitlich ausführen. Zwei Sprünge vor und ein Sprung zurück.\r\n', 'https://player.vimeo.com/video/177379380', '', 'Koordination', 'Sprungkraft', 'kurz', 'einfach', ''),
(1200, 'KL Handlauf', 'Beide Hände in der Koordinationsleiter, die Beine außerhalb. Einmal um die Koordinationsleiter \"laufen\", pro Feld zwei Kontakte mit den Händen.', 'https://player.vimeo.com/video/177310479', '', 'Koordination', 'Armmuskulatur', 'mittel', 'einfach', ''),
(1300, 'KL Jumping Jack 1', 'Wie im Hampelmann beidbeinig in die Koordinationsleiter springen, danach beidbeinig ein Feld überspringen und dabei außerhalb landen. Danach wieder beidbeinig zurück in das übersprungene Feld.\r\nVariante: Arme dazunehmen wie beim Hampelmann', 'https://player.vimeo.com/video/177309339', '', 'Koordination', 'Arm - Bein Koordination', 'mittel', 'hoch', ''),
(1301, 'KL Jumping Jack 2 mit Armen', 'Wie im Hampelmann beidbeinig in die Koordinationsleiter springen, danach beidbeinig ein Feld überspringen und dabei außerhalb landen. Danach wieder beidbeinig zurück in das übersprungene Feld.\r\nVariante: Arme dazunehmen wie beim Hampelmann', 'https://player.vimeo.com/video/177309339', '', 'Koordination', 'Arm- Bein Koordination', 'mittel', 'hoch', ''),
(1400, 'In & Out 1', 'Zwei Kontakte innerhalb der Koordinationsleiter, ein Kontakt außerhalb, dabei ist ein Bein immer in der Koordinationsleiter und das andere außerhalb.\r\nVariante: Koordinationsleiter in Höhe eines Pylonen verlassen und dieses berühren, anschließend wieder zurück in die Koordinationsleiter.', 'https://player.vimeo.com/video/177307678', '', 'Koordination', 'Schnelligkeit', 'mittel', 'hoch', ''),
(1401, 'In & Out 2 Verlassen de', 'Zwei Kontakte innerhalb der Koordinationsleiter, ein Kontakt außerhalb, dabei ist ein Bein immer in der Koordinationsleiter und das andere außerhalb.\r\nVariante: Koordinationsleiter in Höhe eines Pylonen verlassen und dieses berühren, anschließend wieder zurück in die Koordinationsleiter.', 'https://player.vimeo.com/video/177307678', '', 'Koordination', 'Schnelligkeit', 'mittel', 'hoch', ''),
(1500, 'KL Kniehebelauf 1 vorwärts', 'In der Koordinationsleiter einen Kniehebelauf vorwärts ausführen, dabei jeweils zwei Kontakt pro Feld. Den Oberkörper immer gerade halten und die  Knie hoch anziehen.\r\nVariante A: Kniehebelauf seitlich\r\nVariante B: Kniehebelauf rückwärts\r\nVariante C: Kniehebelauf mit Stange vor der Brust', 'https://player.vimeo.com/video/177305283', '', 'Koordination', 'Schnelligkeit', 'kurz', 'einfach', ''),
(1501, 'KL Kniehebelauf 2 seitlich', 'In der Koordinationsleiter einen Kniehebelauf seitlich ausführen, dabei jeweils zwei Kontakt pro Feld. Den Oberkörper immer gerade halten und die  Knie hoch anziehen.\r\n', 'https://player.vimeo.com/video/177305283', '', 'Koordination', 'Schnelligkeit', 'kurz', 'einfach', ''),
(1502, 'KL Kniehebelauf 3 rückwärts', 'In der Koordinationsleiter einen Kniehebelauf rückwärts ausführen, dabei jeweils zwei Kontakt pro Feld. Den Oberkörper immer gerade halten und die  Knie hoch anziehen.\r\n', 'https://player.vimeo.com/video/177305283', '', 'Koordination', 'Schnelligkeit', 'kurz', 'einfach', ''),
(1503, 'KL Kniehebelauf 4 mit Stange', 'In der Koordinationsleiter einen Kniehebelauf vorwärts mit Stange vor der Brust ausführen, dabei jeweils zwei Kontakt pro Feld. Den Oberkörper immer gerade halten und die  Knie hoch anziehen.', 'https://player.vimeo.com/video/177305283', '', 'Koordination', 'Schnelligkeit', 'kurz', 'einfach', ''),
(1600, 'Dauerlauf', 'Man läuft und läuft und läuft und läuft und läuft und läuft. Eigentlich läuft man nur. Und das die ganze Zeit.', 'https://player.vimeo.com/video/177429465\r\n', '', 'Ausdauer', 'Langzeit', 'lang', 'einfach', ''),
(1700, 'Kurzzeitwiederholung', '400m schnell rennen, Pause, das Ganze 4-8x wiederholen.', 'https://player.vimeo.com/video/177462662', '', 'Ausdauer', 'Kurzzeit', 'lang', 'einfach', ''),
(1800, 'Langzeitintervall Stadion', '600m schnell rennen, 200m langsam, das Ganze 4-6x wiederholen', 'https://player.vimeo.com/video/177459387', '', 'Ausdauer', 'Langzeit', 'lang', 'mittel', ''),
(1900, 'Kurzzeitintervall Stadion', '100m schnell rennen, 100m langsam rennen, das Ganze 4-10x wiederholen', 'https://player.vimeo.com/video/177429464', '', 'Ausdauer', 'Kurzzeit', 'lang', 'einfach', ''),
(2000, 'Mittelzeitwiederholung', '800m schnell rennen, das Ganze 6-8x wiederholen', 'https://player.vimeo.com/video/177465747', '', 'Ausdauer', 'Mittelzeit', 'lang', 'hoch', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungsattribute`
--

CREATE TABLE `uebungsattribute` (
  `UebungsattributID` int(11) NOT NULL,
  `Bezeichnung` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `uebungsattribute`
--

INSERT INTO `uebungsattribute` (`UebungsattributID`, `Bezeichnung`) VALUES
(1, 'Wiederholungen'),
(2, 'Einschätzung'),
(3, 'Dauer in sec.'),
(4, 'Strecke in Meter'),
(5, 'Dauer in min.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungsfavorisierung`
--

CREATE TABLE `uebungsfavorisierung` (
  `TrainerID` int(11) NOT NULL,
  `UebungsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `uebungsfavorisierung`
--

INSERT INTO `uebungsfavorisierung` (`TrainerID`, `UebungsID`) VALUES
(1, 3),
(1, 9),
(1, 10),
(1, 1),
(1, 5),
(1, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungszuweisung`
--

CREATE TABLE `uebungszuweisung` (
  `UebungsID` int(11) NOT NULL,
  `TrainingsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `uebungszuweisung`
--

INSERT INTO `uebungszuweisung` (`UebungsID`, `TrainingsID`) VALUES
(100, 1),
(200, 1),
(300, 1),
(500, 2),
(1501, 2),
(800, 2),
(1300, 1),
(400, 13),
(1000, 13),
(100, 13),
(600, 15),
(300, 15),
(1500, 15),
(1700, 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `NutzerID` int(11) NOT NULL,
  `vorname` varchar(30) DEFAULT NULL,
  `nachname` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `RollenID` int(11) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `stadt` varchar(50) DEFAULT NULL,
  `tel` text,
  `mobil` text,
  `bild` text NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `geburtsdatum` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`NutzerID`, `vorname`, `nachname`, `email`, `username`, `password`, `RollenID`, `adresse`, `stadt`, `tel`, `mobil`, `bild`, `position`, `geburtsdatum`) VALUES
(1, 'Oliver', 'Schroeferl', 'olli@schr.com', 'oliver', 'mauldascha', 1, 'Kirchplatz 2', 'Weingarten', '075143023', '0172555555', 'profilbilder/faultier.jpg', 'RL, RR', '01.02.1992'),
(2, 'Ann-Kathrin', 'Domhan', 'a.k.domhan@gmail.com', 'annikkk', 'katzen', 2, 'Doggenriedstraße 5', 'Weingarten', '07514674', '0152556677', '', 'TW', '15.06.1234'),
(3, 'Corinna', 'Blersch', 'keineahnung@live.com', 'Cori', 'blondi', 2, 'Bergstr 21', 'Baienfurt', '07510000', '0172345678', 'profilbilder/profilbild_spieler01.jpg', 'LA', '11.11.1911'),
(4, 'Michael', 'Ohnename', 'm.o@web.de', 'michi', 'michi', 2, 'Hungerstr. 17', 'Baindt', '07516564316', '0172656945', 'profilbilder/bild_mo.jpg', 'RA', '23.01.1990'),
(5, 'Stephan', 'Burkowski', 'burksteph@googlemail.com', 'sb1234', 'kardoffelsalad', 1, NULL, NULL, NULL, NULL, '', 'K', NULL),
(6, 'Gesa', 'Langhammer', 'asdfasdf@asdf.de', 'gesi', 'abcd', 2, 'Straßenstr. 3', 'Stadt', NULL, NULL, '', 'K', '31.34.1990'),
(12, 'Arvid', 'Funke', 'arvid.funke@gmail.com', 'Arvid', '123456789', 2, 'Turmweg 8', '55397 Burgstetten', NULL, NULL, '', 'Tor', '05.10.1989'),
(13, 'Anika', 'Abschluss', 'anikaszenario@schmitt.de', 'anika', 'spetzle', 2, 'Spielerstraße 16', 'Hanballstadt', '01234-78997', NULL, '', 'LA', '20.05.2001');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`AchievementID`);

--
-- Indizes für die Tabelle `hilfsmittel`
--
ALTER TABLE `hilfsmittel`
  ADD PRIMARY KEY (`HilfsmittelID`);

--
-- Indizes für die Tabelle `hilfsmittelzuweisung`
--
ALTER TABLE `hilfsmittelzuweisung`
  ADD KEY `HilfsmittelID` (`HilfsmittelID`),
  ADD KEY `uebungsID` (`uebungsID`);

--
-- Indizes für die Tabelle `mannschaften`
--
ALTER TABLE `mannschaften`
  ADD PRIMARY KEY (`MannschaftsID`),
  ADD KEY `SpielerID` (`SpielerID`);

--
-- Indizes für die Tabelle `mannschaftszuweisung`
--
ALTER TABLE `mannschaftszuweisung`
  ADD KEY `MannschaftsID` (`MannschaftsID`),
  ADD KEY `SpielerID` (`SpielerID`);

--
-- Indizes für die Tabelle `rolle`
--
ALTER TABLE `rolle`
  ADD PRIMARY KEY (`RollenID`);

--
-- Indizes für die Tabelle `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`TrainingsID`),
  ADD KEY `TrainerID` (`TrainerID`);

--
-- Indizes für die Tabelle `trainingszuweisung`
--
ALTER TABLE `trainingszuweisung`
  ADD KEY `TrainingsID` (`TrainingsID`),
  ADD KEY `SpielerID` (`SpielerID`);

--
-- Indizes für die Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  ADD PRIMARY KEY (`UebungsID`);

--
-- Indizes für die Tabelle `uebungsattribute`
--
ALTER TABLE `uebungsattribute`
  ADD PRIMARY KEY (`UebungsattributID`);

--
-- Indizes für die Tabelle `uebungszuweisung`
--
ALTER TABLE `uebungszuweisung`
  ADD KEY `UebungsID` (`UebungsID`),
  ADD KEY `TrainingsID` (`TrainingsID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`NutzerID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `achievements`
--
ALTER TABLE `achievements`
  MODIFY `AchievementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT für Tabelle `hilfsmittel`
--
ALTER TABLE `hilfsmittel`
  MODIFY `HilfsmittelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `training`
--
ALTER TABLE `training`
  MODIFY `TrainingsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `NutzerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
