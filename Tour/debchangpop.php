<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqselectpop = $bdd->prepare('
	SELECT p.idplanetepop, t.prixchangementpop, pl.biens
	FROM gamer.population p
	INNER JOIN typepop t ON t.idtypepop = p.typepoparrivee
	INNER JOIN gamer.planete pl ON p.idplanetepop = pl.idplanete
	WHERE NOT typepoparrivee = ?');

$miseajourdesressources = $bdg->prepare("UPDATE planete SET biens = ? WHERE idplanete = ?");
$miseajourpop = $bdg->prepare("UPDATE population SET typepop = ? , typepoparrivee = ? WHERE idpop = ?");
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess, numspemessage) VALUES (?, ?, ?, ?)") ;

$reqselectpop->execute(array(0));
while ($repselectpop = $reqselectpop->fetch())
	{
	if ($repselectpop['biens'] >= $repselectpop['prixchangementpop'])
		{ // Si on a assez de ressources, on paye et la pop devient inactive.
		$biens = $repselectpop['biens'] - $repselectpop['prixchangementpop'] ; 
		$miseajourdesressources ->execute(array($biens, $repselectpop['idplanetepop']));
		$miseajourpop ->execute(array(0, $repselectpop['typepoparrivee'], $repselectpop['idpop']));
		}
	else
		{ // Sinon l'ordre est annulé.
		$miseajourpop ->execute(array($repselectpop['typepop'], 0, $repselectpop['idpop']));
		$message ->execute(array($repselectpop['idplanetepop'], 'Conversion de pop raté faute de biens', 'planete', $repselectpop['idplanetepop'])) ;
		}
	}
?>