CREATE DATABASE IF NOT EXISTS `autre`;

USE `autre`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `afaire`;

CREATE TABLE `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=527 DEFAULT CHARSET=latin1;

INSERT INTO `afaire` VALUES (205,"Sur la carte, mettre en évidence les endroits accessibles ?","grosseetapeplustard"),
(264,"Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination","petittrucplustard"),
(22,"Ajouter sécurité sur les champs entrés par les utilisateurs.","lancementsite"),
(23,"Passer par http://validator.w3.org","lancementsite"),
(24,"Faire le CRON","lancementsite"),
(25,"Faire de la compression : http://php-minify.com/#","lancementsite"),
(511,"Page capitale et planète : Cacher efficacité jusqu\'à un certain niveau","petittrucrapide"),
(473,"Passage au niveau 6 : Refaire + mettre seconde option ?","petittrucrapide"),
(521,"Page conception : Possibilité d\'ajouter un moteur.","petittrucrapide"),
(498,"Page vaisseau : Revoir la rénovation de vaisseau.","encours"),
(524,"Bug : Passage du niveau 1 a 2 : Message mais cela semble marcher ?!","encours"),
(523,"Page conception : Possibilité de supprimer un plan.","petittrucrapide"),
(525,"Message capitale : Il faut sortir le vaisseau","encours"),
(526,"Tour exploration, ligne 60-75 : Faire last ID ! ! ! !","encours");


DROP TABLE IF EXISTS `champsasteroides`;

CREATE TABLE `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

INSERT INTO `champsasteroides` VALUES (1,5,10,-2,3,6),
(2,18,10,-2,3,6),
(3,2,13,-2,3,6),
(4,6,14,-2,3,6),
(5,7,19,-2,3,6),
(6,20,2,-2,3,6),
(7,2,10,-2,3,6),
(8,16,12,-2,3,6),
(9,7,1,-2,3,6),
(10,15,20,-2,3,6),
(11,13,11,-2,3,6),
(12,16,9,-2,2,6),
(13,16,9,-2,3,8),
(14,15,8,-2,10,6),
(15,16,3,-2,3,6),
(16,9,20,-2,10,6),
(17,3,14,-2,2,6),
(18,3,14,-2,3,8),
(19,19,11,-2,3,6),
(20,12,13,-2,3,6),
(21,20,17,-2,3,6),
(22,2,2,-2,3,6),
(23,17,7,-2,3,6),
(24,14,15,-2,2,6),
(25,14,15,-2,3,8),
(26,9,12,-2,3,6),
(27,4,1,-2,3,6),
(28,16,4,-2,3,6),
(29,1,20,-2,3,6),
(30,11,9,-2,3,6),
(31,15,18,-2,10,6),
(32,4,3,-2,10,6),
(33,10,18,-2,3,6),
(34,6,6,-2,3,6),
(35,8,10,-2,3,6),
(36,3,5,-2,3,6),
(37,6,3,-2,3,6),
(38,18,11,-2,3,6),
(39,7,11,-2,4,6),
(40,7,11,-2,10,8),
(41,12,4,-2,3,6),
(42,11,5,-2,3,6),
(43,5,19,-2,3,6),
(44,10,15,-2,3,6),
(45,1,9,-2,10,6),
(46,8,12,-2,2,6),
(47,8,12,-2,3,8),
(48,3,15,-2,3,6),
(49,8,4,-2,3,6),
(50,6,7,-2,4,6),
(51,6,7,-2,10,8),
(52,1,1,1,5,6),
(53,4,1,1,1,8),
(54,4,1,1,2,6);


DROP TABLE IF EXISTS `planete`;

CREATE TABLE `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `tour`;

CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `tour` VALUES (1,"2020-03-23 15:40:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(2,"2020-03-23 15:40:52","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(3,"2020-03-23 15:40:55","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(4,"2020-03-23 15:40:56","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(5,"2020-03-23 15:40:59",NULL),
(6,"2020-03-23 15:43:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(7,"2020-03-23 15:43:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(8,"2020-03-23 15:43:31","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(9,"2020-03-23 15:44:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(10,"2020-03-23 15:44:41","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(11,"2020-03-23 15:45:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(12,"2020-03-23 15:45:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(13,"2020-03-23 15:45:39","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(14,"2020-03-23 15:45:55","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(15,"2020-03-23 15:45:57",NULL),
(16,"2020-03-23 15:48:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(17,"2020-03-23 15:48:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(18,"2020-03-23 15:48:53","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(19,"2020-03-23 15:49:03","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(20,"2020-03-23 15:49:04",NULL);


SET foreign_key_checks = 1;
