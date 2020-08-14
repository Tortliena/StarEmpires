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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(227,18,11,2,"arme"),
(228,-18,11,2,"arme"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(233,22,15,0,"coque"),
(232,-21,23,0,"autre"),
(234,22,15,0,"coque"),
(235,22,15,0,"coque"),
(236,22,15,0,"coque"),
(237,22,15,0,"coque"),
(244,-22,14,2,"arme"),
(243,-22,14,2,"arme"),
(240,22,14,2,"arme"),
(241,22,14,2,"arme"),
(242,22,14,2,"arme"),
(245,-22,14,2,"arme"),
(246,-22,15,0,"coque"),
(247,-22,15,0,"coque"),
(248,-22,15,0,"coque"),
(249,-22,15,0,"coque"),
(250,-22,15,0,"coque"),
(251,23,15,0,"coque"),
(252,23,15,0,"coque"),
(253,23,15,0,"coque"),
(254,23,15,0,"coque"),
(255,23,15,0,"coque"),
(256,23,14,2,"arme"),
(257,23,14,2,"arme"),
(258,23,14,2,"arme"),
(259,24,15,0,"coque"),
(260,24,15,0,"coque"),
(261,24,15,0,"coque"),
(262,24,15,0,"coque"),
(263,24,15,0,"coque"),
(264,24,14,2,"arme"),
(265,24,14,2,"arme"),
(266,24,14,2,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623);


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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,3,3,"Chasseur d\'épave",0,0,0,0,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(12,0,4,5,4,"Épave spatiale",0,0,0,0,0),
(14,55,4,3,3,"Bataille",0,0,0,0,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=3956 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (3948,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(3949,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(3950,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(3951,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(3952,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(3953,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",56),
(3954,4,"Cette flotte vient de se déplacer. Elle était avant en 4-3","flotte",11),
(3955,4,"Cette flotte vient de se déplacer. Elle était avant en 4-3","flotte",14);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,2212,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,550,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,307,15,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,446,0,4,1,3501,117);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,1,0),
(28,55,1,0),
(29,55,1,0),
(30,55,1,0),
(31,55,1,0),
(32,55,1,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(34,55,11,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,9,0,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(18,10,"Mineur",1,1,3,5,5,90,0,-10),
(19,12,"Épave spatiale",1,1,0,3,3,40,0,-11),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,1,0,59,59,590,0,0),
(23,14,"Croiseur de combat",1,1,0,59,59,590,0,0),
(24,14,"Croiseur de combat",1,1,0,59,59,590,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=2383 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (2377,2,30,60,0,9,45,6),
(2378,19,15,20,100,5,8,2),
(2379,23,5,40,0,3,11,0),
(2380,53,30,20,100,8,22,0),
(2381,55,35,40,0,9,6,6),
(2382,56,15,0,0,3,9,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(227,18,11,2,"arme"),
(228,-18,11,2,"arme"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(233,22,15,0,"coque"),
(232,-21,23,0,"autre"),
(234,22,15,0,"coque"),
(235,22,15,0,"coque"),
(236,22,15,0,"coque"),
(237,22,15,0,"coque"),
(244,-22,14,2,"arme"),
(243,-22,14,2,"arme"),
(240,22,14,2,"arme"),
(241,22,14,2,"arme"),
(242,22,14,2,"arme"),
(245,-22,14,2,"arme"),
(246,-22,15,0,"coque"),
(247,-22,15,0,"coque"),
(248,-22,15,0,"coque"),
(249,-22,15,0,"coque"),
(250,-22,15,0,"coque"),
(251,23,15,0,"coque"),
(252,23,15,0,"coque"),
(253,23,15,0,"coque"),
(254,23,15,0,"coque"),
(255,23,15,0,"coque"),
(256,23,14,2,"arme"),
(257,23,14,2,"arme"),
(258,23,14,2,"arme"),
(259,24,15,0,"coque"),
(260,24,15,0,"coque"),
(261,24,15,0,"coque"),
(262,24,15,0,"coque"),
(263,24,15,0,"coque"),
(264,24,14,2,"arme"),
(265,24,14,2,"arme"),
(266,24,14,2,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(70,4,3,4,4,782);


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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,3,4,"Eplorateur Mineur",4,3,5,6,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(12,0,4,5,4,"Épave spatiale",0,0,0,0,0),
(14,55,4,3,3,"Bataille",0,0,0,0,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=3965 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (3956,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(3957,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(3958,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(3959,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(3960,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(3961,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",56),
(3962,4,"Cette flotte vient de se déplacer. Elle était avant en 3-3","flotte",11),
(3963,4,"Cette flotte vient d\'explorer le parsec (3 - 4).","flotte",11),
(3964,4,"Cette flotte n\'est pas arrivée à destination faute d\'avoir la vitesse suffisante.","flotte",11);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,2182,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,541,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,320,15,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,449,0,4,1,3501,117);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,1,0),
(28,55,1,0),
(29,55,1,0),
(30,55,1,0),
(31,55,1,0),
(32,55,1,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(34,55,11,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,9,0,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(18,11,"Mineur",1,1,3,5,5,90,0,-10),
(19,12,"Épave spatiale",1,1,0,3,3,40,0,-11),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,1,0,59,59,590,0,0),
(23,14,"Croiseur de combat",1,1,0,59,59,590,0,0),
(24,14,"Croiseur de combat",1,1,0,59,59,590,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=2389 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (2383,2,30,60,0,9,45,6),
(2384,19,15,20,100,5,8,2),
(2385,23,5,40,0,3,11,0),
(2386,53,30,20,100,8,22,0),
(2387,55,35,40,0,9,7,6),
(2388,56,15,0,0,3,9,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (18,2,26,3),
(16,2,6,3),
(21,25,18,1),
(22,25,16,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=272 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(228,18,11,2,"arme"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(233,22,15,0,"coque"),
(232,-21,23,0,"autre"),
(234,22,15,0,"coque"),
(235,22,15,0,"coque"),
(236,22,15,0,"coque"),
(237,22,15,0,"coque"),
(244,-22,14,2,"arme"),
(243,-22,14,2,"arme"),
(240,22,14,2,"arme"),
(241,22,14,2,"arme"),
(242,22,14,2,"arme"),
(245,-22,14,2,"arme"),
(246,-22,15,0,"coque"),
(247,-22,15,0,"coque"),
(248,-22,15,0,"coque"),
(249,-22,15,0,"coque"),
(250,-22,15,0,"coque"),
(251,23,15,0,"coque"),
(252,23,15,0,"coque"),
(253,23,15,0,"coque"),
(254,23,15,0,"coque"),
(255,23,15,0,"coque"),
(256,23,14,2,"arme"),
(257,23,14,2,"arme"),
(258,23,14,2,"arme"),
(259,24,15,0,"coque"),
(260,24,15,0,"coque"),
(261,24,15,0,"coque"),
(262,24,15,0,"coque"),
(263,24,15,0,"coque"),
(264,24,14,2,"arme"),
(265,24,14,2,"arme"),
(266,24,14,2,"arme"),
(268,18,12,0,"soute"),
(269,18,12,0,"soute"),
(270,18,12,0,"soute"),
(271,18,12,0,"soute");


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
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623);


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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,3,3,"Eplorateur Mineur",0,0,0,0,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(14,55,4,5,3,"Bataille",0,0,0,0,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales."),
("Ministère de l\'économie",94,4,0,"Marchandises en transit","Un vaisseau vient de livrer  débris communs."),
("Ministère de l\'économie",95,4,0,"Marchandises en transit","Un vaisseau vient de livrer  débris avec des métaux rares.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=4351 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (4345,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(4346,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(4347,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(4348,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(4349,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(4350,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",56);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,1183,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,235,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,78,15,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,542,0,4,1,3501,117);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,3,0),
(28,55,3,0),
(29,55,3,0),
(30,55,1,0),
(31,55,1,0),
(32,55,1,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(34,55,11,1),
(38,55,6,3),
(39,55,8,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,300,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(18,11,"Mineur",1,40,3,21,21,250,0,-2),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,1,0,59,59,590,0,0),
(23,14,"Croiseur de combat",1,1,0,59,53,590,0,0),
(24,14,"Croiseur de combat",1,1,0,59,57,590,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=2737 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (2731,2,30,60,0,9,24,6),
(2732,19,15,20,100,5,8,2),
(2733,23,5,40,0,3,5,0),
(2734,53,30,20,100,8,22,0),
(2735,55,20,40,300,9,2,6),
(2736,56,15,0,0,3,11,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `bataille` VALUES (29,14,16,1);


DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (18,2,26,3),
(16,2,6,3),
(21,25,18,1),
(22,25,16,1),
(26,26,16,1),
(25,26,18,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(272,26,13,4,"arme"),
(228,18,11,2,"arme"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(233,22,15,0,"coque"),
(232,-21,23,0,"autre"),
(234,22,15,0,"coque"),
(235,22,15,0,"coque"),
(236,22,15,0,"coque"),
(237,22,15,0,"coque"),
(244,-22,14,2,"arme"),
(243,-22,14,2,"arme"),
(240,22,14,2,"arme"),
(241,22,14,2,"arme"),
(242,22,14,2,"arme"),
(245,-22,14,2,"arme"),
(246,-22,15,0,"coque"),
(247,-22,15,0,"coque"),
(248,-22,15,0,"coque"),
(249,-22,15,0,"coque"),
(250,-22,15,0,"coque"),
(251,23,15,0,"coque"),
(252,23,15,0,"coque"),
(253,23,15,0,"coque"),
(254,23,15,0,"coque"),
(255,23,15,0,"coque"),
(256,23,14,2,"arme"),
(257,23,14,2,"arme"),
(258,23,14,2,"arme"),
(259,24,15,0,"coque"),
(260,24,15,0,"coque"),
(261,24,15,0,"coque"),
(262,24,15,0,"coque"),
(263,24,15,0,"coque"),
(264,24,14,2,"arme"),
(265,24,14,2,"arme"),
(266,24,14,2,"arme"),
(268,18,12,0,"soute"),
(269,18,12,0,"soute"),
(270,18,12,0,"soute"),
(271,18,12,0,"soute");


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
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(76,4,2,4,4,841),
(77,4,1,5,4,842),
(78,0,2,4,4,843),
(79,4,4,4,4,844),
(80,4,3,5,4,845),
(81,4,2,5,4,846);


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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,2,4,"Eplorateur Mineur",0,1,5,0,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(16,0,4,1,5,"Épave spatiale",0,0,0,0,0),
(14,55,4,1,5,"Bataille",4,16,0,5,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales."),
("Ministère de l\'économie",94,4,0,"Marchandises en transit","Un vaisseau vient de livrer  débris communs."),
("Ministère de l\'économie",95,4,0,"Marchandises en transit","Un vaisseau vient de livrer  débris avec des métaux rares."),
("Vaisseau d\'exploration",96,4,0,"Vaisseau inconnu détecté","Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder."),
("Vaisseau d\'exploration",97,4,0,"Échec de la mission","Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=4427 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (4421,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(4422,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(4423,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(4424,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(4425,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(4426,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",56);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,1101,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,210,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,108,15,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,552,0,4,1,3501,117);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,3,0),
(28,55,3,0),
(29,55,3,0),
(30,55,1,0),
(31,55,1,0),
(32,55,1,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(34,55,11,1),
(38,55,6,3),
(39,55,8,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,300,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(18,11,"Mineur",1,40,3,21,1,250,0,-2),
(26,16,"Épave spatiale",1,1,0,18,18,540,200,-10),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,1,0,59,59,590,0,0),
(23,14,"Croiseur de combat",1,1,0,59,53,590,0,0),
(24,14,"Croiseur de combat",1,1,0,59,57,590,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=2797 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (2791,2,30,60,0,9,22,6),
(2792,19,15,20,100,5,8,2),
(2793,23,5,40,0,3,4,0),
(2794,53,30,20,100,8,22,0),
(2795,55,20,40,300,9,2,6),
(2796,56,15,0,0,3,11,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `bataille` VALUES (29,14,16,1);


DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (18,2,26,3),
(16,2,6,3),
(21,25,18,1),
(22,25,16,1),
(26,26,16,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(272,26,13,4,"arme"),
(228,18,11,2,"arme"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(233,22,15,0,"coque"),
(232,-21,23,0,"autre"),
(234,22,15,0,"coque"),
(235,22,15,0,"coque"),
(236,22,15,0,"coque"),
(237,22,15,0,"coque"),
(244,-22,14,2,"arme"),
(243,-22,14,2,"arme"),
(240,22,14,2,"arme"),
(241,22,14,2,"arme"),
(242,22,14,2,"arme"),
(245,-22,14,2,"arme"),
(246,-22,15,0,"coque"),
(247,-22,15,0,"coque"),
(248,-22,15,0,"coque"),
(249,-22,15,0,"coque"),
(250,-22,15,0,"coque"),
(251,23,15,0,"coque"),
(252,23,15,0,"coque"),
(253,23,15,0,"coque"),
(254,23,15,0,"coque"),
(255,23,15,0,"coque"),
(256,23,14,2,"arme"),
(257,23,14,2,"arme"),
(258,23,14,2,"arme"),
(259,24,15,0,"coque"),
(260,24,15,0,"coque"),
(261,24,15,0,"coque"),
(262,24,15,0,"coque"),
(263,24,15,0,"coque"),
(264,24,14,2,"arme"),
(265,24,14,2,"arme"),
(266,24,14,2,"arme"),
(268,18,12,0,"soute"),
(269,18,12,0,"soute"),
(270,18,12,0,"soute"),
(271,18,12,0,"soute");


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
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(76,4,2,4,4,841),
(77,4,1,5,4,842),
(78,0,2,4,4,843),
(79,4,4,4,4,844),
(80,4,3,5,4,845),
(81,4,2,5,4,846);


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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,2,4,"Eplorateur Mineur",0,1,5,0,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(16,0,4,1,5,"Épave spatiale",0,0,0,0,0),
(14,55,4,1,5,"Bataille",4,16,0,5,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales."),
("Ministère de l\'économie",94,4,0,"Marchandises en transit","Un vaisseau vient de livrer  débris communs."),
("Ministère de l\'économie",95,4,0,"Marchandises en transit","Un vaisseau vient de livrer  débris avec des métaux rares."),
("Vaisseau d\'exploration",96,4,0,"Vaisseau inconnu détecté","Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder."),
("Vaisseau d\'exploration",97,4,0,"Échec de la mission","Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=4427 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (4421,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(4422,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(4423,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(4424,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(4425,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(4426,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",56);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,1101,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,210,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,108,15,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,552,0,4,1,3501,117);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,3,0),
(28,55,3,0),
(29,55,3,0),
(30,55,1,0),
(31,55,1,0),
(32,55,1,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(34,55,11,1),
(38,55,6,3),
(39,55,8,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,300,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(18,11,"Mineur",1,40,3,21,1,250,0,-2),
(26,16,"Épave spatiale",1,1,0,18,18,540,200,-10),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,1,0,59,59,590,0,0),
(23,14,"Croiseur de combat",1,1,0,59,53,590,0,0),
(24,14,"Croiseur de combat",1,1,0,59,57,590,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=2797 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (2791,2,30,60,0,9,22,6),
(2792,19,15,20,100,5,8,2),
(2793,23,5,40,0,3,4,0),
(2794,53,30,20,100,8,22,0),
(2795,55,20,40,300,9,2,6),
(2796,56,15,0,0,3,11,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (116,76,31,1),
(115,75,31,1),
(87,60,31,1),
(125,50,8,6),
(128,49,8,4),
(124,51,8,10),
(117,77,31,1),
(104,69,31,1),
(113,73,31,1),
(114,74,31,1),
(88,61,31,1),
(86,59,31,1),
(89,62,31,1),
(126,50,6,4),
(127,49,6,6);


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
) ENGINE=MyISAM AUTO_INCREMENT=538 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(414,50,15,0,"coque"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(394,22,12,0,"soute"),
(232,-21,23,0,"autre"),
(320,22,15,0,"coque"),
(319,22,15,0,"coque"),
(318,22,15,0,"coque"),
(402,-22,24,0,"noyau"),
(317,22,14,2,"arme"),
(316,22,14,2,"arme"),
(315,22,11,2,"arme"),
(401,-22,15,0,"coque"),
(400,-22,15,0,"coque"),
(399,-22,15,0,"coque"),
(398,-22,14,2,"arme"),
(397,-22,14,2,"arme"),
(396,-22,12,0,"soute"),
(310,32,29,3,"arme"),
(309,32,29,3,"arme"),
(308,32,29,3,"arme"),
(307,31,29,3,"arme"),
(306,31,29,3,"arme"),
(305,31,29,3,"arme"),
(304,30,29,3,"arme"),
(303,30,29,3,"arme"),
(302,30,29,3,"arme"),
(421,51,15,0,"coque"),
(437,49,32,10,"moteur"),
(297,27,29,3,"arme"),
(412,50,15,0,"coque"),
(413,50,15,0,"coque"),
(411,50,12,0,"soute"),
(410,49,24,0,"noyau"),
(409,49,11,2,"arme"),
(408,49,14,2,"arme"),
(407,49,14,2,"arme"),
(406,49,15,0,"coque"),
(405,49,15,0,"coque"),
(404,49,15,0,"coque"),
(479,62,29,3,"arme"),
(480,62,29,3,"arme"),
(435,51,32,10,"moteur"),
(533,77,29,3,"arme"),
(418,50,24,0,"noyau"),
(532,76,29,3,"arme"),
(420,51,15,0,"coque"),
(419,51,12,0,"soute"),
(311,33,29,3,"arme"),
(395,-22,11,2,"arme"),
(323,22,24,0,"noyau"),
(416,50,14,2,"arme"),
(403,49,12,0,"soute"),
(481,62,29,3,"arme"),
(482,62,29,3,"arme"),
(535,77,29,3,"arme"),
(468,59,29,3,"arme"),
(469,59,29,3,"arme"),
(470,59,29,3,"arme"),
(471,60,29,3,"arme"),
(472,60,29,3,"arme"),
(473,60,29,3,"arme"),
(474,60,29,3,"arme"),
(475,61,29,3,"arme"),
(476,61,29,3,"arme"),
(477,61,29,3,"arme"),
(478,61,29,3,"arme"),
(526,75,29,3,"arme"),
(527,75,29,3,"arme"),
(417,50,11,2,"arme"),
(415,50,14,2,"arme"),
(436,50,32,10,"moteur"),
(537,77,29,3,"arme"),
(536,77,29,3,"arme"),
(531,76,29,3,"arme"),
(530,76,29,3,"arme"),
(514,73,29,3,"arme"),
(515,73,29,3,"arme"),
(516,73,29,3,"arme"),
(517,73,29,3,"arme"),
(518,74,29,3,"arme"),
(519,74,29,3,"arme"),
(520,74,29,3,"arme"),
(521,74,29,3,"arme"),
(522,74,29,3,"arme"),
(523,75,29,3,"arme"),
(524,75,29,3,"arme"),
(525,75,29,3,"arme"),
(467,59,29,3,"arme"),
(529,76,29,3,"arme"),
(528,76,29,3,"arme"),
(513,73,29,3,"arme"),
(422,51,15,0,"coque"),
(423,51,14,2,"arme"),
(424,51,14,2,"arme"),
(425,51,11,2,"arme"),
(426,51,24,0,"noyau"),
(534,77,29,3,"arme"),
(427,-49,11,2,"arme"),
(428,-49,12,0,"soute"),
(429,-49,14,2,"arme"),
(430,-49,14,2,"arme"),
(431,-49,15,0,"coque"),
(432,-49,15,0,"coque"),
(433,-49,15,0,"coque"),
(434,-49,24,0,"noyau"),
(503,69,29,3,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(76,4,2,4,4,841),
(77,4,1,5,4,842),
(78,0,2,4,4,843),
(79,4,4,4,4,844),
(80,4,3,5,4,845),
(81,4,2,5,4,846),
(82,-2,12,8,4,886),
(83,4,1,4,4,938),
(84,4,1,3,4,939),
(85,4,1,2,4,940),
(86,4,2,3,4,946),
(87,4,4,3,4,948),
(88,4,5,3,4,949),
(89,-2,3,17,4,962),
(90,-2,2,16,4,983),
(91,-2,1,16,4,984),
(92,4,4,2,4,998),
(93,4,3,2,4,999),
(94,4,3,4,4,1001),
(95,4,4,5,4,1002),
(96,4,5,5,4,1003),
(97,4,5,4,4,1004),
(98,-2,15,20,4,1042),
(99,-2,16,9,4,1054),
(100,-2,15,9,4,1055),
(101,-2,14,9,4,1056),
(102,-2,13,9,4,1057),
(103,-2,12,9,4,1058),
(104,-2,11,10,4,1063),
(105,-2,10,10,4,1064),
(106,-2,9,10,4,1065),
(107,-2,8,10,4,1066),
(108,-2,16,11,4,1072),
(109,-2,15,10,4,1074),
(110,-2,14,10,4,1075),
(111,-2,13,10,4,1076),
(112,-2,12,10,4,1077),
(113,-2,9,12,4,1153),
(114,-2,8,11,4,1155),
(115,-2,1,18,4,1190),
(116,-2,8,17,4,1193),
(117,-2,4,9,4,1221),
(118,-2,1,9,4,1222),
(119,-2,12,18,4,1245),
(120,-2,13,3,4,1246),
(121,-2,14,20,4,1267),
(122,-2,11,16,4,1268),
(123,-2,20,11,4,1276),
(124,-2,19,5,4,1282),
(125,-2,10,1,4,1302),
(126,-2,7,4,4,1303),
(127,-2,9,8,4,1320),
(128,-2,13,14,4,1331);


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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,3,3,"Eplorateur Mineur",0,0,0,0,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(30,0,-2,16,4,"Essain alien",0,0,0,0,0),
(14,55,-2,13,14,"Bataille",0,0,0,0,0),
(27,0,-2,16,6,"Essain alien",0,0,0,0,0),
(32,0,-2,13,14,"Essain alien",0,0,0,0,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=8233 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (8225,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(8226,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(8227,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(8228,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(8229,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(8230,4,"Votre population ne pouvait pas grandir faute de place.","planete",56),
(8231,4,"Cette flotte vient de se déplacer. Elle était avant en 9-8","flotte",14),
(8232,4,"Cette flotte vient d\'explorer le parsec (13 - 14).","flotte",14);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,760,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,122,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,1125,4572,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,760,0,4,1,4497,112);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,3,0),
(28,55,3,0),
(29,55,3,0),
(30,55,2,0),
(31,55,2,0),
(32,55,2,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0),
(38,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1),
(38,36,4,16,3000,2805,1),
(39,36,4,15,3000,2805,1),
(43,43,4,22,300,137,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(55,55,8,60),
(47,55,6,86),
(58,55,31,5),
(50,55,15,6),
(57,55,19,5);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,300,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(51,14,"Croiseur de combat",20,10,3,50046,50016,1080,300,1),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,10,3,46,46,580,100,0),
(50,14,"Croiseur de combat",20,10,3,50046,50016,1080,300,1),
(27,17,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(69,30,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(62,27,"Vaisseau alien",1,1,0,35,35,840,160,5),
(30,19,"Vaisseau alien",1,1,0,27,27,640,120,1),
(31,19,"Vaisseau alien",1,1,0,27,27,640,120,1),
(32,19,"Vaisseau alien",1,1,0,27,27,640,120,1),
(33,20,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(49,14,"Croiseur de combat",20,10,3,50046,50028,1080,300,1),
(61,27,"Vaisseau alien",1,1,0,35,35,840,160,5),
(73,32,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(74,32,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(75,32,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(76,32,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(59,27,"Vaisseau alien",1,1,0,35,35,840,160,5),
(60,27,"Vaisseau alien",1,1,0,35,35,840,160,5),
(77,32,"Vaisseau alien",1,1,0,43,43,1040,200,9);


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
) ENGINE=MyISAM AUTO_INCREMENT=5683 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (5677,2,30,60,0,9,16,6),
(5678,19,15,20,100,5,8,2),
(5679,23,5,40,0,3,2,0),
(5680,53,30,20,100,8,22,0),
(5681,55,5,100,300,9,23,6),
(5682,56,20,0,0,4,16,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (142,91,31,1),
(141,90,31,1),
(135,84,31,1),
(132,81,31,1),
(130,79,31,1),
(133,82,31,1),
(138,87,31,1),
(139,88,31,1),
(140,89,31,1),
(136,85,31,1),
(134,83,31,1),
(137,86,31,1),
(131,80,31,1),
(129,78,31,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=596 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(414,50,15,0,"coque"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(394,22,12,0,"soute"),
(232,-21,23,0,"autre"),
(320,22,15,0,"coque"),
(319,22,15,0,"coque"),
(318,22,15,0,"coque"),
(402,-22,24,0,"noyau"),
(317,22,14,2,"arme"),
(316,22,14,2,"arme"),
(315,22,11,2,"arme"),
(401,-22,15,0,"coque"),
(400,-22,15,0,"coque"),
(399,-22,15,0,"coque"),
(398,-22,14,2,"arme"),
(397,-22,14,2,"arme"),
(396,-22,12,0,"soute"),
(310,32,29,3,"arme"),
(309,32,29,3,"arme"),
(308,32,29,3,"arme"),
(307,31,29,3,"arme"),
(306,31,29,3,"arme"),
(305,31,29,3,"arme"),
(304,30,29,3,"arme"),
(303,30,29,3,"arme"),
(302,30,29,3,"arme"),
(421,51,15,0,"coque"),
(437,49,32,0,"moteur"),
(297,27,29,3,"arme"),
(412,50,15,0,"coque"),
(413,50,15,0,"coque"),
(411,50,12,0,"soute"),
(410,49,24,0,"noyau"),
(409,49,11,0,"arme"),
(408,49,14,0,"arme"),
(407,49,14,0,"arme"),
(406,49,15,0,"coque"),
(405,49,15,0,"coque"),
(404,49,15,0,"coque"),
(553,82,29,3,"arme"),
(552,82,29,3,"arme"),
(435,51,32,0,"moteur"),
(589,89,29,0,"arme"),
(418,50,24,0,"noyau"),
(580,87,29,0,"arme"),
(420,51,15,0,"coque"),
(419,51,12,0,"soute"),
(311,33,29,3,"arme"),
(395,-22,11,2,"arme"),
(323,22,24,0,"noyau"),
(416,50,14,0,"arme"),
(403,49,12,0,"soute"),
(551,81,29,3,"arme"),
(550,81,29,3,"arme"),
(588,89,29,0,"arme"),
(549,81,29,3,"arme"),
(548,81,29,3,"arme"),
(547,81,29,3,"arme"),
(545,80,29,3,"arme"),
(544,80,29,3,"arme"),
(543,80,29,3,"arme"),
(542,80,29,3,"arme"),
(541,79,29,3,"arme"),
(540,79,29,3,"arme"),
(539,78,29,3,"arme"),
(538,78,29,3,"arme"),
(584,88,29,0,"arme"),
(583,88,29,0,"arme"),
(417,50,11,0,"arme"),
(415,50,14,0,"arme"),
(436,50,32,0,"moteur"),
(587,89,29,0,"arme"),
(586,88,29,0,"arme"),
(579,87,29,0,"arme"),
(578,87,29,0,"arme"),
(571,85,29,0,"arme"),
(570,85,29,0,"arme"),
(569,85,29,0,"arme"),
(568,85,29,0,"arme"),
(575,86,29,0,"arme"),
(574,86,29,0,"arme"),
(573,86,29,0,"arme"),
(572,86,29,0,"arme"),
(582,88,29,0,"arme"),
(581,87,29,0,"arme"),
(546,80,29,3,"arme"),
(577,87,29,0,"arme"),
(576,86,29,0,"arme"),
(567,85,29,0,"arme"),
(422,51,15,0,"coque"),
(423,51,14,0,"arme"),
(424,51,14,0,"arme"),
(425,51,11,0,"arme"),
(426,51,24,0,"noyau"),
(585,88,29,0,"arme"),
(427,-49,11,2,"arme"),
(428,-49,12,0,"soute"),
(429,-49,14,2,"arme"),
(430,-49,14,2,"arme"),
(431,-49,15,0,"coque"),
(432,-49,15,0,"coque"),
(433,-49,15,0,"coque"),
(434,-49,24,0,"noyau"),
(590,89,29,0,"arme"),
(554,82,29,3,"arme"),
(555,82,29,3,"arme"),
(556,82,29,3,"arme"),
(557,83,29,3,"arme"),
(558,83,29,3,"arme"),
(559,83,29,3,"arme"),
(560,83,29,3,"arme"),
(561,83,29,3,"arme"),
(562,84,29,3,"arme"),
(563,84,29,3,"arme"),
(564,84,29,3,"arme"),
(565,84,29,3,"arme"),
(566,84,29,3,"arme"),
(591,89,29,0,"arme"),
(592,90,29,0,"arme"),
(593,90,29,0,"arme"),
(594,91,29,0,"arme"),
(595,91,29,0,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(76,4,2,4,4,841),
(77,4,1,5,4,842),
(78,0,2,4,4,843),
(79,4,4,4,4,844),
(80,4,3,5,4,845),
(81,4,2,5,4,846),
(82,-2,12,8,4,886),
(83,4,1,4,4,938),
(84,4,1,3,4,939),
(85,4,1,2,4,940),
(86,4,2,3,4,946),
(87,4,4,3,4,948),
(88,4,5,3,4,949),
(89,-2,3,17,4,962),
(90,-2,2,16,4,983),
(91,-2,1,16,4,984),
(92,4,4,2,4,998),
(93,4,3,2,4,999),
(94,4,3,4,4,1001),
(95,4,4,5,4,1002),
(96,4,5,5,4,1003),
(97,4,5,4,4,1004),
(98,-2,15,20,4,1042),
(99,-2,16,9,4,1054),
(100,-2,15,9,4,1055),
(101,-2,14,9,4,1056),
(102,-2,13,9,4,1057),
(103,-2,12,9,4,1058),
(104,-2,11,10,4,1063),
(105,-2,10,10,4,1064),
(106,-2,9,10,4,1065),
(107,-2,8,10,4,1066),
(108,-2,16,11,4,1072),
(109,-2,15,10,4,1074),
(110,-2,14,10,4,1075),
(111,-2,13,10,4,1076),
(112,-2,12,10,4,1077),
(113,-2,9,12,4,1153),
(114,-2,8,11,4,1155),
(115,-2,1,18,4,1190),
(116,-2,8,17,4,1193),
(117,-2,4,9,4,1221),
(118,-2,1,9,4,1222),
(119,-2,12,18,4,1245),
(120,-2,13,3,4,1246),
(121,-2,14,20,4,1267),
(122,-2,11,16,4,1268),
(123,-2,20,11,4,1276),
(124,-2,19,5,4,1282),
(125,-2,10,1,4,1302),
(126,-2,7,4,4,1303),
(127,-2,9,8,4,1320),
(128,-2,13,14,4,1331),
(129,-2,16,6,4,1332),
(130,-2,16,4,4,1337);


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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-2,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,2,-2,1,17,"Grosse flotte",0,0,0,0,0),
(5,2,2,3,3,"Flotte subspatiale",0,0,0,0,0),
(4,2,2,3,3,"dwq",0,0,0,0,0),
(6,-53,3,3,3,"Flotte de défense",0,0,0,0,0),
(7,53,3,5,1,"nouvelleflotte",0,0,0,0,0),
(9,23,-2,1,17,"Flotte defenseuse",0,0,0,0,0),
(8,-23,-2,1,17,"Flotte de défense",0,0,0,0,0),
(10,-55,4,3,3,"Flotte de défense",0,0,0,0,0),
(11,55,4,3,3,"Eplorateur Mineur",0,0,0,0,0),
(13,55,4,3,3,"nouvelleflotte",0,0,0,0,0),
(36,0,-2,1,11,"Essain alien",0,0,0,0,0),
(14,55,-2,13,14,"Bataille",0,0,0,0,0),
(33,0,-2,2,7,"Essain alien",0,0,0,0,0),
(34,0,-2,7,17,"Essain alien",0,0,0,0,0),
(35,0,-2,15,2,"Essain alien",0,0,0,0,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=8292 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (8286,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(8287,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(8288,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(8289,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(8290,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(8291,4,"Votre population ne pouvait pas grandir faute de place.","planete",56);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,760,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,122,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,857,4572,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,760,0,4,1,4497,112);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,3,0),
(28,55,3,0),
(29,55,3,0),
(30,55,2,0),
(31,55,2,0),
(32,55,2,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0),
(38,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1),
(38,36,4,16,3000,2805,1),
(39,36,4,15,3000,2805,1),
(43,43,4,22,300,137,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(55,55,8,60),
(47,55,6,86),
(58,55,31,5),
(50,55,15,6),
(57,55,19,5);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,300,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

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
(16,9,"Space defense",1,1,0,113,85,590,0,0),
(17,-4,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(51,14,"Croiseur de combat",20,10,3,50046,50007,1080,300,1),
(20,-4,"Colonisateur",1,1,0,8,8,140,0,-5),
(22,-4,"Croiseur de combat",1,10,3,46,46,580,100,0),
(50,14,"Croiseur de combat",20,10,3,50046,50007,1080,300,1),
(27,17,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(89,35,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1),
(30,19,"Vaisseau alien",1,1,0,27,27,640,120,1),
(31,19,"Vaisseau alien",1,1,0,27,27,640,120,1),
(32,19,"Vaisseau alien",1,1,0,27,27,640,120,1),
(33,20,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(49,14,"Croiseur de combat",20,10,3,50046,50016,1080,300,1),
(78,33,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(85,35,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1),
(86,35,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1),
(87,35,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1),
(79,33,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(90,36,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1),
(88,35,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1),
(80,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(81,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(82,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(83,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(84,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(91,36,"Vaisseau alien",-1,-1,-1,20,20,-1,-1,-1);


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
) ENGINE=MyISAM AUTO_INCREMENT=5737 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (5731,2,30,60,0,9,16,6),
(5732,19,15,20,100,5,8,2),
(5733,23,5,40,0,3,2,0),
(5734,53,30,20,100,8,22,0),
(5735,55,5,100,300,9,17,6),
(5736,56,20,0,0,4,16,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (142,91,31,1),
(141,90,31,1),
(135,84,31,1),
(132,81,31,1),
(130,79,31,1),
(133,82,31,1),
(138,87,31,1),
(139,88,31,1),
(140,89,31,1),
(136,85,31,1),
(134,83,31,1),
(137,86,31,1),
(131,80,31,1),
(129,78,31,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=596 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(414,50,15,0,"coque"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(394,22,12,0,"soute"),
(232,-21,23,0,"autre"),
(320,22,15,0,"coque"),
(319,22,15,0,"coque"),
(318,22,15,0,"coque"),
(402,-22,24,0,"noyau"),
(317,22,14,2,"arme"),
(316,22,14,2,"arme"),
(315,22,11,2,"arme"),
(401,-22,15,0,"coque"),
(400,-22,15,0,"coque"),
(399,-22,15,0,"coque"),
(398,-22,14,2,"arme"),
(397,-22,14,2,"arme"),
(396,-22,12,0,"soute"),
(310,32,29,3,"arme"),
(309,32,29,3,"arme"),
(308,32,29,3,"arme"),
(307,31,29,3,"arme"),
(306,31,29,3,"arme"),
(305,31,29,3,"arme"),
(304,30,29,3,"arme"),
(303,30,29,3,"arme"),
(302,30,29,3,"arme"),
(421,51,15,0,"coque"),
(437,49,32,10,"moteur"),
(297,27,29,3,"arme"),
(412,50,15,0,"coque"),
(413,50,15,0,"coque"),
(411,50,12,0,"soute"),
(410,49,24,0,"noyau"),
(409,49,11,2,"arme"),
(408,49,14,2,"arme"),
(407,49,14,2,"arme"),
(406,49,15,0,"coque"),
(405,49,15,0,"coque"),
(404,49,15,0,"coque"),
(553,82,29,3,"arme"),
(552,82,29,3,"arme"),
(435,51,32,10,"moteur"),
(589,89,29,3,"arme"),
(418,50,24,0,"noyau"),
(580,87,29,3,"arme"),
(420,51,15,0,"coque"),
(419,51,12,0,"soute"),
(311,33,29,3,"arme"),
(395,-22,11,2,"arme"),
(323,22,24,0,"noyau"),
(416,50,14,2,"arme"),
(403,49,12,0,"soute"),
(551,81,29,3,"arme"),
(550,81,29,3,"arme"),
(588,89,29,3,"arme"),
(549,81,29,3,"arme"),
(548,81,29,3,"arme"),
(547,81,29,3,"arme"),
(545,80,29,3,"arme"),
(544,80,29,3,"arme"),
(543,80,29,3,"arme"),
(542,80,29,3,"arme"),
(541,79,29,3,"arme"),
(540,79,29,3,"arme"),
(539,78,29,3,"arme"),
(538,78,29,3,"arme"),
(584,88,29,3,"arme"),
(583,88,29,3,"arme"),
(417,50,11,2,"arme"),
(415,50,14,2,"arme"),
(436,50,32,10,"moteur"),
(587,89,29,3,"arme"),
(586,88,29,3,"arme"),
(579,87,29,3,"arme"),
(578,87,29,3,"arme"),
(571,85,29,3,"arme"),
(570,85,29,3,"arme"),
(569,85,29,3,"arme"),
(568,85,29,3,"arme"),
(575,86,29,3,"arme"),
(574,86,29,3,"arme"),
(573,86,29,3,"arme"),
(572,86,29,3,"arme"),
(582,88,29,3,"arme"),
(581,87,29,3,"arme"),
(546,80,29,3,"arme"),
(577,87,29,3,"arme"),
(576,86,29,3,"arme"),
(567,85,29,3,"arme"),
(422,51,15,0,"coque"),
(423,51,14,2,"arme"),
(424,51,14,2,"arme"),
(425,51,11,2,"arme"),
(426,51,24,0,"noyau"),
(585,88,29,3,"arme"),
(427,-49,11,2,"arme"),
(428,-49,12,0,"soute"),
(429,-49,14,2,"arme"),
(430,-49,14,2,"arme"),
(431,-49,15,0,"coque"),
(432,-49,15,0,"coque"),
(433,-49,15,0,"coque"),
(434,-49,24,0,"noyau"),
(590,89,29,3,"arme"),
(554,82,29,3,"arme"),
(555,82,29,3,"arme"),
(556,82,29,3,"arme"),
(557,83,29,3,"arme"),
(558,83,29,3,"arme"),
(559,83,29,3,"arme"),
(560,83,29,3,"arme"),
(561,83,29,3,"arme"),
(562,84,29,3,"arme"),
(563,84,29,3,"arme"),
(564,84,29,3,"arme"),
(565,84,29,3,"arme"),
(566,84,29,3,"arme"),
(591,89,29,3,"arme"),
(592,90,29,3,"arme"),
(593,90,29,3,"arme"),
(594,91,29,3,"arme"),
(595,91,29,3,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(76,4,2,4,4,841),
(77,4,1,5,4,842),
(78,0,2,4,4,843),
(79,4,4,4,4,844),
(80,4,3,5,4,845),
(81,4,2,5,4,846),
(82,-2,12,8,4,886),
(83,4,1,4,4,938),
(84,4,1,3,4,939),
(85,4,1,2,4,940),
(86,4,2,3,4,946),
(87,4,4,3,4,948),
(88,4,5,3,4,949),
(89,-2,3,17,4,962),
(90,-2,2,16,4,983),
(91,-2,1,16,4,984),
(92,4,4,2,4,998),
(93,4,3,2,4,999),
(94,4,3,4,4,1001),
(95,4,4,5,4,1002),
(96,4,5,5,4,1003),
(97,4,5,4,4,1004),
(98,-2,15,20,4,1042),
(99,-2,16,9,4,1054),
(100,-2,15,9,4,1055),
(101,-2,14,9,4,1056),
(102,-2,13,9,4,1057),
(103,-2,12,9,4,1058),
(104,-2,11,10,4,1063),
(105,-2,10,10,4,1064),
(106,-2,9,10,4,1065),
(107,-2,8,10,4,1066),
(108,-2,16,11,4,1072),
(109,-2,15,10,4,1074),
(110,-2,14,10,4,1075),
(111,-2,13,10,4,1076),
(112,-2,12,10,4,1077),
(113,-2,9,12,4,1153),
(114,-2,8,11,4,1155),
(115,-2,1,18,4,1190),
(116,-2,8,17,4,1193),
(117,-2,4,9,4,1221),
(118,-2,1,9,4,1222),
(119,-2,12,18,4,1245),
(120,-2,13,3,4,1246),
(121,-2,14,20,4,1267),
(122,-2,11,16,4,1268),
(123,-2,20,11,4,1276),
(124,-2,19,5,4,1282),
(125,-2,10,1,4,1302),
(126,-2,7,4,4,1303),
(127,-2,9,8,4,1320),
(128,-2,13,14,4,1331),
(129,-2,16,6,4,1332),
(130,-2,16,4,4,1337),
(131,-2,7,17,4,1341);


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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (14,55,-2,7,17,"Bataille",0,0,0,0,0),
(33,0,-2,2,7,"Essain alien",0,0,0,0,0),
(34,0,-2,7,17,"Essain alien",0,0,0,0,0),
(35,0,-2,15,2,"Essain alien",0,0,0,0,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=8300 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (8292,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(8293,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(8294,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(8295,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(8296,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(8297,4,"Votre population ne pouvait pas grandir faute de place.","planete",56),
(8298,4,"Cette flotte vient de se déplacer. Elle était avant en 13-14","flotte",14),
(8299,4,"Cette flotte vient d\'explorer le parsec (7 - 17).","flotte",14);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,760,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,122,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,830,4572,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,760,0,4,1,4497,112);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,3,0),
(28,55,3,0),
(29,55,3,0),
(30,55,2,0),
(31,55,2,0),
(32,55,2,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0),
(38,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1),
(38,36,4,16,3000,2805,1),
(39,36,4,15,3000,2805,1),
(43,43,4,22,300,137,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (1,2,11,1),
(22,2,24,3),
(17,2,19,1),
(24,2,6,5),
(25,2,26,1),
(21,19,6,10),
(55,55,8,60),
(47,55,6,86),
(58,55,31,5),
(50,55,15,6),
(57,55,19,5);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,300,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (51,14,"Croiseur de combat",20,10,3,50046,50007,1080,300,1),
(50,14,"Croiseur de combat",20,10,3,50046,50007,1080,300,1),
(89,35,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(49,14,"Croiseur de combat",20,10,3,50046,50016,1080,300,1),
(78,33,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(85,35,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(86,35,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(87,35,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(79,33,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(90,36,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(88,35,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(80,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(81,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(82,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(83,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(84,34,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(91,36,"Vaisseau alien",1,1,0,19,19,440,80,-3);


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
) ENGINE=MyISAM AUTO_INCREMENT=5743 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (5737,2,30,60,0,9,16,6),
(5738,19,15,20,100,5,8,2),
(5739,23,5,40,0,3,2,0),
(5740,53,30,20,100,8,22,0),
(5741,55,5,100,300,9,17,6),
(5742,56,20,0,0,4,16,0);


SET foreign_key_checks = 1;
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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (1,3,2),
(2,1,2),
(3,3,2),
(4,2,2),
(5,4,19),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (142,91,31,1),
(141,90,31,1),
(162,108,31,1),
(175,112,31,1),
(152,101,31,1),
(161,107,31,1),
(174,111,31,1),
(176,113,31,1),
(173,110,31,1),
(177,114,31,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=687 DEFAULT CHARSET=latin1;

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
(226,16,15,0,"coque"),
(414,50,15,0,"coque"),
(229,20,23,0,"autre"),
(230,-20,23,0,"autre"),
(394,22,12,0,"soute"),
(232,-21,23,0,"autre"),
(320,22,15,0,"coque"),
(319,22,15,0,"coque"),
(318,22,15,0,"coque"),
(402,-22,24,0,"noyau"),
(317,22,14,2,"arme"),
(316,22,14,2,"arme"),
(315,22,11,2,"arme"),
(401,-22,15,0,"coque"),
(400,-22,15,0,"coque"),
(399,-22,15,0,"coque"),
(398,-22,14,2,"arme"),
(397,-22,14,2,"arme"),
(396,-22,12,0,"soute"),
(310,32,29,3,"arme"),
(309,32,29,3,"arme"),
(308,32,29,3,"arme"),
(307,31,29,3,"arme"),
(306,31,29,3,"arme"),
(305,31,29,3,"arme"),
(304,30,29,3,"arme"),
(303,30,29,3,"arme"),
(302,30,29,3,"arme"),
(421,51,15,0,"coque"),
(437,49,32,10,"moteur"),
(297,27,29,3,"arme"),
(412,50,15,0,"coque"),
(413,50,15,0,"coque"),
(411,50,12,0,"soute"),
(410,49,24,0,"noyau"),
(409,49,11,2,"arme"),
(408,49,14,2,"arme"),
(407,49,14,2,"arme"),
(406,49,15,0,"coque"),
(405,49,15,0,"coque"),
(404,49,15,0,"coque"),
(435,51,32,9,"moteur"),
(666,110,29,3,"arme"),
(418,50,24,0,"noyau"),
(680,113,29,3,"arme"),
(420,51,15,0,"coque"),
(419,51,12,0,"soute"),
(311,33,29,3,"arme"),
(395,-22,11,2,"arme"),
(323,22,24,0,"noyau"),
(416,50,14,2,"arme"),
(403,49,12,0,"soute"),
(686,114,29,3,"arme"),
(417,50,11,2,"arme"),
(415,50,14,2,"arme"),
(436,50,32,10,"moteur"),
(685,114,29,3,"arme"),
(679,113,29,3,"arme"),
(678,113,29,3,"arme"),
(677,113,29,3,"arme"),
(675,112,29,3,"arme"),
(674,112,29,3,"arme"),
(673,112,29,3,"arme"),
(668,111,29,3,"arme"),
(669,111,29,3,"arme"),
(670,111,29,3,"arme"),
(671,111,29,3,"arme"),
(672,112,29,3,"arme"),
(631,101,29,3,"arme"),
(667,111,29,3,"arme"),
(422,51,15,0,"coque"),
(423,51,14,2,"arme"),
(424,51,14,2,"arme"),
(425,51,11,2,"arme"),
(426,51,24,0,"noyau"),
(676,112,29,3,"arme"),
(427,-49,11,2,"arme"),
(428,-49,12,0,"soute"),
(429,-49,14,2,"arme"),
(430,-49,14,2,"arme"),
(431,-49,15,0,"coque"),
(432,-49,15,0,"coque"),
(433,-49,15,0,"coque"),
(434,-49,24,0,"noyau"),
(681,113,29,3,"arme"),
(682,114,29,3,"arme"),
(683,114,29,3,"arme"),
(684,114,29,3,"arme"),
(660,108,29,3,"arme"),
(659,108,29,3,"arme"),
(658,107,29,3,"arme"),
(657,107,29,3,"arme"),
(665,110,29,3,"arme"),
(664,110,29,3,"arme"),
(663,110,29,3,"arme"),
(662,110,29,3,"arme"),
(592,90,29,3,"arme"),
(593,90,29,3,"arme"),
(594,91,29,3,"arme"),
(595,91,29,3,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

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
(56,3,5,1,3,526),
(57,4,3,3,4,1),
(58,4,2,2,4,615),
(59,4,1,1,4,616),
(60,4,2,1,4,619),
(61,4,3,1,4,620),
(62,4,4,1,4,621),
(63,4,5,1,4,622),
(64,4,5,2,4,623),
(76,4,2,4,4,841),
(77,4,1,5,4,842),
(78,0,2,4,4,843),
(79,4,4,4,4,844),
(80,4,3,5,4,845),
(81,4,2,5,4,846),
(82,-2,12,8,4,886),
(83,4,1,4,4,938),
(84,4,1,3,4,939),
(85,4,1,2,4,940),
(86,4,2,3,4,946),
(87,4,4,3,4,948),
(88,4,5,3,4,949),
(89,-2,3,17,4,962),
(90,-2,2,16,4,983),
(91,-2,1,16,4,984),
(92,4,4,2,4,998),
(93,4,3,2,4,999),
(94,4,3,4,4,1001),
(95,4,4,5,4,1002),
(96,4,5,5,4,1003),
(97,4,5,4,4,1004),
(98,-2,15,20,4,1042),
(99,-2,16,9,4,1054),
(100,-2,15,9,4,1055),
(101,-2,14,9,4,1056),
(102,-2,13,9,4,1057),
(103,-2,12,9,4,1058),
(104,-2,11,10,4,1063),
(105,-2,10,10,4,1064),
(106,-2,9,10,4,1065),
(107,-2,8,10,4,1066),
(108,-2,16,11,4,1072),
(109,-2,15,10,4,1074),
(110,-2,14,10,4,1075),
(111,-2,13,10,4,1076),
(112,-2,12,10,4,1077),
(113,-2,9,12,4,1153),
(114,-2,8,11,4,1155),
(115,-2,1,18,4,1190),
(116,-2,8,17,4,1193),
(117,-2,4,9,4,1221),
(118,-2,1,9,4,1222),
(119,-2,12,18,4,1245),
(120,-2,13,3,4,1246),
(121,-2,14,20,4,1267),
(122,-2,11,16,4,1268),
(123,-2,20,11,4,1276),
(124,-2,19,5,4,1282),
(125,-2,10,1,4,1302),
(126,-2,7,4,4,1303),
(127,-2,9,8,4,1320),
(128,-2,13,14,4,1331),
(129,-2,16,6,4,1332),
(130,-2,16,4,4,1337),
(131,-2,7,17,4,1341),
(132,-2,16,14,4,1343),
(133,-2,15,2,4,1345),
(134,-2,10,2,4,1347),
(135,-2,14,15,4,1364),
(136,-2,3,11,4,1366),
(137,-2,3,6,4,1394),
(138,-2,2,7,4,1395),
(139,-2,11,6,4,1414),
(140,-2,6,7,4,1415),
(141,-2,14,5,4,1429),
(142,-2,14,3,4,1430);


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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (14,55,-2,14,3,"Bataille",0,0,0,0,0),
(44,0,-2,19,18,"Essain alien",-2,19,4,6,0),
(40,0,-2,15,7,"Essain alien",-2,1,12,6,0),
(42,0,-2,8,12,"Essain alien",-2,5,0,6,0);


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
(54,1,1,8,1,1,0,1),
(55,1,1,10,5,5,0,2),
(56,1,1,4,1,1,1,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Amirauté",68,3,0,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=8875 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (8869,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",2),
(8870,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(8871,3,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(8872,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(8873,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(8874,4,"Votre population ne pouvait pas grandir faute de place.","planete",56);


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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0),
(2,"NewHome",3,3,2,2,760,9715,8,0,10228,114),
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
(19,"Ydillia",1,3,2,2,368,1,4,1,5870,117),
(20,"bif",9,19,-2,0,10,0,3,3,10,0),
(21,"bif",2,8,-2,0,10,0,4,2,10,0),
(22,"bif",7,11,-2,0,10,0,5,3,10,0),
(23,"Planete secteur 2",1,17,-2,3,122,0,3,3,3529,118),
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
(53,"bif",3,3,3,3,1054,0,8,0,9638,120),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0),
(55,"Planète sans nom",3,3,4,4,101,4572,8,0,10184,113),
(56,"Planète sans nom",5,1,4,4,760,0,4,1,4497,112);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

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
(24,19,1,0),
(25,55,2,0),
(26,55,2,0),
(27,55,1,0),
(28,55,3,0),
(29,55,3,0),
(30,55,2,0),
(31,55,2,0),
(32,55,1,0),
(33,56,1,0),
(34,56,1,0),
(35,23,1,0),
(36,55,1,0),
(37,56,1,0),
(38,56,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

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
(27,500,3,11,0,1000,1),
(28,28,4,4,300,216,1),
(29,29,4,1,600,570,1),
(30,30,4,3,500,447,1),
(31,31,4,6,3000,2985,1),
(32,32,4,19,200,171,1),
(33,33,4,16,200,142,1),
(34,34,4,10,4100,3960,1),
(35,35,4,11,3000,2760,1),
(36,36,4,7,3000,2805,1),
(38,36,4,16,3000,2805,1),
(39,36,4,15,3000,2805,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (64,55,30,5),
(62,55,8,16),
(61,55,6,16);


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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,200,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (51,14,"Croiseur de combat",20,10,3,50046,49983,1080,300,1),
(50,14,"Croiseur de combat",20,10,3,50046,49974,1080,300,1),
(107,42,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(49,14,"Croiseur de combat",20,10,3,50046,49992,1080,300,1),
(113,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(111,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(112,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(90,36,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(114,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(101,40,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(110,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(91,36,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(108,42,"Vaisseau alien",1,1,0,19,19,440,80,-3);


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
) ENGINE=MyISAM AUTO_INCREMENT=6283 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (6277,2,30,60,0,9,16,6),
(6278,19,15,20,100,5,8,2),
(6279,23,5,40,0,3,2,0),
(6280,53,30,20,100,8,22,0),
(6281,55,15,80,200,9,2,6),
(6282,56,20,0,0,4,16,0);


SET foreign_key_checks = 1;
