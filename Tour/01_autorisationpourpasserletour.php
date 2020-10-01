<?php
if (!isset($_SESSION['id']) AND !isset($_GET["mdp"]))
  {
  header('Location: ../accueil.php?message=50');
  exit;
  }

if (isset($_SESSION['id']))
  {
  $reqadmin = $bd->prepare('SELECT niveauadmin, lvl FROM c_utilisateurs WHERE id = ?');
  $reqadmin->execute(array($_SESSION['id']));
  $repadmin = $reqadmin->fetch();
  }

$tourrestraint = 'oui';

if (!isset($_GET["mdp"]) AND $repadmin['lvl'] < 10)
  {
  $Commentairestour .= '<br>Tour d\'un noob';
  // Tour venant d'un bas niveau, donc tour partiel.

  // id des planètes de ce joueur :
  $reqplanetedujoueur = $bd->prepare('SELECT idplanete FROM c_planete WHERE idjoueurplanete = ?');
  $reqplanetedujoueur->execute(array($_SESSION['id']));
  while ($repplanetedujoueur = $reqplanetedujoueur->fetch())
    {
    $idplanete[] = $repplanetedujoueur['idplanete'];
    }
  $idplanetes = '';
  if (isset($idplanete[0]))
    {
    $idplanetes = implode(',', $idplanete);
    }

  // id des flottes de ce joueur :
  $reqflottesdujoueur = $bd->query('SELECT idflotte FROM c_flotte WHERE idplaneteflotte IN ('.$idplanetes.')');
  while ($repflottesdujoueur = $reqflottesdujoueur->fetch())
    {
    $idflotte[] = $repflottesdujoueur['idflotte'];
    }
  $idflottes = '';
  if (isset($idflotte[0]))
    {
    $idflottes = implode(',', $idflotte);
    }
  }
elseif ($_GET["mdp"] == 'lrsngrlsntjls')
  { // Si c'est le CRON.
  $Commentairestour .= '<br>Tour automatique';
  $tourrestraint = 'non';
  }
elseif ($repadmin['niveauadmin'] > 0 AND $_GET["mdp"] == 'yguhirtsef')
  { // Si c'est un admin.
  $Commentairestour .= '<br>Tour venant d\'un admin';
  $tourrestraint = 'non';
  }
// Si c'est un bas niveau, alors juste faire une partie.
else
  {
  header('Location: ../accueil.php?message=50');
  exit;
  }
?>