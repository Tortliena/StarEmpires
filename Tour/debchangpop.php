<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

$reqselectpop = $bdd->prepare('SELECT idpop , joueurpop , typepop, typepoparrivee FROM population WHERE NOT typepoparrivee = ?');
$reqressources = $bdd->prepare("SELECT biens FROM utilisateurs WHERE id = ?");
$reqtypepop = $bdd->prepare("SELECT prixchangementpop , technecessaire FROM typepop WHERE idtypepop = ?");
$miseajourdesressources = $bdd->prepare("UPDATE utilisateurs SET biens = ? WHERE id = ?");
$miseajourpop = $bdd->prepare("UPDATE population SET typepop = ? , typepoparrivee = ? WHERE joueurpop = ? AND idpop = ?");
$message = $bdd->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES (? , ?, ?)") ;


$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
  {
  $reqressources->execute(array($repselectpop['joueurpop']));
  $repressources = $reqressources->fetch(); 
  //echo $repressources['biens'] . ' biens du joueur</br>'; 


  $reqtypepop->execute(array($repselectpop['typepoparrivee']));
  $reptypepop = $reqtypepop->fetch(); 
  //echo $reptypepop['prixchangementpop']. ' prix changement </br>'; 

  if ($repressources['biens'] >= $reptypepop['prixchangementpop'])
      {
      $biens = $repressources['biens'] - $reptypepop['prixchangementpop'] ; 
      //echo 'faire le changement ! </br>';
      $miseajourdesressources ->execute(array($biens,  $repselectpop['joueurpop']));
      $miseajourpop ->execute(array(0, $repselectpop['typepoparrivee'], $repselectpop['joueurpop'], $repselectpop['idpop']));
      }
  else
      {
      //echo 'Ne pas faire le changement ! </br>';
      $miseajourpop ->execute(array($repselectpop['typepop'], 0, $repselectpop['joueurpop'], $repselectpop['idpop']));
      $message ->execute(array($repselectpop['joueurpop']  , 'Conversion de pop raté faute de biens' , 'capitale')) ;
      }
  }
?>
