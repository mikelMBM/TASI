-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: dd11106
-- Erstellungszeit: 02. Sep 2016 um 10:09
-- Server Version: 5.5.50-nmm1-log
-- PHP-Version: 5.2.17-nmm5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `d022bdb9`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dauer`
--

CREATE TABLE IF NOT EXISTS `dauer` (
  `id_dauer` int(11) NOT NULL,
  `titel_dauer` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_dauer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `dauer`
--

INSERT INTO `dauer` (`id_dauer`, `titel_dauer`) VALUES
(1, 'kurz'),
(2, 'mittel'),
(3, 'lang');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hilfsmittel`
--

CREATE TABLE IF NOT EXISTS `hilfsmittel` (
  `id_hilfsmittel` int(11) NOT NULL,
  `titel_hilfsmittel` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_hilfsmittel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `hilfsmittel`
--

INSERT INTO `hilfsmittel` (`id_hilfsmittel`, `titel_hilfsmittel`) VALUES
(0, 'Fliese'),
(1, 'Handball'),
(2, 'Medizinball'),
(3, 'Langhantel'),
(4, 'Reckstange'),
(5, 'Reckstange/Langhantel'),
(6, 'Kasten'),
(7, 'Kleinkasten'),
(8, 'Kastendeckel'),
(9, 'Langbank'),
(10, 'Matte'),
(11, 'Zauberschnur'),
(12, 'Deuserband'),
(13, 'Theraband'),
(14, 'Koordinationsleiter'),
(15, 'Partner'),
(16, 'Zuspieler'),
(17, 'Pylon'),
(18, 'Tor'),
(19, 'AirBody'),
(20, 'Torwart'),
(21, 'Sprossenwand'),
(22, 'Barren'),
(23, 'kein Hilfsmittel'),
(24, 'TRX'),
(25, 'Kettlebell'),
(26, 'Fliese'),
(27, 'Response-Ball'),
(28, 'Swing-Stick'),
(29, 'Pezi-Ball'),
(30, 'Reaction-Ball'),
(31, 'Schaumstoffbalken'),
(32, 'Stoppuhr'),
(33, 'Blackroll'),
(34, 'Tennisball');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hilfsmittel2`
--

CREATE TABLE IF NOT EXISTS `hilfsmittel2` (
  `id_hilfsmittel2` int(11) NOT NULL,
  `titel_hilfsmittel2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_hilfsmittel2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `hilfsmittel2`
--

INSERT INTO `hilfsmittel2` (`id_hilfsmittel2`, `titel_hilfsmittel2`) VALUES
(1, ', Handball'),
(2, ', Medizinball'),
(3, ', Langhantel'),
(4, ', Reckstange'),
(5, ', Reckstange/Langhantel'),
(6, ', Kasten'),
(7, ', Kleinkasten'),
(8, ', Kastendeckel'),
(9, ', Langbank'),
(10, ', Matte'),
(11, ', Zauberschnur'),
(12, ', Deuserband'),
(13, ', Theraband'),
(14, ', Koordinationsleiter'),
(15, ', Partner'),
(16, ', Zuspieler'),
(17, ', Pylon'),
(18, ', Tor'),
(19, ', AirBody'),
(20, ', Torwart'),
(21, ', Sprossenwand'),
(22, ', Barren'),
(23, ', kein Hilfsmittel'),
(24, ', TRX'),
(25, ', Kettlebell'),
(26, ', Fliese'),
(27, ', Response-Ball'),
(28, ', Swing-Stick'),
(29, ', Pezi-Ball'),
(30, ', Reaction-Ball'),
(31, 'Schaumstoffbalken'),
(32, 'Stoppuhr'),
(33, 'Blackroll'),
(34, 'Tennisball');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hilfsmittel3`
--

CREATE TABLE IF NOT EXISTS `hilfsmittel3` (
  `id_hilfsmittel3` int(11) NOT NULL,
  `titel_hilfsmittel3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_hilfsmittel3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `hilfsmittel3`
--

INSERT INTO `hilfsmittel3` (`id_hilfsmittel3`, `titel_hilfsmittel3`) VALUES
(1, ', Handball'),
(2, ', Medizinball'),
(3, ', Langhantel'),
(4, ', Reckstange'),
(5, ', Reckstange/Langhantel'),
(6, ', Kasten'),
(7, ', Kleinkasten'),
(8, ', Kastendeckel'),
(9, ', Langbank'),
(10, ', Matte'),
(11, ', Zauberschnur'),
(12, ', Deuserband'),
(13, ', Theraband'),
(14, ', Koordinationsleiter'),
(15, ', Partner'),
(16, ', Zuspieler'),
(17, ', Pylon'),
(18, ', Tor'),
(19, ', AirBody'),
(20, ', Torwart'),
(21, ', Sprossenwand'),
(22, ', Barren'),
(23, ', kein Hilfsmittel'),
(24, ', TRX'),
(25, ', Kettlebell'),
(26, ', Fliese'),
(27, ', Response-Ball'),
(28, ', Swing-Stick'),
(29, ', Pezi-Ball'),
(30, ', Reaction-Ball'),
(31, 'Schaumstoffbalken'),
(32, 'Stoppuhr'),
(33, 'Blackroll'),
(34, 'Tennisball');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE IF NOT EXISTS `kategorie` (
  `id_kategorie` int(11) NOT NULL,
  `titel_kategorie` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_kategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id_kategorie`, `titel_kategorie`) VALUES
(1, 'Kraft'),
(2, 'Schnelligkeit'),
(3, 'Ausdauer'),
(4, 'Beweglichkeit');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niveau` int(11) NOT NULL,
  `titel_niveau` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `titel_niveau`) VALUES
(1, 'einfach'),
(2, 'medium'),
(3, 'schwer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer`
--

CREATE TABLE IF NOT EXISTS `nutzer` (
  `id_nutzer` int(11) NOT NULL AUTO_INCREMENT,
  `vorname_nutzer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nachname_nutzer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_nutzer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password_nutzer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_nutzer`),
  UNIQUE KEY `email_nutzer` (`email_nutzer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `nutzer`
--

INSERT INTO `nutzer` (`id_nutzer`, `vorname_nutzer`, `nachname_nutzer`, `email_nutzer`, `password_nutzer`) VALUES
(1, 'Test1_Vorname', 'Test1_Nachname', 'testmail@test.de', 'password'),
(2, 'Dominic', 'Ellek', 'dominic.ellek@gmail.com', 'password');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzerteilnehmer`
--

CREATE TABLE IF NOT EXISTS `nutzerteilnehmer` (
  `id_nutzer` int(11) NOT NULL,
  `id_tn` int(11) NOT NULL,
  KEY `id_nutzer` (`id_nutzer`),
  KEY `id_tn` (`id_tn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referenz`
--

CREATE TABLE IF NOT EXISTS `referenz` (
  `id_referenz` int(11) NOT NULL,
  `literatur` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_referenz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `referenz`
--

INSERT INTO `referenz` (`id_referenz`, `literatur`) VALUES
(0, 'Steinhöfer, D. (2008). Athletiktraining im Sportspiel (Veränderte Neuauflage). Münster: Philippka Sportverlag.'),
(1, 'Kromer, A. (2015). Positionstraining für Rückraum-, Kreis- und Außenspieler. Münster: Philippka Sportverlag.'),
(2, 'Klee, A. (2011). Circuit-Training und Fitness Gymnastik (5., erweiterte Auflage). Schorndorf: Hofmann.'),
(3, 'Jahoda, R. (2009). ComplexCore: Rumpfstabilisation in Training und Therapie (4. Auflage). Salzburg: Jahoda.'),
(4, 'Impuls Gesundheitszentrum Biberach. Rainer Fimpel, Dipl. Sportlehrer. 2016.'),
(5, 'Wolfgang Weiß. Trainer TG Biberach, Abteilung Leichtathletik.'),
(6, 'Gabriel Senciuc. TG Biberach, Abteilung Handball.'),
(7, 'Markus Braun. Fitnesstrainer, Mai-Fitnees, Ulm.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rolleteilnehmer`
--

CREATE TABLE IF NOT EXISTS `rolleteilnehmer` (
  `id_rolle` int(11) NOT NULL,
  `titel_rolle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_rolle`),
  UNIQUE KEY `id_rolle` (`id_rolle`),
  UNIQUE KEY `titel_rolle` (`titel_rolle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `rolleteilnehmer`
--

INSERT INTO `rolleteilnehmer` (`id_rolle`, `titel_rolle`) VALUES
(1, 'Spieler'),
(2, 'Trainer ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teilnehmer`
--

CREATE TABLE IF NOT EXISTS `teilnehmer` (
  `id_tn` int(11) NOT NULL AUTO_INCREMENT,
  `vorname_tn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nachname_tn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_tn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_rolle` int(11) NOT NULL,
  PRIMARY KEY (`id_tn`),
  KEY `id_rolle` (`id_rolle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `teilnehmer`
--

INSERT INTO `teilnehmer` (`id_tn`, `vorname_tn`, `nachname_tn`, `email_tn`, `id_rolle`) VALUES
(1, 'Teilnehmer1_Vorname', 'Teilnehmer2_Nachname', 'dominic.ellek@gmail.com', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teilnehmertraining`
--

CREATE TABLE IF NOT EXISTS `teilnehmertraining` (
  `id_tn` int(11) NOT NULL,
  `id_tr` int(11) NOT NULL,
  KEY `id_tn` (`id_tn`),
  KEY `id_tr` (`id_tr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `training`
--

CREATE TABLE IF NOT EXISTS `training` (
  `id_tr` int(11) NOT NULL AUTO_INCREMENT,
  `id_nutzer` int(11) NOT NULL,
  `zeitdatum_tr` datetime DEFAULT NULL,
  `titel_tr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tr`),
  KEY `id_nutzer` (`id_nutzer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=69 ;

--
-- Daten für Tabelle `training`
--

INSERT INTO `training` (`id_tr`, `id_nutzer`, `zeitdatum_tr`, `titel_tr`) VALUES
(52, 0, NULL, 'Jonas, 19.08.16 - 10:00h'),
(54, 0, NULL, 'Gruppe 2, 22.08.16 - 19:00h'),
(55, 0, NULL, 'TW, 22.08.16 - 19:00h'),
(58, 0, NULL, 'Training TGSommer, 24.08.16 - 15:30h'),
(59, 0, NULL, 'Training Marion Aug 2016'),
(61, 0, NULL, 'SimonAndy, 25.08.16 - 07:35h'),
(62, 0, NULL, 'Training Loiusa'),
(64, 0, NULL, 'Niki, 31.08.16 - 19:00h'),
(65, 0, NULL, 'Carina, 31.08.16 - 23:10h');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungen`
--

CREATE TABLE IF NOT EXISTS `uebungen` (
  `id_uebung` int(11) NOT NULL AUTO_INCREMENT,
  `titel_uebung` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `beschreibung` text COLLATE utf8_unicode_ci NOT NULL,
  `videourl` text COLLATE utf8_unicode_ci NOT NULL,
  `bildurl` text COLLATE utf8_unicode_ci,
  `kategorie` int(11) NOT NULL,
  `unterkategorie` int(11) DEFAULT NULL,
  `dauer` int(11) NOT NULL,
  `niveau` int(11) NOT NULL,
  `hilfsmittel` int(11) NOT NULL,
  `hilfsmittel2` int(11) DEFAULT NULL,
  `hilfsmittel3` int(11) DEFAULT NULL,
  `referenz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_uebung`),
  UNIQUE KEY `titel_uebung` (`titel_uebung`),
  KEY `kategorie` (`kategorie`),
  KEY `unterkategorie` (`unterkategorie`),
  KEY `dauer` (`dauer`),
  KEY `niveau` (`niveau`),
  KEY `hilfsmittel` (`hilfsmittel`),
  KEY `hilfsmittel2` (`hilfsmittel2`),
  KEY `hilfsmittel3` (`hilfsmittel3`),
  KEY `referenz` (`referenz`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=126 ;

--
-- Daten für Tabelle `uebungen`
--

INSERT INTO `uebungen` (`id_uebung`, `titel_uebung`, `beschreibung`, `videourl`, `bildurl`, `kategorie`, `unterkategorie`, `dauer`, `niveau`, `hilfsmittel`, `hilfsmittel2`, `hilfsmittel3`, `referenz`) VALUES
(13, 'Medizinball Wand 1', 'Beidbeinig ca 2 - 5 Meter vor der Wand stehen. Medizinball ueber Kopf mit maximalem Krafteinsatz gegen die Wand werfen. </br>\r\nVariante A: Linkes bzw. rechtes Bein nach vorne positionieren. </br>\r\nVariante B: Beinwechsel nach jedem Wurf.', '<iframe src="https://player.vimeo.com/video/177053507" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 1, 2, NULL, NULL, 2),
(14, 'Bankdruecken 1', 'Rueckenlage auf der Langbank. Stange auf Hoehe des Brustbeins. Stabiler Rumpf. Fueße und Versen fest auf dem Boden mit Fußspitz auf Kniehoehe. Reckstange vom Brustbein bis in die Armstreckung druecken. Kontrolliertes Tempo. </br>\r\nVariante: Stange schnell nach oben ausstoßen.', '<iframe src="https://player.vimeo.com/video/177062068" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 1, 5, 9, NULL, 2),
(15, 'Squats 1', 'Reckstange auf Nackenmuskulatur fixieren. Beine Hueft- bis Schulterbreit aufstellen. Stabile Rumpfmuskulatur. Beim hochgehen Huefte leicht nach vorne druecken ohne dabei die Grundspannung im Ruecken zu verlieren. Maximal nach unten beugen.', '<iframe src="https://player.vimeo.com/video/177058694" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 5, NULL, NULL, 2),
(16, 'Squats 2', 'Reckstange auf Nackenmuskulatur fixieren. Beine Hueft- bis Schulterbreit aufstellen. Stabile Rumpfmuskulatur. Beim hochgehen Huefte leicht nach vorne druecken ohne dabei die Grundspannung im Ruecken zu verlieren. Maximal nach unten beugen. Gewicht so waehlen, dass 8 - 12 Wiederholungen moeglich sind. </br>\r\nVariante A: Nur 6 - 8 Wiederholungen und im Anschluss 4 - 6 Hockspruenge. </br>\r\nVariante B: Nur 6 -8 Wiederholungen und im Anschluss explosiver Antritt ueber ca. 10 Meter. </br>\r\nVariante C: Nur 6 - 8 Wiederholungen und im Anschluss 4 - 6 Hockspruenge mit explosivem Antritt ueber ca. 10 Meter.', '<iframe src="https://player.vimeo.com/video/177060820" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 5, 1, 2, 9, 5, NULL, 0),
(17, 'Stange ausstoßen 1', 'Stange auf Schulterhoehe vor dem Koerper ausstoßen. </br>\r\nVariante A: Waehrend Stange ausgestoßen wird in doppelter Frequenz auf der Stelle huepfen. </br>\r\nVariante B: Stange schraeg nach oben ausstoßen. </br>\r\nVariante C: Mit Spruenge. </br>\r\nVariante D: Stange abwechseln nach vorne und nach oben ausstoßen. </br>\r\nVariante E: Mit Spruenge.', '<iframe src="https://player.vimeo.com/video/177050804" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 5, NULL, NULL, NULL),
(18, 'Liegestuetz 1', 'Positionierung ueber dem Kasten. Haende auf dem Kleinkasten. Untere Kante auf Hoehe Brustbein. Kontrolliert nach unten in den Liegestuetz gehen und nach oben abdruecken. </br>\r\nVariante: Liegestuetz Ruecklinks.', '<iframe src="https://player.vimeo.com/video/177041041" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 7, NULL, NULL, 2),
(19, 'Liegestuetz 2', 'Fueße auf dem Kasten. Haende auf dem Boden. Stabiler Rumpf. Kontrolliert nach unten in Liegestuetz gehen und nach oben abdruecken. </br>\r\nVariante A: Ein Fuß auf dem Kasten. Der andere ist schwebend in der Luft. </br>\r\nVariante B: Ein Fuß auf dem Kasten. Der andere ist schwebend in der Luft und wird waehrend der Liegestuetz eingedreht.', '<iframe src="https://player.vimeo.com/video/177046114" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 5, 1, 2, 7, NULL, NULL, 2),
(20, 'Situps 1', 'Knie abwechselnd zur Brust fuehren, dabei Oberkoerper anheben. </br>\r\nVariante A: Oberkoerper anheben, Ellbogen diagonal zum Knie fuehren. </br>\r\nVariante B: Beine durchgestreckt lassen und zum Oberkoerper bewegen, dabei unter dem Bein klatschen.', '<iframe src="https://player.vimeo.com/video/176951806" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 2),
(21, 'Unterer Ruecken 1', 'Kasten mindestens bis auf Huefthoehe aufbauen. Mit Oberkoerper bis zur Huefte in Bauchlage auf den Kasten liegen. Beine von unten bis zur vollen Koerperstreckung anheben. Kontrollierte auf und ab Bewegungen. </br>\r\nVariante A: Mit Gewicht an den Fueßen.', '<iframe src="https://player.vimeo.com/video/176959345" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 6, NULL, NULL, 2),
(22, 'Scheibenwischer', 'In Rueckenlage mit Gesaeß an der Wand liegen. Beine zeigen nach oben. Beine kontrolliert nach links und rechts im Wechsel ablassen. Fixierung an der Matte ist moeglich. Beine beruehren nicht den Boden. </br>\r\nVariante: Mit Gewicht an den Fueßen.', '<iframe src="https://player.vimeo.com/video/176951805" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 10, NULL, NULL, 2),
(23, 'Oberer Ruecken 1', 'Bauchlage auf dem Boden. Arme und Kopf vom Boden abheben. Blickrichtung gerade nach unten. Arme sind angewinkelt. Kontrollierte Bewegungen nach links und rechts. </br>\r\nVariante: Bei jeder Bewegung nach links und rechts - Ellbogen auf der jeweiligen Seite nach oben fuehren.', '<iframe src="https://player.vimeo.com/video/176956589" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', NULL, 1, 7, 1, 1, 10, NULL, NULL, 2),
(24, 'Oberer Ruecken 2', 'Bauchlage auf dem Boden. Medizinball, Arme und Kopf vom Boden abheben. Blickrichtung gerade nach unten. Arme sind angewinkelt. Kontrollierte Bewegungen nach links und rechts. </br>\r\nVariante: Mittig ueber Kopf ein kleines Pylon platzieren. Medizinball bei jeder Bewegung darueber heben.', '<iframe src="https://player.vimeo.com/video/176956590" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 2, 10, 17, 2),
(25, 'Rumpf seitlich 1', 'Unterarmstuetz seitlich. Arm und Bein gleichzeitig vom Koerper nach oben heben. Kontrollierte Bewegung nach oben und zurueck zum Koerper. </br>\r\nVariante A: Arm und Bein bei jeder Bewegung nicht ganz ablegen. </br>\r\nVariante B: Arm und Bein diagonal zur Seite bewegen. </br>\r\nVariante C: Arm und Bein gleichzeitig zur Seite nach vorne und hinten bewegen', '<iframe src="https://player.vimeo.com/video/176981407" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 10, NULL, NULL, 2),
(26, 'Hockspruenge 1', 'Beim Absprung mit Gesaeß tief nach unten gehen. Arme zum Schwungholen einsetzen. Aufrechte Haltung mit Blickrichtung nach Vorne. Maximaler Absprung nach oben mit leichtem Trend nach vorne (1 - 2 Fußlaengen). Knie keinesfalls nach Innen bewegen. </br>\r\nVariante A:  Ein Fuß ist beim Absprung ungefaehr eine Fußlaenge vor dem Anderen.</br>\r\nVariante B: Fußwechsel in der Luft vor dem Landen. </br>\r\nVariante C: Absprung mit leichtem Trend zurueck. In allen bisherigen Varianten moeglich.', '<iframe src="https://player.vimeo.com/video/176985127" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 1, 23, NULL, NULL, 2),
(27, 'Bank hochziehen', 'Bank mit gewuenschter Neigung in Sprossenwand sicher verankern. Bauchlage auf Bank. Mittig an Bank festhalten. Fliese unter Koerperschwerpunkt (Huefte - Bauch) legen. Mit Arme nach oben ziehen. </br>\r\nVariant: Am unteren Teil der Bank starten und mit jedem Zug weiter nach oben ziehen.', '<iframe src="https://player.vimeo.com/video/177066788" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 21, 9, 26, 2),
(28, 'Situps Bank', 'Bank mit gewuenschter Neigung in Sprossenwand sicher verankern. Auf oberes Ende der Bank in Rueckenlage liegen. Beine zeigen nach unten. Mit Haende an Sprossenwand festhalten. Beine ueber Kopf anziehen und Wand bzw. Sprossenwand mit Fueßen beruehren. Kontrollierte Bewegung auf und ab.', '<iframe src="https://player.vimeo.com/video/177066787" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 21, 9, NULL, 2),
(29, 'Kniebeugen Parter', 'Beidbeinig frontal vor Sprossenwand stehen. Partner sitz auf den Schultern. Kontrollierte Kniebeugen. Partner kann durch aktives Abstuerzen an der Sprossenwand die Last geringfuegig veraendern und so den Schwierigkeitsgrad der Uebung steuern.', '<iframe src="https://player.vimeo.com/video/177145671" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 5, 1, 2, 21, 15, NULL, 2),
(30, 'Beinbeugen Partner', 'Einbeinig auf der Sprossenwand stehen. Partner liegt auf dem Boden und haelt sich am anderem Fuß fest. Diesen kontrolliert nach oben anziehen und wieder senken. Partner kann aktiv durch Kraftverlagerung mit Zug am Fuß den Schwierigkeitsgrad der Uebung steuern.', '<iframe src="https://player.vimeo.com/video/177145670" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 5, 1, 2, 21, 15, 10, 2),
(31, 'Hockspruenge Sprossenwand', 'Hockspruenge an der Sprossenwand. Beim Absprung mit dem Gesaeß tief nach unten gehen. Maximaler Absprung nach oben mit Hilfe durch Armeinsatz an der Sprossenwand. </br>\r\nVariante:  Nach der Sprungserie blitzartig umdrehen und sprinten.', '<iframe src="https://player.vimeo.com/video/177148871" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 2, 21, NULL, NULL, 2),
(32, 'Steigespruenge 1', 'Ein Fuß auf den Kleinkasten absetzen. Mit diesem nach oben abdruecken. Fuß bleibt auf dem Kasten. Knie vom anderem Bein nach oben ziehen. Arme entsprechend diagonal mitbewegen. </br>\r\nVariante A: Mit Absprung. Fuß hebt vom Kleinkasten ab. </br>\r\nVariante B: Mit Sprungwechsel. Nach jedem Sprung landet der andere Fuß auf dem Kleinkasten', '<iframe src="https://player.vimeo.com/video/177677684" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 7, NULL, NULL, 2),
(33, 'Reaktivspruenge 1', 'Vom Kleinkasten nach unten fallen lassen. Beidbeinig mit moeglichst kurzem Bodenkontakt abspringen. Anschließend wieder auf dem Kleinkasten positionieren und den Vorgang wiederholen. Maximal: 8 Spruenge. </br>\r\nVariante: Ueber einen Schaumstoffbalken springen. Hoehe Balken an Leistungsstand Spieler anpassen. Ziel: Moeglichst kurzer Bodenkontakt bei gleichzeitig moeglichst hohem Sprung.', '<iframe src="https://player.vimeo.com/video/177038710" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 13, 1, 1, 7, 31, NULL, 0),
(34, 'Reaktivspruenge 2', 'Zwei Kleinkaesten nacheinander aufstellen. Vom Kleinkasten nach unten fallen lassen. Beidbeinig mit moeglichst kurzem Bodenkontakt auf anderen Kleinkasten springen. Anschließend drehen und identisch weiter springen. Wiederholungen: 8 Spruenge. Ziel: moeglichst kurzer Bodenkontakt bei gleichzeitig moeglichst hohem Absprung. </br>\r\nVariante A: Hoehe Absprungkasten erhoehen. </br>\r\nVariante B: Hoehe Zielkasten erhoehen. </br>\r\nVariante C: Reihe mit 9 Kleinkaesten (unterschiedlicher Groeße) aufstellen.', '<iframe src="https://player.vimeo.com/video/177066789" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 13, 1, 2, 7, NULL, NULL, 0),
(35, 'Lat Stange 1', 'Rueckenlage auf der Langbank. Fueße auf dem Boden. Stange ueber dem Kopf halten. Stange kontrolliert bis auf Huefthoehe und wieder zurueck ueber Kopf bewegen. Je nach Gewicht der Stange und des Leistungsniveaus kann der Bewegungsradius erweitert werden.', '<iframe src="https://player.vimeo.com/video/177064113" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 5, 9, NULL, 2),
(36, 'Ruecken Stange 1', 'Schulterbreit auf dem Boden stehen. Mit geradem Ruecken nach vorne beugen. Stange zwischen Bauch und Brust zum Koerper ziehen. Schulterblaetter dabei zusammenziehen.', '<iframe src="https://player.vimeo.com/video/177066786" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 5, NULL, NULL, 2),
(37, 'Ausfallschritt 1', 'Langer hoher Ausfallschritt. Knie beruehrt fast den Boden. Koerper aufrecht halten. Richtungswechsel ohne zusaetzlichen Bodenkontakt. Fußspitzen zeigen nach vorne. </br>\r\nVariante A: Medizinball schraeg ueber das fordere bzw. hintere Bein fuehren. </br> \r\nVariante B: Langer Ausfallschritt seitlich mit Medizinball.', '<iframe src="https://player.vimeo.com/video/177056506" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 2),
(38, 'Zauberschnur Brust', 'Zauberschnur vor dem Körper mit gestreckten Armen zusammenführen. </br>\r\nVariante A: Arme schraeg von unten zusammen fuehren. </br>\r\nVariante B: Arme schraeg von oben zusammen fuehren. </br>\r\nVariante C: Arme im Wechsel zusammenfuehren - Oben - Mitte - Unten.', '<iframe src="https://player.vimeo.com/video/177085900" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(39, 'Zauberschnur Ruecken', 'Mit Blickrichtung zur Zauberschnur stehen. Zauberschnur mit gestreckten Armen seitlich auf hoehe der  Schulter ziehen. </br>\r\nVariante A: Arme schraeg nach unten auseinander fuehren. </br>\r\nVariante B: Arme schraeg nach oben auseinander fuehren. </br>\r\nVariante C: Arme im Wechsel - Oben - Unten - Mitte auseinander fuehren.', '<iframe src="https://player.vimeo.com/video/177085899" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(40, 'Zauberschnur Bauch', 'Kontrollierte Situps mit  Zauberschnur in gestreckten Armen vor der Brust durchfuehren.  </br> Variante A: Beim Hochgehen Arme einmal  nach vorne ausstoßen. </br>\nVariante B: Beim Hochgehen Arme 3 mal nach vorne ausstoßen. </br>\nVariante C: Zauberschnur im Wechsel einmal nach links ueber das Knie - einmal ueber Mitte - und einemmal nach rechts ueber das Knie fuehren.', '<iframe src="https://player.vimeo.com/video/177120839" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(41, 'Zauberschnur Boxen', 'In Wurfposition aufstellen. Zauberschnur mit der hinteren Hand zum Boxschlag nach vorne fuehren. Huefte dabei leicht eindrehen. \r\n', '<iframe src="https://player.vimeo.com/video/177103022" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(42, 'Zauberschnur Wurfauslage', 'Wurfhaltung einnehmen. Zauberschnur mit moeglichst ausgestrecktem Arm aus Schulterhoehre dynamisch nach vorne bewegen. Rumpf dreht dabei ein. </br>\r\nVariante: Zauberschnur nach hinten fuehren. Ellbogen und Schulter mitbewegen.', '<iframe src="https://player.vimeo.com/video/177250447" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(43, 'Zauberschnur Kniehebelauf', 'Zauberschnur auf Huefte einspannen. Kniehebelauf mit Zug nach vorne durchfuehren: Oberkoerper gerade, Knie abwechselnd in hoher Frequenz nach vorne oben anziehen. </br>\r\nVariante A: Kniehebelauf seitlich. </br>\r\nVariante B: Kniehebelauf rueckwaerts. Dabei Knie bis auf Hoehe der Zauberschnur anziehen.', '<iframe src="https://player.vimeo.com/video/177250446" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(44, 'Zauberschnur Hockspruenge', 'Zauberschnur auf Huefte einspannen. Hocksprung mit Zug nach vorne durchfuehren.', '<iframe src="https://player.vimeo.com/video/177103020" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(45, 'Zauberschnur Beinbeuger', 'In Rueckenlage Zauberschnur am Fußgelenk befestigen. Knie Richtung Brust ziehen. Anderes Bein bleibt gestreckt. </br>\r\nVariante A: Beide Beine gleichzeitig zur Brust ziehen. </br>\r\nVariante B: Beine schraeg im Wechsel nach links und rechts zur Brust ziehen. </br>\r\nVariante C: Beine im Wechsel anziehen: links - Mitte - rechts.', '<iframe src="https://player.vimeo.com/video/177103019" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(46, 'Zauberschnur Adduktor ', 'Zauberschnur am Fußgelenk befestigen. Beide Beine sind gestreckt. Bein mit Zauberschnur seitlich zu anderem Bein bewegen. ', '<iframe src="https://player.vimeo.com/video/177103016" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(47, 'Zauberschnur Abduktor ', 'Zauberschnur am Fußgelenk befestigen. Beide Beine sind gestreckt. Bein mit Zauberschnur seitlich von anderem Bein weg bewegen. ', '<iframe src="https://player.vimeo.com/video/177103017" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(48, 'Zauberschnur Evi Sachenbacher', 'Ein Ende der Zauberschnur in jede Hand nehmen. Beim in die Knie gehen Zauberschnur dynamisch nach unten fuehren - nach oben abspringen und Zauberschnur mit nach Vorne ueber den Kopf nehmen.', '<iframe src="https://player.vimeo.com/video/177256171" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 11, NULL, NULL, 5),
(49, 'Zubringeruebung Medizinball 1', 'In tiefer Schrittstellung den Medizinball in beiden Haenden hinter dem Kopf halten und mit maximaler Kraft abwechselnd links/rechts neben dem vorderen Fuß  so auf den Boden werfen, dass er wieder hochspringt. Rumpfmuskulatur anspannen. Maximal 10 Wiederholungen.', '<iframe src="https://player.vimeo.com/video/177148872" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 2, 2, NULL, NULL, 1),
(50, 'Zubringeruebung Partner', 'In tiefer Schrittstellung den Medizinball mit maximaler Kraft zum Partner seitlich ueber das vordere Bein werfen. Beine und Huefte bleiben stabil. Rumpf dreht mit ein. Links/rechts im Wechsel. Maximal 10 Wiederholungen.', '<iframe src="https://player.vimeo.com/video/177151240" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 2, 2, 15, NULL, 1),
(51, 'Zubringeruebung Medizinball 2', 'Aus gehockter Position den Medizinball erst zwischen die Unterschenkel, dann ueber den Kopf fuehren und mit maximaler Kraft senkrecht vor dem Koerper so auf den Boden werfen, dass er wieder hochspringt. </br>\r\nVariante: Beim Medizinball zu Kopf fuehren abspringen.', '<iframe src="https://player.vimeo.com/video/177151239" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 1, 2, NULL, NULL, 1),
(52, 'Unterarm Handball 1', 'Mit einem Handball von hinten durch die Beine spielen. Gegen die Wand oder zum Partner. Große Distanz mit moeglichst hartem Zuspiel. </br>\r\nVariante: Ball moeglichst hart und steil nach oben werfen.', '<iframe src="https://player.vimeo.com/video/177207821" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 1, NULL, NULL, 1),
(53, 'Unterarm Handball 2', 'Arm ist nach unten gestreckt. Ellbogen fixiert. Ball aus dem Handgelenk moeglichst hoch werfen.', '<iframe src="https://player.vimeo.com/video/177211956" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 1, NULL, NULL, 1),
(54, 'Wurfkraft 1', 'Werfen aus dem Langsitz: Spieler sitzt im Langsitz mit gestreckten Beinen, durchgestrecktem Becken und aktiver Rumpfmuskulatur. Wurf zum Mitspieler. Auf saubere Technik achten. Ellbogen ueber Schulter. Wurfarm nach hinten eindrehen. Anderer Arm samt Schulter diagonal dazu bewegen. Handgelenk beim Wurf umklappen. </br>\r\nVariante A: Werfen aus dem Huerdensitz: Links/Rechts. Handgelenk beim Wurf umklappen. </br>\r\nVariante B: Werfen aus dem Ausfallschritt: Links/Rechts. Knie beruehrt nicht den Boden. </br>\r\nJeweils 6 Wuerfe und 1-2 Serien.', '<iframe src="https://player.vimeo.com/video/177199212" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 6, 1, 2, 1, 16, NULL, 1),
(55, 'Wurf Langbank 1', 'Auf umgekehrter Langbank in Wurfauslage balancieren. Auf jeder Seite abwechselnd raumgreifende seitliche Ausfallschritte (1 - 3 auf jeder Seite - nach Vorgabe) durchfuehren. Am Ende der Langbank in Sitz auf zweite Langbank springen. Aus dieser Position ohne Verzoegerung aufstehen und mit Wurf abschließen. </br>\r\nVariante A: Verschiede Arten des Schlagwurfs: Schlagwurf mit Abknicken, Hueftwurf, Schlagwurf nach Wurftaeuschung. </br>\r\nVariante B: Sprungwurf mit Vorgabe der Schrittanzahl  </br>\r\nVariante C: Beidbeiniger Sprungwurf direkt aus dem Aufstehen </br>\r\nHinweis: Umso weniger Schritte - umso schwerer in die korrekte aufrechte Wurfauslage zu kommen. ', '<iframe src="https://player.vimeo.com/video/177223479" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 6, 2, 2, 1, 9, 18, 1),
(56, 'Wurf Schnelligkeit', 'Erster Ball passen. Ballaustausch mit direktem schnellen Wurf nach Ballannahme (z.B. Schlagwurf ueber das „falsche“ Bein). Zuspieler umlaufen mit Blick zum Tor und zweiten Ball verwerten.                  nach Zuspiel den zweiten Ball je nach Vorgabe (Knickwurf, Hueftwurf, etc.) aufs Tor werfen. </br>\r\nVariante A: Unterschiedliche Wurfvarianten fuer den ersten und zweiten Wurf. </br>\r\nVariante B: Nach dem ersten Wurf veraendert der Zuspieler seine Position. Werfer muss sich anpassen. </br>\r\nVariante C: Der Zuspieler spielt den zweiten Ball in unterschiedlichen Zeitpunkten zu. Zum Beispiel in die Rueckwaertsbewegung  (Ballannahme in Rueckwaerts-, Seitwaerts- oder kurzen Vorwaertsbewegung.)', '<iframe src="https://player.vimeo.com/video/177230631" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 6, 2, 2, 1, 16, 18, 1),
(57, 'Schneller Sprungwurf', 'In Wurfauslage von Kastendeckel in parallele Grundstellung springen (Rechtshaender wie hier auf Rueckraumlinks).\r\nSchneller Linksschritt nach rechts zur Wurfarmseite. Mit kurzem Bodenkontakt zum Wurf abspringen.\r\nArm stets in AIM-Position halten um jeder Zeit handlungsbereit zu sein. \r\n</br>\r\nVariante: Schneller Linksschritt diagonal nach links-vorne. Gegen Wurfarmseite abspringen. Schneller Schritt mit kurzem Bodenkontakt vor Absprung.', '<iframe src="https://player.vimeo.com/video/177235674" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 13, 2, 2, 1, 8, 18, 1),
(58, 'Spiegelarbeit', 'Zwei Spieler stehen sich gegenueber. Spieler A muss schnellst moeglich nach belieben die Blaettchen in seinem Feld beruehren. Spieler B muss seine Bewegung spiegeln. Auf Zeit (10 - 30 Sekunden). </br>\r\nVariante A: Form des Feldes aendern und/oder mehrere Blaettchen zum beruehren aufstellen. </br>\r\nVariante B: Zusatzuebungen einbauen. Z.B. Liegestuetz oder Strecksprung.', '<iframe src="https://player.vimeo.com/video/177221913" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 2, 1, 17, 15, NULL, 6),
(59, 'Farbenlauf', 'Vier farblich unterschiedliche Gegenstaende (z.B. Pylon) werden in einem Bereich nahe der 6-Meter Linie aufgestellt. Der Abwehrspieler muss auf Zuruf der Farbe schnellstmoeglich nacheinander zu den Gegenstaenden sprinten.</br>\r\nHinweis: Gegenstaende spielgerecht im Bereich zwischen 12 - 6 Meter verteilen. </br>\r\nVariante A: Bis zu 7 farblich unterschiedliche Gegenstaende aufstellen. </br>\r\nVariante B: Echte Personen, farblich gekennzeichnet, anstelle der Gegenstaende aufstellen. Abwehrspieler muss jedes mal Koerperkontakt aufnehmen.', '<iframe src="https://player.vimeo.com/video/177218952" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 2, 2, 17, 15, NULL, 6),
(60, 'Partnerliegestuetz 1', 'Spieler A hebt im Liegestuetz ein Bein an. Spieler B krabbelt (4 - 6 Mal) unter A hindurch. Beide Spieler duerfen nur mit Haende und Fueße Bodenkontakt haben. </br>\r\nVariante A: Spieler A macht jedes mal ein Liegestuetz, wenn B hindurch gekrabbelt ist. </br>\r\nVariante B: Beide Spieler machen jedes Mal ein Liegestuetz. </br>\r\nVariante C: Beide Spieler machen zwei oder mehr Liegestuetz.', '<iframe src="https://player.vimeo.com/video/177203113" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 5, 1, 2, 15, NULL, NULL, 1),
(61, 'Partnerliegestütz 2', 'Spieler A ist mit den Haenden auf dem Kleinkasten im Liegestuetz und wird von Spieler B an den Beinen gehalten. </br>\r\nVariante A: Spieler B haelt nur einen Fuß von Spieler A. </br>\r\nVariante B: Spieler A macht  zusaetzliche Liegestuetz mit einer Hand auf dem Kasten und einer Hand auf dem Boden. </br>\r\nVariante C: Spieler A macht zusaetzlich neben dem Kasten je eine Liegestuetz.', '<iframe src="https://player.vimeo.com/video/177205754" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 5, 1, 2, 15, 7, NULL, 1),
(62, 'Absprung Außenspieler 1', 'Dynamischer Absprung auf dem zweiten Schritt auf Kastendeckel. Der in der Wurfhand gehaltene Ball befindet sich jetzt schon in Kopfnaehe vor dem Koerper. Sprung nach vorne-oben. Schwungbein und Wurfarm nach vorne-oben fuehren. Landung auf der Matte.', '<iframe src="https://player.vimeo.com/video/177216568" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 2, 2, 1, 8, 10, 1),
(63, 'Response-Ball 1', 'Der Ball wird wie ein „gestreckter“ Bodenpass nach vorne-unten gedrueckt. Im Moment der Umkehrbewegung wird der Rueckflug des Balls durch ein kurzes, ruckartiges Zurueckziehen der Wurfhand unterstuetz. Der Ball wird dann einhaendig gefangen. Tempo und Richtung des Balls koennen selbststaendig variiert werden. Beiden Haende schulen.', '<iframe src="https://player.vimeo.com/video/177289469" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 27, NULL, NULL, 1),
(64, 'Response-Ball 2', 'Den Ball in Huefthoehe „no-look“ nach hinten werfen, nach der ersten Umkehrung an den Beinen vorbeifliegen lassen, um ihn nach der zweiten Umkehrung einhaendig zu fangen. </br>\r\nVariante A) Augen kurzzeitig schließen und erst in letztem Augenblick wieder oeffnen.', '<iframe src="https://player.vimeo.com/video/177291283" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 27, NULL, NULL, 1),
(65, 'Response-Ball 3', 'Im Unterarmstütz seitlich den Ball nach vorne werfen und einhaendig fangen. Koerper dabei stabil halten. </br>\r\nVariante A) Selber Ablauf im Handstuetz. </br>\r\nVariante B) Im Unterarmliegestuetz wird ein Bein angehoben.', '<iframe src="https://player.vimeo.com/video/177293453" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 1, 1, 2, 27, NULL, NULL, 1),
(66, 'Response-Ball 4', 'In der Standwaage den Response-Ball einhaendig werfen und fangen.', '<iframe src="https://player.vimeo.com/video/177293452" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 2, 27, NULL, NULL, 1),
(67, 'Skorpion', 'In Bauchlage (mit Arme seitlich ausgestreckt) eine kontrollierte Bewegung der linken Ferse zur rechten und dann der rechten Ferse zur linken Hand durchfuehren. Die Arme und das passive Bein sind immer gestreckt.', '<iframe src="https://player.vimeo.com/video/177139350" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 14, 1, 1, 23, NULL, NULL, 1),
(68, 'Sumo-Hocke', 'Stand gerade mit leicht gespreizten Beinen. Oberkoerper nach vorne beugen und unter die Fußsohlen greifen. Beine strecken. Fersen bleiben immer am Boden.', '<iframe src="https://player.vimeo.com/video/177139352" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 14, 1, 1, 23, NULL, NULL, 1),
(69, 'Handlauf', 'Haende auf den Boden direkt vor die Fueße setzen. Mit Haende nach vorne laufen (dabei den Bauchnabel nach innen ziehen), bis die Position gerade noch gehalten werden kann, dann folgen die Fueße. Die Beine sind jederzeit gestreckt, es werden nur kleine Schritte ausgefuehrt, so dass das Becken immer parallel zum Boden bleibt.', '<iframe src="https://player.vimeo.com/video/177139351" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 1, 1, 2, 23, NULL, NULL, 1),
(70, 'Ausfallschritt Drehung', 'Großer Ausfallschritt. Gewicht auf forderem Bein und gegenueberliegender Hand. Oberkoerper rotiert und Ellbogen wird nach hinten oben gefuehrt.', '<iframe src="https://player.vimeo.com/video/177286484" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 14, 1, 1, 23, NULL, NULL, 1),
(71, 'Skorpion reverse', 'In Rueckenlage (mit Arme seitlich ausgestreckt) eine kontrollierte Bewegung des linken Fußes zur rechten und dann des rechten Fußes zur linken Hand durchfuehren. Die Arme und das passive Bein sind immer gestreckt.', '<iframe src="https://player.vimeo.com/video/177139348" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 14, 1, 1, 23, NULL, NULL, 1),
(72, 'Handstand', 'Handstand kurz halten. </br>  Variante A: Handstand aus der Standwaage. </br>\r\nVariante B: Handstand an der Wand mit Liegestuetz', '<iframe src="https://player.vimeo.com/video/177134603" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 1, 1, 2, 23, NULL, NULL, 1),
(73, 'KL Kniehebelauf', 'Oberkoerper gerade, Knie abwechselnd in hoher Frequenz nach vorne-oben maximal anziehen. Arme bewegen sich seitlich entsprechend mit. </br>\r\nVariante A: Kniehebelauf seitlich. </br>\r\nVariante B: Kniehebelauf rueckwaerts. </br>\r\nVariante C: Kniehebelauf mit Gegenstand (z.B. Stange, Medizinball, Handball) vor der Brust. Ausgestreckte Arme. </br>\r\nVariante D: Kniehebelauf mit Gegenstand (z.B. Stange, Medizinball, Handball) ueber Kopf. Ausgestreckte Arme.', '<iframe src="https://player.vimeo.com/video/177305283" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 14, NULL, NULL, 5),
(74, 'KL In&Out', 'Zwei Kontakte im ersten Feld der Koordinationsleiter (KL). Ein Kontakt außerhalb der KL. Zwei Kontakte innerhalb. Ein Kontakt außerhalb andere Seite. </br>\r\nVariante A Seitlich im Abstand von 1 - 3 Meter zur KL Pylon aufstellen. Koordinationsleiter auf Hoehe des Pylon verlassen und dieses beruehren. Anschließend zurueck in die KL.', '<iframe src="https://player.vimeo.com/video/177307678" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 14, NULL, NULL, 5),
(75, 'KL Akzentlauf', 'Wie Kniehebelauf nur mit einem Bein. Bein innerhalb der Koordinationsleiter (KL) wird schnell nach oben gezogen und mit Druck nach unten gepresst. Dabei findet ein aktiver Abdruck vom Boden mit der Fußspitze statt. Das andere Bein ist außerhalb der KL und schlendert locker mit. Und umgekehrt.', '<iframe src="https://player.vimeo.com/video/177308620" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 14, NULL, NULL, 5),
(76, ' KL Jumpin Jack', 'Beidbeinig in die Koordinationsleiter (KL) springen. Beidbeinig ein Feld ueberspringen und außerhalb landen. Beidbeinig zurueck in das uebersprungene Feld. Und von vorne. </br>\nVariante A: mit Hampelmann  </br> Variante B: mit ueberkreuz-Schritt', '<iframe src="https://player.vimeo.com/video/177309339" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 14, NULL, NULL, 5),
(77, 'KL Handlauf', 'Haende in Koordinationsleiter (KL) und Beine außerhalb. Einmal um die KL. Pro Feld zwei Kontakt. </br>\r\nVariante A) Pro Feld ein Kontakte.', '<iframe src="https://player.vimeo.com/video/177310479" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 14, NULL, NULL, 5),
(78, 'KL Forward Back', 'Beidbeinige Spruenge: Zwei vor - einen zurueck. </br>\r\nVariante A: Seitlich. </br>\r\nVariante B: Rueckwaerts.', '<iframe src="https://player.vimeo.com/video/177379380" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 14, NULL, NULL, 5),
(79, 'Dauerlauf', '45 min Dauerlauf im aeroben Bereich. 12 Einheiten (2-3mal in der Woche - auch vor oder nach dem Training moeglich).', '<iframe src="https://player.vimeo.com/video/177429465" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 3, 12, 3, 1, 32, NULL, NULL, 0),
(80, 'Kurzzeitintervall Stadion', '100m schnell - 100m langsam. Ohne Pausen. 4-10 Mal.', '<iframe src="https://player.vimeo.com/video/177429464" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 3, 10, 2, 2, 23, NULL, NULL, 0),
(81, 'Mittelzeitintervall', '300m schnell - 100m langsam. Ohne Pausen. 4-6 Mal.', '<iframe src="https://player.vimeo.com/video/177429463" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 3, 11, 2, 2, 23, NULL, NULL, 0),
(82, 'Langzeitintervall', '600m schnell - 200m langsam. Ohne Pausen. 4-6 Mal.', '<iframe src="https://player.vimeo.com/video/177459387" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 3, 12, 3, 2, 23, NULL, NULL, 0),
(83, 'Kurzzeitwiederholung', '400m schnell. Pause 4-10 Minuten. 4-8 Mal.', '<iframe src="https://player.vimeo.com/video/177462662" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 3, 10, 2, 2, 23, NULL, NULL, 0),
(84, 'Mittelzeitwiederholung', '800m schnell. Pause 6-12 Minuten. 3-6 Mal.', '<iframe src="https://player.vimeo.com/video/177465747" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 3, 11, 2, 2, 23, NULL, NULL, 0),
(85, 'Reaction-Ball 1', 'Reaction-Ball auf den Boden Fallen lassen und nach einem Bodenkontakt fangen. </br>\r\nVariante A: Gegen die Wand werfen und nach einem Bodenkontakt fangen. </br>\r\nVariante B: Mit Ruecken zur Wand dagegen Werfen, drehen und nach einem Bodenkontakt fangen.', '<iframe src="https://player.vimeo.com/video/177468513" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 30, NULL, NULL, NULL),
(87, 'Reaction-Ball Partner 1', 'Reaction-Ball gegen die Wand Richtung Partner werfen. Dieser muss ihn fangen. </br>\r\nVariante A: Aufsetzer Pass zum Gegenueber. </br>\r\nVariante B: Partner legt den Reaction-Ball ueber die Schulter. Ball nach einem Bodenkontakt fangen.', '<iframe src="https://player.vimeo.com/video/177471318" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 2, 14, 1, 1, 30, 15, NULL, NULL),
(88, 'Pezi-Ball Ruecken 1', 'Huefte liegt auf Pezi-Ball. Rumpfspannung. Arme nach vorne ausgestreckt. Kurze Bewegungen hoch und runter.', '<iframe src="https://player.vimeo.com/video/177522145" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 4, 1, 1, 29, NULL, NULL, 3),
(89, 'Pezi-Ball Bauch 1', 'Knie auf dem Pezi-Ball. Haende auf dem Boden. Durch Knie zur Brust anziehen - Ball nach vorne bewegen. Und wieder zurueck. </br>\r\nVariante: Seitlich eindrehen. Dabei zeigt eine Seite der Huefte nach oben.', '<iframe src="https://player.vimeo.com/video/177518274" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 4, 1, 1, 29, NULL, NULL, 3),
(90, 'Pezi-Ball Rumpf 1', 'Auf dem Pezi-Ball sitzen. Haende auf der Brust ueberkreuzen. Oberkoerper nach hinten bewegen. Bei der Vorwaertsbewegung leicht mit den Beinen nach vorne-oben druecken.', '<iframe src="https://player.vimeo.com/video/177526765" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 4, 1, 1, 29, NULL, NULL, 3),
(91, 'Pezi-Ball Rumpf 2', 'Auf dem Pezi-Ball sitzen. Arme sind gestreckt vor der Brust. Arme versetzt leicht hoch und runter bewegen. Fußgelenksarbeit. Fußspitz - Verse. Links - Rechts.\r\n', '<iframe src="https://player.vimeo.com/video/177522814" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 4, 1, 1, 29, NULL, NULL, 3),
(92, 'Pezi-Ball Rumpf 3', 'Auf dem Pezi-Ball sitzen. Arme sind gestreckt ueber Kopf. Leichtes Hohlkreuz. Gewicht Beine abwechselnd von einem auf den anderen Fuß verlagern.', '<iframe src="https://player.vimeo.com/video/177523871" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 4, 1, 1, 29, NULL, NULL, 3),
(93, 'Faszien Blackroll 1', 'Faszienmassage mit der Blackroll: Über Schienbeinausseinseite rollen. </br>\r\nVariante A: ueber Oberschenkel Vorderseite rollen.</br>\r\nVariante B: ueber Oberschenkel Seiten rollen. </br>\r\nVariante C: ueber Achillessehne rollen. </br>\r\nVariante D: ueber Oberschenkel Rueckseite rollen. </br>\r\nVariante E: ueber Ruecken rollen. Arme seitlich gestreckt.\r\n', '<iframe src="https://player.vimeo.com/video/177528550" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 1, 1, 1, 33, NULL, NULL, 5),
(94, 'Faszien Tennisball 1', 'Faszienmassage mit dem Tennisball. Fuß auf dem Ball vor und zurueck bewegen und auf und ab pumpen.', '<iframe src="https://player.vimeo.com/video/177531795" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 4, 1, 1, 1, 33, NULL, NULL, 1),
(95, 'Swing-Stick 1', 'Swing-Stick einarmig parallel zum Boden erst hoch-runter und dann-links rechts bewegen. </br>\r\nVariante A: Swing-Stick mit beiden Haenden greifen und parallel zum Koerper vor und zurueck bewegen. Dabei durch Schulter Rotation den Stick ueber Kopf hoch und bis zur Huefte runter fuehren. </br>\r\nVariante B: Swing-Stick mit beiden Haenden greifen und parallel zum Boden vor und zurueck bewegen. Dabei durch Schulter Rotation den Stick ueber Kopf hoch und bis zur Huefte runter fuehren.\r\n', '<iframe src="https://player.vimeo.com/video/177534591" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 14, 1, 1, 28, NULL, NULL, 5),
(96, 'Swing-Stick 2', 'Mit Bauch auf Matte liegen. Swing-Stick mit leicht angelegten Armen vor dem Kopf vor und zurueck bewegen. Auch einarmig. ', '<iframe src="https://player.vimeo.com/video/177536235" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 14, 1, 1, 28, 10, NULL, 5),
(97, 'Kettlebell Swing', 'Durch aktives Einklappen in der Huefte beugen und wie ein Gummi der gespannt ist strecken. Bewegung kommt aus den Beinen. Gerader Ruecken. Ganzkoerperspannung halten. </br>\r\nVariante: Einarmig ', '<iframe src="https://player.vimeo.com/video/176865131" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(98, 'Kettlebell High Pull', 'Kettlebell aus dem Swing bis auf Schulterhoehe (max. Augenhoehe) durch Zug mit Ellbogen nach hinten ziehen.', '<iframe src="https://player.vimeo.com/video/176852940" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(99, 'Kettlebell Push Press', 'Aus Parkposition Knie leicht beugen und dann dynamisch Knie, Huefte, Arm strecken und Kettlebell ueber dem Kopf halten.', '<iframe src="https://player.vimeo.com/video/176865132" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(100, 'Kettlebell Snatch', 'Dynamische Beinstreckung. Kettlebell im oberen Ruhepunkt des Schwungs ueber den Ring drehen. Leicht in den Knien abfedern.', '<iframe src="https://player.vimeo.com/video/176865130" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(101, 'Kettlebell Front Squat', 'Gerader Ruecken. Bewegung aus den Beinen. Aus Kniebeuge in volle Koerperstreckung gehen.', '<iframe src="https://player.vimeo.com/video/176852946" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(102, 'Kettlebell Russian Twist', 'Leicht zurueckgelehnt sitzen. Versen auf dem Boden. Beine leicht angewinkelt. Kettlebell vor dem Brustbein. Rumpf rotieren. Variante: Beide Haende uebereinander an den Griff. Kettlebell dynamisch von links nach rechts schleudern.', '<iframe src="https://player.vimeo.com/video/176852947" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(103, 'Kettlebell Turkish Get Up', 'Kettlebell senkrecht ueber der Schulter halten. Schulter ist verriegelt. Blick immer auf die Kettlebell. Arm am Boden abspreizen. Aus der Rueckenlage in Unterarmstuetz ueber die Hand vom Boden in den Kniestand und in den Stand. In umgekehrter Reihenfolge zurueck in Rueckenlage.', '<iframe src="https://player.vimeo.com/video/176865129" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 25, NULL, NULL, 4),
(104, 'TRX Brust 1', 'In den Laschen nach vorne abstuetzen bis Arme angewinkelt sind. Fueße bleiben am Boden. Anschließend in Armstreckung zurueck druecken. </br>\r\nVariante: Arm abwechselnd beim nach vorne gehen zur Seite strecken.', '<iframe src="https://player.vimeo.com/video/176839185" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(105, 'TRX Trizeps 1', 'Laschen oberhalb des Kopfs positionieren. Nach vorne fallen lassen und durch Muskelkraft des Armstreckers wieder in gerade Ausgangsposition zurueck fuehren.', '<iframe src="https://player.vimeo.com/video/176841798" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(106, 'TRX Ruecken 1', 'Laschen vor der Brust positionieren. Nach hinten in Armstreckung bewegen. Mit Blickrichtung zum TRX. Arme gestreckt zur Seite fuehren.', '<iframe src="https://player.vimeo.com/video/176843965" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(107, 'TRX Kniebeugen 1', 'Einbeinige Kniebeugen mit Festhalten an den Laschen durchfuehren. Armstreckung beim nach unten gehen. Armbeugung beim hochziehen.', '<iframe src="https://player.vimeo.com/video/176845260" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(108, 'TRX Spruenge 1', 'Seitliche Spruenge links rechts mit Zug auf den Laschen. Einbeiniger Sprung in Kniebeuge. Dabei geht das Bein in der Luft ueber die Diagonale des stehenden.', '<iframe src="https://player.vimeo.com/video/176845820" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(109, 'TRX Kniebeugen 2', 'Arme sind fixiert angewinkelt mit Halt in den Laschen. Durch Beinstreckung wird das Gewicht aus der Kniebeuge nach vorne verlagert.  </br> Variante: Waehrend der Beinstreckung begeben sich die Arme nach vorne oben in die volle Koerperstreckung.', '<iframe src="https://player.vimeo.com/video/176846361" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(110, 'TRX Kniebeugen 3', 'Einbeinige Kniebeugen. Dabei ist ein Fuß in die Lasche eingehaengt. Stabile Kniebeugen bis das Knie in der Lasche fast den Boden beruehrt. Das Knie auf dem Boden soll nicht nach innen knicken. </br>\r\nVariante: Mit Gewicht in der Hand. Zum Beispiel ein Medizinball.', '<iframe src="https://player.vimeo.com/video/176847386" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(111, 'TRX Rumpf 1', 'Kniend vor dem TRX positionieren. Laschen auf Schulterhoehe mit gestreckten Armen greifen. Laschen bis zur Streckung nach vorne bewegen und wieder zum Koerper ziehen.', '<iframe src="https://player.vimeo.com/video/176846896" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(112, 'TRX Bizeps 1', 'Laschen vor der Brust positionieren. Blickrichtung zum TRX. Durch Muskelkraft des Armbeugers wieder in gerade Ausgangsposition zurueckfuehren.  </br>\r\nVariante A: Handflaechen zeigen nach unten. </br>\r\nVariante B: Haende drehen bei der Streckung ein.', '<iframe src="https://player.vimeo.com/video/176842291" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(113, 'TRX Rumpf 4', 'Mit gestreckten Armen zur Seite eindrehen. Dabei Arme leicht beugen. </br>\r\nVariante: Abwechselnd nach links und rechts eindrehen.', '<iframe src="https://player.vimeo.com/video/176847391" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(114, 'TRX Rumpf 3', 'Beide Fueße uebereinander seitlich in Laschen einhaengen. Unterarmsuetz seitlich. Der Obere Arm dreht sich nach unten ein.', '<iframe src="https://player.vimeo.com/video/176847389" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(115, 'TRX Rumpf 2', 'Beide Fueße in die Laschen einhaengen. Unterarmliegestuetz. Knie zur Brust anziehen. </br>\r\nVariante A: Im Armstuetz. Stabiler Rumpf. Vor allem unterer Ruecken. </br>\r\nVariante B: mit Liegestuetz kombinieren. Kein Hohlkreuz. Brust beruehrt fast den Boden.', '<iframe src="https://player.vimeo.com/video/176847390" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(116, 'TRX Ganzkoerper 1', 'Beide Fueße in die Laschen einhaengen. Armstuetz. Knie im Wechsel schnell zur Brust ziehen. Stabiler Rumpf. Kein Hohlkreuz.', '<iframe src="https://player.vimeo.com/video/176847388" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4);
INSERT INTO `uebungen` (`id_uebung`, `titel_uebung`, `beschreibung`, `videourl`, `bildurl`, `kategorie`, `unterkategorie`, `dauer`, `niveau`, `hilfsmittel`, `hilfsmittel2`, `hilfsmittel3`, `referenz`) VALUES
(117, 'TRX Bizeps 2', 'Laschen auf Kopfhoehe mit angewinkelten Armen greifen. Handflaechen zeigen nach unten. In Armstreckung nach hinten gehen und durch Muskelkraft der Armbeugers wieder herziehen.', '<iframe src="https://player.vimeo.com/video/176844753" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 24, NULL, NULL, 4),
(118, 'Bank ausstoßen', 'Langbank auf Kopfhoehe an Sprossenwand einhaken. Mit angewinkelten Armen Bank nach oben ausstoßen. </br>\r\nVariante A: Mit Bank in angewinkelten Armen nach unten in die Kniebeuge gehen. Zuerst mit Beine dann Arme nach oben abdruecken.</br>\r\nVariante B: Aus der Kniebeuge nach oben abspringen.', '<iframe src="https://player.vimeo.com/video/177066790" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 2, 21, 9, NULL, 2),
(119, 'Burpees', 'Per Kniebeuge nach unten gehen. Haende vorne auf dem Boden abstuetzen. Beine mit einem Sprung nach hinten positionieren. In Liegestuetz gehen. Vor dem Abdruecken nach oben Haende kurz vom Boden abheben. Beine nach vorne anziehen und mit einem kurzen schnellen Sprung nach oben aufrichten.', '<iframe src="https://player.vimeo.com/video/177266572" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 7),
(120, 'Wechselspruenge', 'Sprung in den tiefen Ausfallschritt im Wechsel. Knie beruehrt fast den Boden. Arme entsprechend dynamisch mitschwingen.', '<iframe src="https://player.vimeo.com/video/177269976" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 7),
(121, 'Unterarmstuetz 1', 'Unterarmstuetz halten. Wirbelsaeule gerade. </br>\r\nVariante A: Handstuetz halten. </br>\r\nVariante B: Zwischen Unterarm- und Handstuetz wechseln.', '<iframe src="https://player.vimeo.com/video/177271538" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 7),
(122, 'Hockspruenge Push', 'Hockspruenge mit Armeinsatz. Arme beim Sprung von vorne nach hinten ziehen. Knie und Fußspitz zeigen minimal nach Außen.', '<iframe src="https://player.vimeo.com/video/177274958" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 7),
(123, 'Unterarmstuetz 2', 'Unterarmstuetz seitlich halten. Huefte nicht absenken.', '<iframe src="https://player.vimeo.com/video/177274957" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 7, 1, 1, 23, NULL, NULL, 7),
(124, 'Steigesprünge 1', 'Ein Fuß auf den Kleinkasten absetzen. Mit diesem nach oben abdruecken. Fuß bleibt auf dem Kasten. Knie vom anderem Bein nach oben ziehen. Arme entsprechend diagonal mitbewegen. </br>\r\nVariante A: Mit Absprung. Fuß hebt vom Kleinkasten ab. </br>\r\nVariante B: Mit Sprungwechsel. Nach jedem Sprung landet der andere Fuß auf dem Kleinkasten', '<iframe src="https://player.vimeo.com/video/177677684" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\r\n', NULL, 1, 6, 1, 1, 7, NULL, NULL, 2),
(125, 'Das war die letzte Übung', '', 'Mehr Übungen folgend bald. Verwende "vorherige Übung" um zurück zu gelangen.', 'Mehr Übungen folgend bald. Verwende "vorherige Übung" um zurück zu gelangen.', 1, NULL, 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungentraining`
--

CREATE TABLE IF NOT EXISTS `uebungentraining` (
  `id_uebung` int(11) NOT NULL,
  `id_tr` int(11) NOT NULL,
  `hinweis_uebung` text COLLATE utf8_unicode_ci NOT NULL,
  KEY `id_uebung` (`id_uebung`),
  KEY `id_tr` (`id_tr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `uebungentraining`
--

INSERT INTO `uebungentraining` (`id_uebung`, `id_tr`, `hinweis_uebung`) VALUES
(78, 52, 'Einmal alle drei Übungen absolvieren. Falls nicht funktioniert - vor vorne anfangen.'),
(76, 52, 'Einmal normal + Variante A. Falls nicht funktioniert, von vorne anfangen.'),
(34, 52, '8 Sprünge - 2min Pause --> 4mal. \r\nOhne Variante!\r\nMit möglichst kurzem Bodenkontakt auf Kasten springen!'),
(88, 52, '30 Sekunden am Stück - im Wechsel mit Pezi-Ball Bauch 1. 3 Mal'),
(89, 52, '10-15 Wiederholungen - im Wechsel mit Pezi-Ball Rücken 1. 3 Mal'),
(96, 52, '20 Sekunden beide Arme - Pause - 20 Sekunden linker Arm - Pause - 20 Sekunden rechter Arm. 2 Mal'),
(85, 52, 'Alle Varianten nach belieben durch machen.\r\nSchwierigkeit selbst steuern - durch härteres/leichteres Werfen des Balls.'),
(63, 54, 'Ziel: 3 Pässe nacheinander fangen - 3 Mal'),
(69, 55, '6 Wiederholungen am Stück. 2 Mal'),
(71, 55, '4 Mal Fuß zu Hand je Seite. 2 Mal'),
(85, 55, 'zu Variante A: Mal hoch, mal tief gegen die Wand werfen. Auch ohne Aufsetzer fangen.'),
(16, 58, '1. Squats mit Sprint 2x\r\n2. Squats mit Hocksprünge\r\n3. Squats mit Hürdensprünge\r\n4. Squats mit Hocksprünge und Sprint'),
(57, 58, 'mit Matte vor Spieler. An Matte vorbei'),
(65, 54, 'Jede Seite 2x3 gute Pässe'),
(98, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(122, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(52, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(85, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(71, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(68, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(69, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(67, 59, ' Wiederholungen, Serien, Intensität, etc. ... '),
(63, 61, '5 saubere Pässe am Stück '),
(115, 61, 'Alle Varianten. Je 10 Wdh. Im Wechsel mit response Ball'),
(64, 61, '5 saubere Pässe am Stück'),
(116, 61, 'auf Zeit 20 sec - Pause 3 mal'),
(16, 62, 'Siehe Beschreibung unten ...'),
(26, 62, 'je 8-10 Sprünge. Genügend Pause zwischen den Serien (2-4 Minuten).'),
(31, 62, '6-8 Sprünge + Sprint. Pause 2-5 Minuten.'),
(32, 62, 'Ohne Sprung 15-20 Wiederholungen.\r\nMit Sprung 8 -12 Wiederholungen.'),
(33, 62, '8 Sprünge mit maximaler Konzentration. Anschließend Pause bis zur vollen Erholung. Kurzer Bodenkontakt + hoher Sprung'),
(34, 62, '8 Sprünge - Pause, maximale Erholung'),
(37, 62, '10 - 20 Ausfallschritte. Pause - Beinwechsel'),
(44, 62, '8-10 Sprünge'),
(45, 62, '10-20 Wiederholungen - Beinwechsel'),
(46, 62, '10-20 Wiederholungen - Beinwechsel'),
(62, 62, 'bis zu 8 Sprünge nacheinander - Pause'),
(70, 62, '10-20 Wiederholungen'),
(73, 62, 'Immer so oft, bis Übung gut beherrschbar ist.'),
(74, 62, 'Immer so oft, bis Übung gut beherrschbar ist.'),
(75, 62, 'Immer so oft, bis Übung gut beherrschbar ist.'),
(76, 62, 'Immer so oft, bis Übung gut beherrschbar ist.'),
(78, 62, 'Immer so oft, bis Übung gut beherrschbar ist.'),
(93, 62, 'Vor dem Training eher kurz und schnell - nach dem Training lang und langsam.'),
(94, 62, 'Nach dem Training.'),
(101, 62, '10-20 Wiederholungen. Je nach Gewicht. Am Anfang langsame saubere Bewegungen. Dann auch mal schnell.'),
(107, 62, '8-15 Wiederholungen - Beinwechsel.'),
(108, 62, '10-20 Sprünge.'),
(109, 62, '10-20 Wiederholungen'),
(110, 62, '6-18 Wiederholungen.'),
(120, 62, 'Auf Zeit (15-30sec) oder 20-40 Sprünge.'),
(122, 62, 'Auf Zeit (15-30sec) oder 20-40 Wiederholungen.'),
(20, 64, 'Jeweils 15-20 Wdh. 2 Serien je Übung'),
(24, 64, '15-20 Wiederholungen. 1xNormal, 2xVariante'),
(25, 64, ' Nur Variante A: 10 Wiederholungen. Andere Seite ohne Pause. Nach beiden Seiten kurze Pause. 3 Serien.'),
(63, 64, 'Nach 8-10 Pässen kurze Pause. Solange bis 5 "gute" Pässe nacheinander möglich sind.'),
(64, 64, 'Nach 8-10 Pässen kurze Pause. So lange bis 5 "gute" Pässe nacheinander möglich sind.'),
(95, 64, 'Jeweils ca 15-30 Sekunden.'),
(96, 64, '15-30 Sekunden. 3 Serien.'),
(93, 64, 'Diese Übung zum Schluss: Variante nach Wunsch. 20 Sekunden - 1 Minute pro Variante.'),
(94, 64, 'Diese Übung zum Schluss: Variante nach Wunsch. 20 Sekunden - 1 Minute pro Variante.'),
(17, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(22, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(24, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(26, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(83, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(63, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(58, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(93, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(39, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(116, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(97, 65, ' Wiederholungen, Serien, Intensität, etc. ... '),
(113, 65, ' Wiederholungen, Serien, Intensität, etc. ... ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unterkategorie`
--

CREATE TABLE IF NOT EXISTS `unterkategorie` (
  `id_unterkategorie` int(11) NOT NULL,
  `titel_unterkategorie` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_unterkategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `unterkategorie`
--

INSERT INTO `unterkategorie` (`id_unterkategorie`, `titel_unterkategorie`) VALUES
(1, 'Kraft'),
(2, 'Schnelligkeit'),
(3, 'Ausdauer'),
(4, 'Beweglichkeit'),
(5, 'Maximalkraft'),
(6, 'Schnellkraft'),
(7, 'Kraftausdauer'),
(8, 'Motorische Schnelligkeit'),
(9, 'Handlungsschnelligkeit'),
(10, 'Kurzzeitausdauer'),
(11, 'Mittelzeitausdauer'),
(12, 'Langzeitausdauer'),
(13, 'Reaktivkraft'),
(14, 'Koordination');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `userNickname` varchar(250) NOT NULL,
  `userName` varchar(250) NOT NULL,
  `userSurname` varchar(250) NOT NULL,
  `userPass` varchar(250) NOT NULL,
  `userMail` varchar(250) NOT NULL,
  `userPhone` varchar(250) NOT NULL,
  `userMobile` varchar(250) NOT NULL,
  `createdBy` smallint(5) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userState` int(1) NOT NULL,
  `userRank` smallint(1) NOT NULL DEFAULT '1',
  `userWrongPass` smallint(10) NOT NULL,
  `userPic` int(1) NOT NULL,
  `userStatusAnzeige` int(11) NOT NULL DEFAULT '0',
  `userBriefkopf` smallint(1) NOT NULL DEFAULT '1',
  `userJahr` year(4) NOT NULL DEFAULT '2014',
  `userSaison` smallint(5) NOT NULL DEFAULT '1',
  `userKempa` smallint(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`userID`, `userNickname`, `userName`, `userSurname`, `userPass`, `userMail`, `userPhone`, `userMobile`, `createdBy`, `creationDate`, `userState`, `userRank`, `userWrongPass`, `userPic`, `userStatusAnzeige`, `userBriefkopf`, `userJahr`, `userSaison`, `userKempa`) VALUES
(0, 'Gast', 'Gast', 'Gast', 'aa', '', '', '', 0, '2015-11-30 13:41:14', 0, 1, 0, 0, 0, 1, 2014, 3, 1),
(1, 'Florian', 'Florian', 'Nowack', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-11 10:01:08', 1, 1, 1, 0, 0, 0, 2016, 3, 1),
(33, 'Ticket', 'Dominik', 'Ellek', 'c751439d0db3883ac1c8e816327adcab', 'jochen.halder@gmail.com', '', '', 0, '2016-08-15 16:02:45', 1, 1, 38, 0, 0, 0, 2016, 3, 1),
(36, 'Jochen', 'Jochen', 'Schoch', 'ed80f32239a4d46f30eda7dc31624f43', 'jochen@schochs.de', '+49 7351 28981', '+49 171 17 83 264', 0, '2016-04-27 17:39:33', 1, 1, 96, 1, 0, 0, 2016, 6, 1),
(37, 'Wölfle', 'Wolfgang', 'Weiß', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-14 08:34:03', 1, 1, 0, 0, 0, 1, 2016, 1, 1),
(38, 'Konsti', 'Konstantin', 'Giese', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-15 08:48:50', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(39, 'Koenig', 'Koenig', 'Stefan', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-18 13:02:12', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(40, 'Mueller', 'Mueller', 'Wolfgang', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-18 13:02:19', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(41, 'Rebholz', 'Rebholz', 'Sandra', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-18 13:02:25', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(42, 'Karl-Heinz', 'Herth', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-24 09:22:15', 1, 1, 0, 0, 1, 1, 2014, 1, 1),
(43, 'Marion', 'Waibel', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-24 09:22:59', 1, 1, 2, 0, 1, 1, 2014, 1, 1),
(44, 'Lukas', 'Fimpel', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-24 09:41:08', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(45, 'Roland', 'Roland', 'Lieb', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-26 12:30:03', 1, 1, 1, 0, 0, 1, 2014, 1, 1),
(46, 'Niklas', '', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-26 12:30:30', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(47, 'Louisa', '', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-26 12:30:42', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(48, 'Anne', 'Anne', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-31 14:46:31', 1, 1, 0, 0, 0, 1, 2014, 1, 1),
(49, 'Carina', '', '', 'c751439d0db3883ac1c8e816327adcab', '', '', '', 0, '2016-08-31 14:51:53', 1, 1, 0, 0, 0, 1, 2014, 1, 1);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `nutzerteilnehmer`
--
ALTER TABLE `nutzerteilnehmer`
  ADD CONSTRAINT `nutzerteilnehmer_ibfk_1` FOREIGN KEY (`id_nutzer`) REFERENCES `nutzer` (`id_nutzer`),
  ADD CONSTRAINT `nutzerteilnehmer_ibfk_2` FOREIGN KEY (`id_tn`) REFERENCES `teilnehmer` (`id_tn`);

--
-- Constraints der Tabelle `teilnehmer`
--
ALTER TABLE `teilnehmer`
  ADD CONSTRAINT `teilnehmer_ibfk_1` FOREIGN KEY (`id_rolle`) REFERENCES `rolleteilnehmer` (`id_rolle`);

--
-- Constraints der Tabelle `teilnehmertraining`
--
ALTER TABLE `teilnehmertraining`
  ADD CONSTRAINT `teilnehmertraining_ibfk_1` FOREIGN KEY (`id_tn`) REFERENCES `teilnehmer` (`id_tn`),
  ADD CONSTRAINT `teilnehmertraining_ibfk_2` FOREIGN KEY (`id_tr`) REFERENCES `training` (`id_tr`);

--
-- Constraints der Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  ADD CONSTRAINT `uebungen_ibfk_1` FOREIGN KEY (`kategorie`) REFERENCES `kategorie` (`id_kategorie`),
  ADD CONSTRAINT `uebungen_ibfk_3` FOREIGN KEY (`dauer`) REFERENCES `dauer` (`id_dauer`),
  ADD CONSTRAINT `uebungen_ibfk_4` FOREIGN KEY (`niveau`) REFERENCES `niveau` (`id_niveau`),
  ADD CONSTRAINT `uebungen_ibfk_5` FOREIGN KEY (`hilfsmittel`) REFERENCES `hilfsmittel` (`id_hilfsmittel`),
  ADD CONSTRAINT `uebungen_ibfk_6` FOREIGN KEY (`hilfsmittel2`) REFERENCES `hilfsmittel2` (`id_hilfsmittel2`),
  ADD CONSTRAINT `uebungen_ibfk_7` FOREIGN KEY (`hilfsmittel3`) REFERENCES `hilfsmittel3` (`id_hilfsmittel3`),
  ADD CONSTRAINT `uebungen_ibfk_8` FOREIGN KEY (`unterkategorie`) REFERENCES `unterkategorie` (`id_unterkategorie`),
  ADD CONSTRAINT `uebungen_ibfk_9` FOREIGN KEY (`referenz`) REFERENCES `referenz` (`id_referenz`);

--
-- Constraints der Tabelle `uebungentraining`
--
ALTER TABLE `uebungentraining`
  ADD CONSTRAINT `uebungentraining_ibfk_1` FOREIGN KEY (`id_uebung`) REFERENCES `uebungen` (`id_uebung`),
  ADD CONSTRAINT `uebungentraining_ibfk_2` FOREIGN KEY (`id_tr`) REFERENCES `training` (`id_tr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
