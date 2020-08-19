<?php 
session_start(); 
include("../../include/BDDconnection.php"); 
include("../../function/consommercreeritemsplanetemultiple.php"); 

/*
echo $_SESSION['id'] . ' = ID du joueur.</br>' ; 
echo $_POST['idplanete'] . ' = ID de la planète</br>'; 
echo $_POST['idbatiment'] . ' = ID de litem du batiment à détruire</br>'; 
*/

$message = 79 ; // Annulation destruction.
$reqannulerdestruction = $bdg->prepare('DELETE FROM destruction WHERE idplanetedestruction = ?');
$reqannulerdestruction->execute(array($_POST['idplanete']));

if ($_POST['idbatiment'] > 0)
	{	
	$message = 78 ; // Destruction lancée.
	$reqinsertdestruction = $bdg->prepare('INSERT INTO destruction (idplanetedestruction, idbatimentdestruction) VALUES (?,?)');
	$reqinsertdestruction->execute(array($_POST['idplanete'], $_POST['idbatiment']));
	}


header("location: ../00_planete.php?message=".urlencode($message)."&id=".urlencode($_POST['idplanete']));
?>