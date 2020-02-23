-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 25 fév. 2020 à 14:25
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
) ENGINE=MyISAM AUTO_INCREMENT=371 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `afaire`
--

INSERT INTO `afaire` (`idafaire`, `texteafaire`, `priorite`) VALUES
(346, 'Quand recherche se finie, mettre message avec le nom de la recherche et éventuellement faire un message personnalisé si étude', 'petittrucrapide'),
(335, 'Exporter base de données + importer base de données ', 'grosetapesouspeu'),
(370, 'Revoir les réparations : Faire en fonction prix vaisseau', 'petittrucrapide'),
(349, 'Gérer les conceptions dans les constructions.', 'grosetapesouspeu'),
(369, 'Changer ordre des constructions', 'petittrucrapide'),
(205, 'Sur la carte, mettre en évidence les endroits accessibles ?', 'grosseetapeplustard'),
(17, 'Gestion de crise économique (rétrograder travailleurs ?)', 'grosseetapeplustard'),
(307, 'Affichage carte : Afficher vaisseau ennemis', 'petittrucrapide'),
(264, 'Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination', 'petittrucplustard'),
(22, 'Ajouter sécurité sur les champs entrés par les utilisateurs.', 'lancementsite'),
(23, 'Passer par http://validator.w3.org', 'lancementsite'),
(24, 'Faire le CRON', 'lancementsite'),
(25, 'Faire de la compression : http://php-minify.com/#', 'lancementsite'),
(276, 'Rénovation : Afficher les rénovations en cours.', 'petittrucrapide'),
(360, '1ere dimension', 'grosetapesouspeu'),
(361, 'Bug : Parfois recherche avec même id ! Dou cela vient ?!', 'encours'),
(364, 'Bug : Si 2 rénovations en cours et qu\'un seul composant en stock alors on arrive quand même a rénover les 2 vaisseaux.', 'encours');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `champsasteroides`
--

INSERT INTO `champsasteroides` (`idasteroide`, `xaste`, `yaste`, `uniaste`, `quantite`, `typeitemsaste`) VALUES
(5, 5, 4, 1, 3, 6),
(6, 5, 4, 1, 5, 8),
(11, 4, 3, 1, 10, 6),
(12, 4, 5, 1, 10, 6),
(10, 4, 1, 1, 3, 8);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `planete`
--

INSERT INTO `planete` (`idplanete`, `xplanete`, `yplanete`, `universplanete`) VALUES
(1, 3, 3, 1),
(2, 4, 2, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tour`
--

INSERT INTO `tour` (`id`, `datetour`, `resume`) VALUES
(1, '2020-02-20 12:24:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(2, '2020-02-20 12:24:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(3, '2020-02-20 12:24:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(4, '2020-02-20 12:24:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(5, '2020-02-20 13:26:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(6, '2020-02-20 13:27:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(7, '2020-02-20 13:27:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(8, '2020-02-20 13:27:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(9, '2020-02-20 13:27:09', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(10, '2020-02-20 13:27:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(11, '2020-02-20 13:28:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(12, '2020-02-20 13:28:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(13, '2020-02-20 13:29:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(14, '2020-02-20 13:29:11', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(15, '2020-02-20 13:29:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(16, '2020-02-20 13:29:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(17, '2020-02-20 13:30:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(18, '2020-02-20 13:31:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(19, '2020-02-20 13:31:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(20, '2020-02-20 13:31:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(21, '2020-02-20 13:33:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(22, '2020-02-20 13:33:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(23, '2020-02-20 13:33:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(24, '2020-02-20 13:34:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(25, '2020-02-20 13:34:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(26, '2020-02-20 13:35:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(27, '2020-02-20 13:38:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(28, '2020-02-20 13:38:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(29, '2020-02-20 13:38:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(30, '2020-02-20 13:38:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(31, '2020-02-20 13:40:33', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(32, '2020-02-20 13:44:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(33, '2020-02-20 13:47:07', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(34, '2020-02-20 13:47:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(35, '2020-02-20 13:48:26', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(36, '2020-02-20 13:48:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(37, '2020-02-20 13:50:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(38, '2020-02-20 13:50:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(39, '2020-02-20 13:50:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(40, '2020-02-20 13:51:10', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(41, '2020-02-20 13:52:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(42, '2020-02-20 13:52:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(43, '2020-02-20 13:52:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(44, '2020-02-20 13:53:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(45, '2020-02-20 13:53:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(46, '2020-02-20 13:54:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(47, '2020-02-20 13:55:43', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(48, '2020-02-20 13:55:49', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(49, '2020-02-20 13:56:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(50, '2020-02-20 13:59:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(51, '2020-02-20 13:59:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(52, '2020-02-20 14:01:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(53, '2020-02-20 14:02:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(54, '2020-02-20 14:02:35', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(55, '2020-02-20 14:02:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(56, '2020-02-20 14:03:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(57, '2020-02-20 14:03:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(58, '2020-02-20 14:03:36', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(59, '2020-02-20 14:03:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(60, '2020-02-20 14:06:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(61, '2020-02-20 14:06:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(62, '2020-02-20 14:10:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(63, '2020-02-20 14:10:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(64, '2020-02-20 14:11:30', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(65, '2020-02-20 14:11:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(66, '2020-02-20 14:11:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(67, '2020-02-20 14:13:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(68, '2020-02-20 14:14:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(69, '2020-02-20 14:14:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(70, '2020-02-20 14:14:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(71, '2020-02-20 14:15:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(72, '2020-02-20 14:15:25', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(73, '2020-02-20 14:15:37', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(74, '2020-02-20 14:15:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(75, '2020-02-20 14:15:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(76, '2020-02-20 14:15:49', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(77, '2020-02-20 14:16:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(78, '2020-02-20 14:16:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(79, '2020-02-20 14:16:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(80, '2020-02-20 14:16:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(81, '2020-02-20 14:34:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(82, '2020-02-20 14:34:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(83, '2020-02-20 14:34:54', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(84, '2020-02-20 14:34:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(85, '2020-02-20 14:34:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(86, '2020-02-20 14:35:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(87, '2020-02-20 14:35:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(88, '2020-02-20 14:35:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(89, '2020-02-20 14:35:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(90, '2020-02-20 14:35:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(91, '2020-02-20 14:35:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(92, '2020-02-20 14:36:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(93, '2020-02-20 14:36:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(94, '2020-02-20 14:36:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(95, '2020-02-20 14:36:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(96, '2020-02-20 14:36:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(97, '2020-02-20 14:36:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(98, '2020-02-20 14:36:55', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(99, '2020-02-20 14:36:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(100, '2020-02-20 14:37:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(101, '2020-02-20 14:37:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(102, '2020-02-20 14:47:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(103, '2020-02-20 14:48:28', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(104, '2020-02-20 14:49:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(105, '2020-02-20 14:49:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(106, '2020-02-20 14:50:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(107, '2020-02-20 14:50:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(108, '2020-02-20 14:50:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(109, '2020-02-20 14:51:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(110, '2020-02-20 14:51:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(111, '2020-02-20 14:52:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(112, '2020-02-20 14:55:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(113, '2020-02-20 14:56:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(114, '2020-02-20 14:57:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(115, '2020-02-20 14:57:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(116, '2020-02-20 14:59:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(117, '2020-02-20 14:59:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(118, '2020-02-20 14:59:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(119, '2020-02-20 14:59:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(120, '2020-02-20 14:59:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(121, '2020-02-20 14:59:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(122, '2020-02-20 15:05:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(123, '2020-02-20 15:07:22', NULL),
(124, '2020-02-20 15:07:35', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(125, '2020-02-20 15:07:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(126, '2020-02-20 15:08:04', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(127, '2020-02-20 15:12:45', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(128, '2020-02-20 15:12:52', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(129, '2020-02-22 13:11:44', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(130, '2020-02-22 13:42:20', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
