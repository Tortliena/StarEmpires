<?php
session_start();
include("../../include/bddconnection.php");

$idplan = abs($_GET['id']);


echo $_SESSION['id'] . '</br>';
echo $_GET['id'] . '</br>';
echo $idplan . '</br>';

$reqsupcomposant = $bd->prepare('DELETE FROM c_composantvaisseau WHERE idvaisseaucompo = ?');
$reqsupplan = $bd->prepare('DELETE FROM c_vaisseau WHERE idvaisseau = ?');

$reqinfoplan = $bd->prepare('SELECT v.idflottevaisseau, p.idjoueurplanete FROM c_vaisseau v LEFT JOIN c_flotte f ON v.idflottevaisseau = f.idflotte LEFT JOIN c_planete p ON -f.idplaneteflotte = p.idplanete WHERE v.idvaisseau = ?');
$reqinfoplan->execute(array($idplan));
$repinfoplan = $reqinfoplan->fetch();

if (!isset($repinfoplan['idflottevaisseau']))
	{ // Plan n'existe pas.

	header('Location: ../conception.php?message=66');
	exit();
	}
elseif ($_SESSION['id'] != -$repinfoplan['idflottevaisseau'] AND $_SESSION['id'] != $repinfoplan['idjoueurplanete'])
	{ // Cas d'un plan n'appartenant pas au joueur.
	header('Location: ../conception.php?message=66');
	exit();
	}
elseif ($_GET['id'] < 0)
	{ // Cas du plan en cours de modification.
	$reqsupcomposant->execute(array($_GET['id']));
	if (isset($repinfoplan['idjoueurplanete']))
		{
		header('Location: ../vaisseau.php?message=80&id='.$idplan.'');
		}
	else
		{
		header('Location: ../conception.php?message=80&id='.$idplan.'');
		}
	exit();
	}
elseif ($repinfoplan['idflottevaisseau'] > 0)
	{ // Cas d'un vaisseau, pas d'un plan.
	header('Location: ../conception.php?message=66');
	exit();
	}
elseif ($_SESSION['id'] == -$repinfoplan['idflottevaisseau'])
	{ // Cas d'un plan appartenant au joueur.
	//Permet de supprimer le plan.
	$reqsupcomposant->execute(array($_GET['id']));
	$reqsupplan->execute(array($_GET['id']));
	header('Location: ../conception.php?message=67');
	exit();
	}

// Vérifier qu'il n'y a rien en construction.
header('Location: ../../accueil.php?message=31');
// 31 = erreur non spécifiée.
?>