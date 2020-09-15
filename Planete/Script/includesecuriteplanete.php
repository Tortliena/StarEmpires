<?php
// On peut venir sur cette page si on a au minimum donné ces infos :
if (!isset($_SESSION['id']) OR !isset($_POST['idplanete']))
	{
	header('Location: ../accueil.php'); exit();
    }

$reqplanete = $bd->prepare('SELECT * FROM c_planete WHERE idplanete = ?');
$reqplanete->execute(array($_POST['idplanete']));
$repplanete = $reqplanete->fetch();

// Vérifier propriétaire de la planète + si un restauration est en cours + si la planète est pas trop améliorée déjà.
if ($repplanete['idjoueurplanete'] != $_SESSION['id'])
	{
	header('Location: ../accueil.php'); exit();
	}
?>