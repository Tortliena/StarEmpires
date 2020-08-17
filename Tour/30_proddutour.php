<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$creationvariationdutour = $bdg->prepare('INSERT INTO variationstour (idplanetevariation, prodbiens, chantier, recherche, consobiens, entretien) VALUES (?, ?, ?, ?, ?, ?)');

$reqentretienbatiment = $bdg->prepare('SELECT sum(i.entretien) AS entretien
                                        FROM batiment AS b
                                        INNER JOIN datawebsite.items AS i ON i.iditem = b.typebat
                                        WHERE b.idplanetebat = ?');

// Gerer les planetes une par une au niveau de la pop/efficacité : 
$reqcompterpop = $bdg->query('SELECT    po.idplanetepop,
                                        pl.efficacite,
                                        COUNT(*) AS population,
                                        sum(case when po.typepop = 1 then 1 else 0 end) AS citoyens,
                                        sum(case when po.typepop = 2 then 1 else 0 end) AS ouvriers,
                                        sum(case when po.typepop = 3 then 1 else 0 end) AS scientifiques
                                        FROM population AS po
                                        INNER JOIN planete AS pl ON po.idplanetepop = pl.idplanete
                                        GROUP BY po.idplanetepop');

$proddesouvriers = variable(8);

while ($repcompterpop = $reqcompterpop->fetch())
    {
    $efficite = Min(100, $repcompterpop['efficacite']);

    // Production des citoyens :
    $prodbiens = floor($repcompterpop['citoyens'] * $proddesouvriers[0] * $efficite /100);

    // Production des ouvriers :
    $prodchantier = floor($repcompterpop['ouvriers'] * 20 * $efficite /100);

    // Production de recherche :
    $prodrecherche = floor($repcompterpop['scientifiques'] * 100 * $efficite /100);
   
    // consommation de la population :
    $consommation = $repcompterpop['population'] * 1;

    $entretien = 0;
    $reqentretienbatiment->execute(array($repcompterpop['idplanetepop']));
    $repentretienbatiment = $reqentretienbatiment->fetch();
    $entretien = $entretien + $repentretienbatiment['entretien'];

    $creationvariationdutour->execute(array($repcompterpop['idplanetepop'], $prodbiens, $prodchantier, $prodrecherche, $consommation, $entretien));
    }

$reqinsertrecherhche = $bdg->prepare('UPDATE utilisateurs SET recherche = ? WHERE id = ?');
$reqrecherche = $bdg->query('SELECT sum(v.recherche) AS recherche, p.idjoueurplanete FROM variationstour AS v INNER JOIN planete AS p ON v.idplanetevariation = p.idplanete INNER JOIN utilisateurs AS u ON u.id = p.idjoueurplanete WHERE u.lvl <> 0 GROUP BY idjoueurplanete');
while ($reprecherche = $reqrecherche->fetch())
    {
    $reqinsertrecherhche->execute(array($reprecherche['recherche'], $reprecherche['idjoueurplanete']));
    }
?>