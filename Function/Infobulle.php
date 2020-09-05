<?php 
function infobulle($texteinfobulle, $image) 
	{ 
	echo '&ensp;<a class="infobulle"><img src="/imagecarte/'.$image.'.png" alt=" infobulle "/><span>';
	echo $texteinfobulle ;
	echo '</span></a>';
	}

 /*
include("Function/infobulle.php");
$texte = 'avec des mots en <strong>gras</strong> par exemple. ';
infobulle($texte);
 */
?>