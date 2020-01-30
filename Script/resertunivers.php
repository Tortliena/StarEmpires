<?php 
session_start();
include("../include/BDDconnection.php");

$reqnomtable = $bda->query("SELECT distinct TABLE_SCHEMA, TABLE_NAME from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'autre' OR TABLE_SCHEMA = 'gamer'");
while ($repnomtable  = $reqnomtable ->fetch())
	{
	if ($repnomtable['TABLE_NAME'] != 'afaire')
		{
		if ($repnomtable['TABLE_SCHEMA'] == 'autre')  
			{
			$reqtruncateautre = $bda->prepare('TRUNCATE TABLE '.$repnomtable['TABLE_NAME'].'');
			$reqtruncateautre->execute(array());
			}	
		elseif ($repnomtable['TABLE_SCHEMA'] == 'gamer')
			{
			$reqtruncateautre = $bdg->prepare('TRUNCATE TABLE '.$repnomtable['TABLE_NAME'].'');
			$reqtruncateautre->execute(array());
			}	
		}
	}

// Suppression des variables de session et de la session
$_SESSION = array();
session_destroy();

// Suppression des cookies de connexion automatique
setcookie("id", 0, time(), "/"); 
setcookie("pass", 0, time(), "/");


header('Location: ../acceuil.php');
?>