CREATE DATABASE IF NOT EXISTS `gamer`;

USE `gamer`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `bataille`;

CREATE TABLE `bataille` (
  `idbataille` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauoffensif` int(11) NOT NULL,
  `idvaisseaudefensif` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idbataille`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (6,3,2),
(5,4,1);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (12,2,6,10);


DROP TABLE IF EXISTS `choixevents`;

CREATE TABLE `choixevents` (
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
) ENGINE=MyISAM AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

INSERT INTO `composantvaisseau` VALUES (18,4,17,"noyau",0),
(9,2,10,"moteur",0),
(7,2,12,"soute",0),
(10,1,10,"moteur",0),
(11,4,10,"moteur",0),
(12,1,14,"arme",2),
(13,2,14,"arme",2),
(20,5,10,"moteur",0),
(19,4,19,"arme",2),
(15,1,15,"coque",0),
(16,4,15,"coque",0),
(17,2,15,"coque",0),
(21,5,12,"soute",0),
(22,5,17,"noyau",0),
(23,7,12,"soute",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

INSERT INTO `conceptionencours` VALUES (34,7,91,0,0);


DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idplaneteconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (84,1,1,20,0,60,0,1,9),
(85,2,1,30,0,50,0,1,11),
(91,-2,1,99,0,99,0,1,12);


DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,1,3,3,1,11),
(2,1,2,3,1,12),
(3,1,1,2,1,13),
(4,1,1,1,1,14),
(5,1,2,2,1,15),
(6,1,3,2,1,16),
(7,1,4,2,1,17),
(8,1,4,4,1,27),
(9,1,5,5,1,28),
(10,1,5,4,1,29),
(11,1,1,3,1,41),
(12,1,1,4,1,42),
(13,1,1,5,1,43),
(14,1,2,1,1,105),
(15,1,4,1,1,106),
(16,1,3,4,1,123),
(17,1,2,4,1,123),
(18,1,4,3,1,123),
(19,1,3,1,1,125),
(20,1,3,5,1,125),
(21,1,2,5,1,125),
(22,1,5,3,1,126),
(23,1,4,5,1,126),
(24,1,5,1,1,126),
(25,-2,8,18,1,189),
(26,1,13,1,1,193),
(27,-2,10,3,1,208),
(28,-2,14,14,1,230),
(29,-2,13,12,1,238),
(30,-2,11,10,1,239),
(31,-2,9,8,1,240),
(32,-2,7,6,1,241),
(33,-2,5,5,1,242),
(34,-2,5,6,1,243),
(35,-2,3,3,1,247),
(36,-2,3,2,1,248),
(37,-2,3,4,1,249),
(38,-2,3,6,1,250),
(39,-2,3,8,1,251),
(40,-2,3,10,1,252),
(41,-2,3,12,1,253),
(42,-2,3,14,1,254),
(43,-2,3,16,1,255),
(44,-2,3,17,1,256),
(45,-2,5,16,1,257),
(46,-2,7,16,1,258),
(47,-2,9,16,1,259),
(48,-2,11,16,1,260),
(49,-2,13,16,1,261),
(50,-2,15,16,1,262),
(51,-2,17,16,1,263);


DROP TABLE IF EXISTS `limiteplanete`;

CREATE TABLE `limiteplanete` (
  `idlimiteplanete` int(11) NOT NULL,
  `maxchantier` int(11) NOT NULL DEFAULT '0',
  `maxcentrederecherche` int(11) NOT NULL DEFAULT '0',
  `popmax` int(11) NOT NULL DEFAULT '8',
  `scientmax` int(11) NOT NULL DEFAULT '1',
  `ouvriermax` int(11) NOT NULL DEFAULT '1',
  `maxbaselunaire` int(11) NOT NULL DEFAULT '0',
  `maxmegalopole` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idlimiteplanete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `limiteplanete` VALUES (2,0,0,8,1,1,0,5),
(1,0,0,8,1,1,0,0),
(3,0,0,8,1,1,0,0),
(4,1,1,6,1,1,0,2);


DROP TABLE IF EXISTS `messagerie`;

CREATE TABLE `messagerie` (
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



DROP TABLE IF EXISTS `messagerieinterne`;

CREATE TABLE `messagerieinterne` (
  `expediteur` varchar(64) NOT NULL,
  `idmessagerieinterne` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `titre` varchar(64) NOT NULL,
  `texte` text NOT NULL,
  PRIMARY KEY (`idmessagerieinterne`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",22,3,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",23,3,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `ordredeplacement`;

CREATE TABLE `ordredeplacement` (
  `idordredeplacement` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaudeplacement` int(11) NOT NULL,
  `xdestination` int(11) NOT NULL,
  `ydestination` int(11) NOT NULL,
  `universdestination` int(11) NOT NULL,
  `idjoueurduvaisseau` int(11) NOT NULL,
  `typeordre` int(11) NOT NULL DEFAULT '0',
  `bloque` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idordredeplacement`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (141,7,0,0,1,1,7,0);


DROP TABLE IF EXISTS `planete`;

CREATE TABLE `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `nomplanete` varchar(128) NOT NULL DEFAULT 'Planète sans nom',
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  `idjoueurplanete` int(11) NOT NULL,
  `biens` int(11) NOT NULL DEFAULT '300',
  `titane` int(11) NOT NULL DEFAULT '0',
  `taille` int(11) NOT NULL DEFAULT '8',
  `lune` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"wrewr",3,3,1,1,200,0,6,0),
(2,"Planète sans nom",4,2,1,0,200,0,6,0),
(3,"Planète sans nom",3,3,2,0,200,0,6,0),
(4,"Ydillia",3,3,3,3,507,0,6,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (24,4,3,0),
(23,4,2,0),
(22,4,2,0),
(21,4,3,0),
(20,4,1,0),
(25,4,1,0),
(26,4,1,0),
(27,4,1,0);


DROP TABLE IF EXISTS `rech_joueur`;

CREATE TABLE `rech_joueur` (
  `idrechprinc` int(11) NOT NULL AUTO_INCREMENT,
  `ordrerecherche` int(11) NOT NULL,
  `idjoueurrecherche` int(11) NOT NULL,
  `idrech` int(11) NOT NULL,
  `avrech` int(11) NOT NULL DEFAULT '0',
  `rechnesc` int(11) NOT NULL DEFAULT '1000',
  `rechposs` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idrechprinc`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,1,4,3,3,1),
(2,2,1,1,3,3,1),
(3,3,1,3,4,4,1),
(4,4,1,5,30,30,1),
(5,5,1,7,30,29,1),
(6,3,1,2,18,18,1),
(7,6,1,6,18,16,1),
(8,7,1,10,39,36,1),
(9,8,1,11,24,24,1),
(12,11,1,15,155,151,1),
(13,12,1,14,43,41,1),
(14,13,2,4,3,3,1),
(15,14,2,1,5,5,1),
(16,15,2,3,5,5,1),
(17,16,2,5,27,27,1),
(18,17,2,7,26,26,1),
(19,18,3,4,4,4,1),
(20,19,3,1,6,5,1),
(21,20,3,3,6,5,1),
(22,21,3,5,16,15,1),
(23,22,3,7,24,23,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(32) NOT NULL,
  `motdepasse` varchar(1024) NOT NULL,
  `dateinscription` date DEFAULT NULL,
  `idevent` int(11) NOT NULL DEFAULT '0',
  `ideventsuivant` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",-3,3,10,0),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",6,0,2,0),
(3,"cv","$2y$10$uXo1On1fesKSoGnYi1QzK..ILY8YloCkR9MiAAh.iyT0hjpQiJQMy","2020-03-03",5,0,2,2);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100),
(7,1,5,1,0,0,"Vaisseau",1,10,1,7,1,90,0);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=429 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (428,4,20,40,2,8);


SET foreign_key_checks = 1;
