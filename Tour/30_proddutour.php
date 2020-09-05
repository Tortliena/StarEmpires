<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$creationvariationdutour = $bd->prepare('INSERT INTO c_variationstour(idplanetevariation, prodbiens, chantier, recherche, consobiens, entretien, entretienflotte) VALUES (?, ?, ?, ?, ?, ?, ?)');

$reqentretienbatiment = $bd->prepare('  SELECT sum(i.entretien) AS entretien
                                        FROM c_batiment AS b
                                        INNER JOIN a_items AS i ON i.iditem = b.typebat
                                        WHERE b.idplanetebat = ?');

$reqstructureflotte = $bd->prepare('    SELECT sum(structuretotale) AS structuretotale
                                        FROM c_flotte WHERE idplaneteflotte = ?');
$reqstructureflottedefense = $bd->prepare(' SELECT structuretotale
                                            FROM c_flotte WHERE idplaneteflotte = ?');

// Gerer les planetes une par une au niveau de la pop/efficacité : 
$reqcompterpop = $bd->query('SELECT po.idplanetepop, pl.efficacite, COUNT(*) AS population,
                                    sum(case when po.typepop = 1 then 1 else 0 end) AS citoyens,
                                    sum(case when po.typepop = 2 then 1 else 0 end) AS ouvriers,
                                    sum(case when po.typepop = 3 then 1 else 0 end) AS scientifiques,
                                    sum(case when po.typepop = 4 then 1 else 0 end) AS soldats
                                    FROM c_population AS po
                                    INNER JOIN c_planete AS pl ON po.idplanetepop = pl.idplanete
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

$reqinsertrecherhche = $bd->prepare('UPDATE c_utilisateurs SET recherche = ? WHERE id = ?');
$reqrecherche = $bd->query('    SELECT sum(v.recherche) AS recherche, p.idjoueurplanete FROM c_variationstour AS v 
                                INNER JOIN c_planete AS p ON v.idplanetevariation = p.idplanete
                                INNER JOIN c_utilisateurs AS u ON u.id = p.idjoueurplanete
                                WHERE u.lvl <> 0 GROUP BY idjoueurplanete');
while ($reprecherche = $reqrecherche->fetch())
    {
    $reqinsertrecherhche->execute(array($reprecherche['recherche'], $reprecherche['idjoueurplanete']));
    }
?>