CREATE DATABASE IF NOT EXISTS `autre`;

USE `autre`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `afaire`;

CREATE TABLE `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

INSERT INTO `afaire` VALUES (506,"Favoriser les planetes avec bcp d\'orga pour l\'orga.","encours"),
(205,"Sur la carte, mettre en évidence les endroits accessibles ?","grosseetapeplustard"),
(264,"Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination","petittrucplustard"),
(22,"Ajouter sécurité sur les champs entrés par les utilisateurs.","lancementsite"),
(23,"Passer par http://validator.w3.org","lancementsite"),
(24,"Faire le CRON","lancementsite"),
(25,"Faire de la compression : http://php-minify.com/#","lancementsite"),
(508,"Croissance de pop : Faire en fonction des places libres.","encours"),
(509,"Croissance de pop : Faire en fonction de la pop actuelle.","encours"),
(510,"Script inscription : Mettre de l\'organisation et de l\'efficacité","encours"),
(511,"Page capitale et planète : Cacher efficacité jusqu\'à un certain niveau","petittrucrapide"),
(485,"Croissance de la pop : Faire en fonction place libre et organisation","grosetapesouspeu"),
(473,"Passage au niveau 6 : Refaire + mettre seconde option ?","petittrucrapide"),
(507,"Croissance de pop : Faire en fonction de l\'organisation.","encours"),
(503,"Page conception : Renommer plan","encours"),
(502,"Page conception : Supprimer des composants. ","encours"),
(498,"Page vaisseau : Revoir la rénovation de vaisseau.","encours");


DROP TABLE IF EXISTS `champsasteroides`;

CREATE TABLE `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `champsasteroides` VALUES (1,1,1,1,2,6),
(4,2,3,1,5,6);


DROP TABLE IF EXISTS `tour`;

CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

INSERT INTO `tour` VALUES (1,"2020-03-07 23:25:48","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(2,"2020-03-07 23:26:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(3,"2020-03-07 23:26:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(4,"2020-03-07 23:26:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(5,"2020-03-07 23:26:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(6,"2020-03-07 23:26:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(7,"2020-03-07 23:26:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(8,"2020-03-07 23:26:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(9,"2020-03-07 23:29:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(10,"2020-03-07 23:29:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(11,"2020-03-07 23:33:55","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(12,"2020-03-07 23:33:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(13,"2020-03-07 23:34:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(14,"2020-03-07 23:34:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(15,"2020-03-07 23:34:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(16,"2020-03-07 23:34:22","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(17,"2020-03-07 23:35:00","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(18,"2020-03-07 23:35:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(19,"2020-03-07 23:35:17",NULL),
(20,"2020-03-08 00:19:18",NULL),
(21,"2020-03-08 00:22:03",NULL),
(22,"2020-03-08 00:22:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(23,"2020-03-08 01:28:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(24,"2020-03-08 01:36:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(25,"2020-03-08 01:36:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(26,"2020-03-08 01:36:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(27,"2020-03-08 01:36:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(28,"2020-03-08 01:38:24","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(29,"2020-03-08 01:56:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(30,"2020-03-08 01:56:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(31,"2020-03-08 01:56:48","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(32,"2020-03-08 16:25:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(33,"2020-03-08 16:27:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(34,"2020-03-08 16:31:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(35,"2020-03-08 16:52:00","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(36,"2020-03-08 16:52:04","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(37,"2020-03-08 16:52:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(38,"2020-03-08 16:52:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(39,"2020-03-08 16:58:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(40,"2020-03-08 16:59:08",NULL),
(41,"2020-03-08 17:00:03",NULL),
(42,"2020-03-08 17:00:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(43,"2020-03-08 17:00:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(44,"2020-03-08 17:00:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(45,"2020-03-08 17:33:31","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(46,"2020-03-08 17:37:25",NULL),
(47,"2020-03-08 17:38:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(48,"2020-03-08 17:38:35",NULL),
(49,"2020-03-08 17:39:30",NULL),
(50,"2020-03-08 17:39:45",NULL),
(51,"2020-03-08 17:49:59","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(52,"2020-03-08 17:50:02","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(53,"2020-03-08 17:50:05","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(54,"2020-03-08 17:50:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(55,"2020-03-08 17:51:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(56,"2020-03-08 17:51:52","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(57,"2020-03-08 17:51:54","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(58,"2020-03-08 17:52:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(59,"2020-03-08 17:52:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(60,"2020-03-08 17:52:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(61,"2020-03-08 17:53:02",NULL),
(62,"2020-03-08 17:53:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(63,"2020-03-08 17:58:06",NULL),
(64,"2020-03-08 17:58:41","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(65,"2020-03-08 17:59:15","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(66,"2020-03-08 17:59:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(67,"2020-03-08 17:59:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(68,"2020-03-08 17:59:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(69,"2020-03-08 17:59:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(70,"2020-03-08 17:59:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(71,"2020-03-08 17:59:44","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(72,"2020-03-08 17:59:44","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(73,"2020-03-08 18:23:03","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(74,"2020-03-08 18:23:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(75,"2020-03-08 18:24:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(76,"2020-03-08 18:24:18","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(77,"2020-03-08 18:24:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(78,"2020-03-08 18:24:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(79,"2020-03-08 18:24:35","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(80,"2020-03-08 18:24:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(81,"2020-03-08 18:24:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(82,"2020-03-08 18:24:59","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(83,"2020-03-08 18:25:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(84,"2020-03-08 18:25:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(85,"2020-03-08 18:25:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(86,"2020-03-08 18:25:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(87,"2020-03-08 18:25:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(88,"2020-03-08 18:25:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(89,"2020-03-08 18:25:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(90,"2020-03-08 18:25:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(91,"2020-03-08 20:31:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(92,"2020-03-08 20:31:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(93,"2020-03-08 20:31:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(94,"2020-03-08 20:33:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(95,"2020-03-08 20:33:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(96,"2020-03-08 20:33:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(97,"2020-03-08 22:55:12","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(98,"2020-03-10 15:47:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(99,"2020-03-10 15:47:30","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(100,"2020-03-10 15:47:30","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(101,"2020-03-10 15:47:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(102,"2020-03-12 15:11:45",NULL),
(103,"2020-03-12 15:12:27",NULL),
(104,"2020-03-12 15:12:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(105,"2020-03-12 15:13:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(106,"2020-03-12 15:37:38","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(107,"2020-03-12 15:38:05","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(108,"2020-03-12 15:38:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(109,"2020-03-12 22:21:26","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(110,"2020-03-12 22:21:29","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(111,"2020-03-12 22:21:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(112,"2020-03-14 12:27:49","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(113,"2020-03-14 12:59:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(114,"2020-03-14 13:01:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(115,"2020-03-14 13:02:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(116,"2020-03-14 15:35:58",NULL),
(117,"2020-03-14 15:36:47","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(118,"2020-03-14 22:27:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(119,"2020-03-14 22:27:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(120,"2020-03-14 22:27:33","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(121,"2020-03-14 22:27:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(122,"2020-03-14 22:27:35","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(123,"2020-03-14 22:28:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(124,"2020-03-15 23:14:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop");


SET foreign_key_checks = 1;
CREATE DATABASE IF NOT EXISTS `autre`;

USE `autre`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `afaire`;

CREATE TABLE `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=514 DEFAULT CHARSET=latin1;

INSERT INTO `afaire` VALUES (205,"Sur la carte, mettre en évidence les endroits accessibles ?","grosseetapeplustard"),
(264,"Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination","petittrucplustard"),
(22,"Ajouter sécurité sur les champs entrés par les utilisateurs.","lancementsite"),
(23,"Passer par http://validator.w3.org","lancementsite"),
(24,"Faire le CRON","lancementsite"),
(25,"Faire de la compression : http://php-minify.com/#","lancementsite"),
(511,"Page capitale et planète : Cacher efficacité jusqu\'à un certain niveau","petittrucrapide"),
(485,"Croissance de la pop : Faire en fonction place libre et organisation","grosetapesouspeu"),
(473,"Passage au niveau 6 : Refaire + mettre seconde option ?","petittrucrapide"),
(502,"Page conception : Supprimer des composants. ","encours"),
(498,"Page vaisseau : Revoir la rénovation de vaisseau.","encours");


DROP TABLE IF EXISTS `champsasteroides`;

CREATE TABLE `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `champsasteroides` VALUES (1,1,1,1,2,6),
(4,2,3,1,5,6);


DROP TABLE IF EXISTS `planete`;

CREATE TABLE `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,3,3,1),
(2,4,2,1),
(3,3,3,2);


DROP TABLE IF EXISTS `tour`;

CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

INSERT INTO `tour` VALUES (1,"2020-03-07 23:25:48","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(2,"2020-03-07 23:26:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(3,"2020-03-07 23:26:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(4,"2020-03-07 23:26:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(5,"2020-03-07 23:26:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(6,"2020-03-07 23:26:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(7,"2020-03-07 23:26:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(8,"2020-03-07 23:26:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(9,"2020-03-07 23:29:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(10,"2020-03-07 23:29:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(11,"2020-03-07 23:33:55","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(12,"2020-03-07 23:33:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(13,"2020-03-07 23:34:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(14,"2020-03-07 23:34:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(15,"2020-03-07 23:34:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(16,"2020-03-07 23:34:22","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(17,"2020-03-07 23:35:00","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(18,"2020-03-07 23:35:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(19,"2020-03-07 23:35:17",NULL),
(20,"2020-03-08 00:19:18",NULL),
(21,"2020-03-08 00:22:03",NULL),
(22,"2020-03-08 00:22:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(23,"2020-03-08 01:28:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(24,"2020-03-08 01:36:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(25,"2020-03-08 01:36:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(26,"2020-03-08 01:36:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(27,"2020-03-08 01:36:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(28,"2020-03-08 01:38:24","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(29,"2020-03-08 01:56:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(30,"2020-03-08 01:56:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(31,"2020-03-08 01:56:48","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(32,"2020-03-08 16:25:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(33,"2020-03-08 16:27:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(34,"2020-03-08 16:31:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(35,"2020-03-08 16:52:00","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(36,"2020-03-08 16:52:04","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(37,"2020-03-08 16:52:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(38,"2020-03-08 16:52:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(39,"2020-03-08 16:58:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(40,"2020-03-08 16:59:08",NULL),
(41,"2020-03-08 17:00:03",NULL),
(42,"2020-03-08 17:00:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(43,"2020-03-08 17:00:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(44,"2020-03-08 17:00:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(45,"2020-03-08 17:33:31","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(46,"2020-03-08 17:37:25",NULL),
(47,"2020-03-08 17:38:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(48,"2020-03-08 17:38:35",NULL),
(49,"2020-03-08 17:39:30",NULL),
(50,"2020-03-08 17:39:45",NULL),
(51,"2020-03-08 17:49:59","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(52,"2020-03-08 17:50:02","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(53,"2020-03-08 17:50:05","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(54,"2020-03-08 17:50:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(55,"2020-03-08 17:51:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(56,"2020-03-08 17:51:52","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(57,"2020-03-08 17:51:54","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(58,"2020-03-08 17:52:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(59,"2020-03-08 17:52:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(60,"2020-03-08 17:52:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(61,"2020-03-08 17:53:02",NULL),
(62,"2020-03-08 17:53:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(63,"2020-03-08 17:58:06",NULL),
(64,"2020-03-08 17:58:41","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(65,"2020-03-08 17:59:15","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(66,"2020-03-08 17:59:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(67,"2020-03-08 17:59:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(68,"2020-03-08 17:59:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(69,"2020-03-08 17:59:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(70,"2020-03-08 17:59:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(71,"2020-03-08 17:59:44","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(72,"2020-03-08 17:59:44","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(73,"2020-03-08 18:23:03","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(74,"2020-03-08 18:23:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(75,"2020-03-08 18:24:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(76,"2020-03-08 18:24:18","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(77,"2020-03-08 18:24:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(78,"2020-03-08 18:24:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(79,"2020-03-08 18:24:35","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(80,"2020-03-08 18:24:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(81,"2020-03-08 18:24:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(82,"2020-03-08 18:24:59","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(83,"2020-03-08 18:25:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(84,"2020-03-08 18:25:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(85,"2020-03-08 18:25:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(86,"2020-03-08 18:25:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(87,"2020-03-08 18:25:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(88,"2020-03-08 18:25:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(89,"2020-03-08 18:25:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(90,"2020-03-08 18:25:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(91,"2020-03-08 20:31:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(92,"2020-03-08 20:31:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(93,"2020-03-08 20:31:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(94,"2020-03-08 20:33:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(95,"2020-03-08 20:33:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(96,"2020-03-08 20:33:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(97,"2020-03-08 22:55:12","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(98,"2020-03-10 15:47:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(99,"2020-03-10 15:47:30","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(100,"2020-03-10 15:47:30","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(101,"2020-03-10 15:47:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(102,"2020-03-12 15:11:45",NULL),
(103,"2020-03-12 15:12:27",NULL),
(104,"2020-03-12 15:12:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(105,"2020-03-12 15:13:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(106,"2020-03-12 15:37:38","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(107,"2020-03-12 15:38:05","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(108,"2020-03-12 15:38:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(109,"2020-03-12 22:21:26","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(110,"2020-03-12 22:21:29","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(111,"2020-03-12 22:21:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(112,"2020-03-14 12:27:49","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(113,"2020-03-14 12:59:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(114,"2020-03-14 13:01:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(115,"2020-03-14 13:02:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(116,"2020-03-14 15:35:58",NULL),
(117,"2020-03-14 15:36:47","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(118,"2020-03-14 22:27:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(119,"2020-03-14 22:27:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(120,"2020-03-14 22:27:33","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(121,"2020-03-14 22:27:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(122,"2020-03-14 22:27:35","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(123,"2020-03-14 22:28:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(124,"2020-03-15 23:14:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(125,"2020-03-18 14:30:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop");


SET foreign_key_checks = 1;
CREATE DATABASE IF NOT EXISTS `autre`;

USE `autre`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `afaire`;

CREATE TABLE `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=517 DEFAULT CHARSET=latin1;

INSERT INTO `afaire` VALUES (205,"Sur la carte, mettre en évidence les endroits accessibles ?","grosseetapeplustard"),
(264,"Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination","petittrucplustard"),
(22,"Ajouter sécurité sur les champs entrés par les utilisateurs.","lancementsite"),
(23,"Passer par http://validator.w3.org","lancementsite"),
(24,"Faire le CRON","lancementsite"),
(25,"Faire de la compression : http://php-minify.com/#","lancementsite"),
(515,"BUG : Page vaisseau casse !! ","encours"),
(511,"Page capitale et planète : Cacher efficacité jusqu\'à un certain niveau","petittrucrapide"),
(485,"Croissance de la pop : Faire en fonction place libre et organisation","grosetapesouspeu"),
(473,"Passage au niveau 6 : Refaire + mettre seconde option ?","petittrucrapide"),
(516,"Creer astéroïdes dans l\'univers 2 en fonction de ceux deja presents.","encours"),
(502,"Page conception : Supprimer des composants. ","encours"),
(498,"Page vaisseau : Revoir la rénovation de vaisseau.","encours");


DROP TABLE IF EXISTS `champsasteroides`;

CREATE TABLE `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `champsasteroides` VALUES (1,1,1,1,2,6),
(4,2,3,1,5,6);


DROP TABLE IF EXISTS `planete`;

CREATE TABLE `planete` (
  `idplanete` int(11) NOT NULL AUTO_INCREMENT,
  `xplanete` int(11) NOT NULL,
  `yplanete` int(11) NOT NULL,
  `universplanete` int(11) NOT NULL,
  PRIMARY KEY (`idplanete`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `planete` VALUES (1,3,3,1),
(2,4,2,1),
(3,3,3,2);


DROP TABLE IF EXISTS `tour`;

CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

INSERT INTO `tour` VALUES (1,"2020-03-07 23:25:48","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(2,"2020-03-07 23:26:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(3,"2020-03-07 23:26:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(4,"2020-03-07 23:26:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(5,"2020-03-07 23:26:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(6,"2020-03-07 23:26:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(7,"2020-03-07 23:26:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(8,"2020-03-07 23:26:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(9,"2020-03-07 23:29:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(10,"2020-03-07 23:29:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(11,"2020-03-07 23:33:55","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(12,"2020-03-07 23:33:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(13,"2020-03-07 23:34:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(14,"2020-03-07 23:34:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(15,"2020-03-07 23:34:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(16,"2020-03-07 23:34:22","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(17,"2020-03-07 23:35:00","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(18,"2020-03-07 23:35:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(19,"2020-03-07 23:35:17",NULL),
(20,"2020-03-08 00:19:18",NULL),
(21,"2020-03-08 00:22:03",NULL),
(22,"2020-03-08 00:22:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(23,"2020-03-08 01:28:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(24,"2020-03-08 01:36:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(25,"2020-03-08 01:36:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(26,"2020-03-08 01:36:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(27,"2020-03-08 01:36:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(28,"2020-03-08 01:38:24","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(29,"2020-03-08 01:56:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(30,"2020-03-08 01:56:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(31,"2020-03-08 01:56:48","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(32,"2020-03-08 16:25:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(33,"2020-03-08 16:27:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(34,"2020-03-08 16:31:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(35,"2020-03-08 16:52:00","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(36,"2020-03-08 16:52:04","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(37,"2020-03-08 16:52:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(38,"2020-03-08 16:52:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(39,"2020-03-08 16:58:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(40,"2020-03-08 16:59:08",NULL),
(41,"2020-03-08 17:00:03",NULL),
(42,"2020-03-08 17:00:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(43,"2020-03-08 17:00:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(44,"2020-03-08 17:00:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(45,"2020-03-08 17:33:31","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(46,"2020-03-08 17:37:25",NULL),
(47,"2020-03-08 17:38:10","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(48,"2020-03-08 17:38:35",NULL),
(49,"2020-03-08 17:39:30",NULL),
(50,"2020-03-08 17:39:45",NULL),
(51,"2020-03-08 17:49:59","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(52,"2020-03-08 17:50:02","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(53,"2020-03-08 17:50:05","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(54,"2020-03-08 17:50:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(55,"2020-03-08 17:51:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(56,"2020-03-08 17:51:52","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(57,"2020-03-08 17:51:54","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(58,"2020-03-08 17:52:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(59,"2020-03-08 17:52:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(60,"2020-03-08 17:52:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(61,"2020-03-08 17:53:02",NULL),
(62,"2020-03-08 17:53:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(63,"2020-03-08 17:58:06",NULL),
(64,"2020-03-08 17:58:41","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(65,"2020-03-08 17:59:15","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(66,"2020-03-08 17:59:25","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(67,"2020-03-08 17:59:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(68,"2020-03-08 17:59:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(69,"2020-03-08 17:59:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(70,"2020-03-08 17:59:43","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(71,"2020-03-08 17:59:44","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(72,"2020-03-08 17:59:44","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(73,"2020-03-08 18:23:03","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(74,"2020-03-08 18:23:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(75,"2020-03-08 18:24:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(76,"2020-03-08 18:24:18","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(77,"2020-03-08 18:24:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(78,"2020-03-08 18:24:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(79,"2020-03-08 18:24:35","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(80,"2020-03-08 18:24:42","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(81,"2020-03-08 18:24:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(82,"2020-03-08 18:24:59","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(83,"2020-03-08 18:25:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(84,"2020-03-08 18:25:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(85,"2020-03-08 18:25:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(86,"2020-03-08 18:25:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(87,"2020-03-08 18:25:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(88,"2020-03-08 18:25:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(89,"2020-03-08 18:25:21","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(90,"2020-03-08 18:25:51","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(91,"2020-03-08 20:31:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(92,"2020-03-08 20:31:19","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(93,"2020-03-08 20:31:20","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(94,"2020-03-08 20:33:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(95,"2020-03-08 20:33:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(96,"2020-03-08 20:33:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(97,"2020-03-08 22:55:12","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(98,"2020-03-10 15:47:28","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(99,"2020-03-10 15:47:30","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(100,"2020-03-10 15:47:30","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(101,"2020-03-10 15:47:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(102,"2020-03-12 15:11:45",NULL),
(103,"2020-03-12 15:12:27",NULL),
(104,"2020-03-12 15:12:57","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(105,"2020-03-12 15:13:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(106,"2020-03-12 15:37:38","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(107,"2020-03-12 15:38:05","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(108,"2020-03-12 15:38:11","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(109,"2020-03-12 22:21:26","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(110,"2020-03-12 22:21:29","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(111,"2020-03-12 22:21:36","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(112,"2020-03-14 12:27:49","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(113,"2020-03-14 12:59:40","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(114,"2020-03-14 13:01:58","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(115,"2020-03-14 13:02:23","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(116,"2020-03-14 15:35:58",NULL),
(117,"2020-03-14 15:36:47","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(118,"2020-03-14 22:27:27","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(119,"2020-03-14 22:27:32","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(120,"2020-03-14 22:27:33","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(121,"2020-03-14 22:27:34","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(122,"2020-03-14 22:27:35","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(123,"2020-03-14 22:28:37","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(124,"2020-03-15 23:14:14","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(125,"2020-03-18 14:30:50","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(126,"2020-03-19 18:34:13","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(127,"2020-03-19 18:34:15","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop"),
(128,"2020-03-19 18:34:16","Le tour commence.</br> le numéro du tour a été augmenté</br> Début de la croissance des pop</br> Fin de la croissance des pop");


SET foreign_key_checks = 1;
