<?php
/* session_start();
include("../script/BDDconnection.php");
*/

$reqmajlimite = $bdd->prepare('UPDATE limitesjoueurs SET popmax = ?, maxchantier = ?, ouvriermax = ?, maxcentrederecherche = ?, scientmax = ? WHERE id = ?');

$reqcompterbat = $bdd->prepare('SELECT COUNT(idbat) as nb FROM batiments WHERE typebat = ? and idjoueurbat = ?');

$reqjoueur = $bdd->query("SELECT id FROM utilisateurs ORDER BY id");
while ($repjoueur = $reqjoueur->fetch())
    {
    // Calcul du max de pop :
    $reqcompterbat->execute(array(4, $repjoueur['id']));
    $repcompterbaselunaire = $reqcompterbat->fetch();
    $maxpop = 8 + $repcompterbaselunaire['nb'];

    // Calcul du max de chantiers :
    $maxchantiers = 1;

    // Calcul du max d'ouvriers :
    $reqcompterbat->execute(array(2, $repjoueur['id']));
    $repcompterchantier = $reqcompterbat->fetch();
    $maxouvriers = max (2 , $repcompterchantier['nb']*5);

    // Calcul du max de centre de recherche :
    $maxcentrederecherche = 1;

    // Calcul du max de scientifiques
    $reqcompterbat->execute(array(1, $repjoueur['id']));
    $repcomptercdr = $reqcompterbat->fetch();
    $maxscientifiques = max (2 , $repcomptercdr['nb']*5);

    $reqmajlimite->execute(array($maxpop, $maxchantiers, $maxouvriers, $maxcentrederecherche, $maxscientifiques, $repjoueur['id'])); 
    }
?>