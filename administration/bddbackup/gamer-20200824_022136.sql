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
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `batiment`;

CREATE TABLE `batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO `batiment` VALUES (14,33,60),
(2,1,2),
(13,3,2),
(6,3,55),
(7,1,55),
(8,2,55),
(9,3,55),
(10,21,2),
(11,33,59);


DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;

INSERT INTO `cargovaisseau` VALUES (142,91,31,1),
(141,90,31,1),
(180,117,31,1),
(179,116,31,1),
(181,118,31,1),
(175,112,31,1),
(178,115,31,1),
(174,111,31,1),
(176,113,31,1),
(173,110,31,1),
(177,114,31,1),
(182,119,31,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=750 DEFAULT CHARSET=latin1;

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
(435,51,32,10,"moteur"),
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
(693,116,29,3,"arme"),
(694,116,29,3,"arme"),
(695,117,29,3,"arme"),
(696,117,29,3,"arme"),
(697,117,29,3,"arme"),
(698,117,29,3,"arme"),
(699,118,29,3,"arme"),
(700,118,29,3,"arme"),
(701,118,29,3,"arme"),
(692,116,29,3,"arme"),
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
(690,115,29,3,"arme"),
(689,115,29,3,"arme"),
(688,115,29,3,"arme"),
(687,115,29,3,"arme"),
(665,110,29,3,"arme"),
(664,110,29,3,"arme"),
(663,110,29,3,"arme"),
(691,116,29,3,"arme"),
(662,110,29,3,"arme"),
(592,90,29,3,"arme"),
(593,90,29,3,"arme"),
(594,91,29,3,"arme"),
(595,91,29,3,"arme"),
(703,119,29,3,"arme"),
(702,118,29,3,"arme"),
(704,-124,10,0,"moteur"),
(705,-124,24,0,"noyau"),
(706,-124,11,2,"arme"),
(707,-124,15,0,"coque"),
(708,-124,12,0,"soute"),
(709,-124,23,0,"autre"),
(710,125,12,0,"soute"),
(711,125,12,0,"soute"),
(712,125,15,0,"coque"),
(713,125,15,0,"coque"),
(714,125,11,2,"arme"),
(715,-125,11,2,"arme"),
(716,-125,12,0,"soute"),
(717,-125,12,0,"soute"),
(718,-125,15,0,"coque"),
(719,-125,15,0,"coque"),
(720,126,12,0,"soute"),
(721,126,12,0,"soute"),
(722,126,15,0,"coque"),
(723,126,15,0,"coque"),
(724,126,11,2,"arme"),
(725,127,12,0,"soute"),
(726,127,12,0,"soute"),
(727,127,15,0,"coque"),
(728,127,15,0,"coque"),
(729,127,11,2,"arme"),
(730,128,12,0,"soute"),
(731,128,12,0,"soute"),
(732,128,15,0,"coque"),
(733,128,15,0,"coque"),
(734,128,11,2,"arme"),
(735,129,12,0,"soute"),
(736,129,12,0,"soute"),
(737,129,15,0,"coque"),
(738,129,15,0,"coque"),
(739,129,11,2,"arme"),
(740,130,12,0,"soute"),
(741,130,12,0,"soute"),
(742,130,15,0,"coque"),
(743,130,15,0,"coque"),
(744,130,11,2,"arme"),
(745,131,12,0,"soute"),
(746,131,12,0,"soute"),
(747,131,15,0,"coque"),
(748,131,15,0,"coque"),
(749,131,11,2,"arme");


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
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (187,1,1,40,0,60,0,19,2);


DROP TABLE IF EXISTS `destruction`;

CREATE TABLE `destruction` (
  `iddestruction` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetedestruction` int(11) NOT NULL,
  `idbatimentdestruction` int(11) NOT NULL,
  PRIMARY KEY (`iddestruction`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (8,-2,2,14,4,1483),
(7,-2,8,7,4,1482),
(6,-2,6,7,4,1481),
(5,-2,10,10,4,1480),
(9,-2,3,3,4,1502),
(10,-2,2,13,4,1529),
(11,-2,1,17,4,1530),
(12,2,1,3,4,1536),
(13,8,3,3,8,1);


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
  `structuretotale` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idflotte`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (14,55,2,1,3,"Bataille",0,0,0,0,0,36),
(46,0,-2,12,11,"Essain alien",-2,8,1,6,0,5),
(44,0,-2,7,6,"Essain alien",-2,12,6,6,0,105),
(45,0,-2,16,1,"Essain alien",0,0,0,0,0,68),
(47,-2,2,3,3,"Flotte de défense",0,0,0,0,0,0),
(48,2,2,3,3,"nouvelleflotte",0,0,0,0,0,8),
(50,-23,0,0,0,"Flotte de défense",0,0,0,0,0,8),
(49,-55,0,0,0,"Flotte de défense",0,0,0,0,0,32);


DROP TABLE IF EXISTS `limiteplanete`;

CREATE TABLE `limiteplanete` (
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

INSERT INTO `limiteplanete` VALUES (2,7,5,1,2,0,2,1),
(1,8,1,1,1,0,1,1),
(3,8,1,1,1,0,1,1),
(4,8,1,1,1,0,1,1),
(5,8,1,1,1,0,1,1),
(6,8,1,1,1,0,1,1),
(7,8,1,1,1,0,1,1),
(8,8,1,1,1,0,1,1),
(9,8,1,1,1,0,1,1),
(10,8,1,1,1,0,1,1),
(11,8,1,1,1,0,1,1),
(12,8,1,1,1,0,1,1),
(13,8,1,1,1,0,1,1),
(14,8,1,1,1,0,1,1),
(15,8,1,1,1,0,1,1),
(16,8,1,1,1,0,1,1),
(17,8,1,1,1,0,1,1),
(18,8,1,1,1,0,1,1),
(19,3,1,1,2,1,1,1),
(20,8,1,1,1,0,1,1),
(21,8,1,1,1,0,1,1),
(22,8,1,1,1,0,1,1),
(23,3,1,1,2,3,0,1),
(24,8,1,1,1,0,1,1),
(25,8,1,1,1,0,1,1),
(26,8,1,1,1,0,1,1),
(27,8,1,1,1,0,1,1),
(28,8,1,1,1,0,1,1),
(29,8,1,1,1,0,1,1),
(30,8,1,1,1,0,1,1),
(31,8,1,1,1,0,1,1),
(32,8,1,1,1,0,1,1),
(33,8,1,1,1,0,1,1),
(34,8,1,1,1,0,1,1),
(35,8,1,1,1,0,1,1),
(36,8,1,1,1,0,1,1),
(37,8,1,1,1,0,1,1),
(38,8,1,1,1,0,1,1),
(39,8,1,1,1,0,1,1),
(40,8,1,1,1,0,1,1),
(41,8,1,1,1,0,1,1),
(42,8,1,1,1,0,1,1),
(43,8,1,1,1,0,1,1),
(44,8,1,1,1,0,1,1),
(45,8,1,1,1,0,1,1),
(46,8,1,1,1,0,1,1),
(47,8,1,1,1,0,1,1),
(48,8,1,1,1,0,1,1),
(49,8,1,1,1,0,1,1),
(50,8,1,1,1,0,1,1),
(51,8,1,1,1,0,1,1),
(52,8,1,1,1,0,1,1),
(53,8,1,1,2,0,2,1),
(54,8,1,1,1,0,1,1),
(55,10,5,5,2,0,2,1),
(56,4,1,1,2,1,1,1),
(57,8,1,1,2,0,1,1),
(58,8,1,1,2,0,1,1),
(59,8,1,1,2,0,1,2),
(60,8,1,1,2,0,1,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Conseil civil",158,7,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Ministre de la recherche",157,7,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",156,7,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteur interstellaire\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=10633 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (10622,4,"Votre population ne pouvait pas grandir faute de place.","planete",2),
(10623,2,"Votre population ne pouvait pas grandir faute de place.","planete",19),
(10624,4,"Votre population ne pouvait pas grandir faute de place.","planete",23),
(10625,3,"Votre population ne pouvait pas grandir faute de place.","planete",53),
(10626,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",55),
(10627,4,"Votre population ne pouvait pas grandir faute de place.","planete",56),
(10628,5,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",57),
(10629,6,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",58),
(10630,7,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",59),
(10631,8,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",60),
(10632,19,"Manque d\'ouvriers !","Construction",187);


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
  `environnement` int(11) NOT NULL DEFAULT '0',
  `stabiliteenvironnement` int(11) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"bif",8,7,-2,0,10,0,3,0,10,0,3000,679),
(2,"NewHome",3,3,2,4,3748,9429,8,0,10021,111,-1001,1000),
(3,"bif",6,9,-2,0,10,0,4,0,10,0,0,970),
(4,"bif",13,10,-2,0,10,0,3,3,10,0,0,970),
(5,"bif",18,4,-2,0,10,0,3,0,10,0,0,970),
(6,"bif",17,16,-2,0,10,0,3,1,10,0,0,970),
(7,"bif",15,14,-2,0,10,0,4,2,10,0,0,970),
(8,"bif",2,14,-2,0,10,0,6,2,10,0,0,970),
(9,"bif",20,4,-2,0,10,0,6,3,10,0,0,970),
(10,"bif",15,10,-2,0,10,0,4,3,10,0,0,970),
(11,"bif",1,6,-2,0,10,0,4,2,10,0,0,970),
(12,"bif",20,15,-2,0,10,0,4,1,10,0,0,970),
(13,"bif",5,15,-2,0,10,0,6,2,10,0,0,970),
(14,"bif",17,9,-2,0,10,0,6,0,10,0,0,970),
(15,"bif",20,8,-2,0,10,0,4,0,10,0,0,970),
(16,"bif",14,5,-2,0,10,0,6,2,10,0,0,970),
(17,"bif",2,3,-2,0,10,0,3,1,10,0,0,970),
(18,"bif",15,13,-2,0,10,0,4,2,10,0,0,970),
(19,"Ydillia",1,3,2,2,2135,1,4,1,5870,147,-600,660),
(20,"bif",9,19,-2,0,10,0,3,3,10,0,0,970),
(21,"bif",2,8,-2,0,10,0,4,2,10,0,0,970),
(22,"bif",7,11,-2,0,10,0,5,3,10,0,0,970),
(23,"Planete secteur 2",1,17,-2,4,502,0,3,3,3632,121,0,970),
(24,"bif",3,1,-2,0,10,0,4,3,10,0,0,970),
(25,"bif",16,13,-2,0,10,0,5,3,10,0,0,970),
(26,"bif",2,13,-2,0,10,0,3,1,10,0,0,970),
(27,"bif",19,17,-2,0,10,0,5,0,10,0,0,970),
(28,"bif",18,7,-2,0,10,0,4,1,10,0,0,970),
(29,"bif",12,16,-2,0,10,0,4,0,10,0,0,970),
(30,"bif",6,13,-2,0,10,0,3,3,10,0,0,970),
(31,"bif",8,16,-2,0,10,0,6,0,10,0,0,970),
(32,"bif",18,5,-2,0,10,0,3,3,10,0,0,970),
(33,"bif",9,11,-2,0,10,0,5,0,10,0,0,970),
(34,"bif",4,12,-2,0,10,0,3,2,10,0,0,970),
(35,"bif",6,16,-2,0,10,0,4,3,10,0,0,970),
(36,"bif",20,14,-2,0,10,0,3,1,10,0,0,970),
(37,"bif",16,11,-2,0,10,0,4,3,10,0,0,970),
(38,"bif",16,14,-2,0,10,0,5,0,10,0,0,970),
(39,"bif",20,19,-2,0,10,0,5,0,10,0,0,970),
(40,"bif",19,3,-2,0,10,0,4,3,10,0,0,970),
(41,"bif",8,2,-2,0,10,0,4,1,10,0,0,970),
(42,"bif",14,2,-2,0,10,0,6,0,10,0,0,970),
(43,"bif",12,5,-2,0,10,0,3,3,10,0,0,970),
(44,"bif",14,7,-2,0,10,0,5,0,10,0,0,970),
(45,"bif",12,19,-2,0,10,0,3,3,10,0,0,970),
(46,"bif",6,14,-2,0,10,0,3,1,10,0,0,970),
(47,"bif",4,11,-2,0,10,0,5,1,10,0,0,970),
(48,"bif",11,14,-2,0,10,0,4,0,10,0,0,970),
(49,"bif",19,20,-2,0,10,0,4,1,10,0,0,970),
(50,"bif",4,4,-2,0,10,0,4,1,10,0,0,970),
(51,"bif",17,12,-2,0,10,0,3,1,10,0,0,970),
(52,"bif",7,19,-2,0,10,0,4,0,10,0,0,970),
(53,"bif",3,3,3,3,4399,0,8,0,9638,120,0,970),
(54,"Planète sans nom",5,1,3,0,10,0,4,1,10,0,0,970),
(55,"Planète sans nom",3,3,4,4,371,4572,8,0,10184,113,0,970),
(56,"Planète sans nom",5,1,4,4,2996,0,4,1,4497,112,0,970),
(57,"Planète sans nom",3,3,5,5,5078,0,8,0,9638,138,0,970),
(58,"Planète sans nom",3,3,6,6,5093,0,8,0,9638,138,0,970),
(59,"Planète sans nom",3,3,7,7,3513,0,8,0,9638,138,0,970),
(60,"Planète sans nom",3,3,8,8,2690,0,8,0,9638,138,0,1000);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

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
(60,60,4,0),
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
(27,55,4,0),
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
(38,56,1,0),
(39,57,1,0),
(40,57,1,0),
(41,57,1,0),
(42,57,1,0),
(43,57,1,0),
(44,57,1,0),
(45,58,1,0),
(46,58,1,0),
(47,58,1,0),
(48,58,1,0),
(49,58,1,0),
(50,58,1,0),
(51,59,3,0),
(52,59,2,0),
(53,59,1,0),
(54,59,1,0),
(55,59,1,0),
(56,59,1,0),
(57,58,1,0),
(58,57,1,0),
(59,59,1,0),
(61,60,1,0),
(62,60,2,0),
(63,60,1,0),
(64,60,1,0),
(65,60,1,0),
(66,60,1,0);


DROP TABLE IF EXISTS `rapportcombat`;

CREATE TABLE `rapportcombat` (
  `idrapportcombat` int(11) NOT NULL AUTO_INCREMENT,
  `idflotteattaquant` int(11) NOT NULL,
  `idflottedefenseur` int(11) NOT NULL,
  `texteattaquant` text NOT NULL,
  `textedefenseur` text NOT NULL,
  PRIMARY KEY (`idrapportcombat`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

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
(51,51,7,4,400,388,1),
(52,52,7,1,500,414,1);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

INSERT INTO `silo` VALUES (68,23,23,1),
(67,2,24,1),
(64,55,30,5),
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$erzEjnmsDeGM8ZRcR9CRX.BsucHpYoKBve.HAxcv0atRfIpfNql42","2020-07-24",0,0,0,100,1,0),
(2,"qwe","$2y$10$AAUw38lMmQ5TNZKORxYAXeJO5Kqv4Kc9FoXB/.bqnuwwBId0fDBTu","2020-07-24",0,0,14,100,0,911),
(3,"rty","$2y$10$Pt60SGXw0sXCo4WHEF67juDk9S6Xmk2sMWNX/cQZIk1Bf3zxVIsDe","2020-08-06",0,0,6,100,0,0),
(4,"asd","$2y$10$0GiNJ/sP9Q/yiCaMSFmk2.fJ3LE16axRnTNmS6qym0BWkka2erEV.","2020-08-12",0,0,10,200,0,0),
(5,"zxc","$2y$10$VVuBFF0Z3ckBus5fxrg.geLoB9pS3cv3wv9nrKgNJ2O7qYS4y/mHq","2020-08-14",0,0,1,0,0,0),
(6,"vbn","$2y$10$blRkzoIOH8YcRGiD7gcwr.o3n8.oCt1XeGFVwupHULK3Wr.WIW6Ni","2020-08-14",0,0,1,0,0,0),
(7,"xcv","$2y$10$A4EtFyENXWJwvIrM6RSZ1es8QyDp55XoiGq0EjnwcJZsc78VguGk.","2020-08-14",0,0,3,100,0,0),
(8,"wer","$2y$10$0EgkDjqfnxiB1ODAOu105uUWDluS5Sh/aHIbZw1UrQw7YoFkh4O46","2020-08-21",0,0,1,0,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (51,14,"Croiseur de combat",20,10,3,50046,49980,1080,300,1),
(50,14,"Croiseur de combat",20,10,3,50046,49971,1080,300,1),
(115,45,"Vaisseau alien",1,1,0,35,35,840,160,5),
(49,14,"Croiseur de combat",20,10,3,50046,49989,1080,300,1),
(118,45,"Vaisseau alien",1,1,0,35,35,840,160,5),
(113,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(111,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(112,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(90,36,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(114,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(124,-2,"Vaisseau de test",1,1,0,3,3,40,0,-11),
(117,45,"Vaisseau alien",1,1,0,35,35,840,160,5),
(110,44,"Vaisseau alien",1,1,0,43,43,1040,200,9),
(91,36,"Vaisseau alien",1,1,0,19,19,440,80,-3),
(119,46,"Vaisseau alien",1,1,0,11,11,240,40,-7),
(116,45,"Vaisseau alien",1,1,0,35,35,840,160,5),
(123,-7,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(125,-4,"Transporteur",1,20,3,33,33,270,0,-4),
(126,48,"Transporteur",1,20,3,33,33,270,0,-4),
(127,49,"Transporteur",1,20,3,33,33,270,0,-4),
(128,50,"Transporteur",1,20,3,33,33,270,0,-4),
(129,49,"Transporteur",1,20,3,33,33,270,0,-4),
(130,49,"Transporteur",1,20,3,33,33,270,0,-4),
(131,49,"Transporteur",1,20,3,33,33,270,0,-4);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
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
) ENGINE=MyISAM AUTO_INCREMENT=7768 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (7758,2,120,60,0,0,9,77,8,8),
(7759,19,60,0,100,0,4,44,0,0),
(7760,23,20,40,0,0,3,10,0,8),
(7761,53,120,20,100,0,8,90,0,0),
(7762,55,40,80,200,0,9,8,6,8),
(7763,56,80,0,0,0,4,61,0,0),
(7764,57,140,0,0,0,7,104,0,0),
(7765,58,140,0,0,0,7,104,0,0),
(7766,59,100,20,100,0,7,72,0,0),
(7767,60,100,20,0,0,7,55,0,0);


SET foreign_key_checks = 1;
