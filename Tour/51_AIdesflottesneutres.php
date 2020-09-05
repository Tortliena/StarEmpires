<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
*/

$requpdateordre = $bd->prepare('UPDATE c_flotte SET universdestination = ?, xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ?');
$reqflotteneutre = $bd->prepare('SELECT * FROM c_flotte WHERE idplaneteflotte = 0 AND universflotte < 0');
$reqflottepresentesurplace = $bd->prepare('SELECT f.idflotte FROM c_flotte f INNER JOIN c_vaisseau v ON v.idflottevaisseau = f.idflotte WHERE f.universflotte = ? AND f.xflotte = ? AND f.yflotte = ? AND f.idplaneteflotte > 0 ORDER BY RAND() LIMIT 1');

// Gestion bataille :
$reqcreerbataille = $bd->prepare('INSERT INTO c_bataille (idflotteoffensive, idflottedefensive) VALUES (?, ?)');
$reqsupprimerbataille = $bd->prepare('DELETE FROM c_bataille WHERE idflotteoffensive = ?');

// Trouver un astéroide à moins de 8 parsecs de distance.
$reqtrouverasteroide = $bd->prepare('  SELECT xaste, yaste FROM c_champsasteroides   
                                        WHERE xaste BETWEEN ? + 8 AND ? - 8 AND yaste BETWEEN ? + 8 AND ? - 8 AND uniaste = ?
                                        ORDER BY RAND() LIMIT 1');

// Gérer toutes les flottes sans planète et dans les univers communs
$reqflotteneutre->execute(array());
while ($repflotteneutre = $reqflotteneutre->fetch()) 
    {
    // Deleter la bataille en cours.
    $reqsupprimerbataille->execute(array($repflotteneutre['idflotte']));

    $reqflottepresentesurplace->execute(array($repflotteneutre['universflotte'], $repflotteneutre['xflotte'], $repflotteneutre['yflotte']));
    $repflottepresentesurplace = $reqflottepresentesurplace->fetch();
    // Si une flotte est sur le parsec, l'attaquer et supprimer l'ordre de déplacement en cours.
    if (isset($repflottepresentesurplace['idflotte']))
        {
        $reqcreerbataille->execute(array($repflotteneutre['idflotte'], $repflottepresentesurplace['idflotte']));
        $requpdateordre->execute(array(0, 0, 0, 5, 0, $repflotteneutre['idflotte']));
        }
    elseif ($repflotteneutre['typeordre'] == 6) // 6 = déplacement normal
        { // Sinon, regarder si la flotte a actuellement un ordre et ne pas y toucher si c'est le cas.
        }
    else // Pas défaut, aller au hasard, sinon, aller voir un astéroide. Le but est de créer des conflits avec les joueurs.
        {
        $xdestination = RAND(0, 20);
        $ydestination = RAND(0, 20);
        $reqtrouverasteroide->execute(array($repflotteneutre['xflotte'], $repflotteneutre['xflotte'], $repflotteneutre['xflotte'], $repflotteneutre['xflotte'], $repflotteneutre['universflotte']));
        $reptrouverasteroide = $reqtrouverasteroide->fetch();
        if(isset($reptrouverasteroide['xaste']))
            {
            $xdestination = $reptrouverasteroide['xaste'];
            $ydestination = $reptrouverasteroide['yaste'];
            }
        $requpdateordre->execute(array($repflotteneutre['universflotte'], $xdestination, $ydestination, 6, 0, $repflotteneutre['idflotte']));
        }
    }
?>