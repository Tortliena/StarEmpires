<?php 
session_start(); 
include("../../include/bddconnection.php"); 
include("../../function/consommercreeritemsplanetemultiple.php"); 
include("includesecuriteplanete.php");

/*
echo $_SESSION['id'] . ' = ID du joueur.</br>' ; 
echo $_POST['idplanete'] . ' = ID de la planète</br>'; 
echo $_POST['idbatiment'] . ' = ID de litem du batiment à détruire</br>'; 
*/

$message = 79 ; // Annulation destruction.
$reqannulerdestruction = $bd->prepare('DELETE FROM c_destruction WHERE idplanetedestruction = ?');
$reqannulerdestruction->execute(array($_POST['idplanete']));

if ($_POST['idbatiment'] > 0)
	{	
	$message = 78 ; // Destruction lancée.
	$reqinsertdestruction = $bd->prepare('INSERT INTO c_destruction (idplanetedestruction, idbatimentdestruction) VALUES (?,?)');
	$reqinsertdestruction->execute(array($_POST['idplanete'], $_POST['idbatiment']));
	}

header("location: ../planete.php?message=".urlencode($message)."&id=".urlencode($_POST['idplanete']));
?>