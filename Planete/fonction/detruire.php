<?php
function destruction($idbatiment, $idplanete)
	{
	echo '<form method="post" action="script/detruire.php">';
	echo '<input type="hidden" name="idplanete" value="'.$idplanete.'">';
	echo '<input type="hidden" name="idbatiment" value="'.$idbatiment.'">';
	if ($idbatiment > 0)
  		{
  		echo '&ensp;<a class="infobulle"><input type="image" src="/starempires/imagecarte/Detruire.png" alt=" Détruire " formaction="script/detruirebatiment.php"/><span>';
		echo 'Détruire ce batiment.<br>Un à la fois. ';
		}
	else
		{
  		echo '&ensp;<a class="infobulle"><input type="image" src="/starempires/imagecarte/annuler.png" alt=" Détruire " formaction="script/detruirebatiment.php"/><span>';
		echo 'Annuler la destruction. ';
		}
	echo '</span></a>';
	echo '</form>';
	}
?>