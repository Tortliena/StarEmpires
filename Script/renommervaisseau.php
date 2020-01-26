<?php
session_start();
include("../include/BDDconnection.php");

//On arrive ici avec :
// $_POST['nouveaunom']
// $_SESSION['pseudo']
// $_POST['idvaisseau']

if (empty($_POST['nouveaunom']))
    {
    header("location: ../hangars.php?message=18&" .
       "id=" . urlencode($_POST['idvaisseau']));
    exit();
	}

else
	{
	$renommervaisseau = $bdg->prepare('UPDATE vaisseau SET nomvaisseau = ? WHERE idvaisseau = ? AND idjoueurbat = ?' );
	$renommervaisseau->execute(array($_POST['nouveaunom'] , $_POST['idvaisseau'], $_SESSION['id']));
	header("location: ../hangars.php?message=26&" .
       "id=" . urlencode($_POST['idvaisseau']));
	exit();
	}

header("location: ../accueil.php");
?>