<?php 
session_start();
require __DIR__ . '/../../include/bddconnection.php';
require __DIR__ . '/includescriptadmin.php';

if (!isset($_GET['confirmer']))
    {
	header('Location: ../administration.php?message=42');
	exit(); 
    }
else
	{
	$reqnomtable = $bd->query("SELECT TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_SCHEMA = 'kaien_starsempire' AND TABLE_NAME LIKE 'c%'");
	while ($repnomtable  = $reqnomtable ->fetch())
		{
		$reqtruncateautre = $bd->prepare('TRUNCATE TABLE '.$repnomtable['TABLE_NAME'].'');
		$reqtruncateautre->execute(array());
		}
	}

// Suppression des variables de session et de la session
$_SESSION = array();
session_destroy();

// Suppression des cookies de connexion automatique
setcookie("id", 0, time(), "/"); 
setcookie("pass", 0, time(), "/");

header('Location: ../../tour/gestionglobale.php?mdp=lrsngrlsntjls');
?>