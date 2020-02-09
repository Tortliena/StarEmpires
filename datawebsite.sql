-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 09 fév. 2020 à 19:46
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
-- Base de données :  `datawebsite`
--

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

DROP TABLE IF EXISTS `composant`;
CREATE TABLE IF NOT EXISTS `composant` (
  `idcomposant` int(11) NOT NULL AUTO_INCREMENT,
  `nomcomposant` varchar(64) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `typebonus` int(11) NOT NULL DEFAULT '0',
  `totalbonus` int(11) NOT NULL DEFAULT '0',
  `HPcomposant` int(11) NOT NULL DEFAULT '0',
  `nbtir` int(11) NOT NULL DEFAULT '0',
  `degatpartir` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composant`
--

INSERT INTO `composant` (`idcomposant`, `nomcomposant`, `typecomposant`, `typebonus`, `totalbonus`, `HPcomposant`, `nbtir`, `degatpartir`) VALUES
(10, 'Moteur II', 'moteur', 1, 2, 2, 0, 0),
(11, 'Laser minier', 'arme', 3, 3, 2, 2, 1),
(12, 'Soutes Larges', 'soute', 2, 5, 4, 0, 0),
(14, 'Torpille supraluminique', 'arme', 0, 0, 2, 2, 4),
(15, 'Coque polycarbonique', 'coque', 0, 0, 10, 0, 0),
(13, 'Arme alienne pour le 1er vaisseau', 'arme', 0, 0, 15, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0',
  `itemnecessaire` int(11) DEFAULT '0',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`iditem`, `nombatiment`, `coutbien`, `couttitane`, `typeitem`, `technescessaire`, `itemnecessaire`, `description`, `nomlimite`, `souscategorie`) VALUES
(1, 'Centre de recherche', 100, 0, 'batiments', 1, 0, NULL, 'maxcentrederecherche', ''),
(2, 'Chantier', 100, 0, 'batiments', 3, 0, NULL, 'maxchantier', ''),
(3, 'Mégalopole', 100, 0, 'batiments', 0, 0, 'Permet d\'augmenter la population maximale d\'une planète.', 'maxmegalopole', ''),
(4, 'Base lunaire', 150, 10, 'batiments', 2, 0, NULL, 'maxbaselunaire', ''),
(5, 'Frégate', 100, 0, 'vaisseau', 4, 0, NULL, NULL, ''),
(6, 'débris communs', 10, 0, 'autre', 0, 0, 'Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.', NULL, ''),
(7, 'Recycler débris', 10, 0, 'autre', 0, 6, NULL, NULL, ''),
(8, 'débris avec des métaux rares', 10, 0, 'autre', 0, 0, 'Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.', NULL, ''),
(9, 'Recycler débris rares', 10, 0, 'autre', 0, 8, NULL, NULL, ''),
(10, 'Moteur II', 100, 0, 'composant', 5, 0, 'Moteur amélioré permettant de déplacer plus vite les vaisseaux.', NULL, 'moteur'),
(11, 'Laser minier', 100, 0, 'composant', 6, 0, 'Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.', NULL, 'arme'),
(12, 'Soutes larges', 100, 0, 'composant', 7, 0, 'Permet d\'installer des soutes sur votre vaisseau', NULL, 'soute'),
(14, 'Torpille supraluminique', 100, 0, 'composant', 10, 0, 'Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.', NULL, 'arme'),
(15, 'Coque polycarbonique', 100, 0, 'composant', 11, 0, 'Coque composée de polymères de carbone. Léger et résistant.', NULL, 'coque'),
(13, 'Arme alienne pour le 1er vaisseau', 100, 0, 'composant', -1, 0, NULL, NULL, 'arme');

-- --------------------------------------------------------

--
-- Structure de la table `recherche`
--

DROP TABLE IF EXISTS `recherche`;
CREATE TABLE IF NOT EXISTS `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recherche`
--

INSERT INTO `recherche` (`idrecherche`, `nomrecherche`, `descriptionrecherche`, `prixrecherche`) VALUES
(1, 'Centre de recherche', 'Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.', 8),
(2, 'Base lunaire', 'Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.', 10),
(3, 'Chantier', 'Permet de lancer des projets plus importants.', 5),
(4, 'Moteur interstellaire', 'Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.', 3),
(5, 'Moteurs améliorés', 'Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ', 20),
(6, 'Lasers miniers', 'Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.', 20),
(7, 'Architecture spatiale de stokage', 'Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.', 20),
(10, 'Armes supraluminique', 'On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.', 100),
(11, 'Coque renforcée', 'Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.', 100);

-- --------------------------------------------------------

--
-- Structure de la table `typepop`
--

DROP TABLE IF EXISTS `typepop`;
CREATE TABLE IF NOT EXISTS `typepop` (
  `idtypepop` int(11) NOT NULL AUTO_INCREMENT,
  `nompop` varchar(16) NOT NULL,
  `prixchangementpop` int(11) NOT NULL,
  `technecessaire` int(11) NOT NULL,
  UNIQUE KEY `idtypepop_2` (`idtypepop`),
  KEY `idtypepop` (`idtypepop`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typepop`
--

INSERT INTO `typepop` (`idtypepop`, `nompop`, `prixchangementpop`, `technecessaire`) VALUES
(1, 'citoyen', 0, 0),
(2, 'ouvrier', 50, 0),
(3, 'scientifique', 100, 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
