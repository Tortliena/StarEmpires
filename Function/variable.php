<?php 
// exemple d'utilisation : $pourcentstockage = variable(1);
// $pourcentstockage[0] = valeur de la variable 1
function variable($idvariable) 
  {
  $path = $_SERVER['DOCUMENT_ROOT'];
  $path .= '/include/bddconnection.php';
  include($path); 
  $reqvariable = $bd->prepare("SELECT valeur FROM a_variable WHERE idvariable  = ?"); 
  $reqvariable->execute(array($idvariable)); 
  $repvariable = $reqvariable->fetch();

  $valeur = $repvariable['valeur']; 
  return $valeur;
  } 
?>