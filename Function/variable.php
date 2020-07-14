<?php 
// exemple d'utilisation : $pourcentstockage = variable(1);
// $pourcentstockage[0] = valeur de la variable 1
function variable($idvariable) 
  { 
  include("C:/wamp64/www/Starempires/include/BDDconnection.php"); 
  $reqvariable = $bdd->prepare("SELECT valeur FROM variable WHERE idvariable  = ?"); 
  $reqvariable->execute(array($idvariable)); 
  $repvariable = $reqvariable->fetch();

  $valeur = $repvariable['valeur']; 
 
  return array($valeur); 
  } 
?>