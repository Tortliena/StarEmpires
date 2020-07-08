<?php 
function variable($idvariable) 
  { 
  include("../include/BDDconnection.php"); 
  $reqvariable = $bdd->prepare("SELECT valeur FROM variable WHERE idvariable  = ?"); 
  $reqvariable->execute(array($idvariable)); 
  $repvariable = $reqvariable->fetch();

  $valeur = $repvariable['valeur']; 
 
  return array($valeur); 
  } 
?>