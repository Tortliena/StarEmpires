<?php
/*
session_start();
include("../include/BDDconnection.php");
include("../function/structurevaisseau.php");
*/

$reqvaisseau = $bdg->prepare('SELECT idvaisseau FROM vaisseau WHERE idflottevaisseau = ?');
$reqMAJflotte = $bdg->prepare('UPDATE flotte SET structuretotale = ? WHERE idflotte = ?');


$reqflotte = $bdg->query("SELECT idflotte FROM flotte");
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