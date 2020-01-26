-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 26 jan. 2020 à 18:23
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `autre`
--

-- --------------------------------------------------------

--
-- Structure de la table `afaire`
--

DROP TABLE IF EXISTS `afaire`;
CREATE TABLE IF NOT EXISTS `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `afaire`
--

INSERT INTO `afaire` (`idafaire`, `texteafaire`, `priorite`) VALUES
(126, 'events : faire quelques évents marrants', 'petittrucrapide'),
(215, 'Aller ligne 90 page chantier.', 'encours'),
(204, 'Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination', 'petittrucrapide'),
(205, 'Sur la carte, mettre en évidence les endroits accessibles ?', 'grosseetapeplustard'),
(160, ' Trouver comment afficher un message de la messagerie', 'grosseetapeplustard'),
(17, 'Gestion de crise économique (rétrograder travailleurs ?)', 'grosseetapeplustard'),
(16, 'Message au passage du tour utile ! (temps d\'exécution) (nombre de pop crées) ', 'grosseetapeplustard'),
(216, 'Corriger page hangars, chantier et le tour !!', 'encours'),
(22, 'Ajouter sécurité sur les champs entrés par les utilisateurs.', 'lancementsite'),
(23, 'Passer par http://validator.w3.org', 'lancementsite'),
(24, 'Faire le CRON', 'lancementsite'),
(25, 'Faire de la compression : http://php-minify.com/#', 'lancementsite'),
(75, 'Faire les images', 'grosseetapeplustard');

-- --------------------------------------------------------

--
-- Structure de la table `champsasteroides`
--

DROP TABLE IF EXISTS `champsasteroides`;
CREATE TABLE IF NOT EXISTS `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `champsasteroides`
--

INSERT INTO `champsasteroides` (`idasteroide`, `xaste`, `yaste`, `uniaste`, `quantite`, `typeitemsaste`) VALUES
(3, 3, 2, 2, 3, 6),
(4, 5, 3, 2, 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `planete`
--

DROP TABLE IF EXISTS `planete`;
CREATE TABLE IF NOT EXISTS `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `planete`
--

INSERT INTO `planete` (`idplanete`, `xplanete`, `yplanete`, `universplanete`) VALUES
(1, 3, 3, 1),
(2, 3, 4, 1),
(3, 3, 3, 2),
(4, 3, 3, 3),
(5, 3, 4, 2),
(6, 4, 3, 2),
(7, 3, 3, 4),
(8, 3, 3, 5),
(9, 3, 3, 6),
(10, 3, 3, 7),
(11, 3, 3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `tour`
--

DROP TABLE IF EXISTS `tour`;
CREATE TABLE IF NOT EXISTS `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tour`
--

INSERT INTO `tour` (`id`, `datetour`, `resume`) VALUES
(1, '2019-12-11 12:50:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(2, '2019-12-11 12:50:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(3, '2019-12-11 12:51:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(4, '2019-12-11 12:51:25', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(5, '2019-12-11 12:51:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(6, '2019-12-11 12:51:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(7, '2019-12-11 12:51:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(8, '2019-12-11 12:52:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(9, '2019-12-11 12:52:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(10, '2019-12-11 12:52:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(11, '2019-12-11 12:53:10', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(12, '2019-12-11 12:53:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(13, '2019-12-11 12:53:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(14, '2019-12-11 12:53:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(15, '2019-12-11 12:53:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(16, '2019-12-11 12:53:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(17, '2019-12-11 12:53:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(18, '2019-12-11 12:54:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(19, '2019-12-11 12:54:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(20, '2019-12-11 12:54:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(21, '2019-12-11 12:54:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(22, '2019-12-11 15:03:49', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(23, '2019-12-11 15:04:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(24, '2019-12-11 15:06:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(25, '2019-12-11 15:13:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(26, '2019-12-11 15:13:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(27, '2019-12-11 15:13:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(28, '2019-12-11 15:14:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(29, '2019-12-11 15:15:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(30, '2019-12-11 15:16:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(31, '2019-12-11 15:16:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(32, '2019-12-11 15:16:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(33, '2019-12-11 15:16:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(34, '2019-12-11 15:16:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(35, '2019-12-11 15:17:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(36, '2019-12-11 15:17:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(37, '2019-12-11 15:17:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(38, '2020-01-18 17:09:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(39, '2020-01-18 17:09:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(40, '2020-01-18 17:19:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(41, '2020-01-18 17:27:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(42, '2020-01-18 19:52:30', NULL),
(43, '2020-01-18 19:53:31', NULL),
(44, '2020-01-18 19:53:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(45, '2020-01-18 19:54:09', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(46, '2020-01-18 19:56:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(47, '2020-01-18 19:57:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(48, '2020-01-18 19:57:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(49, '2020-01-18 19:57:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(50, '2020-01-18 19:57:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(51, '2020-01-19 11:30:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(52, '2020-01-22 11:08:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(53, '2020-01-22 11:53:01', NULL),
(54, '2020-01-22 12:03:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(55, '2020-01-22 12:05:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(56, '2020-01-22 12:05:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(57, '2020-01-22 12:06:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(58, '2020-01-22 12:06:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(59, '2020-01-22 12:07:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(60, '2020-01-22 14:42:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(61, '2020-01-22 14:42:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(62, '2020-01-22 14:42:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(63, '2020-01-22 14:42:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(64, '2020-01-22 14:42:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(65, '2020-01-22 14:42:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(66, '2020-01-22 14:42:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(67, '2020-01-22 14:42:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(68, '2020-01-22 14:42:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(69, '2020-01-22 14:43:00', NULL),
(70, '2020-01-22 14:44:10', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(71, '2020-01-22 14:44:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(72, '2020-01-22 14:44:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(73, '2020-01-22 14:44:26', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(74, '2020-01-22 14:44:31', NULL),
(75, '2020-01-22 14:52:26', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(76, '2020-01-22 14:52:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(77, '2020-01-22 14:52:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(78, '2020-01-22 14:52:56', NULL),
(79, '2020-01-22 14:54:09', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(80, '2020-01-22 14:54:26', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(81, '2020-01-22 14:54:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(82, '2020-01-22 14:54:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(83, '2020-01-22 14:54:43', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(84, '2020-01-22 14:54:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(85, '2020-01-22 14:55:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(86, '2020-01-22 14:55:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(87, '2020-01-22 15:42:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(88, '2020-01-22 15:42:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(89, '2020-01-22 15:42:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(90, '2020-01-22 15:42:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(91, '2020-01-22 15:42:49', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(92, '2020-01-22 15:43:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(93, '2020-01-22 15:43:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(94, '2020-01-22 15:44:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(95, '2020-01-22 15:46:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(96, '2020-01-22 15:55:33', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(97, '2020-01-22 16:49:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(98, '2020-01-22 16:49:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(99, '2020-01-22 16:49:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(100, '2020-01-22 16:49:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(101, '2020-01-22 23:18:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(102, '2020-01-22 23:19:09', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(103, '2020-01-22 23:19:17', NULL),
(104, '2020-01-22 23:21:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(105, '2020-01-23 00:13:25', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(106, '2020-01-23 00:16:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(107, '2020-01-23 00:20:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(108, '2020-01-23 00:23:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(109, '2020-01-23 00:25:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(110, '2020-01-23 00:28:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(111, '2020-01-23 00:29:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(112, '2020-01-23 00:30:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(113, '2020-01-23 00:32:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(114, '2020-01-23 13:59:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(115, '2020-01-23 13:59:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(116, '2020-01-23 14:01:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(117, '2020-01-23 14:18:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(118, '2020-01-23 14:18:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(119, '2020-01-23 14:19:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(120, '2020-01-23 14:19:35', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(121, '2020-01-23 14:19:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(122, '2020-01-23 14:19:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(123, '2020-01-23 14:19:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(124, '2020-01-23 14:20:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(125, '2020-01-23 14:20:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(126, '2020-01-23 14:21:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(127, '2020-01-23 14:23:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(128, '2020-01-23 14:24:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(129, '2020-01-23 14:24:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(130, '2020-01-23 14:24:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(131, '2020-01-23 14:24:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(132, '2020-01-23 14:24:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(133, '2020-01-23 14:24:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(134, '2020-01-23 14:24:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(135, '2020-01-23 14:25:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(136, '2020-01-23 14:25:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(137, '2020-01-23 14:25:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(138, '2020-01-23 14:25:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(139, '2020-01-23 14:25:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(140, '2020-01-23 14:25:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(141, '2020-01-23 14:25:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(142, '2020-01-23 14:25:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(143, '2020-01-23 14:25:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(144, '2020-01-23 14:25:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(145, '2020-01-23 14:25:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(146, '2020-01-23 14:25:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(147, '2020-01-23 14:25:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(148, '2020-01-23 14:25:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(149, '2020-01-23 14:25:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(150, '2020-01-23 14:33:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(151, '2020-01-23 14:33:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(152, '2020-01-23 15:02:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(153, '2020-01-23 15:02:08', NULL),
(154, '2020-01-23 15:04:40', NULL),
(155, '2020-01-23 15:05:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(156, '2020-01-23 15:05:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(157, '2020-01-23 15:05:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(158, '2020-01-23 15:20:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(159, '2020-01-23 15:22:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(160, '2020-01-23 15:32:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(161, '2020-01-23 15:33:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(162, '2020-01-23 15:33:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(163, '2020-01-23 17:18:43', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(164, '2020-01-23 22:11:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(165, '2020-01-23 22:11:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(166, '2020-01-23 22:36:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(167, '2020-01-23 22:36:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(168, '2020-01-23 22:36:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(169, '2020-01-23 22:36:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(170, '2020-01-23 22:37:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(171, '2020-01-23 22:41:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(172, '2020-01-23 22:41:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(173, '2020-01-23 22:41:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(174, '2020-01-23 22:41:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(175, '2020-01-23 22:41:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(176, '2020-01-23 22:42:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(177, '2020-01-23 22:49:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(178, '2020-01-23 22:49:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(179, '2020-01-23 22:52:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(180, '2020-01-23 22:52:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(181, '2020-01-23 22:56:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(182, '2020-01-23 22:57:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(183, '2020-01-23 22:57:04', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(184, '2020-01-23 22:59:35', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(185, '2020-01-23 22:59:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(186, '2020-01-23 22:59:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(187, '2020-01-23 23:01:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(188, '2020-01-23 23:01:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(189, '2020-01-23 23:01:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(190, '2020-01-23 23:01:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(191, '2020-01-23 23:03:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(192, '2020-01-23 23:03:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(193, '2020-01-23 23:03:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(194, '2020-01-23 23:03:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(195, '2020-01-23 23:09:09', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(196, '2020-01-23 23:09:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(197, '2020-01-23 23:09:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(198, '2020-01-24 11:13:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(199, '2020-01-24 11:13:52', NULL),
(200, '2020-01-24 11:14:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(201, '2020-01-24 11:14:44', NULL),
(202, '2020-01-24 11:16:39', NULL),
(203, '2020-01-24 11:17:55', NULL),
(204, '2020-01-24 11:18:40', NULL),
(205, '2020-01-24 11:19:25', NULL),
(206, '2020-01-24 11:19:46', NULL),
(207, '2020-01-24 11:21:27', NULL),
(208, '2020-01-24 11:22:39', NULL),
(209, '2020-01-24 11:35:12', NULL),
(210, '2020-01-24 11:36:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(211, '2020-01-24 11:36:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(212, '2020-01-24 11:37:25', NULL),
(213, '2020-01-24 11:40:02', NULL),
(214, '2020-01-24 11:40:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(215, '2020-01-24 12:49:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(216, '2020-01-24 12:49:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(217, '2020-01-24 12:49:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(218, '2020-01-26 11:51:20', NULL),
(219, '2020-01-26 11:55:38', NULL),
(220, '2020-01-26 11:56:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(221, '2020-01-26 12:42:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(222, '2020-01-26 12:44:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(223, '2020-01-26 12:44:10', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(224, '2020-01-26 12:44:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(225, '2020-01-26 12:44:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(226, '2020-01-26 12:44:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(227, '2020-01-26 12:44:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(228, '2020-01-26 12:44:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(229, '2020-01-26 12:45:44', NULL),
(230, '2020-01-26 12:46:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(231, '2020-01-26 12:47:26', NULL),
(232, '2020-01-26 12:48:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(233, '2020-01-26 12:48:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(234, '2020-01-26 12:48:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(235, '2020-01-26 12:48:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(236, '2020-01-26 12:48:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(237, '2020-01-26 12:48:25', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(238, '2020-01-26 12:48:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop');
INSERT INTO `tour` (`id`, `datetour`, `resume`) VALUES
(239, '2020-01-26 12:48:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(240, '2020-01-26 12:48:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(241, '2020-01-26 12:48:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(242, '2020-01-26 12:51:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(243, '2020-01-26 12:51:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
