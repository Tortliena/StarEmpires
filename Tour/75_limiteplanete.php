<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$reqmajlimite = $bd->prepare('UPDATE c_limiteplanete SET popmax = ?, ouvriermax = ?, scientmax = ?, soldatmax = ?, maxmegalopole = ? , maxbaselunaire = ?, maxflotte = ? WHERE idlimiteplanete = ?');

$reqcompterbatiment = $bd->prepare('SELECT sum(case when typebat = 1 then 1 else 0 end) AS centrederecherche,
                                            sum(case when typebat = 2 then 1 else 0 end) AS chantier,
                                            sum(case when typebat = 3 then 1 else 0 end) AS megalopole,
                                            sum(case when typebat = 4 then 1 else 0 end) AS baselunaire,
                                            sum(case when typebat = 38 then 1 else 0 end) AS basemilitaire,
                                            sum(case when typebat = 33 then 1 else 0 end) AS HQ
                                    FROM c_batiment WHERE idplanetebat = ?');

// Gerer les planetes une par une. Compter batiments. Taille planete. Compter pop.
$reqinfoplanete = $bd->query('  SELECT pl.idplanete, pl.taille, pl.lune, pl.environnement, COUNT(p.idpop) AS population
                                FROM c_planete AS pl INNER JOIN c_population AS p ON p.idplanetepop = pl.idplanete
                                GROUP BY p.idplanetepop');
while ($repinfoplanete = $reqinfoplanete->fetch())
    { // Attention, si pas de pop, alors pas de calcul ici ! ! ! 
    $reqcompterbatiment->execute(array($repinfoplanete['idplanete']));
    $repcompterbatiment = $reqcompterbatiment->fetch();

    $maxpop = max(2, $repinfoplanete['taille'] + $repcompterbatiment['megalopole'] + $repcompterbatiment['baselunaire'] + floor($repinfoplanete['environnement']/1000));

    $maxouvriers = max (1, $repcompterbatiment['chantier']*5);

    $maxscientifiques = max (1, $repcompterbatiment['centrederecherche']*5);

    $maxsoldats = max (1, $repcompterbatiment['basemilitaire']*5); // Développer cette formule plus tard ?
    
    $maxmegalopole = floor($repinfoplanete['population']/4);
    
    $maxbaselunaire = $repinfoplanete['lune'];

    $maxflotte = 1 + $repcompterbatiment['HQ'];
    
    $reqmajlimite->execute(array($maxpop, $maxouvriers, $maxscientifiques, $maxsoldats, $maxmegalopole, $maxbaselunaire, $maxflotte, $repinfoplanete['idplanete']));
    }
?>