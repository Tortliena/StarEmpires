<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerflotte = $bd->prepare('INSERT INTO c_flotte(idplaneteflotte, universflotte, xflotte, yflotte, nomflotte) VALUES(?, ?, ?, ?, ?)');          
$reqcreervaisseau = $bd->prepare('INSERT INTO c_vaisseau(idflottevaisseau, nomvaisseau, HPmaxvaisseau, HPvaisseau) VALUES(?, ?, ?, ?)');
$reqinfovaisseau = $bd->prepare('SELECT idvaisseau FROM c_vaisseau ORDER BY idvaisseau DESC LIMIT 1'); 
$reqcreercargo = $bd->prepare('INSERT INTO c_cargovaisseau(idvaisseaucargo, typeitems, quantiteitems) VALUES(?, ?, ?)');
$reqcreercomposant = $bd->prepare('INSERT INTO c_composantvaisseau(idvaisseaucompo, iditemcomposant, typecomposant) VALUES(?, ?, ?)');

$nombredeflotteacreer = 0;
// On compte le nombre de flotte actuellement dans l'univers pour déterminer le nombre de flotte à créer.
$reqcompterflottealien = $bd->query('SELECT COUNT(idflotte) AS nb FROM c_flotte WHERE universflotte = -2 AND idplaneteflotte = 0');
$repcompterflottealien = $reqcompterflottealien->fetch();
if ($repcompterflottealien['nb'] < 20)
	{
	$nombredeflotteacreer = 2;
	}

// On créer les flottes.
for ($i = 1; $i <= $nombredeflotteacreer; $i++)
	{
	$xnouvelleflotte = RAND(1, 20);
	$ynouvelleflotte = RAND(1, 20);
	$reqcreerflotte->execute(array(0, -2, $xnouvelleflotte, $ynouvelleflotte, 'Essain alien'));
	$IDflottealien = $bd->lastInsertId();

	$nombredevaisseauacreer = RAND(1, 5);
	for ($k = 1; $k <= $nombredevaisseauacreer; $k++)
		{ 
		$nombredecomposant = Rand(1, 5);
		$nomvaisseau = 'Vaisseau alien'; // Transformer cette partie en fonction du nombre de composants si un jour les joueurs peuvent voir les noms des vaisseaux.
		$reqcreervaisseau->execute(array($IDflottealien, $nomvaisseau, 20, 20));
		$IDduvaisseaualien = $bd->lastInsertId();
		
		for ($j = 1; $j <= $nombredevaisseauacreer; $j++)
			{ // Plus il y a de composants, plus le vaisseaux a des tirs et des PV et lache des débris.
			$reqcreercomposant->execute(array($IDduvaisseaualien, 29, 'arme'));
			}
		if ($nombredecomposant >= 1)
			{ // Permet de générer du loot dans la flotte.
			$reqcreercargo->execute(array($IDduvaisseaualien, 31, 1));
			}	
		}
	}
?>