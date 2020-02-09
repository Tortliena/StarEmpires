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
-- Base de données :  `gamer`
--

-- --------------------------------------------------------

--
-- Structure de la table `bataille`
--

DROP TABLE IF EXISTS `bataille`;
CREATE TABLE IF NOT EXISTS `bataille` (
  `idbataille` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauoffensif` int(11) NOT NULL,
  `idvaisseaudefensif` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idbataille`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`idbat`, `typebat`, `idjoueurbat`) VALUES
(1, 2, 1),
(2, 4, 1),
(3, 1, 1),
(4, 3, 1),
(5, 3, 2),
(6, 2, 2),
(7, 1, 2),
(8, 4, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `choixevents`
--

INSERT INTO `choixevents` (`idchoix`, `idjoueurevent`, `texteevent`, `eventsuite1`, `textechoix1`, `eventsuite2`, `textechoix2`, `eventsuite3`, `textechoix3`) VALUES
(364, 1, 'Il fait beau aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL),
(365, 2, 'event9', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `composantvaisseau`
--

DROP TABLE IF EXISTS `composantvaisseau`;
CREATE TABLE IF NOT EXISTS `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composantvaisseau`
--

INSERT INTO `composantvaisseau` (`idtable`, `idvaisseaucompo`, `iditemcomposant`, `typecomposant`, `tirrestant`) VALUES
(19, 1, 12, 'soute', 0),
(15, 8, 14, 'arme', 2),
(18, 1, 10, 'moteur', 0),
(17, 8, 15, 'coque', 0),
(27, 10, 12, 'soute', 0),
(26, 17, 13, 'arme', 4),
(25, 16, 13, 'arme', 4);

-- --------------------------------------------------------

--
-- Structure de la table `concenptionencours`
--

DROP TABLE IF EXISTS `concenptionencours`;
CREATE TABLE IF NOT EXISTS `concenptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `explore`
--

INSERT INTO `explore` (`idexplore`, `univers`, `x`, `y`, `idexplorateur`, `tourexploration`) VALUES
(47, 2, 4, 4, 2, 279),
(49, 2, 2, 5, 2, 281),
(53, 2, 3, 2, 2, 287),
(41, 2, 5, 4, 2, 273),
(52, 2, 1, 2, 2, 284),
(39, 2, 5, 2, 2, 271),
(38, 2, 4, 3, 2, 269),
(37, 2, 4, 2, 2, 268),
(51, 2, 1, 3, 2, 283),
(35, 2, 3, 3, 2, 265),
(50, 2, 1, 4, 2, 282);

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
  `maxmegalopole` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `limitesjoueurs`
--

INSERT INTO `limitesjoueurs` (`id`, `maxchantier`, `maxcentrederecherche`, `popmax`, `scientmax`, `ouvriermax`, `maxentrepot`, `maxbaselunaire`, `maxmegalopole`) VALUES
(1, 1, 1, 10, 5, 5, 0, 1, 1),
(2, 1, 1, 10, 5, 5, 0, 1, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=370 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messagetour`
--

INSERT INTO `messagetour` (`idmessage`, `idjoumess`, `message`, `domainemess`, `numspemessage`) VALUES
(367, 2, 'Une nouvelle population vient d\'apparaitre sur votre planète.', 'capitale', 0),
(368, 2, 'Manque d\'ouvriers !', 'Construction', 97),
(369, 2, 'Rénovation du Gros vaisseau : Construction finie', 'Construction', 0);

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
  `bloque` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idordredeplacement`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `population`
--

INSERT INTO `population` (`idpop`, `joueurpop`, `typepop`, `typepoparrivee`) VALUES
(1, 1, 3, 0),
(2, 1, 2, 0),
(3, 1, 2, 0),
(4, 1, 2, 0),
(5, 1, 3, 0),
(6, 1, 3, 0),
(7, 1, 1, 0),
(8, 1, 1, 0),
(9, 1, 1, 0),
(10, 1, 1, 0),
(11, 2, 3, 0),
(12, 2, 2, 0),
(13, 2, 3, 0),
(14, 2, 2, 0),
(15, 2, 1, 0),
(16, 2, 1, 0),
(17, 2, 1, 0),
(18, 2, 1, 0),
(19, 2, 1, 0),
(20, 2, 1, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rech_joueur`
--

INSERT INTO `rech_joueur` (`idrechprinc`, `idjoueurrecherche`, `idrech`, `avrech`, `rechnesc`, `rechposs`) VALUES
(1, 1, 4, 5, 5, 1),
(2, 1, 3, 7, 7, 1),
(3, 1, 1, 16, 16, 1),
(4, 1, 2, 10, 10, 1),
(13, 1, 6, 27, 26, 1),
(6, 1, 7, 37, 37, 1),
(11, 1, 5, 27, 27, 1),
(14, 1, 10, 141, 139, 1),
(15, 1, 11, 111, 110, 1),
(17, 2, 4, 5, 5, 1),
(20, 2, 3, 5, 5, 1),
(19, 2, 1, 8, 8, 1),
(24, 2, 2, 13, 12, 1),
(22, 2, 5, 26, 38, 0),
(23, 2, 7, 38, 38, 1),
(25, 2, 6, 0, 23, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `silo`
--

INSERT INTO `silo` (`idsilo`, `idjoueursilo`, `iditems`, `quantite`) VALUES
(1, 1, 8, 2),
(2, 1, 10, 0),
(3, 1, 11, 0),
(4, 1, 12, 0),
(5, 1, 14, 0),
(6, 1, 15, 0),
(7, 2, 6, 0),
(8, 2, 8, 0),
(9, 2, 12, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudo`, `motdepasse`, `dateinscription`, `biens`, `titane`, `idevent`, `ideventsuivant`, `lvl`) VALUES
(1, 'qw', '$2y$10$A7WhXoIeSKihhOejJl89R.RbPCkWI3gehqbdPcoc7lsI2tEcJ62EO', '2020-02-03', 1070, 10, 1, 0, 8),
(2, 'as', '$2y$10$v3C09pUcDhLobE.bfEue0uoVbRTza.ARc7Px5eBEeFV5Na49N3yVa', '2020-02-09', 756, 10, 9, 0, 7);

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
  `capacitedesoute` int(11) NOT NULL DEFAULT '1',
  `capaciteminage` int(11) NOT NULL DEFAULT '1',
  `HPmaxvaisseau` int(11) NOT NULL DEFAULT '3',
  `HPvaisseau` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaisseau`
--

INSERT INTO `vaisseau` (`idvaisseau`, `idjoueurbat`, `typevaisseau`, `univers`, `x`, `y`, `nomvaisseau`, `vitesse`, `capacitedesoute`, `capaciteminage`, `HPmaxvaisseau`, `HPvaisseau`) VALUES
(1, 1, 5, 1, 0, 0, 'Vaisseau', 2, 5, 1, 9, 9),
(8, 1, 5, 1, 1, 1, 'Explorateur', 1, 1, 1, 15, 15),
(10, 2, 5, 2, 0, 0, 'Gros vaisseau', 1, 5, 1, 7, 6),
(17, 0, 5, 2, 1, 2, 'Épave spatiale', 1, 1, 1, 18, 18),
(16, 0, 5, 2, 1, 3, 'Épave spatiale', 1, 1, 1, 18, 18);

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
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `variationstour`
--

INSERT INTO `variationstour` (`idtable`, `idjoueur`, `prodbiens`, `chantier`, `recherche`, `consobiens`) VALUES
(364, 1, 20, 60, 3, 10),
(365, 2, 25, 40, 2, 9);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
