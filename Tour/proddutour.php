<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$creationvariationdutour = $bdg->prepare('INSERT INTO variationstour (idplanetevariation, prodbiens, chantier, recherche, consobiens) VALUES (?, ?, ?, ?, ?)');

// Gerer les planetes une par une.
$reqcompterpop = $bdg->query('SELECT  	po.idplanetepop,
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

$reqinsertrecherhche = $bdg->prepare('UPDATE utilisateurs SET recherche = ? WHERE id = ?');
$reqrecherche = $bdg->query('SELECT	sum(recherche) AS recherche, p.idjoueurplanete FROM variationstour AS v INNER JOIN planete AS p ON v.idplanetevariation = p.idplanete GROUP BY idjoueurplanete');
while ($reprecherche = $reqrecherche->fetch())
	{
	$reqinsertrecherhche->execute(array($reprecherche['recherche'], $reprecherche['idjoueurplanete']));
	}
?>