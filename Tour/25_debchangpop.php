<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$reqplanete = $bd->prepare('SELECT biens, idjoueurplanete FROM c_planete WHERE idplanete = ?');
$miseajourdesressources = $bd->prepare("UPDATE c_planete SET biens = ? WHERE idplanete = ?");
$miseajourpop = $bd->prepare("UPDATE c_population SET typepop = ?, typepoparrivee = ? WHERE idpop = ?");
$message = $bd->prepare("INSERT INTO c_messagetour (idjoumess , message , domainemess, numspemessage) VALUES (?, ?, ?, ?)") ;

$reqselectpop = $bd->query('  SELECT p.idplanetepop, t.prixchangementpop, p.typepoparrivee, p.idpop, p.typepop
                              FROM c_population p INNER JOIN a_typepop t ON t.idtypepop = p.typepoparrivee
                              WHERE NOT typepoparrivee = 0');
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