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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (316,1,"Étoiles filantes prévues.",NULL,NULL,NULL,NULL,NULL,NULL),
(317,2,"event9",NULL,NULL,NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(22,5,17,"noyau",0);


DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,1,0),
(2,1,3,0),
(3,1,1,0),
(4,1,3,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,2,0),
(10,1,2,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,11,26,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (15,1,6,2),
(14,1,12,1),
(16,1,8,2),
(21,1,17,5);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",880,63,5,0,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",871,0,9,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (4,1,5,-2,17,16,"Stackanov",2,3,1,19,19,340,100);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (313,1,25,40,3,10),
(314,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (352,1,"Un pegu a été chiant. Que voulez-vous faire ?",1,"Ne rien faire",2,"L\'exécuter",3,"l\'exécuter de manière originale"),
(353,2,"Le pégu qui râlait hier s\'est fatigué et est rentré chez lui",NULL,NULL,NULL,NULL,NULL,NULL);


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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `conceptionencours` VALUES (29,7,86,"noyau",17);


DROP TABLE IF EXISTS `construction`;

CREATE TABLE `construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT '0',
  `avancementtitane` int(11) NOT NULL DEFAULT '0',
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `idjoueurconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT '1',
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (84,1,1,20,0,60,0,1,1),
(85,2,1,30,0,50,0,1,2),
(86,-1,1,20,0,20,0,1,1);


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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (452,1,"Manque d\'ouvriers !","Construction",84);


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
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (136,7,0,0,1,1,6,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,2,0),
(2,1,1,0),
(3,1,1,0),
(4,1,1,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,1,0),
(10,1,1,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,26,26,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
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
  `biens` int(11) NOT NULL DEFAULT '200',
  `titane` int(11) NOT NULL DEFAULT '0',
  `idevent` int(11) NOT NULL DEFAULT '0',
  `ideventsuivant` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",405,63,7,1,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",1339,0,-1,0,2);


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
(7,1,5,1,0,0,"Vaisseau",1,10,1,7,7,90,0);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (349,1,40,20,1,10),
(350,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idjoueurbat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (352,1,"Un pegu a été chiant. Que voulez-vous faire ?",1,"Ne rien faire",2,"L\'exécuter",3,"l\'exécuter de manière originale"),
(353,2,"Le pégu qui râlait hier s\'est fatigué et est rentré chez lui",NULL,NULL,NULL,NULL,NULL,NULL);


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
  `idjoueurconst` int(11) NOT NULL,
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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (452,1,"Manque d\'ouvriers !","Construction",84);


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


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `joueurpop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,2,0),
(2,1,1,0),
(3,1,1,0),
(4,1,1,0),
(5,1,1,0),
(6,1,3,0),
(7,1,1,0),
(8,1,1,0),
(9,1,1,0),
(10,1,1,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,26,26,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueursilo` int(11) NOT NULL,
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
  `biens` int(11) NOT NULL DEFAULT '200',
  `titane` int(11) NOT NULL DEFAULT '0',
  `idevent` int(11) NOT NULL DEFAULT '0',
  `ideventsuivant` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",405,63,7,1,10),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",1339,0,-1,0,2);


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
  `idjoueur` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '5',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (349,1,40,20,1,10),
(350,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;

INSERT INTO `choixevents` VALUES (352,1,"Un pegu a été chiant. Que voulez-vous faire ?",1,"Ne rien faire",2,"L\'exécuter",3,"l\'exécuter de manière originale"),
(353,2,"Le pégu qui râlait hier s\'est fatigué et est rentré chez lui",NULL,NULL,NULL,NULL,NULL,NULL);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (452,1,"Manque d\'ouvriers !","Construction",84);


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
  `biens` int(11) NOT NULL DEFAULT '200',
  `titane` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Planète sans nom",3,3,1,1,200,0),
(2,"Planète sans nom",4,2,1,0,200,0),
(3,"Planète sans nom",3,3,2,0,200,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,2,1),
(2,1,1,2),
(3,1,1,3),
(4,1,1,0),
(5,1,1,0),
(6,1,3,1),
(7,1,1,0),
(8,1,1,0),
(9,1,1,0),
(10,1,1,0),
(11,2,3,0),
(12,2,2,0),
(13,2,1,0),
(14,2,1,0),
(15,2,1,0),
(16,2,1,0),
(17,2,1,0),
(18,2,1,0),
(19,2,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,26,26,1);


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
  `recherche` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$8kCNoB4CEESwaHKVKf.vwe7I8v0nIN18waCx9UpmqqBeQb7ZMQST.","2020-02-20",7,3,10,0),
(2,"rt","$2y$10$.8CGB1B3Tz0rmKKTjKwnQ.AC3UNKUP/vkTtMNF0r8Up3UeNoxUW5a","2020-02-28",-1,0,2,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (349,1,40,20,1,10),
(350,2,35,20,1,9);


SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;



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
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Planète sans nom",3,3,1,1,200,0),
(2,"Planète sans nom",4,2,1,0,200,0),
(3,"Planète sans nom",3,3,2,0,200,0),
(4,"Planète sans nom",3,3,3,3,200,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (24,4,1,0),
(23,4,1,0),
(22,4,1,0),
(21,4,1,0),
(20,4,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,26,26,1);


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
(3,"cv","$2y$10$uXo1On1fesKSoGnYi1QzK..ILY8YloCkR9MiAAh.iyT0hjpQiJQMy","2020-03-03",5,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;



SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;



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
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Planète sans nom",3,3,1,1,200,0),
(2,"Planète sans nom",4,2,1,0,200,0),
(3,"Planète sans nom",3,3,2,0,200,0),
(4,"Planète sans nom",3,3,3,3,200,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (24,4,1,0),
(23,4,1,0),
(22,4,1,0),
(21,4,1,0),
(20,4,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,26,26,1);


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
(3,"cv","$2y$10$uXo1On1fesKSoGnYi1QzK..ILY8YloCkR9MiAAh.iyT0hjpQiJQMy","2020-03-03",5,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;



SET foreign_key_checks = 1;
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



DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiments` VALUES (6,3,2),
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


DROP TABLE IF EXISTS `limitesjoueurs`;

CREATE TABLE `limitesjoueurs` (
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

INSERT INTO `limitesjoueurs` VALUES (1,1,1,9,1,1,0,1,1),
(2,1,1,9,1,1,0,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",17,2,0,"Perte d\'un vaisseau","Nous avons perdu le vaisseau Vaisseau en 5-5 lors d\'une bataille spatiale."),
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=469 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (468,3,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",4);


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
  `tailleeffective` int(11) NOT NULL DEFAULT '8',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"wrewr",3,3,1,1,200,0,6,8),
(2,"Planète sans nom",4,2,1,0,200,0,6,8),
(3,"Planète sans nom",3,3,2,0,200,0,6,8),
(4,"Planète sans nom",3,3,3,3,35,0,6,8);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (24,4,3,0),
(23,4,2,0),
(22,4,2,0),
(21,4,3,0),
(20,4,1,0),
(25,4,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18,17,2,7,26,26,1);


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
(3,"cv","$2y$10$uXo1On1fesKSoGnYi1QzK..ILY8YloCkR9MiAAh.iyT0hjpQiJQMy","2020-03-03",5,0,0,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (368,4,10,40,2,6);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (6,3,2),
(5,4,1),
(7,1,4);


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
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

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
(4,1,1,6,5,1,0,2);


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
("Ministre de la recherche",16,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=504 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (503,3,"Votre population ne pouvait pas grandir faute de place.","planete",4);


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
(4,"Ydillia",3,3,3,3,559,0,6,0);


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
  `idjoueurvaisseau` int(11) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (439,4,20,40,2,8);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,1),
(2,3,1);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (1,1,6,3);


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `conceptionencours`;

CREATE TABLE `conceptionencours` (
  `idconception` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseauconception` int(11) NOT NULL,
  `idconstruction` int(11) NOT NULL,
  `typecomposant` varchar(32) NOT NULL,
  `idnouvcomposant` int(11) NOT NULL,
  PRIMARY KEY (`idconception`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,1,3,3,1,9),
(2,1,2,2,1,11),
(3,1,1,1,1,12),
(4,1,2,1,1,14),
(5,1,3,1,1,15),
(6,1,4,1,1,16),
(7,1,4,2,1,19),
(12,1,1,4,1,49),
(11,1,1,3,1,48);


DROP TABLE IF EXISTS `limiteplanete`;

CREATE TABLE `limiteplanete` (
  `idlimiteplanete` int(11) NOT NULL,
  `maxchantier` int(11) NOT NULL DEFAULT '1',
  `maxcentrederecherche` int(11) NOT NULL DEFAULT '1',
  `popmax` int(11) NOT NULL DEFAULT '8',
  `scientmax` int(11) NOT NULL DEFAULT '1',
  `ouvriermax` int(11) NOT NULL DEFAULT '1',
  `maxbaselunaire` int(11) NOT NULL DEFAULT '0',
  `maxmegalopole` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlimiteplanete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `limiteplanete` VALUES (1,1,1,10,1,1,0,2),
(2,1,1,4,1,1,1,0),
(3,1,1,5,1,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (114,1,"Votre population ne pouvait pas grandir faute de place.","planete",1),
(115,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",3);


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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `planete`;

CREATE TABLE `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `nomplanete` varchar(128) NOT NULL DEFAULT 'Planète sans nom',
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  `idjoueurplanete` int(11) NOT NULL DEFAULT '0',
  `biens` int(11) NOT NULL DEFAULT '300',
  `titane` int(11) NOT NULL DEFAULT '0',
  `taille` int(11) NOT NULL DEFAULT '8',
  `lune` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,1067,0,8,0),
(3,"Planète sans nom",2,2,1,1,34,0,5,1);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,3,0),
(2,1,2,0),
(3,1,1,0),
(4,1,1,0),
(5,1,1,0),
(6,1,1,0),
(7,1,1,0),
(8,1,1,0),
(9,1,1,0),
(11,1,1,0),
(12,3,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,1,4,4,4,1),
(2,2,1,1,5,5,1),
(3,3,1,3,3,3,1),
(4,5,1,5,5,21,0),
(5,4,1,7,25,25,1),
(6,6,1,2,0,11,0),
(7,7,1,6,0,18,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,5,1);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurvaisseau` int(11) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (1,1,1,1,4,"Vaisseau",1,3,1,3,1,50,0);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (57,1,40,20,1,10),
(58,3,5,0,0,1);


SET foreign_key_checks = 1;
<<<<<<< HEAD
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,1),
(2,3,1),
(3,1,1),
(4,2,1),
(5,4,3);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (2,2,8,1),
(4,2,6,2);


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `composantvaisseau`;

CREATE TABLE `composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL,
  `iditemcomposant` int(11) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO `composantvaisseau` VALUES (9,13,10,"moteur",0),
(7,11,11,"arme",2),
(8,13,11,"arme",2),
(10,13,12,"soute",0),
(11,13,20,"arme",0);


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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (40,-11,1,50,0,50,0,1,7),
(39,-9,1,50,0,50,0,1,6),
(38,-9,1,50,0,50,0,1,5);


DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,1,3,3,1,9),
(2,1,2,2,1,11),
(3,1,1,1,1,12),
(4,1,2,1,1,14),
(5,1,3,1,1,15),
(6,1,4,1,1,16),
(7,1,4,2,1,19),
(13,1,1,2,1,63),
(12,1,1,4,1,49),
(11,1,1,3,1,48),
(14,1,2,3,1,70),
(15,1,2,4,1,71),
(16,1,2,5,1,72);


DROP TABLE IF EXISTS `limiteplanete`;

CREATE TABLE `limiteplanete` (
  `idlimiteplanete` int(11) NOT NULL,
  `maxchantier` int(11) NOT NULL DEFAULT '1',
  `maxcentrederecherche` int(11) NOT NULL DEFAULT '1',
  `popmax` int(11) NOT NULL DEFAULT '8',
  `scientmax` int(11) NOT NULL DEFAULT '1',
  `ouvriermax` int(11) NOT NULL DEFAULT '1',
  `maxbaselunaire` int(11) NOT NULL DEFAULT '0',
  `maxmegalopole` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idlimiteplanete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `limiteplanete` VALUES (1,1,1,10,5,5,0,2),
(2,1,1,4,1,1,1,0),
(3,1,1,6,1,1,1,0),
(4,1,1,8,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Conseil civil",26,2,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Ministre de la recherche",23,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteur interstellaire\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",24,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",25,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (313,1,"Votre population ne pouvait pas grandir faute de place.","planete",1),
(314,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",3),
(315,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",4),
(316,1," : Construction finie","planete",1),
(317,3,"Manque d\'ouvriers !","Construction",22),
(318,1,"Soutes larges : Construction finie","planete",3),
(319,2,"Vous venez de finir une recherche","recherche",0);


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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (46,6,-1,-1,-1,1,9,2),
(45,5,-1,-1,-1,1,9,2),
(47,7,-1,-1,-1,1,9,2),
(48,8,-1,-1,-1,1,9,2),
(49,9,-1,-1,-1,1,9,2),
(50,11,-1,-1,-1,1,9,2),
(51,12,-1,-1,-1,2,9,2),
(52,13,-1,-1,-1,1,9,2);


DROP TABLE IF EXISTS `planete`;

CREATE TABLE `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `nomplanete` varchar(128) NOT NULL DEFAULT 'Planète sans nom',
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  `idjoueurplanete` int(11) NOT NULL DEFAULT '0',
  `biens` int(11) NOT NULL DEFAULT '300',
  `titane` int(11) NOT NULL DEFAULT '0',
  `taille` int(11) NOT NULL DEFAULT '8',
  `lune` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,1012,0,8,0),
(3,"Planète sans nom",2,2,1,1,11,19,5,1),
(4,"Planète sans nom",3,3,2,2,195,0,8,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,3,0),
(2,1,2,0),
(3,1,3,0),
(4,1,3,0),
(5,1,3,0),
(6,1,2,0),
(7,1,2,0),
(8,1,1,0),
(9,1,1,0),
(11,1,1,0),
(12,3,2,0),
(13,3,1,0),
(14,3,1,0),
(15,4,3,0),
(16,4,2,0),
(17,4,1,0),
(18,4,1,0),
(19,4,1,0),
(20,4,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,1,4,4,4,1),
(2,2,1,1,5,5,1),
(3,3,1,3,3,3,1),
(4,5,1,5,23,21,1),
(5,4,1,7,25,25,1),
(6,6,1,2,12,11,1),
(7,7,1,6,20,18,1),
(8,8,1,8,0,0,0),
(9,9,1,9,0,0,0),
(10,10,1,10,0,31,0),
(11,11,2,4,4,4,1),
(12,12,2,1,0,5,0),
(13,13,2,3,0,3,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,1,6,5),
(3,1,12,4),
(5,3,10,2),
(6,3,12,3);


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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,20,4),
(2,"zx","$2y$10$rf9.RhcE8x6FG.iKdkw/1eEnbt6P4E1x9iKyfvMrEahwYKVkuPsGO","2020-03-08",0,0,2,1);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurvaisseau` int(11) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (13,-1,0,0,0,"Grosvaisseau",2,10,3,11,11,180,0),
(9,-1,0,0,0,"petitvaisseau",1,3,1,3,3,50,0),
(12,-2,0,0,0,"Vaisseau d\'exploration",1,3,1,3,3,50,0),
(11,-1,0,0,0,"moyen vaisseau",1,3,3,5,5,100,0),
(10,1,0,1,0,"Vaisseau",1,3,1,3,3,50,0);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (164,1,15,60,4,10),
(165,3,10,20,0,3),
(166,4,20,20,1,6);


SET foreign_key_checks = 1;
=======
>>>>>>> master
