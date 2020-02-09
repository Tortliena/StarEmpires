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
echo '</br></br>Population max : 8 + ' . $repcomptermegalopole['nb'] . '/' . $repinfolimites['maxmegalopole'] . ' mégalopole + ' . $repcompterbaselunaire['nb'] . '/' . $repinfolimites['maxbaselunaire'] . ' base lunaire = '. $total . ' max';

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
          echo "Former un chercheur et un ouvrier.";
          echo "Vous pouvez passer des tours en allant dans 'gestion du tour' puis 'passer le tour'.</br>";
          echo "Pour former des population, vous pouvez utiliser cette page.</br>";
      break;
      case 1:
          echo "Finir la recherche sur les moteurs.</br>";
          echo "Facultatif : Vous aurez accès à d'autres recherches après celle-ci. Vous pourrez choisir celle qui vous intéresse.";
      break;
      case 2:
          echo "Construire un vaisseau spatial et le sortir.</br>";
          echo "Construction : Page chantier.</br>";
          echo "Facultatif : Vous pouvez former un second ouvrier pour accélérer la construction.</br>";
          echo "Pour diriger le vaisseau, aller sur la page dédiée qui devrait apparaitre après sa construction.</br>";
      break;
      case 3:
          echo "Explorer les environs et trouver quelque chose d'intéressant.</br>";
          echo "Pour se déplacer : Vous pouvez cliquer sur la carte puis valider l'ordre.</br>";
          echo "Facultatif : Avec deux vaisseaux, cela ira plus vite.</br>";
      break;
      case 4:
          echo "Vous venez de trouver quelques astéroides et une planète. Cela va assurer à votre peuple une prospérité à court-moyen terme.</br>";
          echo "Envoyer un ou plusieurs vaisseaux miner les astéroides aux alentours et ramener la cargaison sur votre planète.</br>";
          echo "Déplacer un vaisseau sur un champs d'astéroides, et vous aurez une option pour miner. Ramener le vaisseau avec sa cargaison sur votre planète et vous aurez une option pour déposer votre butin.</br>";
      break;
      case 5:
          echo "Continuer de miner, trouvez des ressources rares, lancer la recherche sur les bases lunaires et en produire une. Vous allez avoir besoin de recycler les débris (option de construction de la page chantier)</br>";
          echo "Facultatif : Vous devriez avoir fini les recherches sur les centres de recherche et les chantiers. Vous pouvez en constuire un de chaque pour augmenter votre limite d'ouvriers ou de chercheurs.</br>";
          echo "Facultatif 2 : Former plus de chercheurs. La recherche des bases lunaires est assez lourde.</br>";
      break;
      case 6:
          echo "Faire une recherche sur des équipements de vaisseau et installer un composant sur l'un de vos vaisseaux.";
      break;
      case 7:
          echo "Continuez d'explorer pour trouver quelque chose d'intéressant.";
      break;
      default:
          echo "Vous etes arrivé au bout du jeu ! Bonne chance !"; 
      break; 

      }
  ?>
  </div>
  </body>
</html>