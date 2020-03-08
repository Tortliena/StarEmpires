CREATE DATABASE IF NOT EXISTS `datawebsite`;

USE `datawebsite`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `composant`;

CREATE TABLE `composant` (
  `idcomposant` int(11) NOT NULL AUTO_INCREMENT,
  `nomcomposant` varchar(64) NOT NULL,
  `typecomposant` varchar(64) NOT NULL,
  `typebonus` int(11) NOT NULL DEFAULT '0',
  `totalbonus` int(11) NOT NULL DEFAULT '0',
  `HPcomposant` int(11) NOT NULL DEFAULT '0',
  `nbtir` int(11) NOT NULL DEFAULT '0',
  `degatpartir` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,2,0,0),
(11,"Laser minier","arme",3,3,2,2,1),
(12,"Soutes Larges","soute",2,10,4,0,0),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2),
(14,"Torpille supraluminique","arme",0,0,2,2,4),
(15,"Coque polycarbonique","coque",0,0,10,0,0),
(17,"Noyau alien adapté","noyau",0,0,2,0,0),
(19,"Missile alienne adapté","arme",0,0,2,2,5),
(20,"Missile enrichi","arme",0,0,2,2,5);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0',
  `itemnecessaire` int(11) DEFAULT '0',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.","maxcentrederecherche",""),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.","maxchantier",""),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole",""),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire",""),
(5,"Frégate",50,0,"vaisseau",4,0,NULL,NULL,""),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,""),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,""),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,""),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,""),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur"),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme"),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute"),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme"),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme"),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque"),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,""),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau"),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,""),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme"),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme");


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",3,0,4),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",10,0,0),
(3,"Chantier","Permet de lancer des projets plus importants.",3,0,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",2,0,0),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",15,0,1),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",15,0,0),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",15,0,3),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",20,0,0),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",20,0,0),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",20,16,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",20,18,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",30,0,13),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",100,0,12);


DROP TABLE IF EXISTS `typepop`;

CREATE TABLE `typepop` (
  `idtypepop` int(11) NOT NULL AUTO_INCREMENT,
  `nompop` varchar(16) NOT NULL,
  `prixchangementpop` int(11) NOT NULL,
  `technecessaire` int(11) NOT NULL,
  UNIQUE KEY `idtypepop_2` (`idtypepop`),
  KEY `idtypepop` (`idtypepop`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `typepop` VALUES (1,"citoyen",-50,0),
(2,"ouvrier",75,0),
(3,"scientifique",100,5);


SET foreign_key_checks = 1;
