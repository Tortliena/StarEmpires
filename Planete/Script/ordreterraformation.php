<?php
session_start();
include("../../include/bddconnection.php");
include("../../function/consommercreeritemsplanetemultiple.php");
include("includesecuriteplanete.php");

/*
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idplanete'] . '</br>';
*/

// Vérifier propriétaire de la planète + si un restauration est en cours + si la planète est pas trop améliorée déjà.
if ($repplanete['restauration'] > 0 OR $repplanete['environnement'] > 3000)
	{
	header('Location: ../accueil.php'); exit();
	}

$reqsilo = $bd->prepare('SELECT sum(case when iditems = 39 then 1 else 0 end) AS restau,
								sum(case when iditems = 40 then 1 else 0 end) AS amelio
								FROM c_silo WHERE idplanetesilo = ?');
$reqsilo->execute(array($_POST['idplanete']));
$repsilo = $reqsilo->fetch();

$reqlancerrestauration = $bd->prepare('UPDATE c_planete SET restauration = ? WHERE idplanete = ?');

// Si inf à 0, alors chercher restaurateur.
if ($repplanete['environnement'] < 0 AND $repsilo['restau'] > 0)
	{
	$reqlancerrestauration->execute(array(20, $_POST['idplanete']));
	$message = 81;
  	// Id du restaurateur planétaire = 39.
    consommercreeritemsplanetemultiple(39, 0, $_POST['idplanete'], 1);
	}
// Si inf à 3000, alors chercher améliorateur de planète.
elseif ($repplanete['environnement'] < 3000 AND $repsilo['amelio'] > 0)
	{
	$reqlancerrestauration->execute(array(30, $_POST['idplanete']));
	$message = 82;
	// Id de l'améliorateur planétaire = 40.
    consommercreeritemsplanetemultiple(40, 0, $_POST['idplanete'], 1);
	}
else
	{
	header('Location: ../accueil.php'); exit();
	}

header("Location: ../planete.php?message=" . urlencode($message) . "&id=" . urlencode($_POST['idplanete']));
?>