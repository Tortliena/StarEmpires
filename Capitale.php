<?php 
session_start(); 
if (!$_SESSION['pseudo']) 
	{ 
    header('Location: Accueil.php'); 
    exit();  
	} 
include("include/BDDconnection.php"); 
?> 
 
<!DOCTYPE html><html><head><meta charset="utf-8"/><link rel="stylesheet" href="style.css"/><title>Mon super site</title></head> 
<body><?php include("include/menu.php"); ?><div class="corps"> 
<h1>CAPITALE</h1> 
     
<?php 
include("include/message.php") ;  
$typemessage = 'capitale' ; 
include("include/resume.php"); 
 
$reqinfoutilisateur = $bdg->prepare('SELECT * FROM utilisateurs WHERE id= ?'); 
$reqinfoutilisateur->execute(array($_SESSION['id'])); 
$repinfoutilisateur = $reqinfoutilisateur->fetch(); 
 
$recuperereventencours = $bdg->prepare('SELECT * FROM choixevents WHERE idjoueurevent= ?'); 
$recuperereventencours->execute(array($_SESSION['id'])); 
$eventencours = $recuperereventencours->fetch(); 

    
    $reqorganisationactuelle = $bdg->prepare('SELECT  FROM planete WHERE idjoueurplanete = ? ');

if ($replvl['lvl'] > 3) 
    { 
    echo '<h3>Stats d\'empire :</h3>'; 
    $reqcompterpop = $bdg->prepare('SELECT  COUNT(*) AS nbpop, 
                                            COUNT(DISTINCT pl.idplanete) AS nbpla 
                                            FROM population po 
                                            INNER JOIN planete pl ON pl.idplanete = po.idplanetepop 
                                            WHERE pl.idjoueurplanete = ?');
    $reqcompterpop->execute(array($_SESSION['id']));                                    
    $repcompterpop = $reqcompterpop->fetch();
    
    $reqorganisationactuelle = $bdg->prepare('SELECT SUM(organisation) AS orga FROM planete WHERE idjoueurplanete = ? ');
    $reqorganisationactuelle->execute(array($_SESSION['id']));                                    
    $reporganisationactuelle = $reqorganisationactuelle->fetch();
    
    echo 'Votre empire compte '.$repcompterpop['nbpop'].' de population réparti sur '.$repcompterpop['nbpla'].' planètes.</br>';
    
    $organisationmoyenne = FLOOR($reporganisationactuelle['orga']/$repcompterpop['nbpop']/10);
    echo 'Organisation moyenne de votre empire : '.$organisationmoyenne.'%.<br>';
    } 
 
if (isset($eventencours['texteevent'])) 
  { 
  echo $eventencours['texteevent']; 
  if (isset($eventencours['eventsuite1'])) 
    { 
    ?> 
    <form method="post" action="script/choixevent.php"> 
    <input type="hidden" name="choix" value="<?php echo $eventencours['eventsuite1'] ;?>"> 
    <input type="submit" 
    <?php if ($repinfoutilisateur['ideventsuivant'] == $eventencours['eventsuite1']) { ?> class="choixactuel" <?php } ?> 
    value="<?php echo $eventencours['textechoix1'] ;?>" /> 
    </form><?php 
    } 
  if (isset($eventencours['eventsuite2'])) 
    { 
    ?> 
    <form method="post" action="script/choixevent.php"> 
    <input type="hidden" name="choix" value="<?php echo $eventencours['eventsuite2'] ;?>"> 
    <input type="submit" 
    <?php if ($repinfoutilisateur['ideventsuivant'] == $eventencours['eventsuite2']) { ?> class="choixactuel" <?php } ?> 
    value="<?php echo $eventencours['textechoix2'] ;?>" /> 
    </form><?php 
    } 
  if (isset($eventencours['eventsuite3'])) 
    { 
    ?> 
    <form method="post" action="script/choixevent.php"> 
    <input type="hidden" name="choix" value="<?php echo $eventencours['eventsuite3'] ;?>"> 
    <input type="submit" 
    <?php if ($repinfoutilisateur['ideventsuivant'] == $eventencours['eventsuite3']) { echo 'class="choixactuel"'; } ?> 
    value="<?php echo $eventencours['textechoix3'] ;?>" /> 
    </form><?php 
    } 
  } 
 
  echo '</br><h3>Objectifs :</h3>'; 
  switch ($repinfoutilisateur['lvl']) 
  {  
      case 0: 
          echo "Former un chercheur et un ouvrier.</br>"; 
          echo "Vous pouvez passer des tours en cliquant sur 'passer le tour'.</br>"; 
          echo "Pour former des spécialistes, vous pouvez passer par la page dédiée à votre planète.</br>"; 
          echo "Facultatif : Donner un meilleur nom a votre planète.</br>"; 
      break; 
      case 1: 
          echo "Finir la recherche sur les moteurs.</br>"; 
          echo "Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"; 
      break; 
      case 2: 
          echo "Construire un vaisseau spatial et le sortir dans l'espace.</br>"; 
          echo "Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>"; 
          echo "Après que votre vaisseau ait été construit, vous devez alors créer une flotte sur la page planète. Ensuite, vous pourrez diriger votre flotte sur la carte à partir de la page dédiée aux flottes.</br>"; 
          echo "Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d'ouvriers et de chercheurs.</br>"; 
          echo "Facultatif : Renommer votre flotte et donnez des ordres pour explorer les alentours.</br>"; 
      break; 
      case 3: 
          echo "Explorer les environs et trouver un nouveau monde pour le coloniser.</br>"; 
          echo "Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l'ordre.</br>"; 
          echo "Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l'espace.</br>"; 
          echo "Facultatif : Avec deux vaisseaux/flottes, cela pourrait aller plus vite.</br>"; 
      break; 
      case 4: 
          echo "Vous venez de trouver quelques astéroides et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>"; 
          echo "Continuez d'explorer.</br>";
          echo "Facultatif : Lancer la recherche sur les lasers miniers afin de pouvoir exploiter les ressources spatiales.</br>"; 
          echo "Facultatif2 : Faire la recherche sur les bases lunaires. Cela vous donnera la possilité votre conquête de l'espace avant d'aller coloniser une exoplanète.</br>"; 
      break; 
      case 5: 
          echo "Votre vaisseau d'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>"; 
          echo "Faites une recherche sur des équipements de vaisseau et construisez en. Vous allez sans doute avoir besoin d'un laser minier, de soutes, de soutes et de moteurs améliorés.</br>"; 
      break; 
      case 6: 
          echo "Vous avez maintenant un composant disponible sur votre planète. Faite rentrer votre vaisseau ou produisant en un nouveau. Une fois sur votre planète, aller voir l'un de vos vaisseaux et équipez le avec un composant au moins.</br>"; 
      break; 
      case 7: 
          echo "Nous devons étendre notre empire. Colonisez une seconde planète.</br>"; 
          echo "Nous devrions aussi nous concentrer en parallèle à la récoltes de ressources spatiales et continuer d'explorer.</br>";        
      break;
      case 8: 
          echo "Nous avons exploré une très grande partie de notre galaxie sans trouver le moindre trace de civilisation. Cette épave spatiale est le seul signe d'intelligence en dehors de notre monde. Elle devient donc notre priorité absolue.</br>"; 
          echo "Nous devons faire des recherches sur l'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d'étudier l'épave.</br>"; 
          echo "La priorité est de préparer deux vaisseaux lourdement armés et d'attaquer cette épave. Nous allons pouvoir l'étudier par la suite.</br>"; 
      break; 
      case 9: 
          echo "Nos dernières explorations semblent indiquer que notre univers est vide de vie avancée en dehors de cette épave et de nous. Nous ne sommes pas en mesure d'expliquer comment cette chose à pu arriver là.</br>"; 
          echo "Récoltez ce que vous pouvez sur les restes de l'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l'être."; 
      break; 
      case 10: 
          echo "Équipez un vaisseau avec le dispositif inconnu et utilisez-le."; 
      break; 
      default: 
          echo "Vous etes arrivé au bout du jeu ! Bonne chance !";  
      break;  
      } 
  ?> 
  </div> 
  </body> 
</html>