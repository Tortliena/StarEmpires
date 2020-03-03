<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqselectpop = $bdd->prepare('SELECT p.idplanetepop, t.prixchangementpop FROM gamer.population p INNER JOIN typepop t ON t.idtypepop = p.typepoparrivee WHERE NOT typepoparrivee = ?');

$reqressources = $bdg->prepare("SELECT biens FROM planete WHERE idplanete = ?");
$miseajourdesressources = $bdg->prepare("UPDATE utilisateurs SET biens = ? WHERE id = ?");
$miseajourpop = $bdg->prepare("UPDATE population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES (? , ?, ?)") ;

$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
  {
  $reqressources->execute(array($repselectpop['idplanetepop']));
  $repressources = $reqressources->fetch(); 
  
  if ($repressources['biens'] >= $reptypepop['prixchangementpop'])
      { // Si on a assez de ressources, on paye et la pop devient inactive.
      $biens = $repressources['biens'] - $reptypepop['prixchangementpop'] ; 
      $miseajourdesressources ->execute(array($biens,  $repselectpop['joueurpop']));
      $miseajourpop ->execute(array(0, $repselectpop['typepoparrivee'], $repselectpop['idpop']));
      }
  else
      { // Sinon l'ordre est annulé.
      $miseajourpop ->execute(array($repselectpop['typepop'], 0, $repselectpop['idpop']));
      $message ->execute(array($repselectpop['joueurpop']  , 'Conversion de pop raté faute de biens' , 'planete')) ;
      }
  }
?>