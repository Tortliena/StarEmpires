<?php
/*
session_start();
include("../include/bddconnection.php");
include("../function/structurevaisseau.php");
*/

$reqvaisseau = $bd->prepare('SELECT idvaisseau FROM c_vaisseau WHERE idflottevaisseau = ?');
$reqMAJflotte = $bd->prepare('UPDATE c_flotte SET structuretotale = ? WHERE idflotte = ?');

if ($tourrestraint == 'non')
    {
    $reqflotte = $bd->query("SELECT idflotte FROM c_flotte");
    }
else
    {
    $reqflotte = $bd->query("SELECT idflotte FROM c_flotte WHERE idflotte IN ('.$idflottes.')");
    }
while($repflotte = $reqflotte->fetch())
  {
  $structureflotte = 0;
  $reqvaisseau->execute(array($repflotte['idflotte']));
  while($repvaisseau = $reqvaisseau->fetch())
    {
    list($structure, $structuremax) = structurevaisseau($repvaisseau['idvaisseau']);
    $structureflotte = $structureflotte + $structure; 
    }
  $reqMAJflotte->execute(array($structureflotte, $repflotte['idflotte']));
  }

?>