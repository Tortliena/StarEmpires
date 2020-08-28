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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",10000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",100,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",100,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",100,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",100,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",100,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",100,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",100,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",100,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",100,0,5,11);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


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


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20);


SET foreign_key_checks = 1;
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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",10000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",100,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",100,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",100,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",100,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",100,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",100,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",100,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",100,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",100,0,5,11);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


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


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20);


SET foreign_key_checks = 1;
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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",10000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",100,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",100,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",100,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",100,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",100,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",100,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",100,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",100,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",100,0,5,11);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


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


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20);


SET foreign_key_checks = 1;
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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",10000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",100,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",100,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",100,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",100,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",100,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",100,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",100,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",100,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",100,0,5,11);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


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


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20),
(9,"Temps d\'invasion de base d\'une planète",10);


SET foreign_key_checks = 1;
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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",10000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",100,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",100,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",100,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",100,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",100,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",100,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",100,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",100,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",100,0,5,11);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


DROP TABLE IF EXISTS `typepop`;

CREATE TABLE `typepop` (
  `idtypepop` int(11) NOT NULL AUTO_INCREMENT,
  `nompop` varchar(16) NOT NULL,
  `prixchangementpop` int(11) NOT NULL,
  UNIQUE KEY `idtypepop_2` (`idtypepop`),
  KEY `idtypepop` (`idtypepop`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `typepop` VALUES (1,"citoyen",-50),
(2,"ouvrier",75),
(3,"scientifique",100),
(4,"soldat",200);


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20),
(9,"Temps d\'invasion de base d\'une planète",10);


SET foreign_key_checks = 1;
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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",10000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",100,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",100,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",100,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",100,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",100,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",100,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",100,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",100,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",100,0,5,11);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


DROP TABLE IF EXISTS `typepop`;

CREATE TABLE `typepop` (
  `idtypepop` int(11) NOT NULL AUTO_INCREMENT,
  `nompop` varchar(16) NOT NULL,
  `prixchangementpop` int(11) NOT NULL,
  UNIQUE KEY `idtypepop_2` (`idtypepop`),
  KEY `idtypepop` (`idtypepop`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `typepop` VALUES (1,"citoyen",-50),
(2,"ouvrier",75),
(3,"scientifique",100),
(4,"soldat",200);


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20),
(9,"Temps d\'invasion de base d\'une planète",10);


SET foreign_key_checks = 1;
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
  `structure` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcomposant`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

INSERT INTO `composant` VALUES (10,"Moteur II","moteur",1,2,5,0,0,2),
(11,"Laser minier","arme",3,3,2,2,1,1),
(12,"Soutes Larges","soute",2,10,4,0,0,2),
(13,"Arme alienne pour le 1er vaisseau","arme",0,0,15,4,2,8),
(14,"Torpille supraluminique","arme",0,0,2,2,4,2),
(15,"Coque polycarbonique","coque",0,0,10,0,0,1),
(17,"Noyau alien adapté","noyau",5,1,2,0,0,1),
(19,"Missile alienne adapté","arme",0,0,2,2,5,1),
(20,"Missile enrichi","arme",0,0,2,2,5,2),
(23,"Module de colonisation","autre",4,0,5,0,0,6),
(24,"Noyau à  Tachyons","noyau",5,1,3,0,0,1),
(25,"Noyau alien acheté","noyau",5,2,5,0,0,1),
(28,"Noyau à hypso-tachyons","noyau",5,2,4,0,0,1),
(29,"Arme alienne pour les vaisseaux du second univers","arme",0,0,8,3,3,4),
(30,"Coque alienne adaptée","coque",0,0,90,0,0,4),
(32,"item pété du cul","moteur",1,20,50000,10,1000,1),
(34,"Coque au titane","coque",0,0,35,0,0,2),
(35,"Moteur III","moteur",1,4,8,0,0,2),
(39,"Module de restauration planétaire","autre",5,1,5,0,0,6),
(40,"Module d\'amélioration planétaire","autre",5,2,5,0,0,6);


DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `nombatiment` varchar(64) NOT NULL,
  `coutbien` int(11) NOT NULL DEFAULT '100',
  `couttitane` int(11) NOT NULL DEFAULT '0',
  `coutneutrinos` int(11) NOT NULL DEFAULT '0',
  `typeitem` varchar(32) NOT NULL,
  `technescessaire` int(11) NOT NULL DEFAULT '0' COMMENT 'Si -1 = impossible à faire',
  `itemnecessaire` int(11) DEFAULT '0' COMMENT 'Si -1, utile pour le menu déroulant et éviter les répétitions.',
  `description` varchar(512) DEFAULT NULL,
  `nomlimite` varchar(32) DEFAULT NULL,
  `souscategorie` varchar(64) NOT NULL,
  `entretien` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

INSERT INTO `items` VALUES (1,"Centre de recherche",60,0,0,"batiment",1,0,"Peut accueillir jusqu\'à 5 chercheurs.",1,"",1),
(2,"Chantier",50,0,0,"batiment",3,0,"Peut accueillir jusqu\'à 5 ouvriers.",1,"",1),
(3,"Mégalopole",80,0,0,"batiment",0,0,"Permet d\'augmenter la population maximale d\'une planète.","maxmegalopole","",2),
(4,"Base lunaire",150,10,0,"batiment",2,0,"Permet d\'augmenter la population maximale de notre civilisation.","maxbaselunaire","",2),
(6,"débris communs",10,0,0,"autre",0,7,"Ressources communes trouvées dans l\'espace. Vous pouvez demander à vos ouvriers de travailler dessus pour les transformer en biens utilisables.",NULL,"",0),
(7,"Recycler débris",10,0,0,"autre",0,6,NULL,NULL,"",0),
(8,"débris avec des métaux rares",10,0,0,"autre",0,9,"Vous ne trouvez pas ces métaux sur votre planète en grande quantité. Ils vous permettent d\'accéder une technologie plus avancée. Cependant, il vous faut au préalable raffiner ce produit brut.",NULL,"",0),
(9,"Recycler débris rares",10,0,0,"autre",0,8,NULL,NULL,"",0),
(10,"Moteur II",40,0,0,"composant",5,0,"Moteur amélioré permettant de déplacer plus vite les vaisseaux.",NULL,"moteur",0),
(11,"Laser minier",50,0,0,"composant",6,0,"Composant destiné à découper les débris. Peut servir d\'arme. Relativement lent car limité à la vitesse de la lumière.",NULL,"arme",0),
(12,"Soutes larges",40,0,0,"composant",7,0,"Permet d\'installer des soutes sur votre vaisseau",NULL,"soute",0),
(13,"Arme alienne pour le 1er vaisseau",500,200,0,"composant",-1,0,NULL,NULL,"arme",0),
(14,"Torpille supraluminique",100,0,0,"composant",10,0,"Énorme bombe avec un propulseur supraluminique. Simple, efficace, rapide contre les grosses cibles peu mobiles.",NULL,"arme",0),
(15,"Coque polycarbonique",50,0,0,"composant",11,0,"Coque composée de polymères de carbone. Léger et résistant.",NULL,"coque",0),
(16,"débris de technologie alienne",100,0,0,"artefact",12,17,"Trouvé au cœur de l\'épave spatiale, ce morceau était particulièrement blindé sans qu\'on ne puisse comprendre sa fonction.",NULL,"",0),
(17,"Noyau alien adapté",100,100,0,"composant",12,16,"Trouvé au cœur de l\'épave spatiale, ce noyau a été partiellement restauré et adapté à notre technologie. Il n\'est sans doute pas aussi efficace que par le passé, mais il marche.",NULL,"noyau",0),
(18,"débris de technologie alienne",100,0,0,"artefact",13,19,"Les premières études laissent à penser que nous avons ici une arme d\'origine alienne. Nous devrions pouvoir le restaurer, voir de l\'imiter pour en produire nous même. ",NULL,"",0),
(19,"Missile alienne adapté",100,0,0,"composant",13,18,"Système de missiles récupérés sur une épave et restauré.",NULL,"arme",0),
(20,"Missile enrichi",100,50,0,"composant",14,0,"Système de missiles développés dont la technologie est tirée de l\'étude de restes aliens.",NULL,"arme",0),
(21,"Centre de traitement des minerais",100,0,0,"batiment",17,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(22,"Centre de traitement des minerais rares",100,0,0,"batiment",18,0,"Permet de traiter automatiquement les minéraux venus de débris spatiaux. Améliore aussi les rendements de recyclage.",1,"",5),
(23,"Module de colonisation",100,0,0,"composant",19,0,"Permet à votre flotte de coloniser un monde. Le vaisseau est consommé dans la procédure.",NULL,"autre",0),
(24,"Noyau à tachyons",100,100,0,"composant",15,0,"Noyau fait maison, imitant celui que nous avons trouvé",NULL,"noyau",0),
(25,"Noyau alien acheté",100,0,0,"composant",-1,-1,"Noyau acheté. Il permet d\'accéder à d\'autres univers.",NULL,"noyau",0),
(26,"Titane en barre",40,100,0,"produit",20,0,"Du titane industriel de haute pureté. Parfait pour être vendu puis utilisé par une autre civilisation.",NULL,"",0),
(27,"Utilisation du titane",100,0,0,"autre",0,26,"Permet d\'utiliser du titane en barre afin de l\'utiliser dans notre économie.",NULL,"",0),
(28,"Noyau à hypso-tachyons",100,200,0,"composant",21,0,"Noyau fait maison, imitant celui que nous avons acheté.",NULL,"noyau",0),
(29,"Arme vaisseau alien 1er univers",200,40,0,"composant",-1,0,NULL,NULL,"arme",0),
(30,"Coque alienne adaptée",100,0,0,"composant",22,31,"La matière semi organique récupérée sur des vaisseaux aliens a été adaptée. Elle est particulièrement adaptée à l\'espace et est solide.",NULL,"coque",0),
(31,"débris de technologie alienne",100,0,0,"artefact",22,30,"La matière est très étrange, solide et semi-organique. Il faudra du temps et des études pour l\'adaptée à un de nos vaisseaux. Nous n\'avons pas trouvé de moyen de reproduire la substance.",NULL,"",0),
(32,"Item pété du cul pour les tests",500,200,0,"composant",-1,0,NULL,NULL,"moteur",0),
(33,"Quartier général des armées",100,0,0,"batiment",-1,0,"Gérer vos troupes partout ou elles se trouvent. Bâtiment unique impossible à produire.",NULL,"",0),
(34,"Coque en titane",100,40,0,"composant",24,0,"Coque extrêmement solide.",NULL,"coque",0),
(35,"Moteur III",50,40,0,"composant",25,0,"Moteur amélioré au titane",NULL,"moteur",0),
(36,"débris irradiés aux neutrinos",100,0,0,"autre",0,37,"On peut récupérer ce matériaux pauvre en neutrinos pour le purifier et récupérer une formidable source d\'énergie.",NULL,"",0),
(37,"Purification des neutrinos",100,10,0,"autre",0,36,NULL,NULL,"",0),
(38,"Base militaire",50,0,0,"batiment",26,0,"Peut accueillir jusqu\'à 5 soldats",1,"",1),
(39,"Module de restauration planétaire",200,50,0,"composant",27,0,"Permet à votre flotte de restaurer l\'environnement d\'une planète.",NULL,"autre",0),
(40,"Module d\'amélioration planétaire",200,50,50,"composant",28,0,"Permet à votre flotte de restaurer, voir d\'améliorer l\'environnement d\'une planète.",NULL,"autre",0);


DROP TABLE IF EXISTS `recherche`;

CREATE TABLE `recherche` (
  `idrecherche` int(11) NOT NULL AUTO_INCREMENT,
  `nomrecherche` varchar(32) NOT NULL,
  `descriptionrecherche` text NOT NULL,
  `prixrecherche` int(11) NOT NULL DEFAULT '100',
  `itemnecessaire` int(11) NOT NULL DEFAULT '0',
  `recherchenecessaire` int(11) DEFAULT '0',
  `niveauminimal` int(11) NOT NULL,
  PRIMARY KEY (`idrecherche`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO `recherche` VALUES (1,"Centre de recherche","Vous permet de construire un centre de recherche qui va vous permettre d\'augmenter la limite maximale du nombre de chercheurs.",300,0,4,3),
(2,"Base lunaire","Votre peuple s\'en va installer des bases dans la galaxie. Cependant, ces installation nécessitent d\'importantes quantités de ressources rares qu\'on trouve en faible quantité sur notre monde.",1000,0,19,6),
(3,"Chantier","Permet de lancer des projets plus importants.",300,0,4,4),
(4,"Moteur interstellaire","Permet développer la technologie pour voyager entre les étoiles. Vous pourrez ainsi visiter les 5 étoiles repérées dans l\'univers.",200,0,0,2),
(5,"Moteurs améliorés","Ce moteur permettra aux vaisseaux d\'aller plus vite. Cette évolution est permise par les dernières ressources trouvées. ",1500,0,1,4),
(6,"Lasers miniers","Développement de lasers optimisés pour découper des débris. Peut servir d\'arme.",1500,0,3,5),
(7,"Architecture spatiale de stokage","Permet d\'installer des soutes sur vos vaisseaux. Ils pourront transporter plus de ressources.",1500,0,3,5),
(10,"Armes supraluminique","On prend une bombe, et on installe un petit moteur supraluminique dessus. On obtient alors une torpille bien plus rapide que les lasers classiques et efficace contre les grosses cibles peu mobiles.",2000,0,6,9),
(11,"Coque renforcée","Ces coques sont renforcées avec un polymère de carbone. Léger et constructibles avec les ressources de notre monde natal.",2000,0,7,9),
(12,"Étude du coeur de l\'épave","Trouvé au cœur de l\'épave spatiale. Les études préliminaires semblent indiquer que ce composant émet un champs quantique à l\'aide d\'un flux de tachyons. Ce composant était particulièrement protégé des attaques externes et ne semble pas présenter de risque majeur. \r\nUne étude poussée nous permettrait de le restaurer et de comprendre pourquoi ce composant bénéficié d\'une si grande attention.",2000,16,0,0),
(13,"Étude d\'arme alien","Nous avons pu récupérer des éléments de l\'armement alien. Nous pourrions l\'adapter à nos vaisseaux et éventuellement développer nos propres armes.",2000,18,0,0),
(14,"Missile enrichi","Nous avons pu récupérer tout un ensemble de composants électroniques permettant de cibler des vaisseaux. Les aliens ont utilisés beaucoup de ressources rares, notamment pour cet armement.",3000,0,0,11),
(15,"Noyaux à tachyons","Nous allons essayer de développer notre propre version du noyaux à tachyons pour pouvoir créer nos propres vaisseaux pouvant voyager entre les univers.",2000,0,12,0),
(17,"Usine de traitement de minerais","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace.",5000,0,6,11),
(23,"Coque ultrarenforcée","Inspirée des coques semi-organiques, nous avons introduit du titane pour renforcer la structure de nos vaisseaux.",800,0,0,0),
(18,"Traitement de minerais avancé","Permet de traiter les minerais trouvés dans l\'espace de manière plus efficace. Notamment les minerais rares.",7000,0,16,0),
(19,"Module de colonisation","Permet de créer un vaisseau entièrement dédiée à la colonisation. Il demande d\'énormes ressources.",400,0,1,5),
(20,"Purification du titane","Permet de raffiner le titane afin d\'en faire du titane de haute qualité.",7000,0,6,13),
(21,"Noyaux avancés","Nous allons tenter de reproduire le noyau que nous avons trouvé. Cela va nous permettre de mieux maitriser nos sauts dimensionnels.",10000,0,15,14),
(22,"Étude coque semi-organique","Cette substance a été trouvé sur un vaisseau alien. Il faut du temps et des ressources pour adapter un de nos vaisseaux pour rentrer dedans. Le vaisseau gagnerait en durabilité.",1000,31,0,0),
(24,"Coque en titane","Inspirée des coques semi-organique, nous avons introduit le titane en petite quantité pour renforcer la structure de nos vaisseaux.",7000,0,22,0),
(25,"Moteur III","Nous avons eu l\'idée d\'intégrer du titane dans nos moteurs pour les rendre plus résistants aux hautes températures et pressions, permettant de développer plus de puissance de propulsion tout en économisant de la place.",8000,0,5,11),
(26,"Militarisation","Permet de construire une base militaire, ce qui permet d’accroitre sensiblement le nombre de soldats.",400,0,4,7),
(27,"Restauration planétaire","Permet de réparer les dégâts d\'une planète. Particulièrement efficace sur les planètes avec une grande stabilité environnementale.",4000,0,2,7),
(28,"Amélioration planétaire","Permet d\'améliorer des planètes. Particulièrement efficace sur les planètes avec une grande stabilité environnementale. Bien moins intéressant que la restauration planétaire.",10000,0,27,14);


DROP TABLE IF EXISTS `texteniveau`;

CREATE TABLE `texteniveau` (
  `niveau` int(11) NOT NULL AUTO_INCREMENT,
  `texteniveau` text NOT NULL,
  PRIMARY KEY (`niveau`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `texteniveau` VALUES (1,"Former un chercheur et un ouvrier.</br>Vous pouvez passer des tours en cliquant sur \'passer le tour\'.</br>Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>Facultatif : Donner un meilleur nom a votre planète.</br>"),
(2,"Finir la recherche sur les moteurs.</br>Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"),
(3,"Construire un vaisseau spatial et le sortir dans l\'espace.</br>Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d\'ouvriers et de chercheurs.</br>Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"),
(4,"Explorer les environs et trouver un nouveau monde pour le coloniser.</br>Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l\'ordre.</br>Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l\'espace.</br>Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"),
(5,"Vous venez de trouver quelques astéroïdes et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>Continuez d\'explorer.</br>Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possibilité votre conquête de l\'espace avant d\'aller coloniser une exoplanète.</br>"),
(6,"Votre vaisseau d\'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d\'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"),
(7,"Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l\'un de vos vaisseaux et équipez le avec un composant au moins.</br>"),
(8,"Nous devons étendre notre empire. Colonisez une seconde planète.</br>Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d\'explorer.</br>"),
(9,"Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d\'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>Nous devons faire des recherches sur l\'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d\'étudier l\'épave.</br>La priorité est de préparer deux vaisseaux lourdement armés et d\'attaquer cette épave. Nous allons pouvoir l\'étudier par la suite.</br>"),
(10,"Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d\'expliquer comment cette chose à pu arriver là.</br>Récoltez ce que vous pouvez sur les restes de l\'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l\'être."),
(11,"Équipez un vaisseau avec le dispositif inconnu et utilisez-le."),
(12,"Explore ce nouvel univers et tentez de trouver de la vie intelligente et d’interagir avec elle. "),
(13,"Vous venez d\'acheter un noyau amélioré. Utilisez le pour aller explorer une nouvelle dimension.");


DROP TABLE IF EXISTS `typepop`;

CREATE TABLE `typepop` (
  `idtypepop` int(11) NOT NULL AUTO_INCREMENT,
  `nompop` varchar(16) NOT NULL,
  `prixchangementpop` int(11) NOT NULL,
  UNIQUE KEY `idtypepop_2` (`idtypepop`),
  KEY `idtypepop` (`idtypepop`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `typepop` VALUES (1,"citoyen",-50),
(2,"ouvrier",75),
(3,"scientifique",100),
(4,"soldat",200);


DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `idvariable` int(11) NOT NULL AUTO_INCREMENT,
  `Explications` text NOT NULL,
  `valeur` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idvariable`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `variable` VALUES (1,"% des couts de stockages.",2),
(2,"Bonus de bien lors d\'une colonisation",150),
(3,"prix débris des métaux rares",10),
(4,"prix des barres de rares",100),
(5,"Prix des noyau de niveau 2",1000),
(6,"Temps de voyage entre les univers",2),
(7,"Prix du titane en barre",500),
(8,"Prod des citoyens",20),
(9,"Temps d\'invasion de base d\'une planète",10);


SET foreign_key_checks = 1;
