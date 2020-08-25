<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$creationvariationdutour = $bdg->prepare('INSERT INTO variationstour (idplanetevariation, prodbiens, chantier, recherche, consobiens, entretien, entretienflotte) VALUES (?, ?, ?, ?, ?, ?, ?)');

$reqentretienbatiment = $bdg->prepare('SELECT sum(i.entretien) AS entretien
                                        FROM batiment AS b
                                        INNER JOIN datawebsite.items AS i ON i.iditem = b.typebat
                                        WHERE b.idplanetebat = ?');

$reqstructureflotte = $bdg->prepare('   SELECT sum(structuretotale) AS structuretotale
                                        FROM flotte WHERE idplaneteflotte = ?');
$reqstructureflottedefense = $bdg->prepare('   SELECT structuretotale
                                        FROM flotte WHERE idplaneteflotte = ?');

// Gerer les planetes une par une au niveau de la pop/efficacité : 
$reqcompterpop = $bdg->query('SELECT    po.idplanetepop,
                                        pl.efficacite,
                                        COUNT(*) AS population,
                                        sum(case when po.typepop = 1 then 1 else 0 end) AS citoyens,
                                        sum(case when po.typepop = 2 then 1 else 0 end) AS ouvriers,
                                        sum(case when po.typepop = 3 then 1 else 0 end) AS scientifiques,
                                        sum(case when po.typepop = 4 then 1 else 0 end) AS soldats
                                        FROM population AS po
                                        INNER JOIN planete AS pl ON po.idplanetepop = pl.idplanete
                                        GROUP BY po.idplanetepop');

$proddesouvriers = variable(8);

while ($repcompterpop = $reqcompterpop->fetch())
    {
    $efficite = min(100, $repcompterpop['efficacite']);

    // Production des citoyens :
    $prodbiens = floor($repcompterpop['citoyens'] * $proddesouvriers * $efficite /100);

    // Production des ouvriers :
    $prodchantier = floor($repcompterpop['ouvriers'] * 20 * $efficite /100);

    // Production de recherche :
    $prodrecherche = floor($repcompterpop['scientifiques'] * 100 * $efficite /100);
   
    // Puissance militaire :
    $puissancemilitaire = floor($repcompterpop['soldats'] * 20 * $efficite /100);

    // consommation de la population :
    $consommation = $repcompterpop['population'] * 1;

    $entretien = 0;
    $reqentretienbatiment->execute(array($repcompterpop['idplanetepop']));
    $repentretienbatiment = $reqentretienbatiment->fetch();
    $entretien = $entretien + $repentretienbatiment['entretien'];

    $reqstructureflotte->execute(array($repcompterpop['idplanetepop']));
    $repstructureflotte = $reqstructureflotte->fetch();
    
    $reqstructureflottedefense->execute(array(-$repcompterpop['idplanetepop']));
    $repstructureflottedefense = $reqstructureflottedefense->fetch();

    $endefense = MAX(0, $repstructureflottedefense['structuretotale']-$puissancemilitaire);
    $entretienflotte = MAX(0, $repstructureflotte['structuretotale']+$endefense-2*$puissancemilitaire);

    $creationvariationdutour->execute(array($repcompterpop['idplanetepop'], $prodbiens, $prodchantier, $prodrecherche, $consommation, $entretien, $entretienflotte));
    }

$reqinsertrecherhche = $bdg->prepare('UPDATE utilisateurs SET recherche = ? WHERE id = ?');
$reqrecherche = $bdg->query('SELECT sum(v.recherche) AS recherche, p.idjoueurplanete FROM variationstour AS v INNER JOIN planete AS p ON v.idplanetevariation = p.idplanete INNER JOIN utilisateurs AS u ON u.id = p.idjoueurplanete WHERE u.lvl <> 0 GROUP BY idjoueurplanete');
while ($reprecherche = $reqrecherche->fetch())
    {
    $reqinsertrecherhche->execute(array($reprecherche['recherche'], $reprecherche['idjoueurplanete']));
    }
?>