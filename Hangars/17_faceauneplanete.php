<?php
$peutenvahir[0] = true ;

if (isset($repplanete2['idjoueurplanete']))
	{
	if ($repplanete2['idjoueurplanete'] == $_SESSION['id'])
		{
		echo '<p>Cette flotte se trouve à proximité d\'un de nos mondes.</p>';
		}
	elseif ($repplanete2['idjoueurplanete'] == 0)
		{
		if ($peutcoloniser[0] == true)
			{
			formulaireordredeplacement(11, $_GET['id'], 0, $repplanete2['idplanete'], 0, 0);
			}
		else
			{
			echo '<p>Cette flotte se trouve à proximité d\'un monde vierge, mais ne possède pas de module pour le coloniser.</p>';
			}
		}
	elseif ($repplanete2['idjoueurplanete'] != $_SESSION['id'])
		{
		if ($peutenvahir[0] == true)
			{
			formulaireordredeplacement(3, $_GET['id'], 0, $repplanete2['idplanete'], 0, 0);   
			}
		else
			{
			echo '<p>Cette flotte se trouve à proximité d\'un monde habité, mais ne peut pas l\'envahir.</p>'; 
			}
		}
	}
?>