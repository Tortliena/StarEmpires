<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$creationvariationdutour = $bdg->prepare('INSERT INTO variationstour (idplanetevariation, prodbiens, chantier, recherche, consobiens) VALUES (?, ?, ?, ?, ?)');

// Gerer les planetes une par une.
$reqcompterpop = $bdg->prepare('SELECT  po.idplanetepop,
                                        COUNT(*) AS population,
                                        sum(case when po.typepop = 1 then 1 else 0 end) AS citoyens,
                                        sum(case when po.typepop = 2 then 1 else 0 end) AS ouvriers,
                                        sum(case when po.typepop = 3 then 1 else 0 end) AS scientifiques
                                        FROM population AS po
                                        INNER JOIN planete AS pl ON po.idplanetepop = pl.idplanete
                                        GROUP BY po.idplanetepop');
while ($repcompterpop = $reqcompterpop->fetch())
	{
	// Production des citoyens :
	$prodbiens = $repcompterpop['citoyens'] * 5;

	// Production des ouvriers :
	$prodchantier = $repcompterpop['ouvriers'] * 20;

	// Production de recherche :
    $prodrecherche = $repcompterpop['scientifiques'] * 1;
   
	// consommation de la population :
	$consommation = $repcompterpop['population'] * 1  ;

	$creationvariationdutour->execute(array($repcompterpop['idplanetepop'], $prodbiens, $prodchantier, $prodrecherche, $consommation));
	}
?>