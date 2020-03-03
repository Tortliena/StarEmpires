<?php
session_start();
include("../include/BDDconnection.php");

//On arrive ici avec :
// $_POST['nouveaunom']
// $_SESSION['pseudo']
// $_POST['idvaisseau']

if (empty($_POST['nouveaunom']))
    {
    if ($_POST['type'] == 'vaisseau')
    	{
    	header("location: ../hangars.php?message=18&id=" . urlencode($_POST['id']));
    	exit();
    	}
    elseif ($_POST['type'] == 'planete')
    	{
    	header("location: ../planete.php?message=18&id=" . urlencode($_POST['id']));
    	exit();
    	}
    header("location: ../accueil.php?message=31");
    exit();
	}

if ($_POST['type'] == 'vaisseau')
	{
	$renommervaisseau = $bdg->prepare('UPDATE vaisseau SET nomvaisseau = ? WHERE idvaisseau = ? AND idjoueurbat = ?' );
	$renommervaisseau->execute(array($_POST['nouveaunom'] , $_POST['id'], $_SESSION['id']));
	header("location: ../hangars.php?message=26&id=" . urlencode($_POST['id']));
	exit();
	}
elseif ($_POST['type'] == 'planete')
	{
	$renommerplanete = $bdg->prepare('UPDATE planete SET nomplanete = ? WHERE idplanete = ? AND idjoueurplanete = ?' );
	$renommerplanete->execute(array($_POST['nouveaunom'] , $_POST['id'], $_SESSION['id']));
	header("location: ../planete.php?message=26&id=" . urlencode($_POST['id']));
	exit();
	}

header("location: ../accueil.php?message=31");
?>