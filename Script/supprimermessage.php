<?php
session_start();
include("../include/bddconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idmessage'] . '</br>';
*/

$reqsupemetteur = $bd->prepare('UPDATE c_messagerie SET supprimeemetteur =  ? WHERE idmessagerie = ?');
$reqsupdestinataire = $bd->prepare('UPDATE c_messagerie SET supprimerecepteur =  ? WHERE idmessagerie = ?');

$reqmessage = $bd->prepare('SELECT idjoueuremetteur, idjoueurrecepteur FROM c_messagerie WHERE idmessagerie = ?');
$reqmessage ->execute(array($_POST['idmessage']));
$repmessage = $reqmessage ->fetch(); 

/*
echo $repmessage['idjoueuremetteur']. '</br>'  ; 	
echo $repmessage['idjoueurrecepteur'] . '</br>' ; 	
*/

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

header('Location: ../accueil.php?message=31');
?>