<?php
if (isset($repasteroide['idasteroide']))   
	{
	if ($quantitetransportee >= $souteflotte)     
		{
		echo '<p>Vous êtes à proximité d\'un champs de débris, mais vous ne pouvez pas miner faute de place dans les soutes</p>'; 
		}
	elseif ($minageflotte < 1)
		{
		echo '<p>Vous êtes à proximité d\'un champs de débris, mais vous ne pouvez pas miner faute d\'équipement présent dans votre flotte.</p>';      
		}
	else  
		{
		formulaireordredeplacement(1, $_GET['id'], 0, 0, 0, 0);   
		}
	}
?>