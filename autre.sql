-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 04 fév. 2020 à 05:37
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
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `afaire`
--

INSERT INTO `afaire` (`idafaire`, `texteafaire`, `priorite`) VALUES
(255, 'Mettre composant augmentant les capacités de minage.', 'grosetapesouspeu'),
(204, 'Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination', 'petittrucrapide'),
(205, 'Sur la carte, mettre en évidence les endroits accessibles ?', 'grosseetapeplustard'),
(160, ' Trouver comment afficher un message de la messagerie', 'grosseetapeplustard'),
(17, 'Gestion de crise économique (rétrograder travailleurs ?)', 'grosseetapeplustard'),
(16, 'Message au passage du tour utile ! (temps d\'exécution) (nombre de pop crées) ', 'grosseetapeplustard'),
(217, 'Table items : Changer nombatiment en nom item', 'petittrucplustard'),
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `champsasteroides`
--

INSERT INTO `champsasteroides` (`idasteroide`, `xaste`, `yaste`, `uniaste`, `quantite`, `typeitemsaste`) VALUES
(1, 4, 3, 1, 4, 6);

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
(2, 2, 4, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tour`
--

INSERT INTO `tour` (`id`, `datetour`, `resume`) VALUES
(1, '2020-02-03 20:53:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(2, '2020-02-03 20:53:29', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(3, '2020-02-03 20:53:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(4, '2020-02-03 20:53:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(5, '2020-02-03 20:53:40', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(6, '2020-02-03 20:53:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(7, '2020-02-03 20:53:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(8, '2020-02-03 20:53:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(9, '2020-02-03 20:53:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(10, '2020-02-03 20:53:47', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(11, '2020-02-03 20:53:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(12, '2020-02-03 20:53:50', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(13, '2020-02-03 20:53:51', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(14, '2020-02-03 20:53:53', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(15, '2020-02-03 20:53:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(16, '2020-02-03 20:54:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(17, '2020-02-03 20:54:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(18, '2020-02-03 20:54:10', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(19, '2020-02-03 20:54:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(20, '2020-02-03 20:54:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(21, '2020-02-03 20:54:26', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(22, '2020-02-03 20:54:31', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(23, '2020-02-03 20:54:39', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(24, '2020-02-03 20:55:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(25, '2020-02-03 20:55:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(26, '2020-02-03 20:55:27', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(27, '2020-02-03 20:55:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(28, '2020-02-03 20:56:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(29, '2020-02-03 21:09:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(30, '2020-02-03 21:13:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(31, '2020-02-03 21:28:32', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(32, '2020-02-03 21:28:38', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(33, '2020-02-03 21:29:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(34, '2020-02-03 21:29:16', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(35, '2020-02-03 21:29:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(36, '2020-02-03 21:29:18', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(37, '2020-02-03 21:29:19', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(38, '2020-02-03 22:13:49', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(39, '2020-02-03 22:14:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(40, '2020-02-03 22:14:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(41, '2020-02-03 23:50:23', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(42, '2020-02-03 23:50:34', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(43, '2020-02-03 23:51:46', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(44, '2020-02-03 23:51:57', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(45, '2020-02-03 23:51:58', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(46, '2020-02-03 23:52:08', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(47, '2020-02-03 23:54:24', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(48, '2020-02-03 23:54:35', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(49, '2020-02-03 23:54:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(50, '2020-02-03 23:54:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(51, '2020-02-03 23:54:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(52, '2020-02-03 23:55:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(53, '2020-02-03 23:55:03', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(54, '2020-02-03 23:55:17', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(55, '2020-02-03 23:55:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(56, '2020-02-03 23:55:21', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(57, '2020-02-03 23:55:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(58, '2020-02-03 23:55:22', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(59, '2020-02-03 23:55:41', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(60, '2020-02-03 23:55:42', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(61, '2020-02-03 23:55:48', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(62, '2020-02-03 23:55:56', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(63, '2020-02-03 23:55:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(64, '2020-02-03 23:55:59', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(65, '2020-02-03 23:56:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(66, '2020-02-03 23:56:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(67, '2020-02-03 23:56:00', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(68, '2020-02-03 23:56:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(69, '2020-02-03 23:56:01', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(70, '2020-02-03 23:56:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(71, '2020-02-03 23:56:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(72, '2020-02-03 23:56:02', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(73, '2020-02-03 23:56:05', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(74, '2020-02-03 23:56:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(75, '2020-02-03 23:56:06', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(76, '2020-02-03 23:56:12', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(77, '2020-02-03 23:56:13', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop'),
(78, '2020-02-03 23:56:14', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
