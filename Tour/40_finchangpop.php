<?php
/*
session_start();
include("../script/bddconnection.php");
*/

$miseajourpop = $bd->prepare("UPDATE c_population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");

if ($tourrestraint == 'non')
    {
    $reqselectpop = $bd->prepare('SELECT typepoparrivee, idpop FROM c_population WHERE typepop = ?');
    }
else
    {
    $reqselectpop = $bd->prepare('SELECT typepoparrivee, idpop FROM c_population WHERE typepop = ? AND idplanetepop IN ('.$idplanetes.')');
    }
$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
  {
  $miseajourpop ->execute(array($repselectpop['typepoparrivee'], 0, $repselectpop['idpop']));
  }
?>