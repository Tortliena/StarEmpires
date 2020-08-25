<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$requpenv = $bdg->prepare('UPDATE planete SET stabiliteenvironnement = ? WHERE idplanete = ?');

$reqenvironnement = $bdg->prepare('SELECT idplanete, stabiliteenvironnement, environnement FROM planete');
$reqenvironnement->execute();
while($repenvironnement = $reqenvironnement->fetch())
    {
    $bonus = max(-5, min(5, -$repenvironnement['environnement']/1000)); // Bonus de max +/-5; de +3 avec un environnement dégradé (permet de booster les planètes rasées et ralentir les grosses planètes)
    $variation = 10 + $bonus;
    $nouvellestabilite = min(1000 , $repenvironnement['stabiliteenvironnement'] + $variation);
    $requpenv->execute(array($nouvellestabilite, $repenvironnement['idplanete']));
    }
?>