<?php
// Détection flottes ennemies  
$reqdetectionflotteennemi = $bd->prepare("	SELECT f.idflotte, f.nomflotte FROM c_flotte f
											LEFT JOIN c_planete p on p.idplanete = f.idplaneteflotte
											INNER JOIN c_vaisseau v on v.idflottevaisseau = f.idflotte
											WHERE f.idflotte <> ? AND f.universflotte = ? AND f.xflotte = ? AND f.yflotte = ? AND (p.idjoueurplanete <> ? OR p.idjoueurplanete IS NULL) AND f.idplaneteflotte >= 0
											GROUP BY f.idflotte");
											// INNER sur vaisseau = pour éliminer les flottes sans vaisseau.
$reqdetectionflotteennemi->execute(array($_GET['id'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte'], $_SESSION['id']));   
while($repdetectionflotteennemi = $reqdetectionflotteennemi->fetch())   
	{   
	if ($estarme == true)   // Si on a des armes, on peut tirer. 
		{   
		formulaireordredeplacement(5, $_GET['id'], 'Flotte inconnue détectée : ' . $repdetectionflotteennemi['nomflotte'] . ' ', $repdetectionflotteennemi['idflotte'], 0, 0);   
		}   
	else   
		{   
		echo '<p>Flotte potentiellement hostile à proximité : ' . $repdetectionflotteennemi['nomflotte'] . '</p>';   
		}   
	}   

// Détection des flotte alliées.
$reqdetectionflottealliee = $bd->prepare("	SELECT f.idflotte, f.nomflotte FROM c_flotte f
											INNER JOIN c_planete p on p.idplanete = f.idplaneteflotte
											INNER JOIN c_vaisseau v on v.idflottevaisseau = f.idflotte
											WHERE f.idflotte <> ? AND f.universflotte = ? AND f.xflotte = ? AND f.yflotte = ? AND p.idjoueurplanete = ?
											GROUP BY f.idflotte"); // INNER sur vaisseau = pour éliminer les flottes sans vaisseau.
$reqdetectionflottealliee->execute(array($_GET['id'], $repflotte['universflotte'], $repflotte['xflotte'], $repflotte['yflotte'], $_SESSION['id']));  
while($repdetectionflottealliee = $reqdetectionflottealliee->fetch())   
	{   
	echo '<p>Flotte amie à proximité : ' . $repdetectionflottealliee['nomflotte'] . '</p>';   
	}
?>