<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqplanete = $bdg->prepare('SELECT biens, idjoueurplanete FROM planete WHERE idplanete = ?');
$miseajourdesressources = $bdg->prepare("UPDATE planete SET biens = ? WHERE idplanete = ?");
$miseajourpop = $bdg->prepare("UPDATE population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess, numspemessage) VALUES (?, ?, ?, ?)") ;

$reqselectpop = $bdd->query('SELECT p.idplanetepop, t.prixchangementpop, p.typepoparrivee, p.idpop, p.typepop
FROM gamer.population p INNER JOIN typepop t ON t.idtypepop = p.typepoparrivee WHERE NOT typepoparrivee = 0');
while ($repselectpop = $reqselectpop->fetch())
  {
  $reqplanete->execute(array($repselectpop['idplanetepop']));
  $repplanete = $reqplanete->fetch();
  if ($repplanete['biens'] >= $repselectpop['prixchangementpop'])
    { // Si on a assez de ressources, on paye et la pop devient inactive.
    $biens = $repplanete['biens'] - $repselectpop['prixchangementpop'] ; 
    $miseajourdesressources ->execute(array($biens, $repselectpop['idplanetepop']));
    $miseajourpop ->execute(array(0, $repselectpop['typepoparrivee'], $repselectpop['idpop']));
    }
  else
    { // Sinon l'ordre est annulé.
    $miseajourpop ->execute(array($repselectpop['typepop'], 0, $repselectpop['idpop']));
    $message ->execute(array($repplanete['idjoueurplanete'], 'Conversion de pop ratée faute de biens', 'planete', $repselectpop['idplanetepop'])) ;
    }
  }
?>