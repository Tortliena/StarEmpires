<?php
if (isset($repasteroide['nb']))
	{
	$taille = tailleasteroide($repasteroide['nb']);

	if (!isset($_GET['x']) OR ($_GET['x'] == $repflotte['xflotte'] AND $_GET['y'] == $repflotte['yflotte']))
		{
		if ($quantitetransportee >= $souteflotte)     
			{
			echo '<p>Vous êtes à proximité d\'un champs de débris de '.$taille.', mais vous ne pouvez pas miner faute de place dans les soutes</p>'; 
			}
		elseif ($minageflotte < 1)
			{
			echo '<p>Vous êtes à proximité d\'un champs de débris de '.$taille.', mais vous ne pouvez pas miner faute d\'équipement présent dans votre flotte.</p>';      
			}
		else  
			{
	    	$texteexplication = 'Votre flotte se trouve à proximité champs d\'astéroides de '.$taille.'. ';
			formulaireordredeplacement(1, $_GET['id'], $texteexplication, 0, 0, 0);   
			}
		}
	elseif ($repdect['idexplore'])
		{
		echo 'Champs d\'astéroides en '.$_GET['x'].'-'.$_GET['y'].' de '.$taille.'.';		
		}
	}
?>