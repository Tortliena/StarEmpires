<?php
if ($repflotte['universflotte'] == 0)
	{// Si le vaisseau est dans l'hyperespace :
	$jourrestant = $repflotte['xdestination']+1;
	echo '<p>Votre vaisseau est en cours de voyage. Reste '.$jourrestant.' jours.</p>';
	}
?>