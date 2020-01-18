<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

$reqselectpop = $bdd->prepare('SELECT typepoparrivee, idpop FROM population WHERE typepop = ?');
$miseajourpop = $bdd->prepare("UPDATE population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");


$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
  {
  $miseajourpop ->execute(array($repselectpop['typepoparrivee'], 0, $repselectpop['idpop']));
  }
?>
