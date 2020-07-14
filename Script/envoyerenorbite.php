<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['id'] .' id du joueur <br>' ;
echo $_POST['idvaisseau'] .' = id vaisseau <br>';
echo $_POST['idplanete'] .' = id planete <br>';
echo $_POST['idflotte'] .' = id de la flotte (0 = création d\'une flotte) <br>';
echo $_POST['mouvement'] .' avec 1 = envoyer en orbite, 2 créer une flotte, 3 envoyer sur planète'; 
*/

$reqflotteenorbite = $bdg->prepare("SELECT nomflotte FROM flotte WHERE idplaneteflotte = ? AND universflotte = ? AND xflotte = ? AND yflotte = ? AND idflotte = ?") ; 
$reqcreerflotte = $bdg->prepare('	INSERT INTO flotte (idplaneteflotte, universflotte, xflotte, yflotte, nomflotte, typeordre)
											VALUES (?, ?, ?, ?, ?, ?);');

$reqvaisseau = $bdg->prepare('	SELECT f.idplaneteflotte
								FROM vaisseau v
								INNER JOIN flotte f ON v.idflottevaisseau = f.idflotte
								WHERE v.idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));   
$repvaisseau = $reqvaisseau->fetch();   

$idplanete = abs($repvaisseau['idplaneteflotte']);  // Permet de gérer les cas ou la flotte est dans une flotte de défense.
$reqplanete = $bdg->prepare('	SELECT idjoueurplanete, universplanete, xplanete, yplanete, idplanete
								FROM planete
								WHERE idplanete = ?');
$reqplanete->execute(array($idplanete));   
$repplanete = $reqplanete->fetch();

if ($repplanete['idjoueurplanete'] != $_SESSION['id'])   // Vérification du possesseur du vaisseau. Si pas bon = dégage vers l'acceuil.
	{ header("location: ../accueil.php?message=31"); exit(); }
elseif ($_POST['idplanete'] != $idplanete)   // Vérification que la planète entrée est la bonne.
	{ header("location: ../accueil.php?message=31"); exit(); }

if ($_POST['mouvement'] == 1)
	{// rejoindre une flotte
	// Vérifier que la flotte est bel et bien en orbite de la planète : 
	$reqflotteenorbite->execute(array($_POST['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], $_POST['idflotte'])); 
	$repflotteenorbite = $reqflotteenorbite->fetch(); 
	if (!isset($repflotteenorbite['nomflotte']))
		{ header("location: ../accueil.php?message=31"); exit(); }
	$idmessage = 69;
	$idflotte = $_POST['idflotte'];
	}
elseif ($_POST['mouvement'] == 2)
	{ // Créer la flotte qui va acceuillir le vaisseau.
	$reqcreerflotte->execute(array($repplanete['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], 'nouvelleflotte', 0));
	$_POST['idflotte'] = $bdg->lastInsertId();
	$idflotte = $_POST['idflotte'];
	$idmessage = 68; 
	}
elseif ($_POST['mouvement'] == 3)
	{ // Rejoindre la planète
	// Vérifier que la flotte est bel et bien en orbite de la planète : 
	$reqflotteenorbite->execute(array($_POST['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], $_POST['idflotte'])); 
	$repflotteenorbite = $reqflotteenorbite->fetch(); 
	if (!isset($repflotteenorbite['nomflotte']))
		{ header("location: ../accueil.php?message=31"); exit(); }
	// récupérer l'ID de la flotte en orbite autour de la planète, éventuellement la créer. 

	$reqflotteendefense = $bdg->prepare("SELECT idflotte FROM flotte WHERE idplaneteflotte = ?") ;
	$reqflotteendefense->execute(array(-$_POST['idplanete'])); 
	$repflotteendefense = $reqflotteendefense->fetch();

	if (!isset($repflotteendefense['idflotte']))
		{
		$reqcreerflotte->execute(array(-$repplanete['idplanete'], $repplanete['universplanete'], $repplanete['xplanete'], $repplanete['yplanete'], 'nouvelleflotte', 0));
		$idflotte = $bdg->lastInsertId();
		}
	else
		{
		$idflotte = $repflotteendefense['idflotte'];
		}
	$idmessage = 70;
	}

if (isset($idmessage) AND $_POST['idflotte'] > 0 AND isset($idflotte))
	{
	$requpdatevaisseau = $bdg->prepare('UPDATE vaisseau SET idflottevaisseau = ? WHERE idvaisseau = ?');
	$requpdatevaisseau->execute(array($idflotte, $_POST['idvaisseau']));
	header("location: ../hangars.php?message=".urlencode($idmessage)."&id=" . urlencode($_POST['idflotte']));
	exit();
	}

header("location: ../accueil.php?message=31");
?>