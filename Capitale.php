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

$reqinfolimites = $bdg->prepare('SELECT * FROM limitesjoueurs WHERE id= ?');
$reqinfolimites->execute(array($_SESSION['id']));
$repinfolimites = $reqinfolimites->fetch();

$reqcomptermegalopole = $bdg->prepare('SELECT COUNT(*) AS nb FROM batiments WHERE idjoueurbat = ? AND typebat = 3');
$reqcomptermegalopole->execute(array($_SESSION['id']));
$repcomptermegalopole = $reqcomptermegalopole->fetch();

$reqcompterbaselunaire = $bdg->prepare('SELECT COUNT(*) AS nb FROM batiments WHERE idjoueurbat = ? AND typebat = 4');
$reqcompterbaselunaire->execute(array($_SESSION['id']));
$repcompterbaselunaire = $reqcompterbaselunaire->fetch();

$total = $repcompterbaselunaire['nb'] + $repcomptermegalopole['nb'] + 8 ; 
echo '</br></br>Population max : 8 + ' . $repcomptermegalopole['nb'] . '/' . $repinfolimites['maxmegalopole'] . ' mégalopole ';
if ($repinfoutilisateur['lvl']>4)
  {
  echo '+ ' . $repcompterbaselunaire['nb'] . '/' . $repinfolimites['maxbaselunaire'] . ' base lunaire ';
  }
echo '= '. $total . ' max';

// Affichage de la population totale.
$compterpop = $bdg->prepare('SELECT COUNT(*) AS population FROM population WHERE joueurpop= ?');
$compterpop->execute(array($_SESSION['id']));
$population = $compterpop->fetch();
?>
</br>Il y a <?php echo $population[0]; ?> de population au total dans ton empire.</br>

<?php


// Affichage du nombre de citoyens. 
$comptercit = $bdg->prepare('SELECT COUNT(*) AS citoyens FROM population WHERE joueurpop = ? AND typepop = 1');
$comptercit->execute(array($_SESSION['id']));
$citoyens = $comptercit->fetch();
?>

<?php 
  if ($citoyens[0] == 0)
  {
    echo 'Il n\'y a aucun citoyen dans le secteur privé et donc la production de biens va être nulle.';
  }
  if ($citoyens[0] == 1)
  {
    echo 'Il n\'y a qu\'un citoyen travaillant dans le secteur privé pour produire des biens.';
  }
  if ($citoyens[0] > 1)
  {
  echo 'Parmi eux, il y a ' . $citoyens[0] . ' citoyens travaillant dans le secteur privé pour produire des biens divers.';
  }
?>

</br>
Tu as <?php echo $repinfoutilisateur['biens'];?> de biens divers.
<?php
// Affichage de la prod des biens.
$reqprod = $bdg->prepare('SELECT prodbiens , consobiens FROM variationstour WHERE idjoueur= ?');
$reqprod->execute(array($_SESSION['id']));
$prodbiens = $reqprod->fetch();
$reqprod->closeCursor();
?>
Au dernier tour, tu en as produit <?php echo $prodbiens['prodbiens'];?> et consommé <?php echo $prodbiens['consobiens'];?> biens divers.

<!-- Formulaire de conversion des pops -->
<form method="post" action="script/conversionpop.php">
   <p>
        <label for="combien">Convertir </label>
        <input type="number" name="combien" min="1" value="1">
        <select name="popdepart" id="popdepart"> -->
<?php
$reqtypepop = $bdd->query('SELECT idtypepop , nompop , technecessaire FROM typepop ORDER BY idtypepop ASC');

while ($reptypepop = $reqtypepop->fetch())
	{
	echo '<option value="'. $reptypepop['idtypepop'] . '">'. $reptypepop['nompop'] .'</option>'; 
	}
$reqtypepop->closeCursor();
	?>
       </select><label for="poparrivee"> en </label><select name="poparrivee" id="poparrivee">

<?php
$reqtypepop = $bdd->query('SELECT idtypepop , nompop , technecessaire FROM typepop ORDER BY idtypepop DESC');
while ($reptypepop = $reqtypepop->fetch())
	{
	echo '<option value="'. $reptypepop['idtypepop'] . '">'. $reptypepop['nompop'] .'</option>'; 
	}
$reqtypepop->closeCursor();
?>
       </select>
        <input type="submit" value="Valider" />
   </p>
</form> 
<?php

// Permet de visualiser les ordres de conversion de pop en cours. 
// $reqpoptransf = $bdd->prepare('SELECT p.typepop , typepoparrivee, idpop FROM population p INNER JOIN typepop t ON t.idtypepop = t.typepop WHERE joueurpop= ? AND NOT typepoparrivee = 0');

$reqpoptransf = $bdg->prepare('SELECT typepop , typepoparrivee, idpop FROM population WHERE joueurpop= ? AND NOT typepoparrivee = 0');
$reqnompop = $bdd->prepare('SELECT nompop from typepop WHERE idtypepop = ?');

$reqpoptransf->execute(array($_SESSION['id']));
while ($reppoptransf = $reqpoptransf->fetch())
  {  ?>
  <form method="post" action="script/supprimerconversion.php">
  <input type="hidden" name="idpop" value="<?php echo $reppoptransf['idpop'] ;?>">
  <?php
  $reqnompop->execute(array($reppoptransf['typepop']));
  $nompopdepart = $reqnompop->fetch();
  $reqnompop->execute(array($reppoptransf['typepoparrivee']));
  $nompoparrivee = $reqnompop->fetch();
  echo 'Vous êtes en train de transformer un ' . $nompopdepart['nompop'] . ' en ' . $nompoparrivee['nompop'] ; ?>
  <input type="submit" value="Annuler" />
  </form></br><?php
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
      break;
      case 9:
          echo "Notre univers est vide de vie avancée en dehors de cette épave. Nous ne sommes pas en mesure d'expliquer comment cette chose à pu arriver là. Nous allons devoir l'étudier et pour cela, nous devons détruire ses défenses automatiques.</br>";
          echo "Envoyez deux vaisesaux lourdement équipés attaquer cette épave. Nous allons pouvoir l'étudier par la suite.</br>";
      break;
      case 10:
          echo "Récoltez ce que vous pouvez sur les restes de l'épave. Ramenez le tout sur la planète et étudions ce qui peut encore l'être.";
      break;
      case 11:
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