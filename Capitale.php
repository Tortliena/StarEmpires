<?php
session_start();
If (!$_SESSION['pseudo'])
{
    header('Location: Accueil.php');
    exit(); 
}
include("include/BDDconnection.php");
?>

<!DOCTYPE html>
<html>
    <head>
           <meta charset="utf-8" />
           <link rel="stylesheet" href="style.css" />
           <title>Mon super site</title>
	</head>
  <body>
    <?php include("include/menu.php"); ?>

  <div class="corps">
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

  echo '<h2>Objectifs :</h2>';
  switch ($repinfoutilisateur['lvl'])
  { 
      case 0:
          echo "Former un chercheur et un ouvrier.</br>";
          echo "Vous pouvez passer des tours en cliquant sur 'passer le tour'.</br>";
          echo "Pour former des population, vous pouvez utiliser cette page.</br>";
      break;
      case 1:
          echo "Finir la recherche sur les moteurs.</br>";
          echo "Facultatif : Utilisez votre ouvrier pour faire une mégalopole.</br>";
      break;
      case 2:
          echo "Construire un vaisseau spatial et le sortir dans l'espace.</br>";
          echo "Construction : Page chantier.</br>";
          echo "Pour diriger le vaisseau, aller sur la page dédiée qui devrait apparaitre après sa construction.</br>";
          echo "Facultatif : Finir les recherches sur les chantiers et les centres de recherche. Vous pourrez plus tard recruter plus d'ouvriers et de chercheurs.</br>";
          echo "Facultatif : Renommer votre vaisseau quand il est construit. Cela pourra vous aider.</br>";
      break;
      case 3:
          echo "Explorer les environs et trouver quelque chose d'intéressant.</br>";
          echo "Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l'ordre.</br>";
          echo "Facultatif : Avec deux vaisseaux, cela ira plus vite. Et avec plus d'ouvriers et de chercheurs, vous pourrez progresser plus vite.</br>";
      break;
      case 4:
          echo "Vous venez de trouver quelques astéroides et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>";
          echo "Vous pouvez déplacer un vaisseau sur un champs d'astéroides, et vous aurez une option pour miner. Ramener le vaisseau avec sa cargaison sur votre planète et vous aurez une option pour déposer votre butin.</br>";
          echo "Continuez d'explorer en parallèle.</br>";
          echo "Facultatif : Faire la recherche sur les bases lunaires et commencer la production.</br>";
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