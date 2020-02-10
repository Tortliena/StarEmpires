-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 10 fév. 2020 à 06:58
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
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `afaire`
--

INSERT INTO `afaire` (`idafaire`, `texteafaire`, `priorite`) VALUES
(313, 'Vaisseau avec ordre : Mettre une alerte', 'petittrucplustard'),
(315, 'Créer débris particuliers après combats contre vaisseau alien', 'encours'),
(205, 'Sur la carte, mettre en évidence les endroits accessibles ?', 'grosseetapeplustard'),
(17, 'Gestion de crise économique (rétrograder travailleurs ?)', 'grosseetapeplustard'),
(307, 'Affichage carte : Afficher vaisseau ennemis', 'petittrucrapide'),
(264, 'Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination', 'petittrucplustard'),
(22, 'Ajouter sécurité sur les champs entrés par les utilisateurs.', 'lancementsite'),
(23, 'Passer par http://validator.w3.org', 'lancementsite'),
(24, 'Faire le CRON', 'lancementsite'),
(25, 'Faire de la compression : http://php-minify.com/#', 'lancementsite'),
(276, 'Rénovation : Afficher les rénovations en cours.', 'petittrucrapide'),
(316, 'Faire design automatiques.', 'grosetapesouspeu'),
(314, 'Creer débris après combat. ', 'grosetapesouspeu');

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
(3, 3, 5, 1, 5, 6),
(4, 2, 3, 1, 3, 8);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `planete`
--

INSERT INTO `planete` (`idplanete`, `xplanete`, `yplanete`, `universplanete`) VALUES
(1, 3, 3, 1),
(2, 4, 2, 1),
(3, 2, 4, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tour`
--

INSERT INTO `tour` (`id`, `datetour`, `resume`) VALUES
(1, '2020-02-09 18:37:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(2, '2020-02-09 18:38:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(3, '2020-02-09 18:39:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(4, '2020-02-09 18:39:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(5, '2020-02-09 18:39:34', NULL),
(6, '2020-02-09 18:58:54', NULL),
(7, '2020-02-09 19:00:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(8, '2020-02-09 19:00:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(9, '2020-02-09 19:00:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(10, '2020-02-09 19:00:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(11, '2020-02-09 19:00:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(12, '2020-02-09 19:00:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(13, '2020-02-09 19:02:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(14, '2020-02-09 19:03:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(15, '2020-02-09 19:05:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(16, '2020-02-09 19:05:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(17, '2020-02-09 19:05:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(18, '2020-02-09 19:05:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(19, '2020-02-09 19:05:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(20, '2020-02-09 19:05:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(21, '2020-02-09 19:05:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(22, '2020-02-09 19:06:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(23, '2020-02-09 19:06:25', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(24, '2020-02-09 19:08:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(25, '2020-02-09 19:09:09', NULL),
(26, '2020-02-09 19:09:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(27, '2020-02-09 19:10:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(28, '2020-02-09 19:11:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(29, '2020-02-09 19:11:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(30, '2020-02-09 19:11:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(31, '2020-02-09 19:11:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(32, '2020-02-09 19:12:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(33, '2020-02-09 19:12:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(34, '2020-02-09 19:13:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(35, '2020-02-09 19:14:25', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(36, '2020-02-09 19:14:33', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(37, '2020-02-09 19:14:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(38, '2020-02-09 19:15:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(39, '2020-02-09 19:15:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(40, '2020-02-09 19:15:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(41, '2020-02-09 19:15:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(42, '2020-02-09 19:15:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(43, '2020-02-09 19:15:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(44, '2020-02-09 19:15:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(45, '2020-02-09 19:15:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(46, '2020-02-09 19:15:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(47, '2020-02-09 19:15:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(48, '2020-02-09 19:16:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(49, '2020-02-09 19:16:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(50, '2020-02-09 19:16:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(51, '2020-02-09 19:16:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(52, '2020-02-09 19:16:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(53, '2020-02-09 19:16:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(54, '2020-02-09 19:16:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(55, '2020-02-09 19:17:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(56, '2020-02-09 19:17:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(57, '2020-02-09 19:17:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(58, '2020-02-09 19:17:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(59, '2020-02-09 19:17:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(60, '2020-02-09 19:17:43', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(61, '2020-02-09 19:17:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(62, '2020-02-09 19:17:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(63, '2020-02-09 19:17:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(64, '2020-02-09 19:18:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(65, '2020-02-09 19:18:33', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(66, '2020-02-09 19:18:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(67, '2020-02-09 19:18:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(68, '2020-02-09 19:19:04', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(69, '2020-02-09 19:19:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(70, '2020-02-09 19:19:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(71, '2020-02-09 19:19:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(72, '2020-02-09 19:19:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(73, '2020-02-09 19:19:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(74, '2020-02-09 19:19:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(75, '2020-02-09 19:19:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(76, '2020-02-09 19:19:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(77, '2020-02-09 19:20:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(78, '2020-02-09 19:20:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(79, '2020-02-09 19:20:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(80, '2020-02-09 19:20:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(81, '2020-02-09 19:20:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(82, '2020-02-09 19:20:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(83, '2020-02-09 19:20:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(84, '2020-02-09 19:20:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(85, '2020-02-09 19:20:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(86, '2020-02-09 19:20:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(87, '2020-02-09 19:20:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(88, '2020-02-09 19:20:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(89, '2020-02-09 19:20:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(90, '2020-02-09 19:20:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(91, '2020-02-09 19:20:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(92, '2020-02-09 19:20:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(93, '2020-02-09 19:20:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(94, '2020-02-09 19:20:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(95, '2020-02-09 19:20:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(96, '2020-02-09 19:21:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(97, '2020-02-09 19:21:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(98, '2020-02-09 19:21:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(99, '2020-02-09 19:21:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(100, '2020-02-09 19:21:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(101, '2020-02-09 19:21:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(102, '2020-02-09 19:22:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(103, '2020-02-09 19:22:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(104, '2020-02-09 19:22:10', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(105, '2020-02-09 19:22:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(106, '2020-02-09 19:22:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(107, '2020-02-09 19:22:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(108, '2020-02-09 19:22:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(109, '2020-02-09 19:22:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(110, '2020-02-09 19:22:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(111, '2020-02-09 19:22:49', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(112, '2020-02-09 19:22:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(113, '2020-02-09 19:22:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(114, '2020-02-09 19:22:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(115, '2020-02-09 19:23:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(116, '2020-02-09 19:23:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(117, '2020-02-09 19:23:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(118, '2020-02-09 19:23:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(119, '2020-02-09 19:23:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(120, '2020-02-09 19:23:43', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(121, '2020-02-09 19:23:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(122, '2020-02-09 19:24:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(123, '2020-02-09 19:24:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(124, '2020-02-09 19:24:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(125, '2020-02-09 19:24:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(126, '2020-02-09 19:24:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(127, '2020-02-09 19:25:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(128, '2020-02-09 19:25:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(129, '2020-02-09 19:25:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(130, '2020-02-09 19:25:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(131, '2020-02-09 19:25:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(132, '2020-02-09 19:25:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(133, '2020-02-09 19:25:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(134, '2020-02-09 19:25:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(135, '2020-02-09 19:25:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(136, '2020-02-09 19:25:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(137, '2020-02-09 19:26:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(138, '2020-02-09 19:26:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(139, '2020-02-09 19:26:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(140, '2020-02-09 19:27:26', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(141, '2020-02-09 19:27:43', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(142, '2020-02-09 19:28:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(143, '2020-02-09 19:29:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(144, '2020-02-09 19:30:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(145, '2020-02-09 20:50:01', NULL),
(146, '2020-02-09 20:55:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(147, '2020-02-09 21:22:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(148, '2020-02-09 21:22:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(149, '2020-02-09 21:22:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(150, '2020-02-09 21:22:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(151, '2020-02-09 21:22:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(152, '2020-02-09 21:23:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(153, '2020-02-09 21:23:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(154, '2020-02-09 21:23:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(155, '2020-02-09 21:23:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(156, '2020-02-09 21:23:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(157, '2020-02-09 21:23:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(158, '2020-02-09 21:23:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(159, '2020-02-09 21:23:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(160, '2020-02-09 21:23:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(161, '2020-02-09 21:23:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(162, '2020-02-09 21:24:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(163, '2020-02-09 22:15:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
