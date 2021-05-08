CREATE DATABASE IF NOT EXISTS `ynyfwcqz_kaien_starsempire`;

USE `ynyfwcqz_kaien_starsempire`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `c_bataille`;

CREATE TABLE `c_bataille` (
  `idbataille` int(11) NOT NULL AUTO_INCREMENT,
  `idflotteoffensive` int(11) NOT NULL,
  `idflottedefensive` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idbataille`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_batiment`;

CREATE TABLE `c_batiment` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `c_batiment` VALUES (1,33,3),
(2,33,6),
(3,33,7),
(4,3,7),
(5,1,7),
(6,2,7),
(7,3,3),
(8,3,7);


DROP TABLE IF EXISTS `c_cargovaisseau`;

CREATE TABLE `c_cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

INSERT INTO `c_cargovaisseau` VALUES (1,1,31,1),
(2,2,31,1),
(3,3,31,1),
(4,4,31,1),
(5,5,31,1),
(6,6,31,1),
(7,7,31,1),
(8,8,31,1),
(9,9,31,1),
(10,10,31,1),
(11,14,18,1),
(12,14,16,1),
(13,18,31,1),
(14,19,31,1),
(15,20,31,1),
(16,21,31,1),
(17,22,31,1),
(18,23,31,1),
(19,24,31,1),
(20,25,31,1),
(21,26,31,1),
(22,28,31,1),
(23,29,31,1),
(24,30,31,1),
(25,31,31,1),
(26,32,31,1),
(27,33,31,1),
(28,34,31,1),
(29,35,31,1),
(30,36,31,1),
(31,37,31,1),
(32,38,31,1),
(33,39,31,1),
(34,40,31,1),
(35,41,31,1),
(36,42,31,1),
(37,43,31,1),
(38,44,31,1),
(39,45,31,1),
(40,46,31,1),
(41,47,31,1),
(42,48,31,1),
(43,49,31,1),
(44,50,31,1),
(45,51,31,1),
(46,52,31,1),
(47,53,31,1),
(48,54,31,1),
(49,55,31,1),
(50,56,31,1),
(51,57,31,1),
(52,58,31,1),
(53,59,31,1);


DROP TABLE IF EXISTS `c_champsasteroides`;

CREATE TABLE `c_champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

INSERT INTO `c_champsasteroides` VALUES (1,1,1,-2,3,6),
(2,6,18,-2,3,6),
(3,20,13,-2,2,6),
(4,20,13,-2,3,8),
(5,11,5,-2,3,6),
(6,5,19,-2,3,6),
(7,7,6,-3,3,36),
(8,14,9,-3,5,36),
(9,9,11,-3,4,36),
(10,19,3,-2,3,6),
(11,8,10,-2,3,6),
(12,18,6,-2,2,6),
(13,18,6,-2,3,8),
(14,11,13,-2,10,6),
(15,16,3,-2,3,6),
(16,7,6,-3,5,36),
(17,14,9,-3,2,36),
(18,9,11,-3,2,36),
(19,1,2,4,5,6),
(20,2,2,4,1,8),
(21,2,2,4,2,6),
(22,5,2,4,5,6),
(23,5,2,4,1,8),
(24,5,4,4,2,6),
(25,5,4,4,4,8),
(26,4,4,4,10,6),
(27,7,15,-2,3,6),
(28,14,10,-2,3,6),
(29,8,4,-2,3,6),
(30,11,6,-2,3,6),
(31,9,10,-2,4,6),
(32,9,10,-2,10,8),
(33,7,6,-3,2,36),
(34,14,9,-3,4,36),
(35,9,11,-3,3,36),
(36,11,2,-2,10,6),
(37,20,5,-2,4,6),
(38,20,5,-2,10,8),
(39,20,4,-2,3,6),
(40,19,16,-2,3,6),
(41,19,6,-2,3,6),
(42,7,6,-3,2,36),
(43,14,9,-3,5,36),
(44,9,11,-3,4,36),
(45,3,7,-2,3,6),
(46,2,7,-2,3,6),
(47,8,20,-2,3,6),
(48,3,4,-2,3,6),
(49,12,15,-2,3,6),
(50,7,6,-3,4,36),
(51,14,9,-3,4,36),
(52,9,11,-3,2,36),
(53,19,2,-2,3,6),
(54,9,20,-2,2,6),
(55,9,20,-2,3,8),
(56,20,18,-2,4,6),
(57,20,18,-2,10,8),
(58,7,20,-2,3,6),
(59,6,3,-2,4,6),
(60,6,3,-2,10,8),
(61,7,6,-3,3,36),
(62,14,9,-3,4,36),
(63,9,11,-3,5,36),
(64,12,13,-2,2,6),
(65,12,13,-2,3,8),
(66,15,14,-2,10,6),
(67,7,3,-2,3,6),
(68,2,3,-2,2,6),
(69,2,3,-2,3,8),
(70,20,15,-2,10,6),
(71,7,6,-3,2,36),
(72,14,9,-3,2,36),
(73,9,11,-3,2,36),
(74,20,10,-2,3,6),
(75,12,2,-2,3,6),
(76,4,10,-2,3,6),
(77,2,7,-2,3,6),
(78,15,1,-2,3,6),
(79,7,6,-3,2,36),
(80,14,9,-3,4,36),
(81,9,11,-3,3,36),
(82,7,6,-3,4,36),
(83,9,11,-3,2,36),
(84,7,6,-3,4,36),
(85,9,11,-3,2,36),
(86,9,11,-3,4,36),
(87,2,5,4,10,6),
(88,4,1,3,5,6),
(89,1,1,3,1,8),
(90,1,1,3,2,6);


DROP TABLE IF EXISTS `c_composantvaisseau`;

CREATE TABLE `c_composantvaisseau` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucompo` int(11) NOT NULL COMMENT 'Si nég = modification de conception ou d''un vaisseau en cours',
  `iditemcomposant` int(11) NOT NULL,
  `tirrestant` int(11) NOT NULL DEFAULT 0,
  `typecomposant` varchar(32) NOT NULL,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=latin1;

INSERT INTO `c_composantvaisseau` VALUES (1,1,29,2,"arme"),
(2,1,29,2,"arme"),
(3,1,29,2,"arme"),
(4,1,29,2,"arme"),
(5,1,29,2,"arme"),
(6,2,29,2,"arme"),
(7,2,29,2,"arme"),
(8,2,29,2,"arme"),
(9,2,29,2,"arme"),
(10,2,29,2,"arme"),
(11,3,29,2,"arme"),
(12,3,29,2,"arme"),
(13,3,29,2,"arme"),
(14,3,29,2,"arme"),
(15,3,29,2,"arme"),
(16,4,29,2,"arme"),
(17,4,29,2,"arme"),
(18,4,29,2,"arme"),
(19,4,29,2,"arme"),
(20,4,29,2,"arme"),
(21,5,29,2,"arme"),
(22,5,29,2,"arme"),
(23,5,29,2,"arme"),
(24,5,29,2,"arme"),
(25,5,29,2,"arme"),
(26,6,29,2,"arme"),
(27,6,29,2,"arme"),
(28,6,29,2,"arme"),
(29,7,29,2,"arme"),
(30,7,29,2,"arme"),
(31,7,29,2,"arme"),
(32,8,29,2,"arme"),
(33,8,29,2,"arme"),
(34,8,29,2,"arme"),
(35,9,29,2,"arme"),
(36,10,29,2,"arme"),
(37,14,13,4,"arme"),
(39,-13,10,0,"moteur"),
(40,-12,10,0,"moteur"),
(213,11,10,0,"moteur"),
(45,18,29,2,"arme"),
(43,-15,10,0,"moteur"),
(44,-15,0,0,"rien"),
(46,18,29,2,"arme"),
(47,18,29,2,"arme"),
(48,18,29,2,"arme"),
(49,19,29,2,"arme"),
(50,19,29,2,"arme"),
(51,19,29,2,"arme"),
(52,19,29,2,"arme"),
(53,20,29,2,"arme"),
(54,20,29,2,"arme"),
(55,20,29,2,"arme"),
(56,20,29,2,"arme"),
(57,21,29,2,"arme"),
(58,21,29,2,"arme"),
(59,21,29,2,"arme"),
(60,21,29,2,"arme"),
(61,22,29,2,"arme"),
(62,22,29,2,"arme"),
(63,22,29,2,"arme"),
(64,22,29,2,"arme"),
(65,22,29,2,"arme"),
(66,23,29,2,"arme"),
(67,23,29,2,"arme"),
(68,23,29,2,"arme"),
(69,23,29,2,"arme"),
(70,23,29,2,"arme"),
(71,24,29,2,"arme"),
(72,24,29,2,"arme"),
(73,24,29,2,"arme"),
(74,24,29,2,"arme"),
(75,24,29,2,"arme"),
(76,25,29,2,"arme"),
(77,25,29,2,"arme"),
(78,25,29,2,"arme"),
(79,25,29,2,"arme"),
(80,25,29,2,"arme"),
(81,26,29,2,"arme"),
(82,26,29,2,"arme"),
(83,26,29,2,"arme"),
(84,26,29,2,"arme"),
(85,26,29,2,"arme"),
(86,28,29,2,"arme"),
(87,28,29,2,"arme"),
(88,28,29,2,"arme"),
(89,29,29,2,"arme"),
(90,29,29,2,"arme"),
(91,29,29,2,"arme"),
(92,30,29,2,"arme"),
(93,30,29,2,"arme"),
(94,30,29,2,"arme"),
(95,31,29,2,"arme"),
(96,31,29,2,"arme"),
(97,31,29,2,"arme"),
(98,32,29,2,"arme"),
(99,32,29,2,"arme"),
(100,32,29,2,"arme"),
(101,33,29,2,"arme"),
(102,33,29,2,"arme"),
(103,33,29,2,"arme"),
(104,34,29,2,"arme"),
(105,34,29,2,"arme"),
(106,35,29,2,"arme"),
(107,35,29,2,"arme"),
(108,36,29,2,"arme"),
(109,36,29,2,"arme"),
(110,36,29,2,"arme"),
(111,37,29,2,"arme"),
(112,37,29,2,"arme"),
(113,37,29,2,"arme"),
(114,38,29,2,"arme"),
(115,38,29,2,"arme"),
(116,38,29,2,"arme"),
(117,39,29,2,"arme"),
(118,39,29,2,"arme"),
(119,39,29,2,"arme"),
(120,39,29,2,"arme"),
(121,39,29,2,"arme"),
(122,40,29,2,"arme"),
(123,40,29,2,"arme"),
(124,40,29,2,"arme"),
(125,40,29,2,"arme"),
(126,40,29,2,"arme"),
(127,41,29,2,"arme"),
(128,41,29,2,"arme"),
(129,41,29,2,"arme"),
(130,41,29,2,"arme"),
(131,41,29,2,"arme"),
(132,42,29,2,"arme"),
(133,42,29,2,"arme"),
(134,42,29,2,"arme"),
(135,42,29,2,"arme"),
(136,42,29,2,"arme"),
(137,43,29,2,"arme"),
(138,43,29,2,"arme"),
(139,43,29,2,"arme"),
(140,43,29,2,"arme"),
(141,43,29,2,"arme"),
(142,44,29,2,"arme"),
(143,45,29,2,"arme"),
(144,45,29,2,"arme"),
(145,45,29,2,"arme"),
(146,45,29,2,"arme"),
(147,45,29,2,"arme"),
(148,46,29,2,"arme"),
(149,46,29,2,"arme"),
(150,46,29,2,"arme"),
(151,46,29,2,"arme"),
(152,46,29,2,"arme"),
(153,47,29,2,"arme"),
(154,47,29,2,"arme"),
(155,47,29,2,"arme"),
(156,47,29,2,"arme"),
(157,47,29,2,"arme"),
(158,48,29,2,"arme"),
(159,48,29,2,"arme"),
(160,48,29,2,"arme"),
(161,48,29,2,"arme"),
(162,48,29,2,"arme"),
(163,49,29,2,"arme"),
(164,49,29,2,"arme"),
(165,49,29,2,"arme"),
(166,49,29,2,"arme"),
(167,49,29,2,"arme"),
(168,50,29,2,"arme"),
(169,50,29,2,"arme"),
(170,51,29,2,"arme"),
(171,51,29,2,"arme"),
(172,52,29,2,"arme"),
(173,52,29,2,"arme"),
(174,52,29,2,"arme"),
(175,52,29,2,"arme"),
(176,52,29,2,"arme"),
(177,53,29,2,"arme"),
(178,53,29,2,"arme"),
(179,53,29,2,"arme"),
(180,53,29,2,"arme"),
(181,53,29,2,"arme"),
(182,54,29,2,"arme"),
(183,54,29,2,"arme"),
(184,54,29,2,"arme"),
(185,54,29,2,"arme"),
(186,54,29,2,"arme"),
(187,55,29,2,"arme"),
(188,55,29,2,"arme"),
(189,55,29,2,"arme"),
(190,55,29,2,"arme"),
(191,55,29,2,"arme"),
(192,56,29,2,"arme"),
(193,56,29,2,"arme"),
(194,56,29,2,"arme"),
(195,56,29,2,"arme"),
(196,56,29,2,"arme"),
(197,57,29,2,"arme"),
(198,57,29,2,"arme"),
(199,57,29,2,"arme"),
(200,58,29,2,"arme"),
(201,58,29,2,"arme"),
(202,58,29,2,"arme"),
(203,59,29,2,"arme"),
(204,59,29,2,"arme"),
(205,59,29,2,"arme"),
(207,60,10,0,"moteur"),
(210,-60,10,0,"moteur"),
(209,60,23,0,"autre"),
(211,-60,23,0,"autre"),
(212,-60,0,0,"rien"),
(214,-11,10,0,"moteur"),
(215,-11,0,0,"rien"),
(389,64,10,0,"moteur"),
(218,-61,10,0,"moteur"),
(219,-61,23,0,"autre"),
(220,-61,0,0,"rien"),
(395,-64,10,0,"moteur"),
(380,63,12,0,"soute"),
(381,-63,10,0,"moteur"),
(378,63,12,0,"soute"),
(396,-64,12,0,"soute"),
(377,63,12,0,"soute"),
(376,63,12,0,"soute"),
(387,-63,0,0,"rien"),
(386,-63,12,0,"soute"),
(385,-63,12,0,"soute"),
(382,-63,11,2,"arme"),
(383,-63,12,0,"soute"),
(384,-63,12,0,"soute"),
(400,-64,0,0,"rien"),
(399,-64,12,0,"soute"),
(398,-64,12,0,"soute"),
(397,-64,12,0,"soute"),
(394,64,12,0,"soute"),
(393,64,12,0,"soute"),
(392,64,12,0,"soute"),
(391,64,12,0,"soute"),
(375,63,11,2,"arme"),
(374,63,10,0,"moteur");


DROP TABLE IF EXISTS `c_construction`;

CREATE TABLE `c_construction` (
  `idconst` int(11) NOT NULL AUTO_INCREMENT,
  `trucaconstruire` varchar(32) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `avancementbiens` int(11) NOT NULL DEFAULT 0,
  `avancementtitane` int(11) NOT NULL DEFAULT 0,
  `avancementneutrinos` int(11) NOT NULL DEFAULT 0,
  `prixbiens` int(11) NOT NULL,
  `prixtitane` int(11) NOT NULL,
  `prixneutrinos` int(11) NOT NULL DEFAULT 0,
  `idplaneteconst` int(11) NOT NULL,
  `ordredeconstruction` int(11) DEFAULT 1,
  PRIMARY KEY (`idconst`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

INSERT INTO `c_explore` VALUES (1,2,3,3,2,1),
(2,3,3,3,3,1),
(3,4,3,3,4,1),
(4,4,2,3,4,-2),
(5,4,1,3,4,-2),
(6,4,1,2,4,-2),
(7,4,1,1,4,-2),
(8,4,2,1,4,-2),
(9,4,2,2,4,-2),
(10,4,3,2,4,-2),
(11,4,3,1,4,-2),
(12,4,4,1,4,-2),
(13,4,5,1,4,-2),
(14,0,4,2,4,-2),
(15,4,5,2,4,-2),
(16,4,4,2,4,-2),
(17,4,4,3,4,-2),
(18,4,5,3,4,-2),
(19,4,5,4,4,-2),
(20,4,5,5,4,-2),
(21,4,4,5,4,-2),
(22,4,4,4,4,-2),
(23,4,2,4,4,-2),
(24,4,1,4,4,-2),
(25,2,4,2,2,-2),
(26,2,5,1,2,-3),
(27,4,3,4,4,-4),
(28,4,1,5,4,-18),
(29,4,2,5,4,-18),
(30,4,3,5,4,-18),
(31,3,4,2,3,-18),
(32,3,5,1,3,-18),
(33,3,4,1,3,-18),
(34,3,3,1,3,-18),
(35,3,2,1,3,-18),
(36,3,1,1,3,-18);


DROP TABLE IF EXISTS `c_flotte`;

CREATE TABLE `c_flotte` (
  `idflotte` int(11) NOT NULL AUTO_INCREMENT,
  `idplaneteflotte` int(11) NOT NULL COMMENT 'si id nég = flotte de défense invisible',
  `universflotte` int(11) NOT NULL DEFAULT 0,
  `xflotte` int(11) NOT NULL DEFAULT 0,
  `yflotte` int(11) DEFAULT 0,
  `nomflotte` varchar(32) NOT NULL DEFAULT 'Flotte de défense',
  `universdestination` int(11) NOT NULL DEFAULT 0,
  `xdestination` int(11) NOT NULL DEFAULT 0,
  `ydestination` int(11) NOT NULL DEFAULT 0,
  `typeordre` int(11) NOT NULL DEFAULT 0,
  `bloque` int(11) NOT NULL DEFAULT 0,
  `structuretotale` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idflotte`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `c_flotte` VALUES (1,0,-2,5,3,"Essain alien",-2,8,3,6,0,105),
(2,0,-2,15,3,"Essain alien",0,0,0,0,0,39),
(3,0,-2,10,1,"Essain alien",-2,20,1,6,0,5),
(4,0,-2,5,6,"Essain alien",-2,13,7,6,0,5),
(5,-7,4,3,3,"Flotte de défense",0,0,0,0,0,2),
(6,7,4,3,3,"ECO-01",0,0,0,0,0,0),
(7,7,4,3,3,"ECO-01",0,0,0,0,0,0),
(8,0,4,5,1,"Épave spatiale",0,0,0,0,0,9),
(9,-3,2,3,3,"Flotte de défense",0,0,0,0,0,0),
(10,3,2,5,1,"nouvelleflotte",0,0,0,0,0,1),
(11,0,-2,15,7,"Essain alien",-2,19,7,6,0,68),
(12,0,-2,9,8,"Essain alien",-2,9,16,6,0,105),
(13,0,-2,18,14,"Essain alien",-2,19,14,6,0,39),
(14,0,-2,9,13,"Essain alien",-2,9,1,6,0,39),
(15,0,-2,5,6,"Essain alien",-2,2,2,6,0,18),
(16,0,-2,13,2,"Essain alien",-2,9,18,6,0,39),
(17,0,-2,8,6,"Essain alien",-2,14,6,6,0,105),
(18,0,-2,14,4,"Essain alien",-2,10,9,6,0,5),
(19,0,-2,5,4,"Essain alien",-2,5,0,6,0,105),
(20,0,-2,15,15,"Essain alien",-2,16,15,6,0,18),
(21,0,-2,15,2,"Essain alien",-2,17,2,6,0,105),
(22,0,-2,10,2,"Essain alien",-2,6,7,6,0,39),
(23,-6,3,3,3,"Flotte de défense",0,0,0,0,0,0),
(24,6,3,1,1,"nouvelleflotte",0,0,0,0,0,1);


DROP TABLE IF EXISTS `c_limiteplanete`;

CREATE TABLE `c_limiteplanete` (
  `idlimiteplanete` int(11) NOT NULL,
  `popmax` int(11) NOT NULL DEFAULT 8,
  `scientmax` int(11) NOT NULL DEFAULT 1,
  `ouvriermax` int(11) NOT NULL DEFAULT 1,
  `soldatmax` int(11) NOT NULL DEFAULT 1,
  `maxbaselunaire` int(11) NOT NULL DEFAULT 0,
  `maxmegalopole` int(11) NOT NULL DEFAULT 1,
  `maxflotte` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idlimiteplanete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `c_limiteplanete` VALUES (3,9,1,1,1,0,1,2),
(1,8,1,1,1,0,1,1),
(2,8,1,1,1,0,1,1),
(6,8,1,1,1,0,1,2),
(4,8,1,1,1,0,1,1),
(5,8,1,1,1,0,1,1),
(7,10,5,5,1,0,2,2),
(8,2,1,1,1,1,0,1),
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
(19,8,1,1,1,0,1,1),
(20,8,1,1,1,0,1,1),
(21,8,1,1,1,0,1,1),
(22,8,1,1,1,0,1,1),
(23,8,1,1,1,0,1,1),
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
(46,8,1,1,1,0,1,1);


DROP TABLE IF EXISTS `c_messagerie`;

CREATE TABLE `c_messagerie` (
  `idmessagerie` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueuremetteur` int(11) NOT NULL,
  `idjoueurrecepteur` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT 0,
  `supprimeemetteur` tinyint(1) NOT NULL DEFAULT 0,
  `supprimerecepteur` tinyint(1) NOT NULL DEFAULT 0,
  `textemessagerie` text NOT NULL,
  `titremessage` varchar(32) NOT NULL,
  `datemessage` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idmessagerie`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `c_messagerie` VALUES (1,4,1,0,0,0,"Test.","Test.","2020-12-23 08:22:33"),
(2,4,2,1,0,0,"Test.","Test.","2020-12-23 08:22:49"),
(3,4,3,1,0,0,"Test.","Test.","2020-12-23 08:23:06"),
(4,2,4,1,0,0,"J\'ai bien eu ton dernier message. Cela marche !\r\n\r\nBienvenue.","Ca marche ! ","2020-12-23 13:59:26"),
(5,2,4,1,0,0,"Bonjour,\r\n\r\nJe te regarde progresser petit à petit.\r\nPetite mise à jour du site :\r\n- Il y a un forum (je peux te nommer admin).\r\n- Les tours auto sont de retour (risque de bugs !).\r\n- Et j\'ai fais quelques petites corrections.\r\n\r\nTu peux publier ce que tu veux/pense sur le forum, sa base de donnée est séparée. À bientôt !","MAJ du site","2020-12-25 00:21:54");


DROP TABLE IF EXISTS `c_messagerieinterne`;

CREATE TABLE `c_messagerieinterne` (
  `expediteur` varchar(64) NOT NULL,
  `idmessagerieinterne` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire` int(11) NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT 0,
  `titre` varchar(64) NOT NULL,
  `texte` text NOT NULL,
  PRIMARY KEY (`idmessagerieinterne`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

INSERT INTO `c_messagerieinterne` VALUES ("Ministre de la recherche",2,4,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteur interstellaire\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",3,4,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Conseil civil",4,4,1,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Équipe scientifique",5,4,1,"Première sortir du système solaire","Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\\-lumière"),
("Ministre de la recherche",6,4,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",7,4,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Vaisseau d\'exploration",8,4,1,"Champ d\'astéroides exploitables","Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice."),
("Vaisseau d\'exploration",9,4,1,"Champ d\'astéroides exploitables","Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice."),
("Ministre de la recherche",10,4,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Module de colonisation\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Vaisseau d\'exploration",11,4,1,"Planète habitable","Nous venons de trouver une nouvelle planète. Nous allons pouvoir la coloniser. Elle dispose d\'astre dans son orbite que nous appellons lune en astronomie. De plus, il semble que cette planète ait subit une destruction massive suite à l\'impact d\'un asteroide il y a des siècles. Si nous voulons la coloniser, nous allons devoir déployer d\'énormes ressources. Nous devrions commencer les recherches pour développer l\'équipement nécessaire."),
("Vaisseau d\'exploration",12,4,1,"Vaisseau inconnu détecté","Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder."),
("Vaisseau d\'exploration",13,4,1,"Échec de la mission","Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer."),
("Amirauté",14,4,1,"Réparation et amélioration des vaisseaux","Notre vaisseau d\'exploration est dans un triste état. Nous devrions le faire rentrer sur notre planète et le réparer. Nous pourrions aussi en profiter pour améliorer ce vaisseau avec du meilleur équipement. Nous devrions investir dans la recherche dans ce sens. Nous allons avoir un important besoin de ressources et nous pourrions constuire aussi des vaisseaux spécialisé dans la récolte de ressources spatiales."),
("Ministre de la recherche",15,4,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Militarisation\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",17,2,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Conseil civil",18,2,1,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Équipe scientifique",19,2,1,"Première sortir du système solaire","Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\\-lumière"),
("Ministre de la recherche",20,2,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",21,2,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",22,3,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Conseil civil",23,3,1,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Conseil civil",24,4,1,"planète colonisée","Nous venons de coloniser une nouvelle planète. Le vaisseau colonisateur a été perdu dans le processus"),
("Amirauté",25,4,1,"Développement de la défense spatiale","les informations recueilli lors de la tentative d\'exploration de l\'épave nous indiquent qu\'il a existé des êtres capables de constuire des vaisseaux armés dans notre galaxie. D\'autre part, cette épave est ancienne, très avancée technologiquement mais nous pourrions arriver à détruire ses défenses avec les armes nécessaires. Cela nous permettrait d\'obtenir de précieuses informations ou technologies. Nous vous prions de lancer les recherches nécessaires et d\'envoyer 2 ou 3 vaisseaux biens équipés pour continuer l\'investigation de l\'épave."),
("Équipe scientifique",26,3,1,"Première sortir du système solaire","Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\\-lumière"),
("Ministre de la recherche",27,3,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",28,3,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Vaisseau d\'exploration",29,3,1,"Champ d\'astéroides exploitables","Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice."),
("Vaisseau d\'exploration",30,3,1,"Champ d\'astéroides exploitables","Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice."),
("Ministre de la recherche",31,3,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Lasers miniers\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",32,3,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche."),
("Ministre de la recherche",33,3,1,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Module de colonisation\". Vous pouvez prioritiser cette recherche sur la page dédiée a la recherche.");


DROP TABLE IF EXISTS `c_messagetour`;

CREATE TABLE `c_messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=latin1;

INSERT INTO `c_messagetour` VALUES (321,2,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 4%)","planete",3),
(322,3,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 2%)","planete",6),
(323,4,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",7),
(324,4,"Votre population ne pouvait pas grandir faute de place.","planete",8);


DROP TABLE IF EXISTS `c_planete`;

CREATE TABLE `c_planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `nomplanete` varchar(128) NOT NULL DEFAULT 'Planète sans nom',
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  `idjoueurplanete` int(11) NOT NULL DEFAULT 0,
  `biens` int(11) NOT NULL DEFAULT 300,
  `titane` int(11) NOT NULL DEFAULT 0,
  `neutrinos` int(11) NOT NULL DEFAULT 0,
  `taille` int(11) NOT NULL DEFAULT 8,
  `lune` int(11) NOT NULL DEFAULT 0,
  `organisation` int(11) NOT NULL DEFAULT 10,
  `efficacite` int(11) NOT NULL DEFAULT 0,
  `environnement` int(11) NOT NULL DEFAULT 0,
  `stabiliteenvironnement` int(11) NOT NULL DEFAULT 1000,
  `restauration` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

INSERT INTO `c_planete` VALUES (1,"nsxhtaenjx",1,17,-2,0,10,0,0,5,1,10,0,-1214,1000,0),
(2,"bchrdqukcj",11,8,-3,0,10,0,0,4,2,10,0,-2452,1000,0),
(3,"Planète sans nom",3,3,2,2,917,0,0,8,0,9638,138,0,1000,0),
(4,"evffmkquwu",14,6,-2,0,10,0,0,3,0,10,0,-1194,1000,0),
(5,"aqpnsukaja",1,4,-3,0,10,0,0,6,0,10,0,108,1000,0),
(6,"Planète sans nom",3,3,3,3,1079,0,0,8,0,9638,138,0,1000,0),
(7,"Septentrion",3,3,4,4,134,0,0,8,0,10216,114,0,1000,0),
(8,"Nova",3,2,4,4,21,0,0,4,1,1873,94,-1500,1000,0),
(9,"fcrnmgvmnt",1,13,-2,0,10,0,0,6,0,10,0,-420,1000,0),
(10,"xakhkkvqwg",10,19,-3,0,10,0,0,6,2,10,0,-2167,1000,0),
(11,"jaayuitjgj",15,12,-2,0,10,0,0,6,3,10,0,-1280,1000,0),
(12,"kmkclwxatq",10,5,-3,0,10,0,0,3,1,10,0,-1755,1000,0),
(13,"isjxbqifea",14,16,-2,0,10,0,0,3,1,10,0,-148,1000,0),
(14,"ukehrgbtil",10,17,-3,0,10,0,0,5,0,10,0,347,1000,0),
(15,"gacjrhiebf",16,8,-2,0,10,0,0,3,2,10,0,-2193,1000,0),
(16,"bjjhrwkwxr",14,2,-3,0,10,0,0,6,3,10,0,-117,1000,0),
(17,"twrlmcrngg",16,4,-2,0,10,0,0,4,3,10,0,-481,1000,0),
(18,"webdshvecs",9,13,-3,0,10,0,0,3,0,10,0,-1246,1000,0),
(19,"abbanmlqld",10,4,-2,0,10,0,0,4,2,10,0,-1336,1000,0),
(20,"buqnmwjvrk",20,9,-3,0,10,0,0,5,1,10,0,283,1000,0),
(21,"fuqxtanvgi",20,12,-2,0,10,0,0,5,2,10,0,-603,1000,0),
(22,"vfcvexmkdv",17,3,-3,0,10,0,0,6,1,10,0,-2174,1000,0),
(23,"nbselbdhpk",12,12,-2,0,10,0,0,4,2,10,0,-1242,1000,0),
(24,"awpqrtjymk",11,16,-2,0,10,0,0,6,3,10,0,-1702,1000,0),
(25,"crrlxbxnhh",3,12,-3,0,10,0,0,4,1,10,0,409,1000,0),
(26,"ujhkegeqqf",13,14,-2,0,10,0,0,5,1,10,0,-977,1000,0),
(27,"eibuvtcdgc",7,19,-3,0,10,0,0,8,4,10,0,-3497,1000,0),
(28,"ruypixkcpc",16,15,-2,0,10,0,0,6,0,10,0,394,1000,0),
(29,"fvilkinjwa",7,20,-3,0,10,0,0,3,0,10,0,-2318,1000,0),
(30,"ampegymnka",6,17,-2,0,10,0,0,6,1,10,0,-799,1000,0),
(31,"hfvilyrawd",12,18,-3,0,10,0,0,4,2,10,0,-1851,1000,0),
(32,"swmmhqcivr",8,4,-2,0,10,0,0,3,2,10,0,-939,1000,0),
(33,"yaetgirtry",4,16,-3,0,10,0,0,3,0,10,0,-1307,1000,0),
(34,"lhcwxdtehv",7,10,-2,0,10,0,0,3,0,10,0,-1562,1000,0),
(35,"kkvmebsinl",1,18,-3,0,10,0,0,3,4,10,0,-2012,1000,0),
(36,"yhhkqyqdjn",15,18,-2,0,10,0,0,3,2,10,0,-565,1000,0),
(37,"dypsxgqmfa",7,8,-3,0,10,0,0,5,4,10,0,-1758,1000,0),
(38,"kqbclqkwtq",3,13,-2,0,10,0,0,4,2,10,0,-369,1000,0),
(39,"mubjjgjelr",2,4,-3,0,10,0,0,3,2,10,0,-1324,1000,0),
(40,"hyriixnuuc",4,7,-2,0,10,0,0,6,3,10,0,-492,1000,0),
(41,"uinepvpvdt",16,1,-3,0,10,0,0,6,4,10,0,-235,1000,0),
(42,"mllxvkdplf",17,8,-2,0,10,0,0,5,2,10,0,-157,1000,0),
(43,"kajcxnnasf",17,15,-3,0,10,0,0,3,2,10,0,-1612,1000,0),
(44,"nawhlkndqn",5,11,-2,0,10,0,0,6,0,10,0,-1626,1000,0),
(45,"yngrhsvyuw",7,9,-3,0,10,0,0,8,0,10,0,-145,1000,0),
(46,"judhsgmfdj",19,6,-2,0,10,0,0,6,0,10,0,-1710,1000,0),
(47,"inrmegvctd",1,4,-2,0,10,0,0,3,2,10,0,-1548,1000,0),
(48,"esbcvjqiia",12,9,-3,0,10,0,0,7,0,10,0,119,1000,0);


DROP TABLE IF EXISTS `c_population`;

CREATE TABLE `c_population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT 1,
  `typepoparrivee` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `c_population` VALUES (1,3,2,0),
(2,3,3,0),
(3,3,1,0),
(4,3,1,0),
(5,3,1,0),
(6,3,1,0),
(7,6,3,0),
(8,6,2,0),
(9,6,1,0),
(10,6,1,0),
(11,6,1,0),
(12,6,1,0),
(13,7,2,0),
(14,7,3,0),
(15,7,3,0),
(16,7,3,0),
(17,7,3,0),
(18,7,3,0),
(19,7,1,0),
(20,7,1,0),
(21,3,1,0),
(22,6,1,0),
(23,8,2,0),
(24,7,1,0),
(25,8,1,0);


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
  `avrech` int(11) NOT NULL DEFAULT 0,
  `rechnesc` int(11) NOT NULL DEFAULT 1000,
  `rechposs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idrechprinc`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `c_rech_joueur` VALUES (1,1,3,4,200,180,1),
(2,2,4,4,200,156,1),
(3,3,4,1,400,393,1),
(4,4,4,3,600,582,1),
(5,5,4,5,1900,1650,1),
(6,6,4,19,1000,752,1),
(7,7,4,26,500,476,1),
(8,8,2,4,200,199,1),
(9,9,2,1,400,369,1),
(10,10,2,3,600,537,1),
(11,11,2,5,1800,2160,0),
(12,12,3,1,400,321,1),
(13,13,3,3,600,564,1),
(14,14,3,5,600,1545,0),
(15,15,3,6,200,2745,0),
(16,16,3,7,0,1830,0),
(17,17,3,19,0,436,0),
(19,15,4,6,3000,2745,1),
(20,16,4,7,2000,1830,1);


DROP TABLE IF EXISTS `c_silo`;

CREATE TABLE `c_silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



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
  `datetour` timestamp NOT NULL DEFAULT current_timestamp(),
  `resume` text DEFAULT NULL,
  `fintour` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `c_tour` VALUES (1,"2020-12-23 01:40:56","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : <br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : <br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : <br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(2,"2020-12-23 01:45:51","Le tour commence.<br>Tour venant d\'un admin<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9000 et son gain dorga est de 638 et il y a 1 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 161.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 3<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 5<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 4<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(3,"2020-12-27 21:48:19",NULL,1),
(4,"2020-12-29 17:43:35","Le tour commence.<br>Tour venant d\'un admin<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 161.<br>La nouvelle efficacite de la planete 6 est de 161.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 8<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 7<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 6<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(5,"2020-12-29 17:45:07","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 161.<br>La nouvelle efficacite de la planete 7 est de 120.<br>Le joueur 3 est monté au niveau 3<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 10<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 11<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 9<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(6,"2020-12-29 17:45:14","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 12<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 16<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 13<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(7,"2020-12-29 18:22:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 16<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 20<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 15<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(8,"2020-12-29 18:23:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 19<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 24<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 20<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(9,"2020-12-29 18:24:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 21<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 26<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 22<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(10,"2020-12-29 18:25:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 23<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 25<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(11,"2020-12-29 18:26:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 27<br>Des débris au neutrinos ont été créés.<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 27<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(12,"2020-12-29 18:27:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 29<br>Des débris au neutrinos ont été créés.<br>Fin du tour.",1),
(13,"2020-12-29 18:28:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(14,"2020-12-29 18:29:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(15,"2020-12-30 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(16,"2020-12-31 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(17,"2021-01-01 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(18,"2021-01-02 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(19,"2021-01-03 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 9738 et son gain dorga est de 615 et il y a 1 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br>La nouvelle efficacite de la planete 8 est de 72.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(20,"2021-01-04 00:10:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 10949 et son gain dorga est de 578 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 120.<br>La nouvelle efficacite de la planete 8 est de 131.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(21,"2021-01-05 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 10949 et son gain dorga est de 578 et il y a 1 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 114.<br>La nouvelle efficacite de la planete 8 est de 131.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(22,"2021-01-06 00:10:02","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 11527 et son gain dorga est de 562 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 114.<br>La nouvelle efficacite de la planete 8 est de 131.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(23,"2021-01-07 00:10:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 11527 et son gain dorga est de 562 et il y a 0 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 114.<br>La nouvelle efficacite de la planete 8 est de 66.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1),
(24,"2021-01-08 00:10:01","Le tour commence.<br>Tour automatique<br>Début de la gestion des planètes.<br>joueur 1 possede une orga de  et son gain dorga est de 1000 et il y a 0 planete ayant besoin dorga.<br>joueur 2 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 3 possede une orga de 9638 et son gain dorga est de 618 et il y a 0 planete ayant besoin dorga.<br>joueur 4 possede une orga de 11527 et son gain dorga est de 562 et il y a 1 planete ayant besoin dorga.<br>La nouvelle efficacite de la planete 3 est de 138.<br>La nouvelle efficacite de la planete 6 est de 138.<br>La nouvelle efficacite de la planete 7 est de 114.<br>La nouvelle efficacite de la planete 8 est de 94.<br><br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 31<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 30<br>Étoile à neutrinos traitée. Quantité de neutrinos en orbite : 33<br>Fin du tour.",1);


DROP TABLE IF EXISTS `c_transfertvaisseau`;

CREATE TABLE `c_transfertvaisseau` (
  `idtransfert` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurtransfert` int(11) NOT NULL,
  `idplanetedepart` int(11) NOT NULL,
  `idplanetearrivee` int(11) NOT NULL,
  `toursrestantstranfert` int(11) NOT NULL,
  `idvaisseautransfert` int(11) NOT NULL,
  PRIMARY KEY (`idtransfert`),
  UNIQUE KEY `idtransfert` (`idtransfert`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_transfertvaisseau`;

CREATE TABLE `c_transfertvaisseau` (
  `idtransfert` int(11) NOT NULL AUTO_INCREMENT,
  `idjoueurtransfert` int(11) NOT NULL,
  `idplanetedepart` int(11) NOT NULL,
  `idplanetearrivee` int(11) NOT NULL,
  `toursrestantstranfert` int(11) NOT NULL,
  `idvaisseautransfert` int(11) NOT NULL,
  PRIMARY KEY (`idtransfert`),
  UNIQUE KEY `idtransfert` (`idtransfert`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `c_utilisateurs`;

CREATE TABLE `c_utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(32) NOT NULL,
  `motdepasse` varchar(1024) NOT NULL,
  `dateinscription` date DEFAULT NULL,
  `idevent` int(11) NOT NULL DEFAULT 0,
  `ideventsuivant` int(11) NOT NULL DEFAULT 0,
  `lvl` int(11) NOT NULL DEFAULT 1,
  `recherche` int(11) NOT NULL DEFAULT 100,
  `niveauadmin` int(11) NOT NULL DEFAULT 0,
  `creditgalactique` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `c_utilisateurs` VALUES (1,"Galdonia","$2y$10$suNrlf1tBwMWzhdRo62TMOzvzr7.PFewEz/mv97hGDADwr9/TUqCG","2020-12-23",0,0,1,100,1,0),
(2,"qwe","$2y$10$rTbJKwCwKmfuFwbzyip4m..CyXlUmgcQnf8/lXQUvkJ0FXEqD8jtu","2020-12-23",0,0,4,100,1,0),
(3,"lebogoss","$2y$10$MpRgL98FtnHnFbLWge5S4u57nOtGeB8ysIGbgoIzttFqWcOpDLsHq","2020-12-23",0,0,5,100,0,0),
(4,"Metatron","$2y$10$Hp9w3fo1Y/2URNV3xCl8guF4cqrdrPgVxjWPmUNjEoeHlwNTg4UJO","2020-12-23",0,0,9,500,0,0);


DROP TABLE IF EXISTS `c_vaisseau`;

CREATE TABLE `c_vaisseau` (
  `idvaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idflottevaisseau` int(11) NOT NULL DEFAULT 0 COMMENT 'Si nég = plan de vaisseau/id du joueur, si 0 = répar ou transf',
  `nomvaisseau` varchar(32) NOT NULL DEFAULT 'Vaisseau',
  `vitesse` int(11) NOT NULL DEFAULT -1,
  `capacitedesoute` int(11) NOT NULL DEFAULT -1,
  `capaciteminage` int(11) NOT NULL DEFAULT -1,
  `HPmaxvaisseau` int(11) NOT NULL DEFAULT -1,
  `HPvaisseau` int(11) NOT NULL DEFAULT -1,
  `biensvaisseau` int(11) NOT NULL DEFAULT -1,
  `titanevaisseau` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`idvaisseau`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

INSERT INTO `c_vaisseau` VALUES (1,1,"Vaisseau alien",1,1,0,28,28,1040,200),
(2,1,"Vaisseau alien",1,1,0,28,28,1040,200),
(3,1,"Vaisseau alien",1,1,0,28,28,1040,200),
(4,1,"Vaisseau alien",1,1,0,28,28,1040,200),
(5,1,"Vaisseau alien",1,1,0,28,28,1040,200),
(6,2,"Vaisseau alien",1,1,0,18,18,640,120),
(7,2,"Vaisseau alien",1,1,0,18,18,640,120),
(8,2,"Vaisseau alien",1,1,0,18,18,640,120),
(9,3,"Vaisseau alien",1,1,0,8,8,240,40),
(10,4,"Vaisseau alien",1,1,0,8,8,240,40),
(11,-4,"Explorer",2,1,0,8,8,80,0),
(12,5,"Vaisseau d\'exploration",1,1,0,3,3,40,0),
(13,5,"Vaisseau d\'exploration",1,1,0,3,3,40,0),
(14,8,"Épave spatiale",1,1,0,18,18,540,200),
(16,-2,"Vaisseau d\'exploration",1,1,0,3,3,40,0),
(17,10,"Vaisseau d\'exploration",1,1,0,3,3,40,0),
(18,11,"Vaisseau alien",1,1,0,23,23,840,160),
(19,11,"Vaisseau alien",1,1,0,23,23,840,160),
(20,11,"Vaisseau alien",1,1,0,23,23,840,160),
(21,11,"Vaisseau alien",1,1,0,23,23,840,160),
(22,12,"Vaisseau alien",1,1,0,28,28,1040,200),
(23,12,"Vaisseau alien",1,1,0,28,28,1040,200),
(24,12,"Vaisseau alien",1,1,0,28,28,1040,200),
(25,12,"Vaisseau alien",1,1,0,28,28,1040,200),
(26,12,"Vaisseau alien",1,1,0,28,28,1040,200),
(27,-3,"Vaisseau d\'exploration",1,1,0,3,3,40,0),
(28,13,"Vaisseau alien",1,1,0,18,18,640,120),
(29,13,"Vaisseau alien",1,1,0,18,18,640,120),
(30,13,"Vaisseau alien",1,1,0,18,18,640,120),
(31,14,"Vaisseau alien",1,1,0,18,18,640,120),
(32,14,"Vaisseau alien",1,1,0,18,18,640,120),
(33,14,"Vaisseau alien",1,1,0,18,18,640,120),
(34,15,"Vaisseau alien",1,1,0,13,13,440,80),
(35,15,"Vaisseau alien",1,1,0,13,13,440,80),
(36,16,"Vaisseau alien",1,1,0,18,18,640,120),
(37,16,"Vaisseau alien",1,1,0,18,18,640,120),
(38,16,"Vaisseau alien",1,1,0,18,18,640,120),
(39,17,"Vaisseau alien",1,1,0,28,28,1040,200),
(40,17,"Vaisseau alien",1,1,0,28,28,1040,200),
(41,17,"Vaisseau alien",1,1,0,28,28,1040,200),
(42,17,"Vaisseau alien",1,1,0,28,28,1040,200),
(43,17,"Vaisseau alien",1,1,0,28,28,1040,200),
(44,18,"Vaisseau alien",1,1,0,8,8,240,40),
(45,19,"Vaisseau alien",1,1,0,28,28,1040,200),
(46,19,"Vaisseau alien",1,1,0,28,28,1040,200),
(47,19,"Vaisseau alien",1,1,0,28,28,1040,200),
(48,19,"Vaisseau alien",1,1,0,28,28,1040,200),
(49,19,"Vaisseau alien",1,1,0,28,28,1040,200),
(50,20,"Vaisseau alien",1,1,0,13,13,440,80),
(51,20,"Vaisseau alien",1,1,0,13,13,440,80),
(52,21,"Vaisseau alien",1,1,0,28,28,1040,200),
(53,21,"Vaisseau alien",1,1,0,28,28,1040,200),
(54,21,"Vaisseau alien",1,1,0,28,28,1040,200),
(55,21,"Vaisseau alien",1,1,0,28,28,1040,200),
(56,21,"Vaisseau alien",1,1,0,28,28,1040,200),
(57,22,"Vaisseau alien",1,1,0,18,18,640,120),
(58,22,"Vaisseau alien",1,1,0,18,18,640,120),
(59,22,"Vaisseau alien",1,1,0,18,18,640,120),
(60,-4,"Pioneer",2,1,0,13,13,180,0),
(62,24,"Vaisseau d\'exploration",1,1,0,3,3,40,0),
(63,-4,"Harvest",2,40,3,26,26,290,0),
(64,-4,"Transport",2,40,0,24,24,240,0);


DROP TABLE IF EXISTS `c_variationstour`;

CREATE TABLE `c_variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT 0,
  `chantier` int(11) NOT NULL DEFAULT 0,
  `recherche` int(11) NOT NULL DEFAULT 0,
  `puissancemilitaire` int(11) NOT NULL DEFAULT 0,
  `consobiens` int(11) NOT NULL DEFAULT 0,
  `coutstockage` int(11) NOT NULL DEFAULT 0,
  `entretien` int(11) NOT NULL DEFAULT 0,
  `entretienflotte` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

INSERT INTO `c_variationstour` VALUES (162,3,50,20,100,0,7,19,2,1),
(163,6,50,20,100,0,7,22,0,1),
(164,7,30,20,500,0,9,3,6,2),
(165,8,9,18,0,0,2,0,0,0);


SET foreign_key_checks = 1;
