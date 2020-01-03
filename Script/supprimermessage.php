<?php
session_start();
include("BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idmessage'] . '</br>';

$reqsupemetteur = $bdd->prepare('UPDATE messagerie SET supprimeemetteur =  ? WHERE idmessagerie = ?');
$reqsupdestinataire = $bdd->prepare('UPDATE messagerie SET supprimerecepteur =  ? WHERE idmessagerie = ?');

$reqmessage = $bdd->prepare('SELECT idjoueuremetteur , idjoueurrecepteur FROM messagerie WHERE idmessagerie = ?');
$reqmessage ->execute(array($_POST['idmessage']));
$repmessage = $reqmessage ->fetch(); 

echo $repmessage['idjoueuremetteur']. '</br>'  ; 	
echo $repmessage['idjoueurrecepteur'] . '</br>' ; 	

if ($_SESSION['id'] == $repmessage['idjoueurrecepteur'])
	{
	$reqsupdestinataire ->execute(array(1, $_POST['idmessage']));
	header('Location: ../messagerie.php?message=25');
	exit();
	}

if ($_SESSION['id'] == $repmessage['idjoueuremetteur'])
	{
	$reqsupemetteur ->execute(array(1, $_POST['idmessage']));
	header('Location: ../messagerie.php?message=25');
	exit();
	}

header('Location: ../accueil.php');
?>