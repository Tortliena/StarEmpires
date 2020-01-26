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
-- Base de données :  `gamer`
--

-- --------------------------------------------------------

--
-- Structure de la table `batiments`
--

DROP TABLE IF EXISTS `batiments`;
CREATE TABLE IF NOT EXISTS `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`idbat`, `typebat`, `idjoueurbat`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 1),
(4, 2, 2),
(5, 4, 2),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cargovaisseau`
--

DROP TABLE IF EXISTS `cargovaisseau`;
CREATE TABLE IF NOT EXISTS `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cargovaisseau`
--

INSERT INTO `cargovaisseau` (`idcargovaisseau`, `idvaisseaucargo`, `typeitems`, `quantiteitems`) VALUES
(30, 2, 8, 1),
(29, 2, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `choixevents`
--

DROP TABLE IF EXISTS `choixevents`;
CREATE TABLE IF NOT EXISTS `choixevents` (
  `idchoix` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurevent` int(11) NOT NULL,
  `texteevent` text NOT NULL,
  `eventsuite1` int(11) DEFAULT NULL,
  `textechoix1` varchar(128) DEFAULT NULL,
  `eventsuite2` int(11) DEFAULT NULL,
  `textechoix2` varchar(128) DEFAULT NULL,
  `eventsuite3` int(11) DEFAULT NULL,
  `textechoix3` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idchoix`)
) ENGINE=MyISAM AUTO_INCREMENT=589 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `choixevents`
--

INSERT INTO `choixevents` (`idchoix`, `idjoueurevent`, `texteevent`, `eventsuite1`, `textechoix1`, `eventsuite2`, `textechoix2`, `eventsuite3`, `textechoix3`) VALUES
(586, 1, 'event9', NULL, NULL, NULL, NULL, NULL, NULL),
(587, 2, 'On cherche des chercheurs qui trouvent ...', NULL, NULL, NULL, NULL, NULL, NULL),
(588, 8, 'Étoiles filantes prévues.', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `construction`
--

DROP TABLE IF EXISTS `construction`;
CREATE TABLE IF NOT EXISTS `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `explore`
--

DROP TABLE IF EXISTS `explore`;
CREATE TABLE IF NOT EXISTS `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `explore`
--

INSERT INTO `explore` (`idexplore`, `univers`, `x`, `y`, `idexplorateur`, `tourexploration`) VALUES
(30, 1, 5, 5, 1, 107),
(29, 1, 1, 5, 1, 106),
(28, 1, 5, 3, 1, 106),
(27, 1, 2, 5, 1, 106),
(26, 1, 3, 2, 1, 105),
(25, 1, 5, 1, 1, 105),
(24, 1, 1, 1, 1, 105),
(23, 2, 3, 3, 2, 85),
(22, 2, 5, 3, 2, 83),
(21, 2, 4, 3, 2, 82),
(20, 2, 5, 2, 2, 81),
(19, 2, 4, 2, 2, 80),
(18, 2, 3, 2, 2, 77),
(17, 2, 2, 2, 2, 76),
(16, 2, 2, 3, 2, 75),
(31, 1, 5, 4, 1, 108),
(32, 1, 2, 3, 1, 109),
(33, 1, 5, 2, 1, 109),
(34, 1, 4, 3, 1, 110),
(35, 1, 4, 4, 1, 111),
(36, 1, 3, 5, 1, 112),
(37, 1, 2, 4, 1, 113),
(38, 1, 1, 3, 1, 114),
(39, 2, 0, 0, 2, 163),
(40, 2, 1, 1, 2, 164),
(41, 2, 4, 1, 2, 191),
(42, 2, 4, 4, 2, 194),
(43, 1, 3, 3, 1, 216);

-- --------------------------------------------------------

--
-- Structure de la table `limitesjoueurs`
--

DROP TABLE IF EXISTS `limitesjoueurs`;
CREATE TABLE IF NOT EXISTS `limitesjoueurs` (
  `id` int(11) NOT NULL,
  `maxchantier` int(11) NOT NULL DEFAULT '0',
  `maxcentrederecherche` int(11) NOT NULL DEFAULT '1',
  `popmax` int(11) NOT NULL DEFAULT '5',
  `scientmax` int(11) NOT NULL DEFAULT '1',
  `ouvriermax` int(11) NOT NULL DEFAULT '1',
  `maxentrepot` int(11) NOT NULL DEFAULT '0',
  `maxbaselunaire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `limitesjoueurs`
--

INSERT INTO `limitesjoueurs` (`id`, `maxchantier`, `maxcentrederecherche`, `popmax`, `scientmax`, `ouvriermax`, `maxentrepot`, `maxbaselunaire`) VALUES
(1, 1, 1, 9, 5, 5, 0, 1),
(2, 1, 1, 9, 5, 5, 0, 1),
(3, 1, 1, 8, 1, 1, 0, 0),
(4, 1, 1, 8, 1, 1, 0, 0),
(5, 1, 1, 8, 1, 1, 0, 0),
(6, 1, 1, 8, 1, 1, 0, 0),
(7, 1, 1, 8, 1, 1, 0, 0),
(8, 1, 1, 8, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `messagerie`
--

DROP TABLE IF EXISTS `messagerie`;
CREATE TABLE IF NOT EXISTS `messagerie` (
  `idmessagerie` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueuremetteur` int(11) NOT NULL,
  `idjoueurrecepteur` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `supprimeemetteur` tinyint(1) NOT NULL DEFAULT '0',
  `supprimerecepteur` tinyint(1) NOT NULL DEFAULT '0',
  `textemessagerie` text NOT NULL,
  `titremessage` varchar(32) NOT NULL,
  `datemessage` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idmessagerie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `messagerieinterne`
--

DROP TABLE IF EXISTS `messagerieinterne`;
CREATE TABLE IF NOT EXISTS `messagerieinterne` (
  `expediteur` varchar(64) NOT NULL,
  `idmessagerieinterne` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `titre` varchar(64) NOT NULL,
  `texte` text NOT NULL,
  PRIMARY KEY (`idmessagerieinterne`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messagerieinterne`
--

INSERT INTO `messagerieinterne` (`expediteur`, `idmessagerieinterne`, `destinataire`, `lu`, `titre`, `texte`) VALUES
('Équipe scientifique', 1, 1, 0, 'Première sortir du système solaire', 'Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\\-lumière'),
('Vaisseau d\'exploration', 2, 1, 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.'),
('Vaisseau d\'exploration', 3, 1, 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.'),
('Équipe scientifique', 12, 1, 0, 'Première sortir du système solaire', 'Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\\-lumière'),
('Vaisseau d\'exploration', 11, 2, 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.'),
('Vaisseau d\'exploration', 10, 2, 0, 'Planète habitable', 'Nous venons de trouver une nouvelle planète. Nous allons pouvoir l\'habiter en déployer d\'énormes ressources. Nous devrions continuer l\'exploration dans le but de trouver ces ressources'),
('Vaisseau d\'exploration', 9, 2, 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.');

-- --------------------------------------------------------

--
-- Structure de la table `messagetour`
--

DROP TABLE IF EXISTS `messagetour`;
CREATE TABLE IF NOT EXISTS `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=400 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messagetour`
--

INSERT INTO `messagetour` (`idmessage`, `idjoumess`, `message`, `domainemess`, `numspemessage`) VALUES
(399, 1, 'Vous venez de finir une recherche', 'recherche', 0);

-- --------------------------------------------------------

--
-- Structure de la table `ordredeplacement`
--

DROP TABLE IF EXISTS `ordredeplacement`;
CREATE TABLE IF NOT EXISTS `ordredeplacement` (
  `idordredeplacement` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaudeplacement` int(11) NOT NULL,
  `xdestination` int(11) NOT NULL,
  `ydestination` int(11) NOT NULL,
  `universdestination` int(11) NOT NULL,
  `idjoueurduvaisseau` int(11) NOT NULL,
  `typeordre` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idordredeplacement`)
) ENGINE=MyISAM AUTO_INCREMENT=360 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `population`
--

DROP TABLE IF EXISTS `population`;
CREATE TABLE IF NOT EXISTS `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `population`
--

INSERT INTO `population` (`idpop`, `joueurpop`, `typepop`, `typepoparrivee`) VALUES
(1, 1, 3, 0),
(2, 1, 3, 0),
(3, 1, 3, 0),
(4, 1, 3, 0),
(5, 1, 3, 0),
(6, 1, 2, 0),
(7, 1, 2, 0),
(8, 1, 1, 0),
(9, 2, 3, 0),
(10, 2, 2, 0),
(11, 2, 2, 0),
(12, 2, 2, 0),
(13, 2, 3, 0),
(14, 2, 3, 0),
(15, 2, 1, 0),
(16, 3, 2, 0),
(17, 3, 3, 0),
(18, 3, 1, 0),
(19, 3, 1, 0),
(20, 3, 1, 0),
(21, 3, 1, 0),
(22, 2, 1, 0),
(23, 3, 1, 0),
(24, 3, 1, 0),
(25, 1, 1, 0),
(26, 4, 1, 0),
(27, 4, 1, 0),
(28, 4, 1, 0),
(29, 4, 1, 0),
(30, 4, 1, 0),
(31, 4, 1, 0),
(32, 5, 1, 0),
(33, 5, 1, 0),
(34, 5, 1, 0),
(35, 5, 1, 0),
(36, 5, 1, 0),
(37, 5, 1, 0),
(38, 2, 1, 0),
(39, 4, 1, 0),
(40, 4, 1, 0),
(41, 5, 1, 0),
(42, 5, 1, 0),
(43, 6, 3, 0),
(44, 6, 2, 0),
(45, 6, 1, 0),
(46, 6, 1, 0),
(47, 6, 1, 0),
(48, 6, 1, 0),
(49, 7, 3, 0),
(50, 7, 2, 0),
(51, 7, 1, 0),
(52, 7, 1, 0),
(53, 7, 1, 0),
(54, 7, 1, 0),
(55, 8, 3, 0),
(56, 8, 2, 0),
(57, 8, 1, 0),
(58, 8, 1, 0),
(59, 8, 1, 0),
(60, 8, 1, 0),
(61, 6, 1, 0),
(62, 6, 1, 0),
(63, 8, 1, 0),
(64, 8, 1, 0),
(65, 7, 1, 0),
(66, 7, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `rech_joueur`
--

DROP TABLE IF EXISTS `rech_joueur`;
CREATE TABLE IF NOT EXISTS `rech_joueur` (
  `idrechprinc` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurrecherche` int(11) NOT NULL,
  `idrech` int(11) NOT NULL,
  `avrech` int(11) NOT NULL DEFAULT '0',
  `rechnesc` int(11) NOT NULL DEFAULT '1000',
  `rechposs` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idrechprinc`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rech_joueur`
--

INSERT INTO `rech_joueur` (`idrechprinc`, `idjoueurrecherche`, `idrech`, `avrech`, `rechnesc`, `rechposs`) VALUES
(44, 2, 1, 10, 10, 1),
(46, 8, 4, 4, 4, 1),
(52, 1, 1, 14, 13, 1),
(39, 2, 3, 12, 10, 1),
(48, 8, 1, 11, 11, 1),
(27, 2, 4, 5, 5, 1),
(45, 2, 5, 34, 32, 1),
(51, 1, 3, 10, 8, 1),
(41, 2, 2, 14, 12, 1),
(50, 1, 4, 6, 5, 1),
(55, 1, 2, 19, 16, 1),
(47, 8, 3, 6, 6, 1),
(56, 1, 5, 33, 32, 1);

-- --------------------------------------------------------

--
-- Structure de la table `silo`
--

DROP TABLE IF EXISTS `silo`;
CREATE TABLE IF NOT EXISTS `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `silo`
--

INSERT INTO `silo` (`idsilo`, `idjoueursilo`, `iditems`, `quantite`) VALUES
(1, 1, 6, 0),
(2, 1, 8, 10),
(6, 2, 8, 10),
(11, 2, 10, 3),
(12, 1, 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(32) NOT NULL,
  `motdepasse` varchar(1024) NOT NULL,
  `dateinscription` date DEFAULT NULL,
  `biens` int(11) NOT NULL DEFAULT '200',
  `titane` int(11) NOT NULL DEFAULT '0',
  `idevent` int(11) NOT NULL DEFAULT '0',
  `ideventsuivant` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudo`, `motdepasse`, `dateinscription`, `biens`, `titane`, `idevent`, `ideventsuivant`, `lvl`) VALUES
(1, 'qw', '$2y$10$aeRzDQxkoWLKwiMKfaNykOIsSi6QRPDaTGTnFpzfLbfKAYDBtcodG', '2019-12-11', 34, 430, 9, 0, 6),
(2, 'ty', '$2y$10$oBttu4RYOmafULAgtTWfu.BIq5AXUB8nDRFpKB6P4l8frYfz15xhu', '2020-01-18', 2000, 110, 6, 0, 6),
(8, 'as', '$2y$10$65WveVyAsvUr7nQJgRvUXuFDJBgc5rFCpGFml3Pc4CA/oCltikhy2', '2020-01-24', 1004, 0, 5, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `vaisseau`
--

DROP TABLE IF EXISTS `vaisseau`;
CREATE TABLE IF NOT EXISTS `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurbat` int(11) NOT NULL,
  `typevaisseau` int(11) NOT NULL,
  `univers` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) DEFAULT '0',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  `vitesse` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaisseau`
--

INSERT INTO `vaisseau` (`idvaisseau`, `idjoueurbat`, `typevaisseau`, `univers`, `x`, `y`, `nomvaisseau`, `vitesse`) VALUES
(1, 1, 5, 1, 0, 0, 'Vaisseau', 1),
(2, 2, 5, 2, 3, 3, 'Vaisseau', 1);

-- --------------------------------------------------------

--
-- Structure de la table `variationstour`
--

DROP TABLE IF EXISTS `variationstour`;
CREATE TABLE IF NOT EXISTS `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=584 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `variationstour`
--

INSERT INTO `variationstour` (`idtable`, `idjoueur`, `prodbiens`, `chantier`, `recherche`, `consobiens`) VALUES
(581, 1, 10, 40, 5, 9),
(582, 2, 15, 60, 3, 9),
(583, 8, 30, 20, 1, 8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
