CREATE DATABASE IF NOT EXISTS `gamer`;

USE `gamer`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `bataille`;

CREATE TABLE `bataille` (
  `idbataille` int(11) NOT NULL AUTO_INCREMENT,
  `idflotteoffensive` int(11) NOT NULL,
  `idflottedefensive` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idbataille`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (18,2,26,3),
(16,2,6,3);


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
  `idvaisseaucompo` int(11) NOT NULL COMMENT 'Si nég = modification de conception ou d''un vaisseau en cours',
  `iditemcomposant` int(11) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT '0',
  `typecomposant` varchar(32) NOT NULL,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=latin1;

INSERT INTO `composantvaisseau` VALUES (62,-11,14,2,"arme"),
(114,2,12,0,"soute"),
(113,2,11,2,"arme"),
(112,2,11,2,"arme"),
(137,-2,25,0,"noyau"),
(136,-2,12,0,"soute"),
(135,-2,11,2,"arme"),
(203,-5,15,0,"coque"),
(17,-4,23,0,"autre"),
(165,5,11,2,"arme"),
(164,5,11,2,"arme"),
(21,-6,10,0,"moteur"),
(24,8,10,0,"moteur"),
(25,8,14,2,"arme"),
(26,8,14,2,"arme"),
(27,8,14,2,"arme"),
(28,8,15,0,"coque"),
(29,8,15,0,"coque"),
(30,8,15,0,"coque"),
(32,-8,14,2,"arme"),
(33,-8,14,2,"arme"),
(34,-8,14,2,"arme"),
(35,-8,15,0,"coque"),
(36,-8,15,0,"coque"),
(37,-8,15,0,"coque"),
(138,9,25,0,"noyau"),
(123,9,15,0,"coque"),
(120,9,14,2,"arme"),
(119,9,14,2,"arme"),
(118,9,10,0,"moteur"),
(122,9,15,0,"coque"),
(121,9,14,2,"arme"),
(189,-12,15,0,"coque"),
(188,-12,15,0,"coque"),
(187,-12,14,2,"arme"),
(186,-12,14,2,"arme"),
(185,-12,14,2,"arme"),
(184,-12,10,0,"moteur"),
(61,-11,10,0,"moteur"),
(54,11,10,0,"moteur"),
(55,11,17,0,"noyau"),
(56,11,14,2,"arme"),
(57,11,14,2,"arme"),
(58,11,14,2,"arme"),
(59,11,15,0,"coque"),
(60,11,15,0,"coque"),
(63,-11,14,2,"arme"),
(64,-11,14,2,"arme"),
(65,-11,15,0,"coque"),
(66,-11,15,0,"coque"),
(67,-11,17,0,"noyau"),
(183,-10,24,0,"noyau"),
(182,-10,15,0,"coque"),
(181,-10,14,2,"arme"),
(180,-10,12,0,"soute"),
(179,-10,12,0,"soute"),
(178,-10,10,0,"moteur"),
(173,10,24,0,"noyau"),
(172,10,15,0,"coque"),
(174,10,12,0,"soute"),
(170,10,14,2,"arme"),
(169,10,12,0,"soute"),
(145,-9,25,0,"noyau"),
(140,-9,14,2,"arme"),
(168,10,10,0,"moteur"),
(143,-9,15,0,"coque"),
(142,-9,14,2,"arme"),
(163,5,11,2,"arme"),
(141,-9,14,2,"arme"),
(144,-9,15,0,"coque"),
(134,-2,11,2,"arme"),
(133,2,25,0,"noyau"),
(139,-9,10,0,"moteur"),
(175,12,10,0,"moteur"),
(147,12,14,2,"arme"),
(148,12,14,2,"arme"),
(149,12,14,2,"arme"),
(150,12,15,0,"coque"),
(151,12,15,0,"coque"),
(177,12,25,0,"noyau"),
(162,5,11,2,"arme"),
(161,5,10,0,"moteur"),
(199,-5,11,2,"arme"),
(166,5,24,0,"noyau"),
(202,-5,11,2,"arme"),
(201,-5,11,2,"arme"),
(200,-5,11,2,"arme"),
(198,-5,10,0,"moteur"),
(190,-12,25,0,"noyau"),
(196,-8,24,0,"noyau"),
(195,-8,10,0,"moteur"),
(197,5,15,0,"coque"),
(204,-5,24,0,"noyau"),
(205,15,15,0,"coque"),
(206,15,15,0,"coque"),
(207,15,15,0,"coque"),
(208,15,15,0,"coque"),
(209,15,15,0,"coque"),
(210,15,15,0,"coque"),
(211,15,15,0,"coque"),
(212,15,15,0,"coque"),
(213,15,15,0,"coque"),
(214,15,15,0,"coque"),
(215,15,15,0,"coque"),
(216,16,15,0,"coque"),
(217,16,15,0,"coque"),
(218,16,15,0,"coque"),
(219,16,15,0,"coque"),
(220,16,15,0,"coque"),
(221,16,15,0,"coque"),
(222,16,15,0,"coque"),
(223,16,15,0,"coque"),
(224,16,15,0,"coque"),
(225,16,15,0,"coque"),
(226,16,15,0,"coque");


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
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,2,3,3,2,1),
(2,2,2,2,2,10),
(3,2,1,1,2,11),
(4,2,2,1,2,12),
(5,2,3,1,2,13),
(6,2,1,2,2,17),
(7,2,1,3,2,18),
(8,2,1,4,2,19),
(9,2,1,5,2,20),
(10,2,2,5,2,21),
(11,2,3,4,2,22),
(12,2,4,2,2,26),
(13,2,5,1,2,27),
(14,2,4,1,2,28),
(15,2,3,2,2,29),
(16,2,2,3,2,30),
(17,2,2,4,2,31),
(18,2,3,5,2,32),
(19,2,4,5,2,33),
(20,2,5,5,2,34),
(21,2,5,4,2,35),
(22,2,5,3,2,36),
(23,2,5,2,2,37),
(24,2,4,3,2,38),
(25,2,4,4,2,39),
(26,-2,10,9,2,262),
(27,-2,2,5,2,272),
(28,-2,4,7,2,273),
(29,-2,6,9,2,274),
(30,-2,8,10,2,275),
(31,-2,10,10,2,276),
(32,-2,10,11,2,278),
(33,-2,1,3,2,301),
(34,-2,5,16,2,380),
(35,-2,6,15,2,382),
(36,-2,7,14,2,383),
(37,-2,8,13,2,384),
(38,-2,9,12,2,385),
(39,-2,9,17,2,402),
(40,-3,4,4,2,406),
(41,3,3,3,3,1),
(42,-2,5,19,2,466),
(43,-2,6,19,2,467),
(44,-2,7,19,2,468),
(45,-2,8,19,2,470),
(46,-2,9,19,2,471),
(47,-2,10,18,2,472),
(48,-2,11,18,2,473),
(49,-2,2,17,2,483),
(50,-2,1,17,2,485),
(51,3,2,2,3,521),
(52,3,1,1,3,522),
(53,3,2,1,3,523),
(54,3,3,1,3,524),
(55,3,4,1,3,525),
(56,3,5,1,3,526);


DROP TABLE IF EXISTS `flotte`;

CREATE TABLE `flotte` (
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
  PRIMARY KEY (`idflotte`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0);


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

INSERT INTO `limiteplanete` VALUES (2,1,1,10,5,5,0,2),
(1,1,1,8,1,1,0,1),
(3,1,1,8,1,1,0,1),
(4,1,1,8,1,1,0,1),
(5,1,1,8,1,1,0,1),
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
(19,1,1,5,1,1,1,1),
(20,1,1,8,1,1,0,1),
(21,1,1,8,1,1,0,1),
(22,1,1,8,1,1,0,1),
(23,1,1,3,1,1,3,0),
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
(39,1,1,8,1,1,0,1),
(40,1,1,8,1,1,0,1),
(41,1,1,8,1,1,0,1),
(42,1,1,8,1,1,0,1),
(43,1,1,8,1,1,0,1),
(44,1,1,8,1,1,0,1),
(45,1,1,8,1,1,0,1),
(46,1,1,8,1,1,0,1),
(47,1,1,8,1,1,0,1),
(48,1,1,8,1,1,0,1),
(49,1,1,8,1,1,0,1),
(50,1,1,8,1,1,0,1),
(51,1,1,8,1,1,0,1),
(52,1,1,8,1,1,0,1),
(53,1,1,8,1,1,0,2),
(54,1,1,8,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=2568 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (2564,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(2565,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(2566,3,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",23),
(2567,3,"Votre population ne pouvait pas grandir faute de place.","planete",53);


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
  `organisation` int(11) NOT NULL DEFAULT '10',
  `efficacite` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,59055,9715,8,0,10228,114),
(3,"bif",6,9,-2,0,10,0,4,0,10,0),
(4,"bif",13,10,-2,0,10,0,3,3,10,0),
(5,"bif",18,4,-2,0,10,0,3,0,10,0),
(6,"bif",17,16,-2,0,10,0,3,1,10,0),
(7,"bif",15,14,-2,0,10,0,4,2,10,0),
(8,"bif",2,14,-2,0,10,0,6,2,10,0),
(9,"bif",20,4,-2,0,10,0,6,3,10,0),
(10,"bif",15,10,-2,0,10,0,4,3,10,0),
(11,"bif",1,6,-2,0,10,0,4,2,10,0),
(12,"bif",20,15,-2,0,10,0,4,1,10,0),
(13,"bif",5,15,-2,0,10,0,6,2,10,0),
(14,"bif",17,9,-2,0,10,0,6,0,10,0),
(15,"bif",20,8,-2,0,10,0,4,0,10,0),
(16,"bif",14,5,-2,0,10,0,6,2,10,0),
(17,"bif",2,3,-2,0,10,0,3,1,10,0),
(18,"bif",15,13,-2,0,10,0,4,2,10,0),
(19,"Ydillia",1,3,2,2,226,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,18989,0,3,3,2451,123),
(24,"bif",3,1,-2,0,10,0,4,3,10,0),
(25,"bif",16,13,-2,0,10,0,5,3,10,0),
(26,"bif",2,13,-2,0,10,0,3,1,10,0),
(27,"bif",19,17,-2,0,10,0,5,0,10,0),
(28,"bif",18,7,-2,0,10,0,4,1,10,0),
(29,"bif",12,16,-2,0,10,0,4,0,10,0),
(30,"bif",6,13,-2,0,10,0,3,3,10,0),
(31,"bif",8,16,-2,0,10,0,6,0,10,0),
(32,"bif",18,5,-2,0,10,0,3,3,10,0),
(33,"bif",9,11,-2,0,10,0,5,0,10,0),
(34,"bif",4,12,-2,0,10,0,3,2,10,0),
(35,"bif",6,16,-2,0,10,0,4,3,10,0),
(36,"bif",20,14,-2,0,10,0,3,1,10,0),
(37,"bif",16,11,-2,0,10,0,4,3,10,0),
(38,"bif",16,14,-2,0,10,0,5,0,10,0),
(39,"bif",20,19,-2,0,10,0,5,0,10,0),
(40,"bif",19,3,-2,0,10,0,4,3,10,0),
(41,"bif",8,2,-2,0,10,0,4,1,10,0),
(42,"bif",14,2,-2,0,10,0,6,0,10,0),
(43,"bif",12,5,-2,0,10,0,3,3,10,0),
(44,"bif",14,7,-2,0,10,0,5,0,10,0),
(45,"bif",12,19,-2,0,10,0,3,3,10,0),
(46,"bif",6,14,-2,0,10,0,3,1,10,0),
(47,"bif",4,11,-2,0,10,0,5,1,10,0),
(48,"bif",11,14,-2,0,10,0,4,0,10,0),
(49,"bif",19,20,-2,0,10,0,4,1,10,0),
(50,"bif",4,4,-2,0,10,0,4,1,10,0),
(51,"bif",17,12,-2,0,10,0,3,1,10,0),
(52,"bif",7,19,-2,0,10,0,4,0,10,0),
(53,"bif",3,3,3,3,1029,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,2,1,0),
(2,2,1,0),
(3,2,1,0),
(4,2,1,0),
(5,2,1,0),
(6,2,1,0),
(7,2,2,0),
(8,2,2,0),
(9,19,3,0),
(10,2,2,0),
(11,19,2,0),
(12,19,1,0),
(13,19,1,0),
(14,53,3,0),
(15,53,2,0),
(16,53,1,0),
(17,53,1,0),
(18,53,1,0),
(19,53,1,0),
(20,53,1,0),
(21,53,1,0),
(22,23,2,0),
(23,23,2,0),
(24,19,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,2,4,400,382,1),
(2,2,2,1,500,402,1),
(3,3,2,3,400,396,1),
(4,6,2,5,2700,2640,1),
(5,7,2,7,3000,2730,1),
(6,5,2,2,1400,1390,1),
(7,4,2,6,2400,2370,1),
(8,8,2,16,300,174,1),
(9,9,2,19,300,195,1),
(10,10,2,17,300,182,1),
(11,11,2,18,300,138,1),
(12,12,2,10,3000,2880,1),
(13,13,2,11,3800,3680,1),
(21,21,2,14,6000,6000,1),
(20,20,2,15,13200,13100,1),
(22,22,2,20,400,107,1),
(23,23,2,21,400,158,1),
(24,24,3,4,300,288,1),
(25,25,3,1,300,300,1),
(26,26,3,3,600,525,1),
(27,500,3,11,0,1000,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10);


DROP TABLE IF EXISTS `station`;

CREATE TABLE `station` (
  `idstation` int(11) NOT NULL AUTO_INCREMENT,
  `nomstation` varchar(64) NOT NULL DEFAULT 'Nouvelle station',
  `xstation` int(11) NOT NULL,
  `ystation` int(11) NOT NULL,
  `universstation` int(11) NOT NULL,
  `idjoueurstation` int(11) NOT NULL,
  PRIMARY KEY (`idstation`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `station` VALUES (1,"Ydillia",10,10,-2,1);


DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0);


DROP TABLE IF EXISTS `vaisseau`;

CREATE TABLE `vaisseau` (
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
  `structure` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (5,-2,"arfw",2,1,3,29,29,430,100,-3),
(2,2,"qew",1,10,3,16,16,280,0,-6),
(11,-2,"Vaisseau sub-spatial",2,1,0,36,36,580,100,0),
(8,-2,"Croisseur de combat",2,1,0,44,44,530,0,0),
(9,2,"efrewr",2,1,0,39,39,580,0,0),
(10,1,"Croisseur de combat",2,20,0,31,31,410,100,-1),
(12,1,"Vaisseau sub-spatial",2,1,0,39,39,580,0,0),
(13,-3,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(14,7,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(15,8,"Planete defense",1,1,0,113,57,590,0,0),
(16,9,"Space defense",1,1,0,113,85,590,0,0);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  `coutstockage` int(11) NOT NULL DEFAULT '0',
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=1367 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (1363,2,0,60,0,9,1205,6),
(1364,19,15,20,100,5,5,2),
(1365,23,0,40,0,2,388,0),
(1366,53,30,20,100,8,21,0);


SET foreign_key_checks = 1;
