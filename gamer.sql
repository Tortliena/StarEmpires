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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,1),
(2,3,1),
(3,1,1),
(4,2,1),
(5,4,3),
(6,3,5),
(7,3,15);


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
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

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
(53,46,12,0,"soute"),
(54,43,11,0,"arme"),
(55,43,14,0,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;



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
(5,1,1,9,1,1,0,1),
(15,1,1,9,1,1,0,1),
(6,1,1,8,1,1,0,1),
(7,1,1,8,1,1,0,1),
(8,1,1,8,1,1,0,1),
(9,1,1,8,1,1,0,1),
(10,1,1,8,1,1,0,1),
(11,1,1,8,1,1,0,1),
(12,1,1,8,1,1,0,1),
(13,1,1,8,1,1,0,1),
(14,1,1,8,1,1,0,1),
(16,1,1,8,1,1,0,1),
(17,1,1,8,1,1,0,1),
(18,1,1,8,1,1,0,1),
(19,1,1,8,1,1,0,1),
(20,1,1,8,1,1,0,1),
(21,1,1,8,1,1,0,1),
(22,1,1,8,1,1,0,1),
(23,1,1,8,1,1,0,1),
(24,1,1,8,1,1,0,1),
(25,1,1,8,1,1,0,1),
(26,1,1,8,1,1,0,1),
(27,1,1,8,1,1,0,1),
(28,1,1,8,1,1,0,1),
(29,1,1,8,1,1,0,1),
(30,1,1,8,1,1,0,1),
(31,1,1,8,1,1,0,1),
(32,1,1,8,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Ministre de la recherche",28,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",27,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Conseil civil",26,2,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Ministre de la recherche",23,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteur interstellaire\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",24,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",25,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",29,5,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteur interstellaire\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",30,5,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",31,5,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Conseil civil",32,5,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Ministre de la recherche",33,5,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",34,5,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=591 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (586,1,"Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.","planete",1),
(587,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 4%)","planete",3),
(588,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",4),
(589,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 5%)","planete",5),
(590,5,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 7%)","planete",15);


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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (70,44,-1,-1,-1,1,9,2),
(69,43,-1,-1,-1,1,9,2),
(68,42,-1,-1,-1,1,9,2),
(67,40,-1,-1,-1,1,9,2),
(66,39,-1,-1,-1,1,9,2),
(65,38,-1,-1,-1,1,9,2),
(64,37,-1,-1,-1,1,9,2),
(63,36,-1,-1,-1,1,9,2),
(71,45,-1,-1,-1,1,9,2),
(72,47,-1,-1,-1,5,9,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,481,0,8,0,3188,35),
(3,"Planète sans nom",2,2,1,1,320,13,5,1,4405,110),
(4,"Planète sans nom",3,3,2,1,822,0,8,0,7692,110),
(5,"Planète sans nom",3,3,3,1,667,0,8,0,6758,113),
(6,"gvybtmcyjb",13,17,-2,0,10,0,6,1,10,0),
(7,"guvtpbakle",13,9,-2,0,10,0,6,3,10,0),
(8,"iewhvbuqbg",8,10,-2,0,10,0,3,3,10,0),
(9,"xxfctctwin",8,8,-2,0,10,0,6,1,10,0),
(10,"pemjienfqg",2,2,-2,0,10,0,5,0,10,0),
(11,"eghcnxyifc",19,9,-2,0,10,0,4,1,10,0),
(12,"hngktwxves",9,20,-2,0,10,0,6,2,10,0),
(13,"khqdulwlaq",16,19,-2,0,10,0,4,1,10,0),
(14,"utywbaakhg",2,17,-2,0,10,0,3,2,10,0),
(15,"Florida",3,3,5,5,261,0,8,0,9638,161),
(16,"jcxbwkinsm",16,4,-2,0,10,0,4,0,10,0),
(17,"xpgkncpimr",3,3,-2,0,10,0,3,2,10,0),
(18,"vdmdqmfyer",6,18,-2,0,10,0,6,0,10,0),
(19,"xwimchfsyr",7,16,-2,0,10,0,6,3,10,0),
(20,"hykicsvawx",3,7,-2,0,10,0,5,2,10,0),
(21,"ellsumgsjn",14,2,-2,0,10,0,5,0,10,0),
(22,"kkcfnmefuf",6,4,-2,0,10,0,6,3,10,0),
(23,"helfbgnkfi",1,20,-2,0,10,0,4,0,10,0),
(24,"xvkujbudrp",2,18,-2,0,10,0,4,2,10,0),
(25,"wfdlhwwlcp",12,16,-2,0,10,0,3,2,10,0),
(26,"xjcskidjfc",4,7,-2,0,10,0,4,3,10,0),
(27,"wupspcmncd",7,13,-2,0,10,0,3,3,10,0),
(28,"wthfulyufq",18,12,-2,0,10,0,3,3,10,0),
(29,"xvfmbavbje",8,4,-2,0,10,0,6,1,10,0),
(30,"nhytukgsrc",11,12,-2,0,10,0,4,1,10,0),
(31,"hvnpkcuhmt",16,8,-2,0,10,0,6,3,10,0),
(32,"kmifjqauqs",15,9,-2,0,10,0,4,1,10,0),
(33,"fgthrtqyye",7,14,-2,0,10,0,3,2,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (29,15,3,0),
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
(28,5,1,0),
(30,15,2,0),
(31,15,1,0),
(32,15,1,0),
(33,15,1,0),
(34,15,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,1,4,4,4,1),
(2,2,1,1,5,5,1),
(3,3,1,3,3,3,1),
(4,5,1,5,23,21,1),
(5,4,1,7,25,25,1),
(6,6,1,2,12,11,1),
(7,7,1,6,20,18,1),
(18,18,5,3,100,6,1),
(17,17,5,1,100,6,1),
(10,10,1,10,186,31,1),
(11,11,2,4,4,4,1),
(12,12,2,1,5,5,1),
(13,13,2,3,3,3,1),
(14,14,2,5,13,17,0),
(15,15,2,7,0,17,0),
(16,16,5,4,3,3,1),
(19,19,5,5,100,2445,0),
(20,20,5,7,0,2910,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,1,6,7),
(3,1,12,5),
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
  `recherche` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,20,205),
(2,"zx","$2y$10$rf9.RhcE8x6FG.iKdkw/1eEnbt6P4E1x9iKyfvMrEahwYKVkuPsGO","2020-03-08",0,0,2,0),
(3,"ui","$2y$10$QwhNjre1BvPv1PYXW7qHWuFm7MNGswFPFSAJmKT7UC12MMcUPXwIa","2020-03-14",0,0,0,1),
(4,"er","$2y$10$97ZfonZD8U7x/1KfPEQ0yudXsm1XQE5AhUMe5fhkXjrepLfsgy80O","2020-03-20",0,0,0,1),
(5,"ty","$2y$10$G2GYjSTS4P1fQFs6O48b5eVeRf8cFgQm7o.guibzPVS90SDprNYTy","2020-03-20",0,0,2,100);


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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (44,-1,0,0,0,"gtr",2,20,3,24,24,360,0,-1),
(43,-1,0,0,0,"eqweq",2,1,3,14,14,280,0,-5),
(42,-1,0,0,0,"hih",2,30,3,24,24,300,0,-1),
(45,-1,0,0,0,"petit",1,1,0,3,-1,40,0,-11),
(46,1,0,3,0,"Vaisseau",2,30,3,24,24,300,0,-1),
(47,-5,0,0,0,"Vaisseau d\'exploration",1,1,0,3,-1,40,0,-11),
(48,5,0,15,0,"Vaisseau",1,1,0,3,-1,40,0,-11),
(49,-5,0,0,0,"Vaisseau d\'exploration",1,1,0,3,-1,40,0,-11);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (363,1,5,21,105,9),
(364,3,15,20,0,4),
(365,4,25,20,100,7),
(366,5,25,20,0,6),
(367,15,20,20,100,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;



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
(5,1,1,9,1,1,0,1),
(6,1,1,8,1,1,0,1),
(7,1,1,8,1,1,0,1),
(8,1,1,8,1,1,0,1),
(9,1,1,8,1,1,0,1),
(10,1,1,8,1,1,0,1),
(11,1,1,8,1,1,0,1),
(12,1,1,8,1,1,0,1),
(13,1,1,8,1,1,0,1),
(14,1,1,8,1,1,0,1),
(15,1,1,8,1,1,0,1),
(16,1,1,8,1,1,0,1),
(17,1,1,8,1,1,0,1),
(18,1,1,8,1,1,0,1),
(19,1,1,8,1,1,0,1),
(20,1,1,8,1,1,0,1),
(21,1,1,8,1,1,0,1),
(22,1,1,8,1,1,0,1),
(23,1,1,8,1,1,0,1),
(24,1,1,8,1,1,0,1),
(25,1,1,8,1,1,0,1),
(26,1,1,8,1,1,0,1),
(27,1,1,8,1,1,0,1),
(28,1,1,8,1,1,0,1),
(29,1,1,8,1,1,0,1),
(30,1,1,8,1,1,0,1),
(31,1,1,8,1,1,0,1),
(32,1,1,8,1,1,0,1),
(33,1,1,8,1,1,0,1),
(34,1,1,8,1,1,0,1),
(35,1,1,8,1,1,0,1),
(36,1,1,8,1,1,0,1),
(37,1,1,8,1,1,0,1),
(38,1,1,8,1,1,0,1),
(39,1,1,8,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=653 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (648,1,"Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.","planete",1),
(649,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",3),
(650,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",4),
(651,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",5),
(652,1,"Vous venez de finir une recherche","recherche",0);


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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",3,3,1,1,361,0,8,0,6085,68),
(3,"bif",2,2,1,1,554,13,5,1,5695,114),
(4,"bif",3,3,2,1,1115,0,8,0,7705,110),
(5,"bif",3,3,3,1,988,0,8,0,7303,104),
(6,"bif",13,17,-2,0,10,0,6,1,10,0),
(7,"bif",10,13,-2,0,10,0,5,3,10,0),
(8,"bif",15,15,-2,0,10,0,4,1,10,0),
(9,"bif",18,15,-2,0,10,0,4,2,10,0),
(10,"bif",3,5,-2,0,10,0,5,3,10,0),
(11,"bif",17,19,-2,0,10,0,6,3,10,0),
(12,"bif",11,16,-2,0,10,0,6,1,10,0),
(13,"bif",5,18,-2,0,10,0,3,1,10,0),
(14,"bif",13,20,-2,0,10,0,5,3,10,0),
(15,"bif",16,7,-2,0,10,0,4,1,10,0),
(16,"bif",6,6,-2,0,10,0,5,0,10,0),
(17,"bif",16,18,-2,0,10,0,5,1,10,0),
(18,"bif",6,20,-2,0,10,0,6,3,10,0),
(19,"bif",12,5,-2,0,10,0,3,2,10,0),
(20,"bif",6,12,-2,0,10,0,5,1,10,0),
(21,"bif",16,5,-2,0,10,0,5,0,10,0),
(22,"bif",11,17,-2,0,10,0,4,0,10,0),
(23,"bif",17,2,-2,0,10,0,4,1,10,0),
(24,"bif",12,2,-2,0,10,0,4,0,10,0),
(25,"bif",14,18,-2,0,10,0,4,0,10,0),
(26,"bif",3,19,-2,0,10,0,5,2,10,0),
(27,"bif",20,6,-2,0,10,0,5,3,10,0),
(28,"bif",13,12,-2,0,10,0,6,2,10,0),
(29,"bif",20,14,-2,0,10,0,4,3,10,0),
(30,"bif",8,13,-2,0,10,0,6,0,10,0),
(31,"bif",2,4,-2,0,10,0,6,2,10,0),
(32,"bif",5,2,-2,0,10,0,6,1,10,0),
(33,"bif",6,13,-2,0,10,0,6,0,10,0),
(34,"bif",10,19,-2,0,10,0,5,1,10,0),
(35,"bif",2,5,-2,0,10,0,3,3,10,0),
(36,"bif",8,4,-2,0,10,0,5,3,10,0),
(37,"bif",10,7,-2,0,10,0,5,2,10,0),
(38,"bif",16,10,-2,0,10,0,6,0,10,0),
(39,"bif",12,19,-2,0,10,0,6,2,10,0),
(40,"bif",4,8,-2,0,10,0,5,3,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

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
(28,5,1,0),
(29,3,1,0),
(30,5,1,0);


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
(8,14,1,14,220,0,1),
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
(3,1,12,5),
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
  `recherche` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zZEcWLJaYEgRDLfpUTUyHu57557oFlTakpwHwOX96h7cOWEgSYVZG","2020-03-07",0,0,20,304),
(2,"zx","$2y$10$rf9.RhcE8x6FG.iKdkw/1eEnbt6P4E1x9iKyfvMrEahwYKVkuPsGO","2020-03-08",0,0,2,0),
(3,"ui","$2y$10$QwhNjre1BvPv1PYXW7qHWuFm7MNGswFPFSAJmKT7UC12MMcUPXwIa","2020-03-14",0,0,0,100);


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
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (44,-1,0,0,0,"gtr",2,20,3,24,24,360,0,-1),
(43,-1,0,0,0,"eqweq",2,1,3,10,10,130,0,-8),
(42,-1,0,0,0,"hih",2,30,3,24,24,300,0,-1),
(45,-1,0,0,0,"petit",1,1,0,3,-1,40,0,-11),
(46,1,0,1,0,"Vaisseau",2,30,3,24,24,300,0,-1),
(47,1,1,2,2,"Boom",1,1,0,3,-1,40,0,-11),
(48,1,0,1,0,"Vaisseau",1,1,0,3,-1,40,0,-11);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (408,1,10,40,204,9),
(409,3,20,20,0,5),
(410,4,25,20,100,7),
(411,5,30,20,0,7);


SET foreign_key_checks = 1;
