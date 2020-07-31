<?php
session_start();
require __DIR__ . '/../include/BDDconnection.php';
require __DIR__ . '/../function/caracteristiquesvaisseau.php';

/*
echo $_SESSION['id'] .' = id du joueur <br>' ;
echo $_POST['idvaisseau'] .' = id vaisseau <br>';
*/

// Cas d'un vaisseau réel : 
$reqvaisseau = $bdg->prepare('	SELECT p.idjoueurplanete
								FROM vaisseau v
								INNER JOIN flotte f ON v.idflottevaisseau = f.idflotte
								INNER JOIN planete p ON -f.idplaneteflotte = p.idplanete 
								WHERE v.idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));   
$repvaisseau = $reqvaisseau->fetch();

// Cas d'un plan : 
$reqvaisseauplan = $bdg->prepare('SELECT idflottevaisseau FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseauplan->execute(array($_POST['idvaisseau']));   
$repvaisseauplan = $reqvaisseauplan->fetch();

if ($repvaisseau['idjoueurplanete'] != $_SESSION['id'] AND -$repvaisseauplan['idflottevaisseau'] != $_SESSION['id'])   // Vérification du possesseur du vaisseau. Si pas bon = dégage vers l'acceuil.
	{ header("location: ../accueil.php?message=31"); exit(); }   

list($structure, $structuremax) = structurevaisseau ($_POST['idvaisseau']);
if ($structure > $structuremax)
	{ header("location: ../accueil.php?message=31"); exit(); }

$reqconstructionencours = $bdg->prepare('SELECT idconst FROM construction WHERE trucaconstruire = ?');
$reqconstructionencours->execute(array(-$_POST['idvaisseau']));   
$repconstructionencours = $reqconstructionencours->fetch();

if (!isset($repconstructionencours['idconst']))
	{ // Si aucune construction lié à ce plan existe, alors on peut le mettre à jour.
	// permet de supprimer le plan actuel :
	$reqsupprimerplanprecedent = $bdg->prepare('DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?');
	$reqsupprimerplanprecedent->execute(array($_POST['idvaisseau']));   

	// Permet d'appliquer le plan préparé :
	$reqappliquerplan = $bdg->prepare('UPDATE composantvaisseau SET idvaisseaucompo = ? WHERE idvaisseaucompo = ?');
	$reqappliquerplan->execute(array($_POST['idvaisseau'], -$_POST['idvaisseau']));

	caracteristiquesvaisseau ($_POST['idvaisseau']);

	if (-$repvaisseauplan['idflottevaisseau'] == $_SESSION['id'])
		{ // 75
		header("location: ../conception.php?message=75&id=" . urlencode($_POST['idvaisseau']));
		exit;
		}
	if ($repvaisseau['idjoueurplanete'] == $_SESSION['id'])
		{
		header("location: ../vaisseau.php?message=75&id=" . urlencode($_POST['idvaisseau']));
		exit;
		}
	}
else
	{
 	header("location: ../conception.php?message=76&id=" . urlencode($_POST['idvaisseau']));
	exit;
	}

header("location: ../accueil.php?message=31");
?>