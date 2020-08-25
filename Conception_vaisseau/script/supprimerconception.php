<?php
session_start();
include("../../include/BDDconnection.php");

$idplan = abs($_GET['id']);
/*
echo $_SESSION['id'] . '</br>';
echo $_GET['id'] . '</br>';
echo $idplan . '</br>';
*/
$reqsupcomposant = $bdg->prepare('DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?');
$reqsupplan = $bdg->prepare('DELETE FROM vaisseau WHERE idvaisseau = ?');

$reqinfoplan = $bdg->prepare('SELECT idflottevaisseau FROM vaisseau WHERE idvaisseau = ?');
$reqinfoplan->execute(array($idplan));
$repinfoplan = $reqinfoplan->fetch();

if (!isset($repinfoplan['idflottevaisseau']))
	{ // Plan n'existe pas.
	header('Location: ../00_conception.php?message=66');
	exit();
	}
elseif ($_SESSION['id'] != -$repinfoplan['idflottevaisseau'])
	{ // Cas d'un plan n'appartenant pas au joueur.
	header('Location: ../00_conception.php?message=66');
	exit();
	}
elseif ($_GET['id'] < 0)
	{ // Cas du plan en cours de modification.
	$reqsupcomposant->execute(array($_GET['id']));
	header('Location: ../00_conception.php?message=80&id='.$idplan.'');
	exit();
	}
elseif ($repinfoplan['idflottevaisseau'] > 0)
	{ // Cas d'un vaisseau, pas d'un plan.
	header('Location: ../00_conception.php?message=66');
	exit();
	}
elseif ($_SESSION['id'] == -$repinfoplan['idflottevaisseau'])
	{ // Cas d'un plan appartenant au joueur.
	//Permet de supprimer le plan.
	$reqsupcomposant->execute(array($_GET['id']));
	$reqsupplan->execute(array($_GET['id']));
	header('Location: ../00_conception.php?message=67');
	exit();
	}

// Vérifier qu'il n'y a rien en construction.
header('Location: ../../accueil.php?message=31');
// 31 = erreur non spécifiée.
?>