<?php
$peutenvahir[0] = true ;

if (!isset($_GET['x']) OR ($_GET['x'] == $repflotte['xflotte'] AND $_GET['y'] == $repflotte['yflotte']))
	{ //On a cliqué sur la flotte ou on a cliqué sur rien.
	if (isset($repplanete2['idjoueurplanete']))
		{ // On est en orbite d'une planète
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