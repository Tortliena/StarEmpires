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
include("include/message.php");
$typemessage = 'capitale';
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
    $nombredeplanete = 0;
    $nombredepop = 0;
    $organisationtotale = 0;
    echo '<h3>Stats d\'empire :</h3>'; 
    $reqinfoplanete = $bdg->prepare('SELECT COUNT(*) AS nbpop, organisation, nomplanete
                                            FROM population po 
                                            INNER JOIN planete pl ON pl.idplanete = po.idplanetepop 
                                            WHERE pl.idjoueurplanete = ?
                                            GROUP BY pl.idplanete');
    $reqinfoplanete ->execute(array($_SESSION['id']));                                    
    while ($repinfoplanete  = $reqinfoplanete ->fetch())
      {
      $nombredeplanete++;
      $nombredepop = $nombredepop + $repinfoplanete['nbpop'];
      $organisationplanete = MIN(100, FLOOR($repinfoplanete['organisation']/$repinfoplanete['nbpop']/10));
      $organisationtotale = MIN(1000*$repinfoplanete['nbpop'], $repinfoplanete['organisation']) + $organisationtotale;
      
      if ($nombredeplanete == 1)
        {
        $texteinfobulle = $repinfoplanete['nomplanete'].' : '.$repinfoplanete['nbpop'].' de population. '.$organisationplanete.'% d\'organisation.';
        }
      else
        {
        $texteinfobulle .= '<br>'.$repinfoplanete['nomplanete'].' : '.$repinfoplanete['nbpop'].' de population. '.$organisationplanete.'% d\'organisation.';
        }
      }

    echo 'Votre empire compte '.$nombredepop.' de population réparti sur '.$nombredeplanete.' planètes.</br>';
    
    $organisationmoyenne = FLOOR($organisationtotale/$nombredepop/10);
    echo 'Organisation moyenne de votre empire : '.$organisationmoyenne.'%. ';

    include("Function/infobulle.php");
    infobulle($texteinfobulle, 'infobulle');
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


echo '</br></br><h3>Objectifs :</h3>'; 
$reqtexteniveau = $bdd->prepare('SELECT texteniveau FROM texteniveau WHERE niveau = ?'); 
$reqtexteniveau->execute(array($repinfoutilisateur['lvl'])); 
$reptexteniveau = $reqtexteniveau->fetch();
if (isset($reptexteniveau['texteniveau']))
  {
  echo $reptexteniveau['texteniveau'];
  } 
else
  {
  echo 'Pas d\'objectif prévu pour ce niveau.';
  } 

require __DIR__ . '/include/affichernews.php';

  ?> 
  </div> 
  </body> 
</html>