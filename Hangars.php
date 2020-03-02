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

  $reqvaisseau = $bdg->prepare('SELECT * FROM vaisseau WHERE idvaisseau = ?');
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

include("include/fonctionhangars.php");

$reqcomposantsurlevaisseau = $bdd->prepare("SELECT i.nombatiment FROM gamer.composantvaisseau c
          INNER JOIN items i ON i.iditem = c.iditemcomposant
          WHERE c.idvaisseaucompo = ? AND c.typecomposant = ?");

?>
<form method="post" action="script/renommervaisseau.php">
    <p> 
        <input type="text" name="nouveaunom" id="nouveaunom" placeholder="nouveau nom" size="25" maxlength="80" />
        <input name="idvaisseau" type="hidden" value="<?php echo $_GET['id'] ;?>">
        <input type="submit" value="Renommer" />
    </p>
</form>

<?php

  if ($replvl['lvl']>=3)
    {
    echo '<p>Vitesse du vaisseau : ' . $repvaisseau['vitesse'] . ' parsec/cycle</p>'; 
    }

$a = 0; // Variable permettant de gérer le cas avec un ou plusieurs composants en stock + gére le cas du remplissage des soutes.
$reqverifcargo = $bdg->prepare("SELECT c.quantiteitems , i.nombatiment
                FROM cargovaisseau c
                INNER JOIN datawebsite.items i
                ON i.iditem = c.typeitems
                WHERE idvaisseaucargo = ?") ;
$reqverifcargo ->execute(array($_GET['id']));
while ($repverifcargo  = $reqverifcargo ->fetch())
  {
  if ($a == 0)
    {
    $texteexplication = '<p>Ce vaisseau transporte ';
    }
  else
    { // Permet de gérer les cas avec de multiples items dans les soutes.
    $texteexplication .= ', ';
    }
  // Affiche ce qui est dans le cargo.
  $texteexplication .= $repverifcargo['quantiteitems'].' '.$repverifcargo['nombatiment'] ;

  $a = $a + $repverifcargo['quantiteitems'];
  }
  if ($a != 0)
    {
    $texteexplication .= '. ';
    if  ($repvaisseau['univers'] == $_SESSION['id']
        AND
        (($repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3) // Proche de la planète
        OR
        ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0))) // Au hangars
      { // Formulaire pour décharger le cargo. Ne s'exécute que si on a quelque chose en soute ($a)
      formulaireordredeplacement(2, $_GET['id'], $texteexplication, 0, 0, 0);
      }
    else
      { // Permet de mettre un point à la fin de la phase avec les trucs en soute. 
      echo $texteexplication ;
      }
    echo '</p>'; 
    }

  if ($replvl['lvl']>=3)
    {
    echo '<p>Capacité des soutes : ' . $a . '/' . $repvaisseau['capacitedesoute'] . '. Capacité de minage : ' . $repvaisseau['capaciteminage'] . '</p>';
    }

  if ($replvl['lvl']>=5)
    {
    $PourcentHP = $repvaisseau['HPvaisseau'] / $repvaisseau['HPmaxvaisseau'] * 100 ;
    if ($PourcentHP != 100 AND $repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0 AND $repvaisseau['univers'] == $_SESSION['id'])
    	{ // Permet de réparer le vaisseau.
    	formulaireordredeplacement(7, $_GET['id'], 'PV : ' . number_format($PourcentHP, 0) . '% ', 0, 0, 0);
    	}	
    else
    	{
    	echo '<p>PV : ' . number_format($PourcentHP, 0) . '%'; 
    	}
    
    $reqcomposantsurlevaisseau->execute(array($_GET['id'], 'arme'));
    $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();
    echo '&emsp; Armement : ';
      if (isset($repcomposantsurlevaisseau['nombatiment']))
        {
        echo ucfirst($repcomposantsurlevaisseau['nombatiment']);
        }
      else
        {
        echo 'Vaisseau non armé.';
        }
    echo '</p>';
    }

// requetes pour la carte et/ou les ordres.
$reqdect = $bdg->prepare('SELECT idexplore FROM explore WHERE x = ? AND y = ? AND univers = ? AND idexplorateur = ? LIMIT 1');
$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? LIMIT 1');
$reqasteroide = $bda->prepare('SELECT idasteroide , quantite , typeitemsaste FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');
$reqvaisseaucarte = $bdg->prepare('SELECT idvaisseau FROM vaisseau WHERE x = ? AND y = ? AND univers = ? AND idjoueurbat <> ? LIMIT 1');

// Permet de récupérer les ordres de déplacement en cours.
$ordredeplacementactuel = $bdg->prepare('SELECT * FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$ordredeplacementactuel->execute(array($_GET['id']));
$reponseordredeplacementactuel = $ordredeplacementactuel->fetch();

// Si on a un champs d'astéroide, formulaire pour embarquer les trucs.
$reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
$repasteroide = $reqasteroide->fetch();
if (isset($repasteroide['idasteroide']))
  {
  if ($a < $repvaisseau['capacitedesoute'])
    {
    formulaireordredeplacement(1, $_GET['id'], 0, 0, 0, 0);
    }
  else
    {
    echo '<p>Vous êtes à proximité d\'un champs de débris, mais vous ne pouvez pas miner faute de place dans les soutes</p>'; 
    }
  }

$reqarmesurvaisseau = $bdg->prepare("SELECT COUNT(*) AS nb FROM composantvaisseau WHERE tirrestant > 0 AND idvaisseaucompo = ?");
$reqarmesurvaisseau->execute(array($_GET['id']));
$reparmesurvaisseau = $reqarmesurvaisseau->fetch();

// Détection 
$reqdetectionvaisseauennemi = $bdg->prepare("SELECT idvaisseau, nomvaisseau FROM vaisseau WHERE idjoueurbat <> ? AND univers = ? AND x = ? AND y = ? AND x <> 0");
$reqdetectionvaisseauennemi->execute(array($_SESSION['id'], $repvaisseau['univers'], $repvaisseau['x'], $repvaisseau['y']));
while($repdetectionvaisseauennemi = $reqdetectionvaisseauennemi->fetch())
  {
  if ($reparmesurvaisseau['nb'] > 0)
    {
    formulaireordredeplacement(5, $_GET['id'], 'Vaisseau inconnu détecté : ' . $repdetectionvaisseauennemi['nomvaisseau'] . ' ', $repdetectionvaisseauennemi['idvaisseau'], 0, 0);
    }
  else
    {
    echo '<p>Vaisseau potentiellement hostile à proximité : ' . $repdetectionvaisseauennemi['nomvaisseau'] . '</p>';
    }
  }

$reqdetectionvaisseau = $bdg->prepare("SELECT idvaisseau, nomvaisseau FROM vaisseau WHERE idjoueurbat = ? AND univers = ? AND x = ? AND y = ? AND  idvaisseau <> ? AND x <> 0");
$reqdetectionvaisseau->execute(array($_SESSION['id'], $repvaisseau['univers'], $repvaisseau['x'], $repvaisseau['y'], $repvaisseau['idvaisseau']));
while($repdetectionvaisseau = $reqdetectionvaisseau->fetch())
  {
  echo '<p>Vaisseau ami à proximité : ' . $repdetectionvaisseau['nomvaisseau'] . '</p>';
  }

// Si le vaisseau est au hangars : 
if ($repvaisseau['x'] == 0 AND $repvaisseau['y'] == 0 AND $repvaisseau['univers'] == $_SESSION['id'])
  {

  $reqcomposantsurlevaisseau->execute(array($_GET['id'], 'noyau'));
  $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();
  if (isset($repcomposantsurlevaisseau['nombatiment']))
      {
      formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);
      }

  echo '<h3></br>Votre vaisseau est au hangars.</h3>' ;
  if (isset($reponseordredeplacementactuel['typeordre']))
    {
    annulerordrededeplacement($reponseordredeplacementactuel['typeordre'], $_GET['id'], $reponseordredeplacementactuel['xdestination'], $reponseordredeplacementactuel['ydestination'], $reponseordredeplacementactuel['bloque']);
    }

  // Ordre de sortir du hangars.
  formulaireordredeplacement(4, $_GET['id'], 0, 0, 0, 0);

  // Permet d'afficher cette partie avec le niveau suffisant.
  if ($replvl['lvl']>=6)
    {
    // Afficher ce qui est actuellement sur votre vaisseau. 
    echo '<h2>Composants dans votre vaisseau :</h2>';
    
    composanthangars('moteur', $_SESSION['id'], $_GET['id']);

    composanthangars('soute', $_SESSION['id'], $_GET['id']);

    composanthangars('arme', $_SESSION['id'], $_GET['id']);

    if ($replvl['lvl']>=8)
      {
      // Donner accès à cette partie plus tard dans les niveaux.
      composanthangars('coque', $_SESSION['id'], $_GET['id']);
      }

    if ($replvl['lvl']>=10)
      {
      // Donner accès à cette partie plus tard dans les niveaux.
      composanthangars('noyau', $_SESSION['id'], $_GET['id']);
      }

    echo '<h2>Composants dans les stocks :</h2>';
    $reqsiloitems = $bdd->prepare("
                    SELECT s.quantite, i.description, i.nombatiment
                    FROM gamer.silo s
                    INNER JOIN items i
                    ON i.iditem = s.iditems
                    WHERE s.idjoueursilo = ?
                    AND i.typeitem = 'composant'");
    $reqsiloitems->execute(array($_SESSION['id']));

    $b = 0; // Permet de gérer le cas avec 0 composant en stock
    while($repsiloitems = $reqsiloitems->fetch())
      { 
      if ($repsiloitems['quantite']>0)
        {
        $b++;
        echo $repsiloitems['quantite'] . ' ' . $repsiloitems['nombatiment'] . '</br>';
        } 
      }
    if ($b == 0)
      {
      echo 'Rien en stock' ; 
      }
    } // Fin de la partie sur les modules. 
  } // Fin de la partie dans le hangars.

elseif ($repvaisseau['univers'] == 0)
  {// Si le vaisseau est dans l'hyperespace :
  $jourrestant = $reponseordredeplacementactuel['xdestination']+1;
  echo '<p>Votre vaisseau est en cours de voyage. Reste '.$jourrestant.' jours.</p>';
  }

// Si le vaisseau est de sortie sur la carte :
else
  {
  $reqcomposantsurlevaisseau->execute(array($_GET['id'], 'noyau'));
  $repcomposantsurlevaisseau = $reqcomposantsurlevaisseau->fetch();
  if (isset($repcomposantsurlevaisseau['nombatiment']))
      {
      formulaireordredeplacement(10, $_GET['id'], 'Saut dimensionnel : ', 0, 0, 0);
      }
  
  if ($repvaisseau['univers'] > 0)
    {
    $xymax = 5 ; // valeurs maximales de la carte.
    }
  else
    {
    $xymax = 20 ; // valeurs maximales de la carte.
    }

  // Si le vaisseau se trouve en orbite de la planète mère :
  if ($repvaisseau['x'] == 3 AND $repvaisseau['y'] == 3 AND $repvaisseau['univers'] == $_SESSION['id'])
    {
    // Formulaire pour rentrer en orbite : ordre de type 3.
    formulaireordredeplacement(3, $_GET['id'], 0, 0, 0, 0);
    }

    // Si il y a un ordre de déplacement en cours : 
    if (isset($reponseordredeplacementactuel['typeordre']))
      {
      annulerordrededeplacement($reponseordredeplacementactuel['typeordre'], $_GET['id'], $reponseordredeplacementactuel['xdestination'], $reponseordredeplacementactuel['ydestination'], $reponseordredeplacementactuel['bloque']);
      }

    echo '<p>Votre vaisseau est en balade en ' . $repvaisseau['univers'] . ' , ' . $repvaisseau['x'] . ' , ' . $repvaisseau['y'] . '</p>';

    // Formulaire pour donner un ordre de déplacement.
    if (isset($_GET['x']))
      {
      formulaireordredeplacement(0, $_GET['id'], 0, $_GET['x'], $_GET['y'], $xymax);
      }
    else
      {
      formulaireordredeplacement(0, $_GET['id'], 0, $repvaisseau['x'], $repvaisseau['y'], $xymax);
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
        $reqvaisseaucarte->execute(array($x , $y, $repvaisseau['univers'], $_SESSION['id']));
        $repvaisseaucarte = $reqvaisseaucarte->fetch();
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
          elseif (isset($repvaisseaucarte['idvaisseau']))
            {// Sinon, si la case est occupée par un vaisseau n'appartement pas au joueur, l'afficher.
            echo '<td class = "tdcarte"><a href="hangars.php?id=' . $_GET['id'] . '&amp;x=' . $x . '&amp;y=' . $y . '"><img class = "carte" src="imagecarte/vaisseaumechant.png" alt="vaisseaumechant" /></a></td>' ;
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
  } // acolade pour fermer la partie sur la carte.
?>
  </div>
  </body>
</html>