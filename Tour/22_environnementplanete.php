<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$requpenv = $bd->prepare('UPDATE c_planete SET stabiliteenvironnement = ?, environnement = ?, restauration = ? WHERE idplanete = ?');

$reqenvironnement = $bd->prepare('SELECT idplanete, stabiliteenvironnement, environnement, restauration FROM c_planete');
$reqenvironnement->execute();
while($repenvironnement = $reqenvironnement->fetch())
    {
    $restauraion = $repenvironnement['restauration'];
    $environnement = $repenvironnement['environnement'];

	// Stabilité va monter de 5 à 15. +15 si la planète est très abimée et + 5 si elle est parfaite.
	$variationstab = 10 + max(-5, min(5, -$repenvironnement['environnement']/500)); 

    if ($repenvironnement['restauration'] > 0)
    	{
    	$restauraion--;
    	$variationstab = $variationstab - 50;
    	$environnement = $environnement + FLOOR(80*$repenvironnement['stabiliteenvironnement']/1000) ;
    	}

    $nouvellestabilite = max(0  , min(1000 , $repenvironnement['stabiliteenvironnement'] + $variationstab));
    $requpenv->execute(array($nouvellestabilite, $environnement, $restauraion, $repenvironnement['idplanete']));
    }
?>