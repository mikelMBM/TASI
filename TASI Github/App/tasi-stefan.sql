-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Apr 2018 um 18:41
-- Server-Version: 10.1.28-MariaDB
-- PHP-Version: 7.1.11

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
(16, 'Koordinationsleiter');

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
(3, 1),
(2, 2),
(4, 2),
(5, 3),
(6, 5),
(11, 5),
(6, 6),
(11, 7),
(6, 7),
(6, 8),
(9, 9),
(9, 10);

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
(2, 2),
(2, 3);

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
(17, 'testen', '0000-00-00 00:00:00', 1, 'adsfafgasdfasdf', 1),
(18, '', '0000-00-00 00:00:00', 0, NULL, NULL);

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
(18, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungen`
--

CREATE TABLE `uebungen` (
  `UebungsID` int(11) NOT NULL,
  `Bezeichnung` varchar(30) NOT NULL,
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
(1, 'Medizinball Wand 1', 'Beidbeinig ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand werfen.\r\nVariante A: Linkes bzw. rechtes Bein nach vorne positionieren.\r\nVariante B: Beinwechsel nach jedem Wurf.', 'https://player.vimeo.com/video/177053507\r\n', '', 'Kraft', 'Schnellkraft', 'kurz', 'einfach', ''),
(2, 'Wurfkraft 1', 'Werfen aus dem Langsitz: Spieler sitzt im Langsitz mit gestreckten Beinen, durchgestrecktem Becken und aktiver Rumpfmuskulatur. Wurf zum Mitspieler. Auf saubere Technik achten. Ellbogen ueber Schulter. Wurfarm nach hinten eindrehen. Anderer Arm samt Schulter diagonal dazu bewegen. Handgelenk beim Wurf umklappen. \r\nVariante A: Werfen aus dem Huerdensitz: Links/Rechts. Handgelenk beim Wurf umklappen. \r\nVariante B: Werfen aus dem Ausfallschritt: Links/Rechts. Knie beruehrt nicht den Boden.', 'https://player.vimeo.com/video/177199212\r\n', '', 'Schnelligkeit', 'Schnellkraft', 'kurz', 'medium', ''),
(3, 'Dauerlauf', 'Man läuft und läuft und läuft und läuft und läuft und läuft. Eigentlich läuft man nur. Und das die ganze Zeit.', 'https://player.vimeo.com/video/177429465\r\n', '', 'Ausdauer', 'Langzeitausdauer', 'lang', 'einfach', ''),
(4, 'Skorpion', 'Ein Skorpion ist ein Kriechtier. Es hat einen giftigen Stachel. Für die Übung, welche insbesondere für besonders giftige Außenspieler geeignet ist gilt: In Bauchlage (mit Arme seitlich ausgestreckt) eine kontrollierte Bewegung der linken Ferse zur rechten und dann der rechten Ferse zur linken Hand durchfuehren. Die Arme und das passive Bein sind immer gestreckt.', 'https://player.vimeo.com/video/177139350', '', 'Beweglichkeit', 'Koordination', 'kurz', 'einfach', ''),
(5, 'Bankdreucken 1', 'Rueckenlage auf der Langbank. Stange auf Hoehe des Brustbeins. Stabiler Rumpf. Fueße und Versen fest auf dem Boden mit Fußspitz auf Kniehoehe. Reckstange vom Brustbein bis in die Armstreckung druecken. Kontrolliertes Tempo. </br>\r\nVariante: Stange schnell nach oben ausstoßen.', 'https://player.vimeo.com/video/177062068\r\n', '', 'Kraft', 'Schnellkraft', 'kurz', 'einfach', ''),
(6, 'Squats 1', 'Reckstange auf Nackenmuskulatur fixieren. Beine Hueft- bis Schulterbreit aufstellen. Stabile Rumpfmuskulatur. Beim hochgehen Huefte leicht nach vorne druecken ohne dabei die Grundspannung im Ruecken zu verlieren. Maximal nach unten beugen.', 'https://player.vimeo.com/video/177058694\r\n', '', 'Kraft', 'Kraftausdauer', 'kurz', 'einfach', ''),
(7, 'Squats 2', 'Reckstange auf Nackenmuskulatur fixieren. Beine Hueft- bis Schulterbreit aufstellen. Stabile Rumpfmuskulatur. Beim hochgehen Huefte leicht nach vorne druecken ohne dabei die Grundspannung im Ruecken zu verlieren. Maximal nach unten beugen. Gewicht so waehlen, dass 8 - 12 Wiederholungen moeglich sind. </br>\r\nVariante A: Nur 6 - 8 Wiederholungen und im Anschluss 4 - 6 Hockspruenge. </br>\r\nVariante B: Nur 6 -8 Wiederholungen und im Anschluss explosiver Antritt ueber ca. 10 Meter. </br>\r\nVariante C: Nur 6 - 8 Wiederholungen und im Anschluss 4 - 6 Hockspruenge mit explosivem Antritt ueber ca. 10 Meter.', 'https://player.vimeo.com/video/177060820', '', 'Kraft', 'Maximalkraft', 'kurz', 'medium', ''),
(8, 'Stange ausstoßen 1', 'Stange auf Schulterhoehe vor dem Koerper ausstoßen. </br>\r\nVariante A: Waehrend Stange ausgestoßen wird in doppelter Frequenz auf der Stelle huepfen. </br>\r\nVariante B: Stange schraeg nach oben ausstoßen. </br>\r\nVariante C: Mit Spruenge. </br>\r\nVariante D: Stange abwechseln nach vorne und nach oben ausstoßen. </br>\r\nVariante E: Mit Spruenge.', 'https://player.vimeo.com/video/177050804\r\n', '', 'Kraft', 'Kraftausdauer', 'kurz', 'einfach', ''),
(9, 'Liegestuetz 1', 'Positionierung ueber dem Kasten. Haende auf dem Kleinkasten. Untere Kante auf Hoehe Brustbein. Kontrolliert nach unten in den Liegestuetz gehen und nach oben abdruecken. </br>\r\nVariante: Liegestuetz Ruecklinks.', 'https://player.vimeo.com/video/177041041', '', 'Kraft', 'Kraftausdauer', 'kurz', 'einfach', ''),
(10, 'Liegestuetz 2', 'Fueße auf dem Kasten. Haende auf dem Boden. Stabiler Rumpf. Kontrolliert nach unten in Liegestuetz gehen und nach oben abdruecken. </br>\r\nVariante A: Ein Fuß auf dem Kasten. Der andere ist schwebend in der Luft. </br>\r\nVariante B: Ein Fuß auf dem Kasten. Der andere ist schwebend in der Luft und wird waehrend der Liegestuetz eingedreht.', 'https://player.vimeo.com/video/177046114\r\n', '', 'Kraft', 'Maximalkraft', 'kurz', 'medium', ''),
(11, 'Situps 1', 'Knie abwechselnd zur Brust führen, dabei Oberkörper anheben.\r\nVariante A: Oberkörper anheben, Ellbogen diagonal zum Knie fuehren.\r\nVariante B: Beine durchgestreckt lassen und zum Oberkörper bewegen, dabei unter dem Bein klatschen.', 'https://player.vimeo.com/video/176951806', '', 'Kraft', 'Kraftausdauer', 'kurz', 'einfach', '');

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
(4, 1),
(2, 1),
(1, 1),
(3, 17),
(4, 17),
(1, 2),
(8, 2),
(1, 2),
(2, 17),
(3, 18),
(4, 18);

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
(2, 'Ann-Kathrin', 'Domhan', 'a.k.domhan@gmail.com', 'anni', 'katzen', 2, 'Doggenriedstraße 5', 'Weingarten', '07514674', '0152556677', '', 'TW', '15.06.1234'),
(3, 'Corinna', 'Blersch', 'keineahnung@live.com', 'Cori', 'blondi', 2, 'Bergstr 21', 'Baienfurt', '07510000', '0172345678', 'profilbilder/profilbild_spieler01.jpg', 'LA', '11.11.1911'),
(4, 'Michael', 'Ohnename', 'm.o@web.de', 'michi', 'michi', 2, 'Hungerstr. 17', 'Baindt', '07516564316', '0172656945', 'profilbilder/bild_mo.jpg', 'RA', '23.01.1990'),
(5, 'Stephan', 'Burkowski', 'burksteph@googlemail.com', 'sb1234', 'kardoffelsalad', 1, NULL, NULL, NULL, NULL, '', 'K', NULL),
(6, 'Gesa', 'Langhammer', 'asdfasdf@asdf.de', 'gesi', 'abcd', 2, 'Straßenstr. 3', 'Stadt', NULL, NULL, '', 'K', '31.34.1990');

--
-- Indizes der exportierten Tabellen
--

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
-- AUTO_INCREMENT für Tabelle `hilfsmittel`
--
ALTER TABLE `hilfsmittel`
  MODIFY `HilfsmittelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `mannschaften`
--
ALTER TABLE `mannschaften`
  MODIFY `MannschaftsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `rolle`
--
ALTER TABLE `rolle`
  MODIFY `RollenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `training`
--
ALTER TABLE `training`
  MODIFY `TrainingsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  MODIFY `UebungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `NutzerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
