<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqmajlimite = $bdg->prepare('UPDATE limiteplanete SET popmax = ?, maxchantier = ?, ouvriermax = ?, maxcentrederecherche = ?, scientmax = ?, maxmegalopole = ? , maxbaselunaire = ? WHERE idlimiteplanete = ?');

$reqcompterbatiment = $bdg->prepare('SELECT sum(case when typebat = 1 then 1 else 0 end) AS centrederecherche,
                                            sum(case when typebat = 2 then 1 else 0 end) AS chantier,
                                            sum(case when typebat = 3 then 1 else 0 end) AS megalopole,
                                            sum(case when typebat = 4 then 1 else 0 end) AS baselunaire
                                    FROM batiment WHERE idplanetebat = ?');

// Gerer les planetes une par une. Compter batiments. Taille planete. Compter pop.
$reqinfoplanete = $bdg->query('SELECT pl.idplanete, pl.taille, pl.lune, COUNT(p.idpop) AS population
                            FROM planete AS pl INNER JOIN population AS p ON p.idplanetepop = pl.idplanete
                            GROUP BY p.idplanetepop');
while ($repinfoplanete = $reqinfoplanete->fetch())
    { // Attention, si pas de pop, alors pas de calcul ici ! ! ! 
    $reqcompterbatiment->execute(array($repinfoplanete['idplanete']));
    $repcompterbatiment = $reqcompterbatiment->fetch();

    $maxpop = $repinfoplanete['taille'] + $repcompterbatiment['megalopole'] + $repcompterbatiment['baselunaire'];

    // Calcul du max de chantiers :
    $maxchantiers = 1;

    // Calcul du max d'ouvriers :
    $maxouvriers = max (1, $repcompterbatiment['chantier']*5);

    // Calcul du max de centre de recherche :
    $maxcentrederecherche = 1;

    // Calcul du max de scientifiques
    $maxscientifiques = max (1, $repcompterbatiment['centrederecherche']*5);
    
    $maxmegalopole = floor($repinfoplanete['population']/4);
    
    $maxbaselunaire = $repinfoplanete['lune'];
    
    $reqmajlimite->execute(array($maxpop, $maxchantiers, $maxouvriers, $maxcentrederecherche, $maxscientifiques, $maxmegalopole, $maxbaselunaire, $repinfoplanete['idplanete']));
    }
?>