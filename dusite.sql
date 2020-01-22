-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 22 jan. 2020 à 17:28
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
-- Base de données :  `dusite`
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
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `afaire`
--

INSERT INTO `afaire` (`idafaire`, `texteafaire`, `priorite`) VALUES
(126, 'events : faire quelques évents marrants', 'petittrucrapide'),
(188, 'Lorsqu\'on créé un compte : Se connecter avec. ', 'petittrucplustard'),
(176, 'Refaire toute la recherche : Introduire les recherche lors du passage de niveau.', 'grosetapesouspeu'),
(12, 'Faire un arbre technologique', 'grosseetapeplustard'),
(198, 'Recycler métaux rares : Bug lorsque plusieurs ... ', 'encours'),
(160, ' Trouver comment afficher un message de la messagerie', 'grosseetapeplustard'),
(17, 'Gestion de crise économique (rétrograder travailleurs ?)', 'grosseetapeplustard'),
(16, 'Message au passage du tour utile ! (temps d\'exécution) (nombre de pop crées) ', 'grosseetapeplustard'),
(181, 'Exploration 6 : Augmenter limite base lunaire + donner accès à la recherche.', 'petittrucrapide'),
(21, 'Refaire inscriptions. (inserer quelques pops)', 'lancementsite'),
(22, 'Ajouter sécurité sur les champs entrés par les utilisateurs.', 'lancementsite'),
(23, 'Passer par http://validator.w3.org', 'lancementsite'),
(24, 'Faire le CRON', 'lancementsite'),
(25, 'Faire de la compression : http://php-minify.com/#', 'lancementsite'),
(154, 'Conversion pop (tour et page) : Mettre des max /chantiers ou /cdr ', 'grosseetapeplustard'),
(159, 'Ajouter mégalopoles + lien base lunaire', 'grosetapesouspeu'),
(75, 'Faire les images', 'grosseetapeplustard'),
(191, 'Bug : Base lunaire non constructible ! ! ', 'encours');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`idbat`, `typebat`, `idjoueurbat`) VALUES
(1, 1, 1),
(2, 2, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

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
  `quantité` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `choixevents`
--

INSERT INTO `choixevents` (`idchoix`, `idjoueurevent`, `texteevent`, `eventsuite1`, `textechoix1`, `eventsuite2`, `textechoix2`, `eventsuite3`, `textechoix3`) VALUES
(92, 1, 'Ce soir, gros débat politique à la télé.', NULL, NULL, NULL, NULL, NULL, NULL),
(93, 2, 'Il fait beau aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL),
(94, 3, 'La journée a été longue', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `construction`
--

INSERT INTO `construction` (`idconst`, `trucaconstruire`, `nombre`, `avancementbiens`, `avancementtitane`, `prixbiens`, `prixtitane`, `idjoueurconst`) VALUES
(353, '9', 3, 10, 0, 10, 0, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `explore`
--

INSERT INTO `explore` (`idexplore`, `univers`, `x`, `y`, `idexplorateur`, `tourexploration`) VALUES
(1, 1, 3, 3, 1, 10),
(2, 1, 3, 2, 1, 11),
(3, 1, 4, 2, 1, 12),
(4, 1, 4, 3, 1, 13),
(5, 1, 4, 4, 1, 14),
(6, 1, 3, 4, 1, 15),
(7, 1, 2, 4, 1, 16),
(8, 1, 2, 3, 1, 17);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL,
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0',
  `itemnecessaire` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`iditem`, `nombatiment`, `coutbien`, `couttitane`, `typeitem`, `technescessaire`, `itemnecessaire`, `description`, `nomlimite`) VALUES
(1, 'Centre de recherche', 100, 0, 'batiments', 1, 0, NULL, 'maxcentrederecherche'),
(2, 'Chantier', 100, 0, 'batiments', 3, 0, NULL, 'maxchantier'),
(4, 'Base lunaire', 150, 10, 'batiments', 2, 0, NULL, 'maxbaselunaire'),
(5, 'Frégate', 100, 0, 'vaisseau', 4, 0, NULL, NULL),
(6, 'débris communs', 10, 0, 'Autre', 0, 0, 'Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.', NULL),
(7, 'Recycler débris', 10, 0, 'Autre', 0, 6, NULL, NULL),
(8, 'débris avec des métaux rares', 10, 0, 'Autre', 0, 0, 'Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.', NULL),
(9, 'Recycler débris rares', 10, 0, 'Autre', 0, 8, NULL, NULL);

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
  `scientmax` int(11) NOT NULL DEFAULT '2',
  `ouvriermax` int(11) NOT NULL DEFAULT '2',
  `maxentrepot` int(11) NOT NULL DEFAULT '0',
  `maxbaselunaire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `limitesjoueurs`
--

INSERT INTO `limitesjoueurs` (`id`, `maxchantier`, `maxcentrederecherche`, `popmax`, `scientmax`, `ouvriermax`, `maxentrepot`, `maxbaselunaire`) VALUES
(1, 1, 1, 8, 5, 5, 0, 0),
(2, 1, 1, 8, 1, 1, 0, 0),
(3, 1, 1, 8, 1, 1, 0, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messagerieinterne`
--

INSERT INTO `messagerieinterne` (`expediteur`, `idmessagerieinterne`, `destinataire`, `lu`, `titre`, `texte`) VALUES
('Équipe scientifique', 1, 1, 0, 'Première sortir du système solaire', 'Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\\-lumière'),
('Vaisseau d\'exploration', 2, 1, 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.'),
('Vaisseau d\'exploration', 3, 1, 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.');

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
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messagetour`
--

INSERT INTO `messagetour` (`idmessage`, `idjoumess`, `message`, `domainemess`, `numspemessage`) VALUES
(103, 1, 'Recycler débris rares : Construction finie', 'Construction', 0),
(104, 1, 'Recycler débris rares : Construction finie', 'Construction', 0),
(105, 1, 'Recycler débris rares : Construction finie', 'Construction', 0),
(106, 1, 'Manque d\'ouvriers !', 'Construction', 353),
(107, 1, 'Recycler débris rares : Construction finie', 'Construction', 0),
(108, 1, 'Manque d\'ouvriers !', 'Construction', 353);

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
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `planete`
--

INSERT INTO `planete` (`idplanete`, `xplanete`, `yplanete`, `universplanete`) VALUES
(1, 3, 3, 1),
(2, 3, 4, 1),
(3, 3, 3, 2),
(4, 3, 3, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `population`
--

INSERT INTO `population` (`idpop`, `joueurpop`, `typepop`, `typepoparrivee`) VALUES
(1, 1, 3, 0),
(2, 1, 2, 0),
(3, 1, 2, 0),
(4, 1, 3, 0),
(5, 1, 3, 0),
(6, 1, 1, 0),
(7, 1, 1, 0),
(8, 1, 1, 0),
(9, 2, 3, 0),
(10, 2, 2, 0),
(11, 2, 1, 0),
(12, 2, 1, 0),
(13, 2, 1, 0),
(14, 2, 1, 0),
(15, 2, 1, 0),
(16, 3, 2, 0),
(17, 3, 3, 0),
(18, 3, 1, 0),
(19, 3, 1, 0),
(20, 3, 1, 0),
(21, 3, 1, 0),
(22, 2, 1, 0),
(23, 3, 1, 0),
(24, 3, 1, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recherche`
--

INSERT INTO `recherche` (`idrecherche`, `nomrecherche`, `descriptionrecherche`, `prixrecherche`) VALUES
(1, 'Centre de recherche', 'Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.', 8),
(2, 'Base lunaire', 'Votre peuple s\'en va installer des bases sur des lunes dans votre système principal ou sur les mondes proches.', 10),
(3, 'Chantier', 'Permet de lancer des projets plus importants.', 5),
(4, 'Moteur interstellaire', 'Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.', 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rech_joueur`
--

INSERT INTO `rech_joueur` (`idrechprinc`, `idjoueurrecherche`, `idrech`, `avrech`, `rechnesc`, `rechposs`) VALUES
(2, 1, 4, 5, 5, 1),
(3, 1, 3, 7, 7, 1),
(4, 1, 1, 8, 8, 1),
(11, 2, 4, 6, 6, 1),
(9, 1, 2, 18, 16, 1),
(13, 3, 4, 3, 3, 1),
(14, 2, 3, 0, 6, 0),
(15, 2, 1, 11, 13, 0),
(19, 3, 3, 8, 8, 1),
(18, 3, 1, 1, 9, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `silo`
--

INSERT INTO `silo` (`idsilo`, `idjoueursilo`, `iditems`, `quantite`) VALUES
(1, 1, 6, 0),
(2, 1, 8, 11);

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
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

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
(59, '2020-01-22 12:07:15', 'Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la production des biens</br> Fin de la production des biens</br> Début de la croissance des pop</br> Fin de la croissance des pop');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudo`, `motdepasse`, `dateinscription`, `biens`, `titane`, `idevent`, `ideventsuivant`, `lvl`) VALUES
(1, 'qw', '$2y$10$aeRzDQxkoWLKwiMKfaNykOIsSi6QRPDaTGTnFpzfLbfKAYDBtcodG', '2019-12-11', 155, 380, 2, 0, 5),
(2, 'ty', '$2y$10$oBttu4RYOmafULAgtTWfu.BIq5AXUB8nDRFpKB6P4l8frYfz15xhu', '2020-01-18', 494, 0, 1, 0, 2),
(3, 'vb', '$2y$10$uz4K5e9jpvQ9lAUbCaxBzeRAX.1eqbcFOe1j8dtatULwxKaDPErA2', '2020-01-18', 412, 0, 4, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `vaisseau`
--

DROP TABLE IF EXISTS `vaisseau`;
CREATE TABLE IF NOT EXISTS `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurbat` int(11) NOT NULL,
  `typebat` int(11) NOT NULL,
  `univers` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) DEFAULT '0',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaisseau`
--

INSERT INTO `vaisseau` (`idvaisseau`, `idjoueurbat`, `typebat`, `univers`, `x`, `y`, `nomvaisseau`) VALUES
(1, 1, 5, 1, 3, 3, 'Vaisseau');

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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `variationstour`
--

INSERT INTO `variationstour` (`idtable`, `idjoueur`, `prodbiens`, `chantier`, `recherche`, `consobiens`) VALUES
(90, 1, 15, 40, 3, 8),
(91, 2, 30, 20, 1, 8),
(92, 3, 30, 20, 1, 8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
