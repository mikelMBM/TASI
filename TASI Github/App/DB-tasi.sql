-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Dez 2018 um 14:31
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
-- Datenbank: `tasidaten`
--

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
(100, 'Medizinball Wand 1 beidbeinig', 'Beidbeinig ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand werfen.\r\nVariante A: Linkes bzw. rechtes Bein nach vorne positionieren.\r\nVariante B: Beinwechsel nach jedem Wurf.', 'https://player.vimeo.com/video/177053507\r\n', '', 'Kraft', 'Wurfkraft', 'kurz', 'einfach', ''),
(101, 'Medizinball Wand 2 einbeinig', 'Ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand werfen.\r\nLinkes bzw. rechtes Bein nach vorne positionieren.\r\n', 'https://player.vimeo.com/video/177053507', '', 'Kraft', 'Wurfkraft', 'kurz', 'einfach', ''),
(102, 'Medizinball Wand 3 Bein wechse', 'Ca 2 - 5 Meter vor der Wand stehen. Medizinball über Kopf mit maximalem Krafteinsatz gegen die Wand \r\nLinkes bzw. rechtes Bein nach vorne positionieren.\r\nBeinwechsel nach jedem Wurf.', 'https://player.vimeo.com/video/177053507', '', 'Kraft', 'Wurfkraft', 'kurz', 'einfach', ''),
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

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  ADD PRIMARY KEY (`UebungsID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  MODIFY `UebungsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
