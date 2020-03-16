<?php
session_start();
include("../include/BDDconnection.php");

echo $_SESSION['id'] .' id du joueur <br>' ;
echo $_POST['nouveaunom'] .' = Nouveau nom <br>' ;
echo $_POST['id'] .' = id planete ou vaisseau <br>';
echo $_POST['type'].' = truc à renommer. <br>';


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
	$trouvervaisseau = $bdg->prepare('SELECT nomvaisseau FROM vaisseau WHERE idvaisseau = ? AND idjoueurvaisseau = ?');
	
	$trouvervaisseau->execute(array($_POST['id'], $_SESSION['id']));
	$vaisseaureel = $trouvervaisseau->fetch();
	$trouvervaisseau->execute(array($_POST['id'], -$_SESSION['id']));
	$vaisseauconception = $trouvervaisseau->fetch();

	$renommervaisseau = $bdg->prepare('UPDATE vaisseau SET nomvaisseau = ? WHERE idvaisseau = ? AND idjoueurvaisseau = ?' );
	$renommervaisseau->execute(array($_POST['nouveaunom'], $_POST['id'], $_SESSION['id']));
	$renommervaisseau->execute(array($_POST['nouveaunom'], $_POST['id'], -$_SESSION['id']));

	if (isset($vaisseaureel[0]))
		{
		header("location: ../hangars.php?message=26&id=" . urlencode($_POST['id']));
		exit();
		}
	elseif (isset($vaisseauconception[0]))
		{
		header("location: ../conception.php?message=26&id=" . urlencode($_POST['id']));
		exit();
		}
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