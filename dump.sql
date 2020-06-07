-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 08 Juin 2020 à 01:25
-- Version du serveur :  5.7.30-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ecl_mob_targetdeuzy`
--

DELIMITER $$
--
-- Procédures
--
CREATE PROCEDURE `getEntryIndicatorsValues` (IN `entryId` INT)  NO SQL
SELECT indicators.id as indicatorId, indicators.name as indicatorName, indicators.type as indicatorType, entries_values.value

FROM entries_values

INNER JOIN indicators ON indicators.id = entries_values.indicatorId

WHERE entries_values.entryId = entryId$$

CREATE PROCEDURE `getNumericIndicatorEntryOccurences` (IN `indicatorId` INT)  NO SQL
SELECT entries.date, entries_values.value
FROM entries_values

INNER JOIN entries ON entries.id = entries_values.entryId
INNER JOIN indicators ON indicators.id = indicatorId

WHERE entries_values.indicatorId = indicatorId AND indicators.deleted=0
ORDER BY entries.date ASC$$

CREATE PROCEDURE `getUserEntriesByDate` (IN `date` DATE, IN `userId` INT)  NO SQL
SELECT entries.*, spaces.name as spaceName

FROM entries

INNER JOIN spaces on entries.spaceId = spaces.id

WHERE spaces.userId = userId AND entries.date=date$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `spaceId` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entries`
--

INSERT INTO `entries` (`id`, `timestamp`, `spaceId`, `date`) VALUES
(87, '2020-06-05 23:23:40', 26, '2020-06-05'),
(86, '2020-06-05 23:23:32', 26, '2020-06-05'),
(85, '2020-06-05 21:12:37', 32, '2020-05-05'),
(84, '2020-06-05 21:09:43', 31, '2020-06-05'),
(83, '2020-06-05 21:08:14', 31, '2020-03-05'),
(82, '2020-06-05 18:46:22', 29, '2020-06-05'),
(81, '2020-06-05 17:23:17', 29, '2020-06-03'),
(80, '2020-06-05 15:43:24', 28, '2020-06-05'),
(79, '2020-06-03 00:20:16', 26, '2020-06-03'),
(78, '2020-06-02 08:19:05', 28, '2020-06-01'),
(77, '2020-06-02 08:18:27', 28, '2020-06-02'),
(76, '2020-06-02 06:57:03', 27, '2020-06-02'),
(75, '2020-06-01 20:48:03', 26, '2020-06-01'),
(74, '2020-06-01 19:51:06', 26, '2020-03-01'),
(73, '2020-06-01 19:51:00', 26, '2020-03-01'),
(72, '2020-06-01 19:50:48', 26, '2018-02-01'),
(71, '2020-06-01 19:30:18', 26, '2020-04-01'),
(70, '2020-06-01 19:30:11', 26, '2020-03-01'),
(69, '2020-06-01 17:47:16', 1, '2020-06-01'),
(68, '2020-06-01 17:46:55', 1, '2020-06-01'),
(67, '2020-06-01 17:34:44', 24, '2020-06-01'),
(66, '2020-06-01 17:34:40', 24, '2020-06-01'),
(65, '2020-06-01 17:34:32', 24, '2020-06-01'),
(64, '2020-06-01 17:34:25', 24, '2020-06-01'),
(63, '2020-06-01 17:34:18', 24, '2020-06-01'),
(62, '2020-06-01 16:48:07', 25, '2020-04-01'),
(61, '2020-06-01 16:47:59', 25, '2020-05-01'),
(60, '2020-06-01 16:44:18', 1, '2020-06-01'),
(59, '2020-06-01 16:37:11', 22, '2020-06-01'),
(58, '2020-06-01 16:16:38', 2, '2020-02-01'),
(57, '2020-06-01 16:15:41', 2, '2020-04-01'),
(56, '2020-06-01 16:14:13', 2, '2020-06-01'),
(55, '2020-06-01 16:13:40', 2, '2020-06-01'),
(54, '2020-06-01 16:04:33', 2, '2020-05-06'),
(53, '2020-06-01 16:04:16', 2, '2020-04-05'),
(52, '2020-06-01 16:03:37', 2, '2020-03-01'),
(88, '2020-06-05 23:23:48', 26, '2020-06-05'),
(89, '2020-06-05 23:24:09', 26, '2020-05-05'),
(90, '2020-06-05 23:24:19', 26, '2020-01-05'),
(91, '2020-06-05 23:28:40', 26, '2020-06-05'),
(92, '2020-06-05 23:31:11', 34, '2020-06-05'),
(93, '2020-06-05 23:31:21', 34, '2020-05-05'),
(94, '2020-06-05 23:31:26', 34, '2020-06-05'),
(95, '2020-06-05 23:31:34', 34, '2020-06-05'),
(96, '2020-06-05 23:31:41', 34, '2020-06-05'),
(97, '2020-06-05 23:31:53', 34, '2020-06-05'),
(98, '2020-06-05 23:31:57', 34, '2020-06-05'),
(99, '2020-06-05 23:39:44', 26, '2020-06-03'),
(100, '2020-06-06 10:43:23', 33, '2020-06-06'),
(101, '2020-06-06 10:43:36', 33, '2020-06-04'),
(102, '2020-06-06 10:43:46', 33, '2020-06-04'),
(103, '2020-06-06 10:51:12', 35, '2020-06-06'),
(104, '2020-06-06 17:00:56', 36, '2020-06-03'),
(105, '2020-06-06 17:02:24', 36, '2020-06-04'),
(106, '2020-06-06 17:02:43', 36, '2020-06-05'),
(107, '2020-06-06 20:31:21', 38, '2020-06-03'),
(108, '2020-06-06 20:32:17', 38, '2020-06-04'),
(109, '2020-06-06 20:32:34', 38, '2020-06-05'),
(110, '2020-06-06 20:46:15', 44, '2020-06-03'),
(111, '2020-06-06 20:46:56', 44, '2020-06-04'),
(112, '2020-06-06 20:47:10', 44, '2020-06-05'),
(113, '2020-06-06 20:50:05', 45, '2020-06-03'),
(114, '2020-06-06 20:52:52', 46, '2020-06-04'),
(115, '2020-06-06 20:53:47', 46, '2020-06-02'),
(116, '2020-06-06 20:54:01', 46, '2020-06-06'),
(117, '2020-06-07 10:45:20', 47, '2020-06-07'),
(118, '2020-06-07 10:45:56', 47, '2020-06-07');

--
-- Déclencheurs `entries`
--
DELIMITER $$
CREATE TRIGGER `delete_entries_values` AFTER DELETE ON `entries` FOR EACH ROW DELETE FROM entries_values where entryId=OLD.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_lastEntry_oninsert` AFTER INSERT ON `entries` FOR EACH ROW UPDATE spaces set lastEntry=(SELECT MAX(date) FROM entries WHERE spaceId=NEW.spaceId) WHERE id=NEW.spaceId
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_lastEntry_onupdate` AFTER UPDATE ON `entries` FOR EACH ROW UPDATE spaces set lastEntry=(SELECT MAX(date) FROM entries WHERE spaceId=NEW.spaceId) WHERE id=NEW.spaceId
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `entries_values`
--

CREATE TABLE `entries_values` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `indicatorId` int(11) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entries_values`
--

INSERT INTO `entries_values` (`id`, `entryId`, `indicatorId`, `value`) VALUES
(62, 52, 20, 'Oui'),
(63, 52, 19, 'Ok'),
(64, 52, 24, '25'),
(65, 53, 24, '10'),
(66, 53, 19, 'ggg'),
(67, 53, 20, 'Oui'),
(68, 54, 24, '35'),
(69, 54, 20, 'Oui'),
(70, 54, 19, 'ee'),
(71, 55, 19, 'ee'),
(72, 55, 20, 'Oui'),
(73, 55, 24, '14'),
(74, 56, 24, '555'),
(75, 56, 20, 'Oui'),
(76, 56, 19, 'oog'),
(77, 57, 24, '22'),
(78, 57, 20, 'Oui'),
(79, 57, 19, 'tgj'),
(80, 58, 19, 'hh'),
(81, 58, 20, 'Oui'),
(82, 58, 24, '222'),
(83, 59, 23, 'ggg'),
(84, 59, 22, 'Oui'),
(85, 60, 16, 'Oui'),
(86, 60, 17, 'gg'),
(87, 60, 18, 'ggg'),
(88, 60, 21, 'Oui'),
(89, 61, 25, '222'),
(90, 62, 25, '555'),
(91, 63, 27, 'Non'),
(92, 64, 27, 'Oui'),
(93, 65, 27, 'Oui'),
(94, 66, 27, 'Oui'),
(95, 67, 27, 'Non'),
(96, 68, 18, 'gggg'),
(97, 68, 17, 'gg'),
(98, 68, 21, 'Non'),
(99, 68, 16, 'Non'),
(100, 69, 16, 'Non'),
(101, 69, 18, 'ff'),
(102, 69, 17, 'g'),
(103, 69, 21, 'Non'),
(104, 70, 28, '6'),
(105, 71, 28, '3'),
(106, 72, 29, 'Oui'),
(107, 72, 28, '5'),
(108, 73, 29, 'Non'),
(109, 73, 28, '2'),
(110, 74, 28, '5'),
(111, 74, 29, 'Oui'),
(112, 75, 29, 'Oui'),
(113, 75, 30, 'Non satisfait...'),
(114, 75, 28, '2'),
(115, 75, 31, 'Oui'),
(116, 77, 36, 'Non'),
(117, 77, 35, '3'),
(118, 77, 37, 'Good'),
(119, 78, 36, 'Non'),
(120, 78, 37, 'Moyen'),
(121, 78, 35, '4'),
(122, 79, 28, '0'),
(123, 79, 29, 'Non'),
(124, 79, 31, 'Oui'),
(125, 79, 32, '0'),
(126, 79, 30, 'Parfait'),
(127, 80, 36, 'Non'),
(128, 80, 35, '5'),
(129, 80, 37, 'gioo'),
(130, 81, 38, '25'),
(131, 82, 38, '100'),
(132, 83, 40, 'Non '),
(133, 83, 39, '125'),
(134, 83, 41, 'Oui'),
(135, 84, 41, 'Oui'),
(136, 84, 40, 'Non non non'),
(137, 84, 39, '357181673480467'),
(138, 85, 42, 'contente'),
(139, 86, 30, 'd'),
(140, 86, 31, 'Oui'),
(141, 86, 43, '2'),
(142, 87, 30, 'd'),
(143, 87, 31, 'Oui'),
(144, 87, 43, '7'),
(145, 88, 30, 'd'),
(146, 88, 43, '2'),
(147, 88, 31, 'Oui'),
(148, 89, 31, 'Oui'),
(149, 89, 43, '2'),
(150, 89, 30, 'g'),
(151, 90, 31, 'Oui'),
(152, 90, 43, '7'),
(153, 90, 30, 't'),
(154, 91, 31, 'Non'),
(155, 91, 30, 'y'),
(156, 91, 43, '6'),
(157, 92, 44, 'Bien'),
(158, 93, 44, 'RAS'),
(159, 94, 44, 'RAS'),
(160, 95, 44, 'Moyen'),
(161, 96, 44, 'Bof'),
(162, 97, 44, 'Moyen'),
(163, 98, 44, 'RAS'),
(164, 99, 43, '5'),
(165, 99, 30, 'Bien'),
(166, 99, 31, 'Oui'),
(167, 100, 46, 'Non'),
(168, 101, 46, 'Oui'),
(169, 102, 46, 'Oui'),
(170, 103, 47, 'henkf'),
(171, 104, 50, '4'),
(172, 104, 49, 'bien'),
(173, 104, 48, 'Non'),
(174, 105, 50, '2'),
(175, 105, 49, 'mal'),
(176, 105, 48, 'Oui'),
(177, 106, 50, '6'),
(178, 106, 48, 'Oui'),
(179, 106, 49, 'bien'),
(180, 107, 55, 'Oui'),
(181, 107, 52, 'Non'),
(182, 107, 53, '0'),
(183, 107, 54, 'Bien'),
(184, 108, 52, 'Oui'),
(185, 108, 55, 'Non'),
(186, 108, 53, '4'),
(187, 108, 54, 'Bien'),
(188, 109, 52, 'Oui'),
(189, 109, 53, '7'),
(190, 109, 55, 'Oui'),
(191, 109, 54, 'Mal'),
(192, 110, 61, '5'),
(193, 110, 60, 'Oui'),
(194, 110, 62, 'Bien'),
(195, 111, 60, 'Non'),
(196, 111, 62, 'Mal'),
(197, 111, 61, '0'),
(198, 112, 60, 'Oui'),
(199, 112, 61, '6'),
(200, 112, 62, 'Bien'),
(201, 113, 63, 'Oui'),
(202, 113, 64, '4'),
(203, 113, 66, 'Non'),
(204, 113, 65, 'Mal'),
(205, 114, 70, 'Oui'),
(206, 114, 68, '4'),
(207, 114, 67, 'Oui'),
(208, 114, 69, 'Mal'),
(209, 115, 67, 'Oui'),
(210, 115, 68, '8'),
(211, 115, 70, 'Non'),
(212, 115, 69, 'Mal'),
(213, 116, 69, 'Bien'),
(214, 116, 68, '0'),
(215, 116, 67, 'Non'),
(216, 116, 70, 'Oui'),
(217, 118, 71, 'trop');

-- --------------------------------------------------------

--
-- Structure de la table `indicators`
--

CREATE TABLE `indicators` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` char(10) NOT NULL,
  `spaceId` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `indicators`
--

INSERT INTO `indicators` (`id`, `name`, `type`, `spaceId`, `deleted`) VALUES
(17, 'Ai-je fumé aujourd\'hui ?', 'Nombre', 1, 1),
(16, 'Ai-je eu envie de fumer aujourd\'hui ?', 'Booléen', 1, 1),
(24, 'Cerise', 'Numérique', 2, 1),
(23, 'popi', 'Nombre', 22, 0),
(22, 'yuyy', 'Booléen', 22, 0),
(21, 'Test', 'Booléen', 1, 1),
(20, 'Tomate', 'Booléen', 2, 0),
(19, 'Test', 'Texte', 2, 0),
(18, 'Mon humeur du jour ?', 'Texte', 1, 0),
(25, 'Jeff vais bien	', 'Numérique', 25, 0),
(26, 'for', 'Numérique', 2, 0),
(27, 'Tes', 'Booléen', 24, 0),
(28, 'Combien de cigarettes ai-je fumé ?', 'Numérique', 26, 1),
(29, 'Ai-je fumé aujourd\'hui ?', 'Booléen', 26, 1),
(30, 'Commentaire sur mon humeur du jour', 'Texte', 26, 0),
(31, 'Ai-je été en manque ?', 'Booléen', 26, 0),
(32, 'Combien de cigarettes ai-je fumé ?', 'Numérique', 26, 1),
(33, 'Nombre de plats', 'Numérique', 27, 0),
(34, 'Ai-je mangé des sucreries ?', 'Booléen', 27, 0),
(35, 'A quelle heure ai-je dormi aujourd\'hui ?', 'Numérique', 28, 1),
(36, 'Ai-je EU one insomnie ?', 'Booléen', 28, 1),
(37, 'Mon humeur', 'Texte', 28, 1),
(38, 'Poids', 'Numérique', 29, 0),
(39, 'bg', 'Numérique', 31, 0),
(40, 'Pas bg', 'Texte', 31, 0),
(41, 'la7eus', 'Booléen', 31, 0),
(42, 'humeur', 'Texte', 32, 0),
(43, 'Combien de cigarettes ai-je fumé aujourd\'hui ?', 'Numérique', 26, 0),
(44, 'test', 'Texte', 34, 1),
(45, 'test', 'Numérique', 33, 1),
(46, 'all fois ?', 'Booléen', 33, 0),
(47, 'ok', 'Texte', 35, 0),
(48, 'Ai-je fumé aujourd\'hui ?', 'Booléen', 36, 0),
(49, 'Mon humeur du jour', 'Texte', 36, 0),
(50, 'Combien de cigarettes ai-je fumé aujourd\'hui ?', 'Numérique', 36, 0),
(51, 'Testeee', 'Booléen', 36, 1),
(52, 'Ai-je fumé aujourd\'hui ?', 'Booléen', 38, 0),
(53, 'Combien de cigarettes ai-je fumé aujourd\'hui ?', 'Numérique', 38, 0),
(54, 'Mon humeur du jour', 'Texte', 38, 0),
(55, 'Ai-je été en manque ?', 'Booléen', 38, 0),
(56, 'Test', 'Numérique', 38, 0),
(57, 'Ai-je fumé aujourd\'hui ?', 'Booléen', 39, 0),
(58, 'Combien de cigarettes ai-je fumé aujourd\'hui ?', 'Numérique', 39, 0),
(59, 'Mon humeur du jour ?', 'Texte', 39, 0),
(60, 'Ai-je fumé aujourd\'hui ?', 'Booléen', 44, 0),
(61, 'Combien de cigarettes ai-je fumé aujourd\'hui ?', 'Numérique', 44, 0),
(62, 'Commentaire sur mon humeur du jour ?', 'Texte', 44, 0),
(63, 'Ai-je fumé aujourd\'hui ? t', 'Booléen', 45, 0),
(64, 'Combien de cigarettes ai-je fumé ?', 'Numérique', 45, 0),
(65, 'Commentaire sur mon humeur du jour', 'Texte', 45, 0),
(66, 'Ai-je été en manque ?', 'Booléen', 45, 0),
(67, 'Ai-je fumé aujourd\'hui ?', 'Booléen', 46, 0),
(68, 'Combien de cigarettes ai-je fumé ?', 'Numérique', 46, 0),
(69, 'Commentaire sur mon humeur du jour', 'Texte', 46, 0),
(70, 'Ai-je été en manque ?', 'Booléen', 46, 0),
(71, 'mon texte', 'Texte', 47, 0);

-- --------------------------------------------------------

--
-- Structure de la table `spaces`
--

CREATE TABLE `spaces` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `userId` int(11) NOT NULL,
  `lastEntry` date DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `spaces`
--

INSERT INTO `spaces` (`id`, `name`, `userId`, `lastEntry`, `deleted`) VALUES
(1, 'J\'arrête la cigarette', 1, '2020-06-01', 1),
(2, 'Pompes Tractions', 1, '2020-06-01', 1),
(22, 'Pop', 1, '2020-06-01', 1),
(23, 'Ayman', 1, NULL, 1),
(24, 'Omans', 1, '2020-06-01', 1),
(25, 'toto', 1, '2020-05-01', 1),
(26, 'Finie la cigarette', 1, '2020-06-05', 0),
(27, 'Perdre du poids', 1, '2020-06-02', 0),
(28, 'Je veux regler mon sommeil', 1, '2020-06-05', 0),
(29, 'Régime', 2, '2020-06-05', 1),
(30, 'Régime', 3, NULL, 1),
(31, 'ousous', 4, '2020-06-05', 0),
(32, 'Mon moral', 5, '2020-05-05', 0),
(33, 'Finie la cigarette', 2, '2020-06-06', 1),
(34, 'ff', 1, '2020-06-05', 0),
(35, 'dodo', 1, '2020-06-06', 0),
(36, 'Arrêter la cigarette', 7, '2020-06-05', 0),
(37, 'Test', 7, NULL, 0),
(38, 'J\'arrete de fumer', 10, '2020-06-05', 1),
(39, 'Finie la cigarette', 10, NULL, 1),
(40, 'Finie la cigarette !', 10, NULL, 1),
(41, 'J\'arrete la cigarette', 10, NULL, 1),
(42, 'Finie la cigarette !', 10, NULL, 1),
(43, 'Finie la cigarette !', 10, NULL, 1),
(44, 'Finie la cigarette !', 10, '2020-06-05', 1),
(45, 'Finie la cigarette !', 10, '2020-06-03', 1),
(46, 'Finie la cigarette !', 10, '2020-06-06', 0),
(47, 'journal', 12, '2020-06-07', 0);

--
-- Déclencheurs `spaces`
--
DELIMITER $$
CREATE TRIGGER `delete_indicators` AFTER DELETE ON `spaces` FOR EACH ROW DELETE FROM indicators WHERE spaceId = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` char(50) NOT NULL,
  `password` char(50) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'johndoe2', 'poiu', 'John', 'Doe'),
(2, 'inesos', 'poiu', 'Ines', 'Bouarourou'),
(3, 'jd', 'poiu', 'John', 'Doe'),
(4, 'zoudu62', 'rclens62', 'lerebeu', 'zouzou'),
(5, 'sarahlala', 'sarah', 'lala', 'lala'),
(6, 'ao', 'ao', 'oussama', 'ayman'),
(7, 'ouayman', 'poiu00', 'Ayman', 'Oussama'),
(8, 'johnd', 'poiu', 'John', 'Doe'),
(9, 'johndoe', 'poiu', 'John', 'Doe'),
(10, 'oayman', 'poiu', 'Ayman', 'Oussama'),
(11, 'pseudo', 'paul', 'paul', 'klak'),
(12, 'paul', 'paul', 'paul', 'klak');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entries_values`
--
ALTER TABLE `entries_values`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT pour la table `entries_values`
--
ALTER TABLE `entries_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
--
-- AUTO_INCREMENT pour la table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT pour la table `spaces`
--
ALTER TABLE `spaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
