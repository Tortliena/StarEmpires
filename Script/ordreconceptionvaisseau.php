<?php
session_start();
include("../include/BDDconnection.php");

$result = $_POST['composant'];
$result_explode = explode('|', $result);

/*
echo "id composant : ". $result_explode[0]."<br />";
echo "type composant : ". $result_explode[1]."<br />";
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idvaisseau'] . ' id du vaisseau</br>' ;
*/

//Vérifier propriétaire du vaisseau.  
$reqvaisseau = $bdg->prepare('SELECT univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));
$repvaisseau = $reqvaisseau->fetch();
	if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
		{ header('Location: ../accueil.php?message=31'); exit(); }

// supprimer ordre précédent.
$reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
$reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));

// créer nouvel ordre.
$req = $bdg->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
$req->execute(array($_POST['idvaisseau'], 0, 0, 0, $_SESSION['id'], 6));

$reqcreerconstruction = $bdg->prepare('
		INSERT INTO construction(trucaconstruire, nombre, idjoueurconst, avancementbiens, avancementtitane, prixbiens, prixtitane)
		VALUES(?, ?, ?, ?, ?, ?, ?)');
$reqcreerconstruction->execute(array(-1, 1, $_SESSION['id'], 100, 0, 100, 0));

$reqnumconstruction = $bdg->QUERY('SELECT idconst FROM construction ORDER BY idconst DESC LIMIT 1'); 
$repnumconstruction = $reqnumconstruction ->fetch();

$reqcreerconception = $bdg->prepare('INSERT INTO concenptionencours(idconstruction, idvaisseauconception, typecomposant, idnouvcomposant) VALUES(?, ?, ?, ?)');
$reqcreerconception->execute(array($repnumconstruction['idconst'], $_POST['idvaisseau'], $result_explode[1], $result_explode[0]));

header("location: ../hangars.php?message=32&" . "id=" . urlencode($_POST['idvaisseau'])); 
?>