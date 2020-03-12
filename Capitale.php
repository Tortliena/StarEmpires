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
 
  echo 'Votre empire compte '.$repcompterpop['nbpop'].' de population réparti sur '.$repcompterpop['nbpla'].' planètes.</br>';  
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
          echo "Pour former des spécialistes, vous pouvez passer par la page planète.</br>"; 
          echo "Facultatif : Donner un meilleur nom a votre planète.</br>"; 
      break; 
      case 1: 
          echo "Finir la recherche sur les moteurs.</br>"; 
          echo "Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>"; 
      break; 
      case 2: 
          echo "Construire un vaisseau spatial et le sortir dans l'espace.</br>"; 
          echo "Construction : Aller sur la page dediée à votre planète, dans la partie chantier.</br>"; 
          echo "Pour diriger le vaisseau, aller sur la page dédiée qui devrait apparaitre après sa construction.</br>"; 
          echo "Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d'ouvriers et de chercheurs.</br>"; 
          echo "Facultatif : Renommer votre vaisseau quand il est construit.</br>"; 
      break; 
      case 3: 
          echo "Explorer les environs et trouver un nouveau monde pour le coloniser.</br>"; 
          echo "Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l'ordre.</br>"; 
          echo "Vous devriez avoir des options pour intéragir avec ce que vous allez trouver dans l'espace.</br>"; 
          echo "Facultatif : Avec deux vaisseaux, cela ira plus vite. Et avec plus d'ouvriers et de chercheurs, vous pourrez progresser plus vite.</br>"; 
      break; 
      case 4: 
          echo "Vous venez de trouver quelques astéroides et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>"; 
          echo "Continuez d'explorer et de vous développer.</br>"; 
          echo "Facultatif : Faire la recherche sur les bases lunaires et commencer la production de celle-ci sur votre seconde planète.</br>"; 
      break; 
      case 5: 
          echo "Votre vaisseau d'exploration est lourdement endommagé. Vous avez aussi trouvé de multiples ressources à exploiter et une nouvelle planète nécessitant un gros investissement.</br>"; 
          echo "Faites une recherche sur des équipements de vaisseau et construisez en un ou alors envoyez un vaisseau récolter des ressources et ramenez les sur votre planète.</br>"; 
      break; 
      case 6: 
          echo "Vous avez maintenant accès à votre silo. Vous y avez dedans le résumé de ce qui est stocké sur votre planète.</br>"; 
          echo "Équiper un de vos vaisseaux avec un composant quelconque. Ils faut faire entrer votre vaisseau dans le hangars et sélectionner le composant à équiper.</br>"; 
      break; 
      case 7: 
          echo "Il est temps pour nous d'aller commencer la colonisation d'un nouveau monde. Finissez la recherche sur les bases lunaires et en produire une.</br>"; 
          echo "Vous allez avoir besoin de recycler les débris spatiaux, donc équipez vos vaisseaux de moteurs, lasers miniers et de soutes avant de ramener ce dont vous avez besoin sur votre planète.</br>"; 
      break; 
      case 8: 
          echo "Nous devons faire des recherches sur l'armement spatial et commencer à équiper une paire de vaisseau avec. Cela nous permettra d'étudier l'épave.</br>"; 
          echo "En attendant, continuons d'explorer pour voir si nous ne pourrions pas trouver un monde ayant ou abritant toujours les créateurs de cette épave.</br>"; 
          echo "La priorité est de préparer deux vaisseaux lourdement armés et attaquer cette épave. Nous allons pouvoir l'étudier par la suite.</br>"; 
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