-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 25 fév. 2020 à 14:26
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`idbat`, `typebat`, `idjoueurbat`) VALUES
(1, 3, 1),
(2, 1, 1),
(3, 2, 1),
(4, 4, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `choixevents`
--

INSERT INTO `choixevents` (`idchoix`, `idjoueurevent`, `texteevent`, `eventsuite1`, `textechoix1`, `eventsuite2`, `textechoix2`, `eventsuite3`, `textechoix3`) VALUES
(130, 1, 'Ce soir, gros débat politique à la télé.', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composantvaisseau`
--

INSERT INTO `composantvaisseau` (`idtable`, `idvaisseaucompo`, `iditemcomposant`, `typecomposant`, `tirrestant`) VALUES
(18, 4, 17, 'noyau', 0),
(9, 2, 10, 'moteur', 0),
(7, 2, 12, 'soute', 0),
(10, 1, 10, 'moteur', 0),
(11, 4, 10, 'moteur', 0),
(12, 1, 14, 'arme', 2),
(13, 2, 14, 'arme', 2),
(19, 4, 19, 'arme', 0),
(15, 1, 15, 'coque', 0),
(16, 4, 15, 'coque', 0),
(17, 2, 15, 'coque', 0);

-- --------------------------------------------------------

--
-- Structure de la table `conceptionencours`
--

DROP TABLE IF EXISTS `conceptionencours`;
CREATE TABLE IF NOT EXISTS `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `explore`
--

INSERT INTO `explore` (`idexplore`, `univers`, `x`, `y`, `idexplorateur`, `tourexploration`) VALUES
(1, 1, 3, 3, 1, 11),
(2, 1, 2, 3, 1, 12),
(3, 1, 1, 2, 1, 13),
(4, 1, 1, 1, 1, 14),
(5, 1, 2, 2, 1, 15),
(6, 1, 3, 2, 1, 16),
(7, 1, 4, 2, 1, 17),
(8, 1, 4, 4, 1, 27),
(9, 1, 5, 5, 1, 28),
(10, 1, 5, 4, 1, 29),
(11, 1, 1, 3, 1, 41),
(12, 1, 1, 4, 1, 42),
(13, 1, 1, 5, 1, 43),
(14, 1, 2, 1, 1, 105),
(15, 1, 4, 1, 1, 106),
(16, 1, 3, 4, 1, 123),
(17, 1, 2, 4, 1, 123),
(18, 1, 4, 3, 1, 123),
(19, 1, 3, 1, 1, 125),
(20, 1, 3, 5, 1, 125),
(21, 1, 2, 5, 1, 125),
(22, 1, 5, 3, 1, 126),
(23, 1, 4, 5, 1, 126),
(24, 1, 5, 1, 1, 126);

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
(1, 1, 1, 10, 5, 5, 0, 1, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messagetour`
--

INSERT INTO `messagetour` (`idmessage`, `idjoumess`, `message`, `domainemess`, `numspemessage`) VALUES
(294, 1, 'Rénovation du Stackanov : Construction finie', 'Construction', 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ordredeplacement`
--

INSERT INTO `ordredeplacement` (`idordredeplacement`, `idvaisseaudeplacement`, `xdestination`, `ydestination`, `universdestination`, `idjoueurduvaisseau`, `typeordre`, `bloque`) VALUES
(92, 4, 0, 0, 1, 1, 10, 0),
(89, 1, 2, 1, 1, 1, 0, 0),
(88, 2, 0, 0, 1, 1, 1, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `population`
--

INSERT INTO `population` (`idpop`, `joueurpop`, `typepop`, `typepoparrivee`) VALUES
(1, 1, 3, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 3, 0),
(5, 1, 2, 0),
(6, 1, 3, 0),
(7, 1, 1, 0),
(8, 1, 1, 0),
(9, 1, 1, 0),
(10, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `rech_joueur`
--

DROP TABLE IF EXISTS `rech_joueur`;
CREATE TABLE IF NOT EXISTS `rech_joueur` (
  `idrechprinc` int(11) NOT NULL AUTO_INCREMENT,
  `ordrerecherche` int(11) NOT NULL,
  `idjoueurrecherche` int(11) NOT NULL,
  `idrech` int(11) NOT NULL,
  `avrech` int(11) NOT NULL DEFAULT '0',
  `rechnesc` int(11) NOT NULL DEFAULT '1000',
  `rechposs` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idrechprinc`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rech_joueur`
--

INSERT INTO `rech_joueur` (`idrechprinc`, `ordrerecherche`, `idjoueurrecherche`, `idrech`, `avrech`, `rechnesc`, `rechposs`) VALUES
(1, 1, 1, 4, 3, 3, 1),
(2, 2, 1, 1, 3, 3, 1),
(3, 3, 1, 3, 4, 4, 1),
(4, 4, 1, 5, 30, 30, 1),
(5, 5, 1, 7, 30, 29, 1),
(6, 3, 1, 2, 18, 18, 1),
(7, 6, 1, 6, 18, 16, 1),
(8, 7, 1, 10, 39, 36, 1),
(9, 8, 1, 11, 24, 24, 1),
(12, 11, 1, 15, 36, 151, 0),
(13, 12, 1, 14, 0, 41, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `silo`
--

INSERT INTO `silo` (`idsilo`, `idjoueursilo`, `iditems`, `quantite`) VALUES
(15, 1, 6, 2),
(14, 1, 12, 1),
(16, 1, 8, 2),
(21, 1, 17, 5);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudo`, `motdepasse`, `dateinscription`, `biens`, `titane`, `idevent`, `ideventsuivant`, `lvl`) VALUES
(1, 'qw', '$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.', '2020-02-20', 406, 73, 2, 0, 10);

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
  `biensvaisseau` int(11) DEFAULT '0',
  `titanevaisseau` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaisseau`
--

INSERT INTO `vaisseau` (`idvaisseau`, `idjoueurbat`, `typevaisseau`, `univers`, `x`, `y`, `nomvaisseau`, `vitesse`, `capacitedesoute`, `capaciteminage`, `HPmaxvaisseau`, `HPvaisseau`, `biensvaisseau`, `titanevaisseau`) VALUES
(1, 1, 5, 1, 5, 1, 'Gros bilou', 2, 3, 1, 17, 15, 240, 0),
(2, 1, 5, 1, 4, 5, 'Petit Bib', 2, 10, 1, 21, 17, 280, 0),
(4, 1, 5, 1, 0, 0, 'Stackanov', 2, 3, 1, 17, 17, 240, 100);

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
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `variationstour`
--

INSERT INTO `variationstour` (`idtable`, `idjoueur`, `prodbiens`, `chantier`, `recherche`, `consobiens`) VALUES
(130, 1, 20, 40, 4, 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
