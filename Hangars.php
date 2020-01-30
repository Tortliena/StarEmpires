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
    <?php include("include/menu.php"); 

  $reqvaisseau = $bdg->prepare('SELECT idjoueurbat, nomvaisseau, x, y, univers, vitesse FROM vaisseau WHERE idvaisseau = ?');
  $reqvaisseau->execute(array($_GET['id']));
  $repvaisseau = $reqvaisseau->fetch();
  
  if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    { header('Location: Accueil.php'); exit(); }
  ?>

  <div class="corps">
    <h1>Hangars : <?php echo $repvaisseau['nomvaisseau'] ;?></h1>

<?php
include("include/message.php");
$typemessage = 'vaisseau' ;
include("include/resume.php");
?>

<form method="post" action="script/renommervaisseau.php">
    <p> 
        <input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />
        <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
        <input type="submit" value="Renommer" />
    </p>
</form>

<?php
echo 'Vitesse du vaisseau : ' . $repvaisseau['vitesse'] . ' parsec/cycle</br>'; 


// requetes pour la carte et/ou les ordres.
$reqdect = $bdg->prepare('SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? LIMIT 1');
$reqplanete = $bda->prepare('SELECT idplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? LIMIT 1');
$reqasteroide = $bda->prepare('SELECT idasteroide , quantite , typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');

// Permet de récupérer les ordres de déplacement en cours.
$ordredeplacementactuel = $bdg->prepare('SELECT xdestination , ydestination , typeordre FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$ordredeplacementactuel->execute(array($_GET['id']));
$reponseordredeplacementactuel = $ordredeplacementactuel->fetch();

// Si le vaisseau est au hangars : 
if ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0 AND $repvaisseau['univers'] == $_SESSION['id'])
  {
  echo 'Votre vaisseau est au hangars.' ;
  
  // Si il y a un ordre de sortie du hangars : 
  if ($reponseordredeplacementactuel['typeordre'] == 4)
    {
    ?>
    <form method="post" action="script/annulerdeplacementvaisseau.php">
      <p>
      Vous avez ordonné à votre vaisseau de sortir.
      <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
      <input name="univers" type="hidden" value="<?php echo $repvaisseau['univers'] ;?>">
      <input type="submit" value="supprimer l'ordre"/>
    </p>
    </form>
    <?php
    }

  elseif ($reponseordredeplacementactuel['typeordre'] == 2)
    { // Si l'ordre est de décharger la cargaison
    ?>
    <form method="post" action="script/annulerdeplacementvaisseau.php">
      <p>
      Vous avez ordonné à votre vaisseau de décharger sa cargainson.
      <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
      <input name="univers" type="hidden" value="<?php echo $repvaisseau['univers'] ;?>">
      <input type="submit" value="supprimer l'ordre"/>
    </p>
    </form>
    <?php
    }

  elseif ($reponseordredeplacementactuel['typeordre'] == 6)
    { // Si l'ordre est de rénover un vaisseau :
    ?>
    <form method="post" action="script/annulerdeplacementvaisseau.php">
      <p>
      Vous venez juste de débuter la rénovation du vaisseau.
      <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
      <input name="univers" type="hidden" value="<?php echo $repvaisseau['univers'] ;?>">
      <input type="submit" value="supprimer l'ordre"/>
    </p>
    </form>
    <?php
    }

  // Formulaire d'ordres dans le hangars : ?>
  <form method="post" action="script/ordredepuishangars.php">
    <p>Ordre :
    <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
    <select name="ordredepuishangars" id="ordredepuishangars">
    <option value="sortir">Sortir</option>
    <input type="submit" value="Valider" />
    </p>
  </form>
  <?php

  // Permet d'afficher cette partie avec le niveau suffisant.
  $reqlvl = $bdg->prepare('SELECT lvl from utilisateurs WHERE id= ?');
  $reqlvl->execute(array($_SESSION['id']));
  $replvl = $reqlvl->fetch();
  if ($replvl['lvl']>=6)
  {

  // Afficher ce qui est actuellement sur votre vaisseau. 
  echo 'Composants dans votre vaisseau :</br>';
  $reqcomposantsurlevaisseau
      = $bdd->prepare("
      SELECT i.nombatiment
      FROM gamer.composantvaisseau c
      INNER JOIN items i
      ON i.iditem = c.iditemcomposant
      WHERE c.idvaisseaucompo = ?
      AND c.typecomposant = ?
      ");

  echo '</br>Moteur : ';

$a = 0; ?> <!-- Variable permettant de gérer le cas avec 0 choix -->
<form method="post" action="script/ordreconceptionvaisseau.php">
  <p>
    <label for="idcomposant">
    <?php
    $reqcomposantsurlevaisseau->execute(array($_GET['id'], 'moteur'));
    while($repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch())
      {
      echo $repcomposantsurlevaisseau['nombatiment'];
      $composantmoteurexiste = true;
      }
    if ($composantmoteurexiste =! true)
      {
      echo 'Moteur I';
      }
      ?>
  </label>
  <select name="composant" id="idcomposant">

    <?php
    $reqmoteurdanssilo = $bdd->prepare("
                  SELECT s.quantite, i.nombatiment, i.iditem, i.souscategorie
                  FROM gamer.silo s
                  INNER JOIN items i
                  ON i.iditem = s.iditems
                  WHERE s.idjoueursilo = ?
                  AND i.souscategorie = ?");
    $reqmoteurdanssilo ->execute(array($_SESSION['id'], 'moteur'));

  while($repmoteurdanssilo = $reqmoteurdanssilo->fetch())
    { 
    if ($repmoteurdanssilo['quantite']>0)
      {
      ?>
      <option value="<?php echo $repmoteurdanssilo['iditem']; ?>|<?php echo $repmoteurdanssilo['souscategorie']; ?>"><?php echo $repmoteurdanssilo['nombatiment']; ?></option>
      <?php
      $a++;
      } 
    }

    if ($a == 0)
      {
      echo '<option disabled selected>Pas de composant en stock</option>';
      }
    else
      {
      echo '</select>';
      echo '<input name="idvaisseau" type="hidden" value="' . $_GET['id'] . '">';
      echo '<input type="submit" value="échanger" />';
      }
  ?>
   </p>
</form>

<?php
  echo '</br>Composants dans les stocks :</br>';
  $reqSiloItems = $bdd->prepare("
                  SELECT s.quantite, i.description, i.nombatiment
                  FROM gamer.silo s
                  INNER JOIN items i
                  ON i.iditem = s.iditems
                  WHERE s.idjoueursilo = ?
                  AND i.typeitem = 'composant'");
  $reqSiloItems->execute(array($_SESSION['id']));

  while($repSiloItems = $reqSiloItems->fetch())
    { 
    if ($repSiloItems['quantite']>0)
      {
      echo $repSiloItems['quantite'] . ' ' . $repSiloItems['nombatiment'] . '</br>';
      } 
    }
  } // Fin de la partie sur les modules. 
} // Fin de la partie dans le hangars.

// Si le vaisseau est de sortie sur la carte :
else
  {
  $xymax = 5 ; // valeurs maximales de la carte.

    // Si le vaisseau se trouve en orbite de la planète mère :
    if ($repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3 AND $repvaisseau['univers'] == $_SESSION['id'])
      { // Formulaire pour faire rentrer le vaisseau en orbite. ?>
      <form method="post" action="script/ordrerentrerorbite.php"><p>
      <?php echo 'Votre vaisseau se trouve à proximité de votre planète mère (3 - 3).' ; ?>
        <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
        <input type="submit" value="Rentrer en orbite" />
      </p></form>
      <?php 
      }

    // Si il y a un ordre de déplacement en cours : 
    if ($reponseordredeplacementactuel['xdestination'] != NULL)
      { 
      ?><form method="post" action="script/annulerdeplacementvaisseau.php"><p><?php
      if ($reponseordredeplacementactuel['typeordre'] == 3)
        { // Si l'ordre est de rentrer en orbite
        echo 'Vous avez ordonné à votre vaisseau de rentrer en orbite de la planète mère.' ;
        }
      elseif ($reponseordredeplacementactuel['typeordre'] == 1)
        { // Si l'ordre est de miner un champs d'asteroide
        echo 'Vous avez ordonné à votre vaisseau de miner le champs d\'astéroides' ;
        }
      elseif ($reponseordredeplacementactuel['typeordre'] == 2)
        { // Si l'ordre est de décharger la cargaison
        echo 'Vous avez ordonné à votre vaisseau de décharger sa cargainson' ;
        }
      else
        { // Ordre de déplacement classique.
        echo 'Vous avez ordonné à votre vaisseau d\'aller en ' . $reponseordredeplacementactuel['xdestination'] . ' , ' . $reponseordredeplacementactuel['ydestination'] ;
        }
      ?>
      <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
      <input name="univers" type="hidden" value="<?php echo $repvaisseau['univers'] ;?>">
      <input type="submit" value="supprimer l'ordre" />
      </p>
      </form>
      <?php
      }  
    echo 'Votre vaisseau est en balade en ' . $repvaisseau['univers'] . ' , ' . $repvaisseau['x'] . ' , ' . $repvaisseau['y'];

    // Formulaire pour donner un ordre de déplacement.
    ?>
    <form method="post" action="script/ordredeplacementvaisseau.php">
    <p>
        <input type="number" name="xobjectif" value="<?php if (!isset($_GET['x'])){echo $repvaisseau['x'];} else{echo $_GET['x'];} ?>" min="1" max="<?php echo $xymax;?>">
    <input type="number" name="yobjectif" value="<?php if (!isset($_GET['y'])){echo $repvaisseau['y'];} else{echo $_GET['y'];} ?>" min="1" max="<?php echo $xymax;?>">
        <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
        <input name="univers" type="hidden" value="<?php echo $repvaisseau['univers'] ;?>">
        <input name="xdepart" type="hidden" value="<?php echo $repvaisseau['x'] ;?>">
        <input name="ydepart" type="hidden" value="<?php echo $repvaisseau['y'] ;?>">
        <input type="submit" value="déplacer" />
    </p>
    </form>

    <?php
    // Si on a un champs d'astéroide, formulaire pour embarquer les trucs.
    $reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
    $repasteroide = $reqasteroide->fetch();
    if (isset($repasteroide['idasteroide']))
      { 
      ?>
      <form method="post" action="script/ordreminer.php">
      <p>
      Vous êtes face à un champs d'astéroides.
      <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
      <input name="univers" type="hidden" value="<?php echo $repvaisseau['univers'] ;?>">
      <input name="xdepart" type="hidden" value="<?php echo $repvaisseau['x'] ;?>">
      <input name="ydepart" type="hidden" value="<?php echo $repvaisseau['y'] ;?>">       
      <input type="submit" value="Récolter" />
      </p>
      </form>
      <?php
      }

  // Carte spatiale :
    for ($y = 0 ; $y <= $xymax ; $y++)
      {
    for ($x = 0 ; $x <= $xymax ; $x++)
      {
      if ($x == 0 AND $y == 0)
        { // Début du tableau + tout en haut à gauche.
        echo '<table class = "carte"><caption>Univers ' . $repvaisseau['univers'] . '!</caption><tr><td class = "xycarte">x/y</td>' ;
        }
      elseif ($x > 0 AND $x <= $xymax AND $y > 0 AND $y <= $xymax)
        { // interieur du tableau
        $reqplanete->execute(array($x , $y, $repvaisseau['univers']));
        $repplanete = $reqplanete->fetch();
        $reqasteroide->execute(array($x , $y, $repvaisseau['univers']));
        $repasteroide = $reqasteroide->fetch();
        $reqdect->execute(array($x , $y, $repvaisseau['univers'], $_SESSION['id']));
        $repdect = $reqdect->fetch();
          if ($repvaisseau['x'] == $x AND $repvaisseau['y'] == $y) // Si je suis sur mon vaisseau, afficher mon vaisseau.
            {
            echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/monvaisseau.png" alt="monvaisseau" /></a></td>';
            }
          elseif (isset($repplanete['idplanete']))
            { // Sinon, si la case est occupée par une planète, l'afficher.
            echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/planete.png" alt="planete" /></a></td>' ;
            }
          elseif (isset($repasteroide['idasteroide']))
            { // Sinon, si la case est occupée par un champs d'astéroides, l'afficher.
            echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/asteroide.png" alt="asteroide" /></a></td>' ;
            }
           elseif (isset($repdect['idexplore']))
            {
            echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/explore.png" alt="explore" /></a></td>' ;
          }
           else
            {
            echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/inconnu.png" alt="inconnu" /></a></td>' ;
          }   
      }
      elseif ($x == 0 AND $y > 0 AND $y <= $xymax)
        { // Première colonne du tableau (hors haut à gauche)
          echo '<tr><td class = "xycarte">' . $y . '</td>' ;
        } 
      elseif ($x > 0 AND $x <= $xymax AND $y == 0)  
        { // Première ligne du tableau (hors haut à gauche)
          echo '<td class = "xycarte">' . $x . '</td>' ;
        } 
      if ($x == $xymax)
        { // Arrivée à la droite du tableau
        echo '</tr>' ;
        }
      if ($x == $xymax AND $y == $xymax)
        { // fin du tableau
        echo '</table>' ;
        }
      }} // Acolades pour fermer les for de la carte.
  } // acolade pour fermer la partie hors hangars.

$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock.

$reqverifcargo = $bdg->prepare("SELECT c.quantiteitems , i.nombatiment
                FROM cargovaisseau c
                INNER JOIN datawebsite.items i
                ON i.iditem = c.typeitems
                WHERE idvaisseaucargo = ?") ;
$reqverifcargo ->execute(array($_GET['id']));
while ($repverifcargo  = $reqverifcargo ->fetch())
  {
  if ($a != 0)
    { // Permet de gérer les cas avec de multiples items dans les soutes.
    echo ', ';
    }
  else
    { // On passe par cette partie une seule fois.
    echo '<form method="post" action="script/ordredecharger.php"><p>Ce vaisseau transporte ';
    }
  // Affiche ce qui est dans le cargo.
  echo $repverifcargo['quantiteitems'].' '.$repverifcargo['nombatiment'] ;
  $a++;
  

  if 	($repvaisseau['univers'] == $_SESSION['id']
      AND
        (($repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3) // Proche de la planète
        OR
        ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0))) // Au hangars
      { // Formulaire pour décharger le cargo
      ?>.
        <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
        <input type="submit" value="décharger" /> 
        </p>
      </form><?php
      }
  elseif ($a >= 0) 
    {
    echo '.';
    }
  }
?> 
  
  </div>
  </body>
</html>