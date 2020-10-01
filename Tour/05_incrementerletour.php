<?php
/* session_start();
include("../script/bddconnection.php");
*/

// Affichage du tour en cours : 
$reqderniertour = $bd->query('SELECT fintour FROM c_tour ORDER BY id DESC LIMIT 1');
$repderniertour = $reqderniertour->fetch();

if (isset($repderniertour['fintour']) AND $repderniertour['fintour'] == 0)
  {
  header('Location: /administration/administration.php?message=84');
  exit();
  }

$bd->exec("INSERT INTO c_tour() VALUES()");
?>