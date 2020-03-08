CREATE DATABASE IF NOT EXISTS `autre`;

USE `autre`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `afaire`;

CREATE TABLE `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=473 DEFAULT CHARSET=latin1;

INSERT INTO `afaire` VALUES (457,"Organisation : Impacte la prod des mondes","grosetapesouspeu"),
(205,"Sur la carte, mettre en évidence les endroits accessibles ?","grosseetapeplustard"),
(264,"Mettre un avertissement dans le cas ou un vaisseau ne peut pas atteindre la destination","petittrucplustard"),
(22,"Ajouter sécurité sur les champs entrés par les utilisateurs.","lancementsite"),
(23,"Passer par http://validator.w3.org","lancementsite"),
(24,"Faire le CRON","lancementsite"),
(25,"Faire de la compression : http://php-minify.com/#","lancementsite"),
(470,"Afficher le résumé d\'empire APRES la colonisation.","encours"),
(460,"Si on a pas tous les composants en stock, alors lancer la prod de tous les composants non possédés ","petittrucrapide"),
(472,"Lors de colonisation : Mettre message en cas de réussite et d\'échec.","encours"),
(467,"Refaire niveau 4 et plus. ","encours");


DROP TABLE IF EXISTS `champsasteroides`;

CREATE TABLE `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `champsasteroides` VALUES (1,1,1,1,4,6),
(2,4,1,1,1,8);


DROP TABLE IF EXISTS `tour`;

CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

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
(50,"2020-03-08 17:39:45",NULL);


SET foreign_key_checks = 1;
