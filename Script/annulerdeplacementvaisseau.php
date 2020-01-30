<?php
session_start();
include("../include/BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
// echo $_POST['perdreressources'] . '</br>' ;
echo $_POST['idvaisseau'] . '</br>' ;

//Vérifier propriétaire du vaisseau.  
$reqvaisseau = $bdg->prepare('SELECT idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));
$repvaisseau = $reqvaisseau->fetch();
    
if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    { header('Location: ../accueil.php?message=31'); exit(); }

else
    {
    $reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
    $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));

    // Cas d'une suppression d'un ordre de rénovation de vaisseau :
    // Récupérer l'ordre de construction :
    $reqnumerodeconstruction = $bdg->prepare('SELECT idconstruction FROM concenptionencours WHERE idvaisseauconception = ?');
    $reqnumerodeconstruction->execute(array($_POST['idvaisseau']));
    $repnumerodeconstruction = $reqnumerodeconstruction->fetch();

    if (isset($repnumerodeconstruction['idconstruction']))
    	{
	    // Supprimer la construction en cours :
		$reqsupprimerconstructionencours = $bdg->prepare('DELETE FROM construction WHERE idconst = ?');
	    $reqsupprimerconstructionencours->execute(array($repnumerodeconstruction['idconstruction']));

	    // Supprimer la partie spéciale liée à la conception en cours :
	    $reqsupprimerconcenptionencours = $bdg->prepare('DELETE FROM concenptionencours WHERE idvaisseauconception = ?');
	    $reqsupprimerconcenptionencours->execute(array($_POST['idvaisseau']));
	    header("location: ../hangars.php?message=33&" . "id=" . urlencode($_POST['idvaisseau'])); 
    	}
    }	

header("location: ../hangars.php?message=20&" . "id=" . urlencode($_POST['idvaisseau'])); 
    ?>