<?php
function planeteperteniveau($idplaneteperte, $idplaneteprisevassaux)
	{
	require __DIR__ . '/../include/bddconnection.php';

	$reqchangerplanete = $bd->prepare('UPDATE c_planete SET idplanetesuzerain = ?, niveauplanete = ? WHERE idplanete = ?');

	$reqinfoplanete = $bd->prepare('SELECT * FROM c_planete WHERE idplanete = ?');
	$reqinfoplanete->execute(array($idplaneteperte));
	$repinfoplanete = $reqinfoplanete->fetch();

	$nouveauniveau = $repinfoplanete['niveauplanete']-1;

	// Trouver id des planètes vassalisée et avec un niveau de moins.
	$reqplanetevassalisee = $bd->prepare('SELECT * FROM c_planete WHERE idplanetesuzerain = ? AND niveauplanete = ?');
	$reqplanetevassalisee->execute(array($idplaneteperte, $nouveauniveau));
	while ($repplanetevassalisee = $reqplanetevassalisee->fetch())
		{ // Rendre ces planètes indépendantes.
		$reqchangerplanete->execute(array(0, $repplanetevassalisee['niveauplanete'], $repplanetevassalisee['idplanete']));
		// FAIRE MESSAGE POUR AVERTIR LE PROPRIÉTAIRE DU CHANGEMENT ! ABCDE
		}
	
	if ($idplaneteprisevassaux > 0)
		{ // Soumettre la planète
		$reqchangerplanete->execute(array($idplaneteprisevassaux, $nouveauniveau, $idplaneteperte));
		// FAIRE MESSAGE POUR AVERTIR LE PROPRIÉTAIRE DU CHANGEMENT ! ABCDE
		}
	}
?>

