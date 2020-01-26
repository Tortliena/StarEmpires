<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

$reqselectpop = $bdg->prepare('SELECT typepoparrivee, idpop FROM population WHERE typepop = ?');
$miseajourpop = $bdg->prepare("UPDATE population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");

$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
  {
  $miseajourpop ->execute(array($repselectpop['typepoparrivee'], 0, $repselectpop['idpop']));
  }
?>
