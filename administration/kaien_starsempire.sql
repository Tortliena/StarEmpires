CREATE DATABASE IF NOT EXISTS `kaien_starsempire`;

USE `kaien_starsempire`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `c_bataille`;

CREATE TABLE `c_bataille` (
  `idbataille` int(11) NOT NULL AUTO_INCREMENT,
  `idflotteoffensive` int(11) NOT NULL,
  `idflottedefensive` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idbataille`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_batiment`;

CREATE TABLE `c_batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `c_batiment` VALUES (1,33,3);


DROP TABLE IF EXISTS `c_cargovaisseau`;

CREATE TABLE `c_cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `c_cargovaisseau` VALUES (1,1,31,1),
(2,2,31,1),
(3,3,31,1),
(4,4,31,1),
(5,5,31,1),
(6,6,31,1),
(7,7,31,1),
(8,8,31,1);


DROP TABLE IF EXISTS `c_champsasteroides`;

CREATE TABLE `c_champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `c_champsasteroides` VALUES (1,6,15,-2,3,6),
(2,2,18,-2,3,6),
(3,17,10,-2,3,6),
(4,9,6,-2,2,6),
(5,9,6,-2,3,8),
(6,3,18,-2,3,6),
(7,7,6,-3,2,36),
(8,14,9,-3,3,36),
(9,9,11,-3,5,36);


DROP TABLE IF EXISTS `c_composantvaisseau`;

CREATE TABLE `c_composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL COMMENT 'Si nég = modification de conception ou d''un vaisseau en cours',
  `iditemcomposant` int(11) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  `typecomposant` varchar(32) NOT NULL,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

INSERT INTO `c_composantvaisseau` VALUES (1,1,29,0,"arme"),
(2,1,29,0,"arme"),
(3,1,29,0,"arme"),
(4,1,29,0,"arme"),
(5,1,29,0,"arme"),
(6,2,29,0,"arme"),
(7,2,29,0,"arme"),
(8,2,29,0,"arme"),
(9,2,29,0,"arme"),
(10,2,29,0,"arme"),
(11,3,29,0,"arme"),
(12,3,29,0,"arme"),
(13,3,29,0,"arme"),
(14,3,29,0,"arme"),
(15,3,29,0,"arme"),
(16,4,29,0,"arme"),
(17,4,29,0,"arme"),
(18,4,29,0,"arme"),
(19,4,29,0,"arme"),
(20,4,29,0,"arme"),
(21,5,29,0,"arme"),
(22,5,29,0,"arme"),
(23,5,29,0,"arme"),
(24,5,29,0,"arme"),
(25,5,29,0,"arme"),
(26,6,29,0,"arme"),
(27,6,29,0,"arme"),
(28,6,29,0,"arme"),
(29,7,29,0,"arme"),
(30,7,29,0,"arme"),
(31,7,29,0,"arme"),
(32,8,29,0,"arme"),
(33,8,29,0,"arme"),
(34,8,29,0,"arme");


DROP TABLE IF EXISTS `c_construction`;

CREATE TABLE `c_construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `avancementneutrinos` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `prixneutrinos` int(11) NOT NULL DEFAULT '0',
  `idplaneteconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_destruction`;

CREATE TABLE `c_destruction` (
  `iddestruction` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetedestruction` int(11) NOT NULL,
  `idbatimentdestruction` int(11) NOT NULL,
  PRIMARY KEY (`iddestruction`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_etoileneutrinos`;

CREATE TABLE `c_etoileneutrinos` (
  `idetoileneutrinos` int(11) NOT NULL AUTO_INCREMENT,
  `xneutrinos` int(11) NOT NULL,
  `yneutrinos` int(11) NOT NULL,
  `universneutrinos` int(11) NOT NULL,
  `reserveneutrinos` int(11) NOT NULL,
  PRIMARY KEY (`idetoileneutrinos`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `c_etoileneutrinos` VALUES (1,7,6,-3,30),
(2,14,9,-3,30),
(3,9,11,-3,30);


DROP TABLE IF EXISTS `c_explore`;

CREATE TABLE `c_explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `c_explore` VALUES (1,2,3,3,2,1);


DROP TABLE IF EXISTS `c_flotte`;

CREATE TABLE `c_flotte` (
  `idflotte` int(11) NOT NULL AUTO_INCREMENT,
  `idplaneteflotte` int(11) NOT NULL COMMENT 'si id nég = flotte de défense invisible',
  `universflotte` int(11) NOT NULL DEFAULT '0',
  `xflotte` int(11) NOT NULL DEFAULT '0',
  `yflotte` int(11) DEFAULT '0',
  `nomflotte` varchar(32) NOT NULL DEFAULT 'Flotte de défense',
  `universdestination` int(11) NOT NULL DEFAULT '0',
  `xdestination` int(11) NOT NULL DEFAULT '0',
  `ydestination` int(11) NOT NULL DEFAULT '0',
  `typeordre` int(11) NOT NULL DEFAULT '0',
  `bloque` int(11) NOT NULL DEFAULT '0',
  `structuretotale` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idflotte`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `c_flotte` VALUES (1,0,-2,15,13,"Essain alien",0,0,0,0,0,0),
(2,0,-2,10,16,"Essain alien",0,0,0,0,0,0);


DROP TABLE IF EXISTS `c_limiteplanete`;

CREATE TABLE `c_limiteplanete` (
  `idlimiteplanete` int(11) NOT NULL,
  `popmax` int(11) NOT NULL DEFAULT '8',
  `scientmax` int(11) NOT NULL DEFAULT '1',
  `ouvriermax` int(11) NOT NULL DEFAULT '1',
  `soldatmax` int(11) NOT NULL DEFAULT '1',
  `maxbaselunaire` int(11) NOT NULL DEFAULT '0',
  `maxmegalopole` int(11) NOT NULL DEFAULT '1',
  `maxflotte` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlimiteplanete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `c_limiteplanete` VALUES (3,8,1,1,1,0,1,1);


DROP TABLE IF EXISTS `c_messagerie`;

CREATE TABLE `c_messagerie` (
  `idmessagerie` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueuremetteur` int(11) NOT NULL,
  `idjoueurrecepteur` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `supprimeemetteur` tinyint(1) NOT NULL DEFAULT '0',
  `supprimerecepteur` tinyint(1) NOT NULL DEFAULT '0',
  `textemessagerie` text NOT NULL,
  `titremessage` varchar(32) NOT NULL,
  `datemessage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idmessagerie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_messagerieinterne`;

CREATE TABLE `c_messagerieinterne` (
  `expediteur` varchar(64) NOT NULL,
  `idmessagerieinterne` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `titre` varchar(64) NOT NULL,
  `texte` text NOT NULL,
  PRIMARY KEY (`idmessagerieinterne`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_messagetour`;

CREATE TABLE `c_messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_planete`;

CREATE TABLE `c_planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `nomplanete` varchar(128) NOT NULL DEFAULT 'Planète sans nom',
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  `idjoueurplanete` int(11) NOT NULL DEFAULT '0',
  `biens` int(11) NOT NULL DEFAULT '300',
  `titane` int(11) NOT NULL DEFAULT '0',
  `neutrinos` int(11) NOT NULL DEFAULT '0',
  `taille` int(11) NOT NULL DEFAULT '8',
  `lune` int(11) NOT NULL DEFAULT '0',
  `organisation` int(11) NOT NULL DEFAULT '10',
  `efficacite` int(11) NOT NULL DEFAULT '0',
  `environnement` int(11) NOT NULL DEFAULT '0',
  `stabiliteenvironnement` int(11) NOT NULL DEFAULT '1000',
  `restauration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `c_planete` VALUES (1,"kiwntgteqd",12,5,-2,0,10,0,0,3,1,10,0,375,1000,0),
(2,"meesidkdta",4,13,-3,0,10,0,0,8,2,10,0,-2892,1000,0),
(3,"Planète sans nom",3,3,2,2,300,0,0,8,0,9000,100,0,1000,0);


DROP TABLE IF EXISTS `c_population`;

CREATE TABLE `c_population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `c_population` VALUES (1,3,1,0),
(2,3,1,0),
(3,3,1,0),
(4,3,1,0),
(5,3,1,0),
(6,3,1,0);


DROP TABLE IF EXISTS `c_rapportcombat`;

CREATE TABLE `c_rapportcombat` (
  `idrapportcombat` int(11) NOT NULL AUTO_INCREMENT,
  `idflotteattaquant` int(11) NOT NULL,
  `idflottedefenseur` int(11) NOT NULL,
  `texteattaquant` text NOT NULL,
  `textedefenseur` text NOT NULL,
  PRIMARY KEY (`idrapportcombat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_rech_joueur`;

CREATE TABLE `c_rech_joueur` (
  `idrechprinc` int(11) NOT NULL AUTO_INCREMENT,
  `ordrerecherche` int(11) NOT NULL,
  `idjoueurrecherche` int(11) NOT NULL,
  `idrech` int(11) NOT NULL,
  `avrech` int(11) NOT NULL DEFAULT '0',
  `rechnesc` int(11) NOT NULL DEFAULT '1000',
  `rechposs` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idrechprinc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_silo`;

CREATE TABLE `c_silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_station`;

CREATE TABLE `c_station` (
  `idstation` int(11) NOT NULL AUTO_INCREMENT,
  `nomstation` varchar(64) NOT NULL DEFAULT 'Nouvelle station',
  `xstation` int(11) NOT NULL,
  `ystation` int(11) NOT NULL,
  `universstation` int(11) NOT NULL,
  `idjoueurstation` int(11) NOT NULL,
  PRIMARY KEY (`idstation`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `c_station` VALUES (1,"Ydillia",10,10,-2,1),
(2,"Lilar",10,10,-3,1);


DROP TABLE IF EXISTS `c_tour`;

CREATE TABLE `c_tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  `fintour` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `c_tour` VALUES (1,"2020-09-26 23:55:31","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : <br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : <br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : <br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1);


DROP TABLE IF EXISTS `c_utilisateurs`;

CREATE TABLE `c_utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(32) NOT NULL,
  `motdepasse` varchar(1024) NOT NULL,
  `dateinscription` date DEFAULT NULL,
  `idevent` int(11) NOT NULL DEFAULT '0',
  `ideventsuivant` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '1',
  `recherche` int(11) NOT NULL DEFAULT '100',
  `niveauadmin` int(11) NOT NULL DEFAULT '0',
  `creditgalactique` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `c_utilisateurs` VALUES (1,"Galdonia","$2y$10$OafvevfCbK6plyA4Wfwpd.I1OlHFStFsuhaYXfQVLWR.Hn5Wmj.ei","2020-09-26",0,0,1,100,1,0),
(2,"qwe","$2y$10$XG/0./XIb/pjIi2DLIHRO.F4/jWoeKTXEkc1J5JZRYtGSwGTtkZNG","2020-09-26",0,0,1,100,1,0);


DROP TABLE IF EXISTS `c_vaisseau`;

CREATE TABLE `c_vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idflottevaisseau` int(11) NOT NULL DEFAULT '0' COMMENT 'Si nég = plan de vaisseau/id du joueur, si 0 = réparation',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  `vitesse` int(11) NOT NULL DEFAULT '-1',
  `capacitedesoute` int(11) NOT NULL DEFAULT '-1',
  `capaciteminage` int(11) NOT NULL DEFAULT '-1',
  `HPmaxvaisseau` int(11) NOT NULL DEFAULT '-1',
  `HPvaisseau` int(11) NOT NULL DEFAULT '-1',
  `biensvaisseau` int(11) NOT NULL DEFAULT '-1',
  `titanevaisseau` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `c_vaisseau` VALUES (1,1,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(2,1,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(3,1,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(4,1,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(5,1,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(6,2,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(7,2,"Vaisseau alien",-1,-1,-1,20,20,-1,-1),
(8,2,"Vaisseau alien",-1,-1,-1,20,20,-1,-1);


DROP TABLE IF EXISTS `c_variationstour`;

CREATE TABLE `c_variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `puissancemilitaire` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  `coutstockage` int(11) NOT NULL DEFAULT '0',
  `entretien` int(11) NOT NULL DEFAULT '0',
  `entretienflotte` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `c_variationstour` VALUES (1,3,30,0,0,0,6,0,0,0);


SET foreign_key_checks = 1;
