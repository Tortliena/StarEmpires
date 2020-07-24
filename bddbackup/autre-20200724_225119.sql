CREATE DATABASE IF NOT EXISTS `autre`;

USE `autre`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `afaire`;

CREATE TABLE `afaire` (
  `idafaire` int(11) NOT NULL AUTO_INCREMENT,
  `texteafaire` text NOT NULL,
  `priorite` varchar(128) NOT NULL,
  PRIMARY KEY (`idafaire`)
) ENGINE=MyISAM AUTO_INCREMENT=605 DEFAULT CHARSET=latin1;

INSERT INTO `afaire` VALUES (544,"Faire noyau de niveau 2 effectif.","grosseetapeplustard"),
(553,"Fusionner script de chargement et de vente","petittrucplustard"),
(558,"Gérer le titane en barre (gain titane lorsque consommé + introduire recharche)","grosseetapeplustard"),
(22,"Ajouter sécurité sur les champs entrés par les utilisateurs.","lancementsite"),
(23,"Passer par http://validator.w3.org","lancementsite"),
(24,"Faire le CRON","lancementsite"),
(25,"Faire de la compression : http://php-minify.com/#","lancementsite"),
(548,"Possibilité de faire du titane en barres + le vendre. ","grosetapesouspeu"),
(531,"Vérifier corriger les niveaux et en ajouter une paire.","grosseetapeplustard"),
(529,"Introduire usines de recyclages","petittrucplustard"),
(560,"Faire déchargement partiel sur planète","grosseetapeplustard"),
(547,"Faire chargement sur planète ","grosseetapeplustard"),
(582,"Faire rénovation des vaisseaux = ordre de construction + prix","grosseetapeplustard");


DROP TABLE IF EXISTS `champsasteroides`;

CREATE TABLE `champsasteroides` (
  `idasteroide` int(11) NOT NULL AUTO_INCREMENT,
  `xaste` int(11) NOT NULL,
  `yaste` int(11) NOT NULL,
  `uniaste` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `typeitemsaste` int(11) NOT NULL,
  PRIMARY KEY (`idasteroide`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `champsasteroides` VALUES (1,5,15,-2,2,6),
(2,5,15,-2,3,8),
(3,19,1,-2,3,6),
(4,10,2,-2,3,6),
(5,4,16,-2,3,6),
(6,14,19,-2,3,6);


DROP TABLE IF EXISTS `tour`;

CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetour` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `tour` VALUES (1,"2020-07-24 18:50:40","Le tour commence.</br> Début de la croissance des pop</br> Fin de la croissance des pop");


SET foreign_key_checks = 1;
