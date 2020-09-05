<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
*/

$requpdateordre = $bd->prepare('UPDATE c_flotte SET universdestination = ?, xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ?');
$reqflotte = $bd->prepare(' SELECT * FROM c_flotte f
                            INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte
                            WHERE typeordre = ?');
$reqtrouverflottedelaplanete = $bd->prepare('SELECT f.idflotte FROM c_flotte f INNER JOIN planete p ON p.idplanete = f.idplaneteflotte WHERE f.universflotte = ? AND p.universplanete = ? AND f.xflotte = ? AND p.xplanete = ? AND f.yflotte = ? AND p.yplanete = ?');
$reqtrouverflottedefense = $bd->prepare('SELECT f.idflotte FROM c_flotte f INNER JOIN planete p ON p.idplanete = -f.idplaneteflotte WHERE p.universplanete = ? AND p.xplanete = ? AND p.yplanete = ?');
$reqcreerbataille = $bd->prepare('INSERT INTO c_bataille(idflotteoffensive, idflottedefensive) VALUES (?, ?)'); 
 

$reqflotte->execute(array(3)); // Ordre d\'invasion d'une planète.
while ($repflotte = $reqflotte->fetch()) 
    {
    if ($repflotte['bloque'] == 0)
        { // Si bloque 0, alors on vient de donner l'ordre.
        $tempsinvasion = variable(9); 
        $requpdateordre->execute(array(0, $repflotte['xdestination'], $tempsinvasion, 3, 1, $repflotte['idflotte']));
        }

    $reqtrouverflottedelaplanete->execute(array($repflotte['universflotte'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['xflotte'], $repflotte['yflotte'], $repflotte['yflotte']));
    while ($reptrouverflottedelaplanete = $reqtrouverflottedelaplanete->fetch())
        { // Créer bataille avec toutes les flottes du joueur présent sur la case.
        $reqcreerbataille->execute(array($repflotte['idflotte'], $reptrouverflottedelaplanete['idflotte']));
        }

    $reqtrouverflottedefense->execute(array($repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte']));
    while ($reptrouverflottedefense = $reqtrouverflottedefense->fetch())
        { // Créer bataille avec la flotte de défense de la planète. Cette requête ne devrait normalement donner que 0 ou 1 résultat.
        $reqcreerbataille->execute(array($repflotte['idflotte'], $reptrouverflottedefense['idflotte']));
        }
    }
?>