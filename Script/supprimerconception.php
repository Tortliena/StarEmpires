<?php
session_start();
include("../include/BDDconnection.php");


echo $_SESSION['id'] . '</br>' ;
echo $_GET['id'] . '</br>';



$reqsupcomposant = $bdg->prepare('DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?');
$reqsupplan = $bdg->prepare('DELETE FROM vaisseau WHERE idvaisseau = ?');

$reqinfoplan = $bdg->prepare('SELECT idjoueurvaisseau FROM vaisseau WHERE idvaisseau = ?');
$reqinfoplan->execute(array($_GET['id'])); 
$repinfoplan = $reqinfoplan->fetch(); 


if (!isset($repinfoplan['idjoueurvaisseau']))
	{ // Plan n'existe pas.
	header('Location: ../conception.php?message=66');
	exit();
	}
elseif ($repinfoplan['idjoueurvaisseau'] > 0)
	{ // Cas d'un vaisseau, pas d'un plan.
	header('Location: ../conception.php?message=66');
	exit();
	}
elseif ($_SESSION['id'] != -$repinfoplan['idjoueurvaisseau'])
	{ // Cas d'un plan n'appartenant pas au joueur.
	header('Location: ../conception.php?message=66');
	exit();
	}
elseif ($_SESSION['id'] == -$repinfoplan['idjoueurvaisseau'])
	{ // Cas d'un plan appartenant au joueur.
	//Permet de supprimer le plan.
	$reqsupcomposant->execute(array($_GET['id']));
	$reqsupplan->execute(array($_GET['id']));
	header('Location: ../conception.php?message=67');
	exit();
	}

// Vérifier qu'il n'y a rien en construction.

header('Location: ../accueil.php?message=31');
// 31 = erreur non spécifiée.
?>