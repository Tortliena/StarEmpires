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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,1),
(2,3,1),
(3,1,1),
(4,2,1),
(5,4,3),
(6,3,5);


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
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  `typecomposant` varchar(32) NOT NULL,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

INSERT INTO `composantvaisseau` VALUES (38,44,11,2,"arme"),
(37,44,11,2,"arme"),
(36,44,11,2,"arme"),
(35,44,10,0,"moteur"),
(34,43,10,0,"moteur"),
(33,42,10,0,"moteur"),
(39,44,11,2,"arme"),
(40,44,12,0,"soute"),
(41,44,12,0,"soute");


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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (70,12,1,40,0,40,0,1,2),
(72,-42,1,50,0,50,0,3,3);


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
(3,1,1,6,1,1,1,1),
(4,1,1,8,1,1,0,1),
(5,1,1,9,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Ministre de la recherche",28,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",27,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Conseil civil",26,2,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
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
) ENGINE=MyISAM AUTO_INCREMENT=438 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (434,1,"Votre population ne pouvait pas grandir faute de place.","planete",1),
(435,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",3),
(436,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",4),
(437,3,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.","planete",5);


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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (70,44,-1,-1,-1,1,9,2),
(69,43,-1,-1,-1,1,9,2),
(68,42,-1,-1,-1,1,9,2),
(67,40,-1,-1,-1,1,9,2),
(66,39,-1,-1,-1,1,9,2),
(65,38,-1,-1,-1,1,9,2),
(64,37,-1,-1,-1,1,9,2),
(63,36,-1,-1,-1,1,9,2),
(71,45,-1,-1,-1,1,9,2);


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
  `organisation` int(11) NOT NULL,
  `efficacite` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,672,0,8,0,92,1),
(3,"Planète sans nom",2,2,1,1,176,13,5,1,908,23),
(4,"Planète sans nom",3,3,2,2,555,0,8,0,1000,14),
(5,"Planète sans nom",3,3,3,3,257,0,8,0,1000,17);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

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
(20,4,1,0),
(21,4,1,0),
(22,3,1,0),
(23,5,2,0),
(24,5,1,0),
(25,5,1,0),
(26,5,1,0),
(27,5,1,0),
(28,5,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

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
(12,12,2,1,5,5,1),
(13,13,2,3,3,3,1),
(14,14,2,5,13,17,0),
(15,15,2,7,0,17,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,1,6,7),
(3,1,12,4),
(9,1,11,1),
(5,3,10,1),
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,20,0),
(2,"zx","$2y$10$rf9.RhcE8x6FG.iKdkw/1eEnbt6P4E1x9iKyfvMrEahwYKVkuPsGO","2020-03-08",0,0,2,0),
(3,"ui","$2y$10$QwhNjre1BvPv1PYXW7qHWuFm7MNGswFPFSAJmKT7UC12MMcUPXwIa","2020-03-14",0,0,0,1);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurvaisseau` int(11) NOT NULL,
  `univers` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) DEFAULT '0',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  `vitesse` int(11) NOT NULL DEFAULT '-1',
  `capacitedesoute` int(11) NOT NULL DEFAULT '-1',
  `capaciteminage` int(11) NOT NULL DEFAULT '-1',
  `HPmaxvaisseau` int(11) NOT NULL DEFAULT '-1',
  `HPvaisseau` int(11) NOT NULL DEFAULT '-1',
  `biensvaisseau` int(11) NOT NULL DEFAULT '-1',
  `titanevaisseau` int(11) NOT NULL DEFAULT '-1',
  `structure` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (44,-1,0,0,0,"gtr",2,10,3,24,24,370,0,-2),
(43,-1,0,0,0,"eqweq",2,3,1,8,8,90,0,-10),
(42,-1,0,0,0,"Gros vaisseau moche",2,3,1,8,8,90,0,-10),
(45,-1,0,0,0,"petit",1,3,1,3,-1,50,0,-12);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (240,1,0,0,0,10),
(241,3,3,4,0,4),
(242,4,3,2,0,7),
(243,5,4,3,0,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,1),
(2,3,1),
(3,1,1),
(4,2,1),
(5,4,3),
(6,3,5);


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
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  `typecomposant` varchar(32) NOT NULL,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

INSERT INTO `composantvaisseau` VALUES (38,44,11,2,"arme"),
(37,44,11,2,"arme"),
(36,44,11,2,"arme"),
(35,44,10,0,"moteur"),
(34,43,10,0,"moteur"),
(33,42,10,0,"moteur"),
(39,44,11,2,"arme"),
(40,44,12,0,"soute"),
(41,44,12,0,"soute"),
(42,42,11,0,"arme"),
(43,42,11,0,"arme"),
(44,43,11,0,"arme"),
(45,42,12,0,"soute"),
(46,42,12,0,"soute"),
(47,42,12,0,"soute");


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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (70,12,1,25,0,40,0,1,2),
(72,-42,1,38,0,50,0,3,3);


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
(3,1,1,6,1,1,1,1),
(4,1,1,8,1,1,0,1),
(5,1,1,9,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Ministre de la recherche",28,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",27,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Conseil civil",26,2,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
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
) ENGINE=MyISAM AUTO_INCREMENT=460 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (454,1,"Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.","planete",1),
(455,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",3),
(456,1,"Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.","planete",4),
(457,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 3%)","planete",5),
(458,1,"Manque d\'ouvriers !","Construction",70),
(459,3,"Manque d\'ouvriers !","Construction",72);


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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (70,44,-1,-1,-1,1,9,2),
(69,43,-1,-1,-1,1,9,2),
(68,42,-1,-1,-1,1,9,2),
(67,40,-1,-1,-1,1,9,2),
(66,39,-1,-1,-1,1,9,2),
(65,38,-1,-1,-1,1,9,2),
(64,37,-1,-1,-1,1,9,2),
(63,36,-1,-1,-1,1,9,2),
(71,45,-1,-1,-1,1,9,2);


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
  `organisation` int(11) NOT NULL,
  `efficacite` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,651,0,8,0,2353,26),
(3,"Planète sans nom",2,2,1,1,169,13,5,1,2466,62),
(4,"Planète sans nom",3,3,2,1,560,0,8,0,3484,50),
(5,"Planète sans nom",3,3,3,1,269,0,8,0,4521,75);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (2,1,2,0),
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
(20,4,1,0),
(21,4,1,0),
(22,3,1,0),
(23,5,2,0),
(24,5,1,0),
(25,5,1,0),
(26,5,1,0),
(27,5,1,0),
(28,5,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

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
(12,12,2,1,5,5,1),
(13,13,2,3,3,3,1),
(14,14,2,5,13,17,0),
(15,15,2,7,0,17,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,1,6,7),
(3,1,12,4),
(9,1,11,1),
(5,3,10,1),
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,20,0),
(2,"zx","$2y$10$rf9.RhcE8x6FG.iKdkw/1eEnbt6P4E1x9iKyfvMrEahwYKVkuPsGO","2020-03-08",0,0,2,0),
(3,"ui","$2y$10$QwhNjre1BvPv1PYXW7qHWuFm7MNGswFPFSAJmKT7UC12MMcUPXwIa","2020-03-14",0,0,0,1);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurvaisseau` int(11) NOT NULL,
  `univers` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) DEFAULT '0',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  `vitesse` int(11) NOT NULL DEFAULT '-1',
  `capacitedesoute` int(11) NOT NULL DEFAULT '-1',
  `capaciteminage` int(11) NOT NULL DEFAULT '-1',
  `HPmaxvaisseau` int(11) NOT NULL DEFAULT '-1',
  `HPvaisseau` int(11) NOT NULL DEFAULT '-1',
  `biensvaisseau` int(11) NOT NULL DEFAULT '-1',
  `titanevaisseau` int(11) NOT NULL DEFAULT '-1',
  `structure` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (44,-1,0,0,0,"gtr",2,20,3,24,24,360,0,-1),
(43,-1,0,0,0,"eqweq",2,1,3,10,10,130,0,-8),
(42,-1,0,0,0,"hih",2,30,3,24,24,300,0,-1),
(45,-1,0,0,0,"petit",1,1,0,3,-1,40,0,-11);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (244,1,3,15,0,9),
(245,3,9,12,0,4),
(246,4,12,10,0,7),
(247,5,18,15,0,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,1),
(2,3,1),
(3,1,1),
(4,2,1),
(5,4,3),
(6,3,5);


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
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  `typecomposant` varchar(32) NOT NULL,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

INSERT INTO `composantvaisseau` VALUES (38,44,11,2,"arme"),
(37,44,11,2,"arme"),
(36,44,11,2,"arme"),
(35,44,10,0,"moteur"),
(34,43,10,0,"moteur"),
(33,42,10,0,"moteur"),
(39,44,11,2,"arme"),
(40,44,12,0,"soute"),
(41,44,12,0,"soute"),
(42,42,11,2,"arme"),
(43,42,11,2,"arme"),
(44,43,11,2,"arme"),
(45,42,12,0,"soute"),
(46,42,12,0,"soute"),
(47,42,12,0,"soute"),
(48,46,10,0,"moteur"),
(49,46,11,2,"arme"),
(50,46,11,2,"arme"),
(51,46,12,0,"soute"),
(52,46,12,0,"soute"),
(53,46,12,0,"soute");


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
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (70,12,1,17,0,40,0,1,2);


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
(3,1,1,6,1,1,1,1),
(4,1,1,8,1,1,0,1),
(5,1,1,9,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Ministre de la recherche",28,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",27,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Conseil civil",26,2,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
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
) ENGINE=MyISAM AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (474,1,"Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.","planete",1),
(475,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",3),
(476,1,"Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.","planete",4),
(477,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 3%)","planete",5),
(478,1,"Moteur II : Construction finie","planete",1),
(479,1,"Manque d\'ouvriers !","Construction",70),
(480,3,"Manque d\'ouvriers !","Construction",72),
(481,1," : Construction finie","planete",3);


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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (70,44,-1,-1,-1,1,9,2),
(69,43,-1,-1,-1,1,9,2),
(68,42,-1,-1,-1,1,9,2),
(67,40,-1,-1,-1,1,9,2),
(66,39,-1,-1,-1,1,9,2),
(65,38,-1,-1,-1,1,9,2),
(64,37,-1,-1,-1,1,9,2),
(63,36,-1,-1,-1,1,9,2),
(71,45,-1,-1,-1,1,9,2);


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
  `organisation` int(11) NOT NULL,
  `efficacite` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,588,0,8,0,2467,27),
(3,"Planète sans nom",2,2,1,1,148,13,5,1,2752,69),
(4,"Planète sans nom",3,3,2,1,579,0,8,0,3912,56),
(5,"Planète sans nom",3,3,3,1,312,0,8,0,5233,87),
(6,"gvybtmcyjb",13,17,-2,0,10,0,6,1,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (2,1,2,0),
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
(20,4,1,0),
(21,4,1,0),
(22,3,1,0),
(23,5,2,0),
(24,5,1,0),
(25,5,1,0),
(26,5,1,0),
(27,5,1,0),
(28,5,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

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
(12,12,2,1,5,5,1),
(13,13,2,3,3,3,1),
(14,14,2,5,13,17,0),
(15,15,2,7,0,17,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,1,6,7),
(3,1,12,4),
(9,1,11,1),
(5,3,10,1),
(6,3,12,3),
(10,1,10,1);


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

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,20,0),
(2,"zx","$2y$10$rf9.RhcE8x6FG.iKdkw/1eEnbt6P4E1x9iKyfvMrEahwYKVkuPsGO","2020-03-08",0,0,2,0),
(3,"ui","$2y$10$QwhNjre1BvPv1PYXW7qHWuFm7MNGswFPFSAJmKT7UC12MMcUPXwIa","2020-03-14",0,0,0,1);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurvaisseau` int(11) NOT NULL,
  `univers` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) DEFAULT '0',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  `vitesse` int(11) NOT NULL DEFAULT '-1',
  `capacitedesoute` int(11) NOT NULL DEFAULT '-1',
  `capaciteminage` int(11) NOT NULL DEFAULT '-1',
  `HPmaxvaisseau` int(11) NOT NULL DEFAULT '-1',
  `HPvaisseau` int(11) NOT NULL DEFAULT '-1',
  `biensvaisseau` int(11) NOT NULL DEFAULT '-1',
  `titanevaisseau` int(11) NOT NULL DEFAULT '-1',
  `structure` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (44,-1,0,0,0,"gtr",2,20,3,24,24,360,0,-1),
(43,-1,0,0,0,"eqweq",2,1,3,10,10,130,0,-8),
(42,-1,0,0,0,"hih",2,30,3,24,24,300,0,-1),
(45,-1,0,0,0,"petit",1,1,0,3,-1,40,0,-11),
(46,1,0,3,0,"Vaisseau",2,30,3,24,24,300,0,-1);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=272 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (264,1,4,16,0,9),
(265,3,10,13,0,4),
(266,4,14,11,0,7),
(267,5,21,17,0,6),
(268,1,4,16,0,9),
(269,3,10,13,0,4),
(270,4,14,11,0,7),
(271,5,21,17,0,6);


SET foreign_key_checks = 1;
