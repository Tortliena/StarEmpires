<?php
$peutenvahir[0] = true ;

/*
$reqplanete2 = $bd->prepare('SELECT * FROM c_planete WHERE xplanete = ? AND yplanete = ? AND universplanete = ? LIMIT 1');
$reqplanete2->execute(array($repflotte['xflotte'] , $repflotte['yflotte'], $repflotte['universflotte']));
$repplanete2 = $reqplanete2->fetch();
*/

if (!isset($_GET['x']) OR ($_GET['x'] == $repflotte['xflotte'] AND $_GET['y'] == $repflotte['yflotte']))
	{ //On a cliqué sur la flotte ou on a cliqué sur rien.
	if (isset($repplanete2['idjoueurplanete']))
		{ // On est en orbite d'une planète

		// GESTION COLONISATION
		if ($repplanete2['idjoueurplanete'] == $_SESSION['id'])
			{ // Ce monde est le notre.
			echo '<p>Cette flotte se trouve à proximité d\'un de nos mondes.</p>';
			}
		elseif ($repplanete2['idjoueurplanete'] == 0)
			{ // Ou ce monde n'est pas colonisé.
			if ($peutcoloniser[0] == true)
				{
				formulaireordredeplacement(11, $_GET['id'], 0, $repplanete2['idplanete'], 0, 0);
				}
			else
				{
				echo '<p>Cette flotte se trouve à proximité d\'un monde vierge (taille '.$repplanete2['taille'].', '.$repplanete2['lune'].' lunes), mais ne possède pas de module pour le coloniser.</p>';
				}
			}
		elseif ($repplanete2['idjoueurplanete'] != $_SESSION['id'])
			{ // Ou ce monde est aux mains de quelqu'un d'autre. 
			if ($peutenvahir[0] == true)
				{
				$tempsinvasion = variable(9);
				formulaireordredeplacement(3, $_GET['id'], 0, $repplanete2['idplanete'], $tempsinvasion, 0);   
				}
			else
				{
				echo '<p>Cette flotte se trouve à proximité d\'un monde habité (taille '.$repplanete2['taille'].', '.$repplanete2['lune'].' lunes), mais ne peut pas l\'envahir.</p>'; 
				}
			}
		// FIN GESTION COLONISATION

		// GESTION TERRAFORMATION
		// $peutterra[0] : 0 = peut pas terra, 1 = peut restauter, 2 = peut améliorer, 3 = peut restauter et améliorer.
		if ($peutterra[0] > 0)
			{
			if ($repplanete2['restauration'] > 0)
				{
				echo 'Planète déjà en cours de restauration. Pas possible de lancer la moindre opération actuellement.';
				}
			elseif ($repplanete2['environnement'] < 0 AND $peutterra[0] == 1)
				{ // planète abimée et flotte peut restaurer.
				$texteexplication = 'La planète est abimée et vous pouvez la restaurer. ';
				formulaireordredeplacement(4, $_GET['id'], $texteexplication, $repplanete2['idplanete'], 0, 0);
				}
			elseif ($repplanete2['environnement'] < 0 AND $peutterra[0] == 2)
				{ // planète abimée et flotte peut améliorer.
				$texteexplication = 'La planète est abimée et vous pouvez la restaurer. (module d\'amélioration = cher). ';
				formulaireordredeplacement(4, $_GET['id'], $texteexplication, $repplanete2['idplanete'], 0, 0);
				}
			elseif ($repplanete2['environnement'] < 0 AND $peutterra[0] == 3)
				{ // planète abimée et flotte peut améliorer et restaurer.
				$texteexplication = 'La planète est abimée et vous pouvez la restaurer (module de restauration utilisé). ';
				formulaireordredeplacement(4, $_GET['id'], $texteexplication, $repplanete2['idplanete'], 0, 0);
				}
			elseif ($repplanete2['environnement'] < 3000 AND $peutterra[0] > 1)
				{ // planète en bon état et flotte peut améliorer.
				$texteexplication = 'Vous pouvez améliorer l\'environnement de cette planète. ';
				formulaireordredeplacement(4, $_GET['id'], $texteexplication, $repplanete2['idplanete'], 0, 0);
				}
			else
				{ // Planète en trop bon état pour etre térraformer.
				echo 'La planète est en excellent état et peut difficilement être améliorée même avec votre équipement.';
				}
			}
		// FIN TERRAFORMATION
		}
	}


elseif ($repdect['idexplore'])
	{ // On a cliqué sur une case autre que celle de la flotte.
	if (isset($repplanete3['idjoueurplanete']))
		{ // Dans le cas ou il y a une planète sur la dite case
		echo 'Planète en '.$_GET['x'].'-'.$_GET['y'].' : Taille '.$repplanete3['taille'].', '.$repplanete3['lune'].' lune(s). ';
		if ($repplanete3['idjoueurplanete'] == $_SESSION['id'])
			{
			echo 'Vous possédez ce monde.';
			}
		elseif ($repplanete3['idjoueurplanete'] == 0)
			{
			echo 'Ce monde ne semble pas habité.';
			}
		else
			{
			echo 'Des signes de vies évolués sont détectés.';
			}
		}
	}
else
	{ // On a cliqué sur une case autre que celle de la flotte.
	if (isset($repplanete3['idjoueurplanete']))
		{ // Dans le cas ou il y a une planète sur la dite case
		echo 'Planète en '.$_GET['x'].'-'.$_GET['y'].'. Nous devrions exploré la zone pour avoir plus d\'informations.';
		}
	}
?>