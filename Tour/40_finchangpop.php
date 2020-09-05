<?php
/*
session_start();
include("../script/bddconnection.php");
*/

$reqselectpop = $bd->prepare('SELECT typepoparrivee, idpop FROM c_population WHERE typepop = ?');
$miseajourpop = $bd->prepare("UPDATE c_population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");

$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
  {
  $miseajourpop ->execute(array($repselectpop['typepoparrivee'], 0, $repselectpop['idpop']));
  }
?>
