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
(2,1,1);


DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,1,3,3,1,9),
(2,1,2,2,1,10),
(3,1,1,1,1,11),
(4,1,2,1,1,12),
(5,1,3,1,1,13),
(6,1,4,1,1,14),
(7,1,5,1,1,15),
(8,1,4,2,1,18),
(9,1,4,3,1,19),
(10,1,4,4,1,20);


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

INSERT INTO `limiteplanete` VALUES (1,1,1,9,5,1,0,1),
(2,1,1,8,1,1,0,1),
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
(17,1,1,8,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Vaisseau d\'exploration",8,1,0,"Champ d\'astéroides exploitables","Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice."),
("Ministre de la recherche",9,1,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Vaisseau d\'exploration",10,1,0,"Vaisseau inconnu détecté","Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (60,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 4%)","planete",1),
(61,1,"Ce vaisseau vient de se déplacer. Il était avant en 4-3","Vaisseau",2),
(62,1,"Ce vaisseau vient d\'explorer le parsec (4 - 4).","Vaisseau",2),
(63,1,"Ce vaisseau n\'est pas arrivé à destination faute d\'avoir la vitesse suffisante.","Vaisseau",2);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (6,2,4,4,0,1,8,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,279,0,8,0,9638,138),
(2,"btbpkmbnbr",19,7,-2,0,10,0,4,3,10,0),
(3,"nhmixprurs",11,19,-2,0,10,0,4,3,10,0),
(4,"eqwycwpiuh",15,13,-2,0,10,0,5,1,10,0),
(5,"vakytritdd",13,1,-2,0,10,0,6,0,10,0),
(6,"fgeltejwwp",12,11,-2,0,10,0,5,2,10,0),
(7,"ydknjibjaw",3,6,-2,0,10,0,3,0,10,0),
(8,"lsmpsstxec",20,16,-2,0,10,0,5,1,10,0),
(9,"nharlqaglp",6,18,-2,0,10,0,4,0,10,0),
(10,"djvrtcumxf",16,16,-2,0,10,0,3,2,10,0),
(11,"wlqwnwnrme",17,13,-2,0,10,0,5,3,10,0),
(12,"wuayblmxbs",13,14,-2,0,10,0,4,0,10,0),
(13,"pvqjijdyks",17,19,-2,0,10,0,3,1,10,0),
(14,"cxbluldacd",8,10,-2,0,10,0,5,3,10,0),
(15,"kkpshdftcr",6,5,-2,0,10,0,4,3,10,0),
(16,"bqqwdxyfvg",5,2,-2,0,10,0,6,2,10,0),
(17,"qxauqulnax",7,8,-2,0,10,0,6,1,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,3,0),
(2,1,2,0),
(3,1,1,0),
(4,1,1,0),
(5,1,1,0),
(6,1,1,0),
(7,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,1,4,400,364,1),
(2,2,1,1,500,462,1),
(3,3,1,3,400,390,1),
(4,4,1,5,400,2580,0),
(5,5,1,7,0,2745,0);


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
  `recherche` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zLMrJ6/S8hJkHI48l2VLVOkLE1WKBuelxlKW./k5APWcXt4wdB982","2020-03-23",0,0,3,100);


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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (1,-1,0,0,0,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(2,1,1,4,4,"Vaisseau",1,1,0,3,3,40,0,-11);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (21,1,25,20,100,7);


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
(2,1,1);


DROP TABLE IF EXISTS `batiments`;

CREATE TABLE `batiments` (
  `idbat` int(11) NOT NULL AUTO_INCREMENT,
  `typebat` int(11) NOT NULL,
  `idplanetebat` int(11) NOT NULL,
  PRIMARY KEY (`idbat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `construction` VALUES (6,10,1,40,0,40,0,1,2);


DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,1,3,3,1,9),
(2,1,2,2,1,10),
(3,1,1,1,1,11),
(4,1,2,1,1,12),
(5,1,3,1,1,13),
(6,1,4,1,1,14),
(7,1,5,1,1,15),
(8,1,4,2,1,18),
(9,1,4,3,1,19),
(10,1,4,4,1,20),
(11,1,2,4,1,32),
(12,1,1,5,1,33),
(13,1,2,5,1,35),
(14,1,3,5,1,36),
(15,1,4,5,1,37),
(16,1,5,5,1,38),
(17,1,5,4,1,40),
(18,1,5,3,1,41),
(19,1,5,2,1,42);


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

INSERT INTO `limiteplanete` VALUES (1,1,1,9,5,1,0,2),
(2,1,1,8,1,1,0,1),
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
(35,1,1,8,1,1,0,1);


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

INSERT INTO `messagerieinterne` VALUES ("Vaisseau d\'exploration",8,1,0,"Champ d\'astéroides exploitables","Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice."),
("Ministre de la recherche",9,1,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Vaisseau d\'exploration",10,1,0,"Vaisseau inconnu détecté","Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder."),
("Vaisseau d\'exploration",11,1,0,"Échec de la mission","Nous avons tenté d\'aborder l\'épave, mais ce qui semble être un système de défense automatique nous a tiré dessus. Notre vaisseau est lourdement endommagé et nous devrions rentrer et le réparer.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (116,1,"Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : 1%)","planete",1),
(117,1,"Ce vaisseau vient de se déplacer. Il était avant en 5-2","Vaisseau",9);


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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `ordredeplacement` VALUES (8,8,-1,-1,-1,1,9,2);


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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"Ydillia",3,3,1,1,731,0,8,0,9638,120),
(2,"btbpkmbnbr",19,7,-2,0,10,0,4,3,10,0),
(3,"nhmixprurs",11,19,-2,0,10,0,4,3,10,0),
(4,"eqwycwpiuh",15,13,-2,0,10,0,5,1,10,0),
(5,"vakytritdd",13,1,-2,0,10,0,6,0,10,0),
(6,"fgeltejwwp",12,11,-2,0,10,0,5,2,10,0),
(7,"ydknjibjaw",3,6,-2,0,10,0,3,0,10,0),
(8,"lsmpsstxec",20,16,-2,0,10,0,5,1,10,0),
(9,"nharlqaglp",6,18,-2,0,10,0,4,0,10,0),
(10,"djvrtcumxf",16,16,-2,0,10,0,3,2,10,0),
(11,"wlqwnwnrme",17,13,-2,0,10,0,5,3,10,0),
(12,"wuayblmxbs",13,14,-2,0,10,0,4,0,10,0),
(13,"pvqjijdyks",17,19,-2,0,10,0,3,1,10,0),
(14,"cxbluldacd",8,10,-2,0,10,0,5,3,10,0),
(15,"kkpshdftcr",6,5,-2,0,10,0,4,3,10,0),
(16,"bqqwdxyfvg",5,2,-2,0,10,0,6,2,10,0),
(17,"qxauqulnax",7,8,-2,0,10,0,6,1,10,0),
(18,"dlcfutqfmc",20,12,-2,0,10,0,6,3,10,0),
(19,"fsuxthlwct",17,9,-2,0,10,0,3,1,10,0),
(20,"ramlqjbppc",20,15,-2,0,10,0,3,1,10,0),
(21,"ugnbtlehmj",4,19,-2,0,10,0,5,2,10,0),
(22,"utxbhhkkrq",11,14,-2,0,10,0,6,2,10,0),
(23,"jshncqvqah",15,14,-2,0,10,0,3,1,10,0),
(24,"ldlexxheqy",7,7,-2,0,10,0,3,1,10,0),
(25,"csljftajuc",13,18,-2,0,10,0,6,1,10,0),
(26,"pldyrklhdg",12,12,-2,0,10,0,5,3,10,0),
(27,"ysnetaihuk",20,18,-2,0,10,0,3,2,10,0),
(28,"hbcrhkfbcw",19,5,-2,0,10,0,4,0,10,0),
(29,"ercyysyflj",12,8,-2,0,10,0,5,1,10,0),
(30,"tcpindhvvm",3,3,-2,0,10,0,3,2,10,0),
(31,"wryshlblqw",15,11,-2,0,10,0,4,1,10,0),
(32,"ygdhewjhxq",19,3,-2,0,10,0,6,2,10,0),
(33,"yupaqtubgk",20,2,-2,0,10,0,3,3,10,0),
(34,"ttexwhuikw",11,10,-2,0,10,0,6,1,10,0),
(35,"tldppuphgc",9,15,-2,0,10,0,3,2,10,0),
(36,"vgydrbxgqx",17,14,-2,0,10,0,5,3,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,1,3,0),
(2,1,2,0),
(3,1,1,0),
(4,1,1,0),
(5,1,1,0),
(6,1,1,0),
(7,1,1,0),
(8,1,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,1,4,400,364,1),
(2,2,1,1,500,462,1),
(3,3,1,3,400,390,1),
(4,4,1,5,2600,2580,1),
(5,5,1,7,100,2745,0);


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
  `recherche` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"qw","$2y$10$zLMrJ6/S8hJkHI48l2VLVOkLE1WKBuelxlKW./k5APWcXt4wdB982","2020-03-23",0,0,10,100);


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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (8,-1,0,0,0,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(9,1,1,5,1,"Vaisseau",1,1,0,3,3,40,0,-11);


DROP TABLE IF EXISTS `variationstour`;

CREATE TABLE `variationstour` (
  `idtable` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetevariation` int(11) NOT NULL,
  `prodbiens` int(11) NOT NULL DEFAULT '0',
  `chantier` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '0',
  `consobiens` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtable`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (44,1,30,20,100,8);


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `cargovaisseau`;

CREATE TABLE `cargovaisseau` (
  `idcargovaisseau` int(11) NOT NULL AUTO_INCREMENT,
  `idvaisseaucargo` int(11) NOT NULL,
  `typeitems` int(11) NOT NULL,
  `quantiteitems` int(11) NOT NULL,
  PRIMARY KEY (`idcargovaisseau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `explore`;

CREATE TABLE `explore` (
  `idexplore` int(11) NOT NULL AUTO_INCREMENT,
  `univers` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idexplorateur` int(11) NOT NULL,
  `tourexploration` int(11) NOT NULL,
  PRIMARY KEY (`idexplore`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `explore` VALUES (1,-2,4,4,2,13),
(2,-2,5,5,2,14),
(3,-2,6,6,2,15),
(4,-2,7,7,2,16),
(5,-2,8,8,2,17),
(6,-2,9,9,2,18),
(7,-2,10,10,2,19),
(8,-2,10,9,2,24);


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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `flotte` VALUES (1,-3,2,3,3,"Flotte de défense",0,0,0,0,0),
(2,3,-2,10,10,"nouvelleflotte",0,0,0,0,0);


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

INSERT INTO `limiteplanete` VALUES (1,1,1,8,1,1,0,1),
(3,1,1,8,1,1,0,2),
(2,1,1,8,1,1,0,1),
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
(19,1,1,8,1,1,0,1),
(20,1,1,8,1,1,0,1),
(21,1,1,8,1,1,0,1),
(22,1,1,8,1,1,0,1),
(23,1,1,8,1,1,0,1),
(24,1,1,8,1,1,0,1),
(25,1,1,8,1,1,0,1),
(26,1,1,8,1,1,0,1);


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `messagerieinterne` VALUES ("Ministre de la recherche",1,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteur interstellaire\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",2,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Centre de recherche\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",3,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Chantier\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Conseil civil",4,2,0,"Développement","Nous entrons dans une nouvelle ère. Nous pourrions avoir besoin de massivement investir dans notre puissance industrielle et scienfique. Nous avons besoin de développer des labos de recherche de taille mondiale et des chantiers de construction capable de réaliser d\'énormes projets."),
("Ministre de la recherche",5,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Moteurs améliorés\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche."),
("Ministre de la recherche",6,2,0,"Nouvelle recherche disponible","Nous pouvons maintenant recherche \"Architecture spatiale de stokage\". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.");


DROP TABLE IF EXISTS `messagetour`;

CREATE TABLE `messagetour` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `idjoumess` int(11) NOT NULL,
  `message` text NOT NULL,
  `domainemess` varchar(32) NOT NULL,
  `numspemessage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmessage`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

INSERT INTO `messagetour` VALUES (53,2,"Votre population ne pouvait pas grandir faute de place.","planete",3);


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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,"meexwvefuw",14,4,-2,0,10,0,6,2,10,0),
(2,"wehqrtdhkw",17,20,-2,0,10,0,4,3,10,0),
(3,"Planète sans nom",3,3,2,2,421,0,8,0,9638,120),
(4,"ssuukturcl",2,17,-2,0,10,0,5,2,10,0),
(5,"lfvwqjxpdq",16,17,-2,0,10,0,3,1,10,0),
(6,"bxjdmcqxwg",8,11,-2,0,10,0,3,3,10,0),
(7,"rexliwscjw",10,3,-2,0,10,0,3,3,10,0),
(8,"gxxnfxdygh",10,16,-2,0,10,0,3,3,10,0),
(9,"qnaifdtdnt",12,11,-2,0,10,0,3,3,10,0),
(10,"sspdqdagme",16,19,-2,0,10,0,3,2,10,0),
(11,"dkuqvtwicc",13,4,-2,0,10,0,4,2,10,0),
(12,"wfdtrbwuyn",7,16,-2,0,10,0,4,3,10,0),
(13,"lxnxuahsih",9,3,-2,0,10,0,4,2,10,0),
(14,"hyfkgvirlh",16,9,-2,0,10,0,3,2,10,0),
(15,"hwpndfgcgx",19,2,-2,0,10,0,4,0,10,0),
(16,"myblsnvkjq",5,14,-2,0,10,0,3,2,10,0),
(17,"tadiifuqkb",1,1,-2,0,10,0,6,0,10,0),
(18,"lbhyvmpxvw",12,17,-2,0,10,0,6,1,10,0),
(19,"gfkwdlptyn",18,13,-2,0,10,0,6,2,10,0),
(20,"ihpbgaxsli",1,11,-2,0,10,0,6,3,10,0),
(21,"cbfyhmsxbu",4,4,-2,0,10,0,3,0,10,0),
(22,"csxxmrktvu",18,6,-2,0,10,0,5,0,10,0),
(23,"mkdphspnnj",4,18,-2,0,10,0,4,1,10,0),
(24,"kxwrlagpwp",8,20,-2,0,10,0,4,3,10,0),
(25,"ceadyydbgw",7,2,-2,0,10,0,3,2,10,0),
(26,"euwlpxlyfu",6,14,-2,0,10,0,4,0,10,0),
(27,"ahkdpgigfk",3,17,-2,0,10,0,3,3,10,0);


DROP TABLE IF EXISTS `population`;

CREATE TABLE `population` (
  `idpop` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetepop` int(11) NOT NULL,
  `typepop` int(11) NOT NULL DEFAULT '1',
  `typepoparrivee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpop`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `population` VALUES (1,3,3,0),
(2,3,2,0),
(3,3,1,0),
(4,3,1,0),
(5,3,1,0),
(6,3,1,0),
(7,3,1,0),
(8,3,1,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `rech_joueur` VALUES (1,1,2,4,400,378,1),
(2,2,2,1,600,555,1),
(3,3,2,3,500,495,1),
(4,4,2,5,800,1890,0),
(5,5,2,7,0,2205,0);


DROP TABLE IF EXISTS `silo`;

CREATE TABLE `silo` (
  `idsilo` int(11) NOT NULL AUTO_INCREMENT,
  `idplanetesilo` int(11) NOT NULL,
  `iditems` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  UNIQUE KEY `idsilo` (`idsilo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
  `lvl` int(11) NOT NULL DEFAULT '0',
  `recherche` int(11) NOT NULL DEFAULT '100',
  `niveauadmin` int(11) NOT NULL DEFAULT '0',
  `creditgalactique` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `utilisateurs` VALUES (1,"Galdonia","$2y$10$obRXhmXwouAb8C3QVuBTSuA6BZO.IFD3o2xN/2PGSmSrZ3ZdE8/rm","2020-07-15",0,0,0,100,1,0),
(2,"qwe","$2y$10$K5/PLDcLxBrqcy8Nnzwjren1b/w7a8Rp/5lEMF3WW8qULRyqGu2kC","2020-07-15",0,0,3,100,0,0);


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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `vaisseau` VALUES (1,-2,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11),
(2,2,"Vaisseau d\'exploration",1,1,0,3,3,40,0,-11);


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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `variationstour` VALUES (25,3,30,20,100,8,9,0);


SET foreign_key_checks = 1;
