<?php
session_start();
require __DIR__ . '/../include/bddconnection.php';

/*
echo $_SESSION['id'] .' id du joueur <br>' ;
echo $_POST['nouveaunom'] .' = Nouveau nom <br>' ;
echo $_POST['id'] .' = id planete ou vaisseau <br>';
echo $_POST['type'].' = truc à renommer. <br>';
*/

if (empty($_POST['nouveaunom']))
    {
    if ($_POST['type'] == 'flotte')
    	{
    	header("location: ../hangars.php?message=18&id=" . urlencode($_POST['id']));
    	exit();
    	}
    elseif ($_POST['type'] == 'planete')
    	{
    	header("location: ../planete.php?message=18&id=" . urlencode($_POST['id']));
    	exit();
    	}
    elseif ($_POST['type'] == 'vaisseau')
    	{
    	header("location: ../vaisseau.php?message=18&id=" . urlencode($_POST['id']));
    	exit();
    	}
    header("location: ../accueil.php?message=31");
    exit();
	}

if ($_POST['type'] == 'flotte')
	{
	$trouverflotte = $bd->prepare('	SELECT f.idflotte FROM c_flotte f
									INNER JOIN c_planete p ON p.idplanete = f.idplaneteflotte OR p.idplanete = -f.idplaneteflotte 
									WHERE f.idflotte = ? AND p.idjoueurplanete = ?');
	$trouverflotte->execute(array($_POST['id'], $_SESSION['id']));
	$flotte = $trouverflotte->fetch();
	// Si aucun résultat, alors on a pas de ''$flotte'', donc on fait pas la requete de renommage donc on arrive à la fin du script.


	if (isset($flotte[0]))
		{
		$renommerflotte = $bd->prepare('UPDATE c_flotte SET nomflotte = ? WHERE idflotte = ?' );
		$renommerflotte->execute(array($_POST['nouveaunom'], $_POST['id']));

		header("location: ../hangars.php?message=26&id=" . urlencode($_POST['id']));
		exit();
		}
	}


elseif ($_POST['type'] == 'vaisseau')
	{
	// Cas d'un vaisseau réel : 
	$reqvaisseau = $bd->prepare('	SELECT p.idjoueurplanete
									FROM c_vaisseau v
									INNER JOIN c_flotte f ON v.idflottevaisseau = f.idflotte
									INNER JOIN c_planete p ON f.idplaneteflotte = p.idplanete OR -f.idplaneteflotte = p.idplanete
									WHERE v.idvaisseau = ?');
	$reqvaisseau->execute(array($_POST['id']));   
	$repvaisseau = $reqvaisseau->fetch();

	// Cas d'un plan : 
	$reqvaisseauplan = $bd->prepare('SELECT idflottevaisseau FROM c_vaisseau v WHERE idvaisseau = ?');
	$reqvaisseauplan->execute(array($_POST['id']));   
	$repvaisseauplan = $reqvaisseauplan->fetch();

	if ($repvaisseau['idjoueurplanete'] != $_SESSION['id'] AND -$repvaisseauplan['idflottevaisseau'] != $_SESSION['id'])   // Vérification du possesseur du vaisseau. Si pas bon = dégage vers l'acceuil.
		{ header("location: ../accueil.php?message=31"); exit(); }   

	$renommervaisseau = $bd->prepare('UPDATE c_vaisseau SET nomvaisseau = ? WHERE idvaisseau = ?' );
	$renommervaisseau->execute(array($_POST['nouveaunom'], $_POST['id']));

	if ($repvaisseau['idjoueurplanete'] == $_SESSION['id'])
		{
		header("location: ../vaisseau.php?message=26&id=" . urlencode($_POST['id']));
		exit();
		}
	else
		{
		header("location: ../conception.php?message=26&id=" . urlencode($_POST['id']));
		exit();
		}
	}


elseif ($_POST['type'] == 'planete')
	{
	$renommerplanete = $bd->prepare('UPDATE c_planete SET nomplanete = ? WHERE idplanete = ? AND idjoueurplanete = ?' );
	$renommerplanete->execute(array($_POST['nouveaunom'] , $_POST['id'], $_SESSION['id']));
	header("location: ../planete.php?message=26&id=" . urlencode($_POST['id']));
	exit();
	}

header("location: ../accueil.php?message=31");
?>