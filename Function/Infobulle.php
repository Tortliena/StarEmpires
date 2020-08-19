<?php 
function infobulle($texteinfobulle) 
	{ 
	echo '&ensp;<a class="infobulle"><img src="/starempires/imagecarte/infobulle.png" alt=" infobulle "/><span>';
	echo $texteinfobulle ;
	echo '</span></a>';
	}

 /*
include("Function/infobulle.php");
$texte = 'avec des mots en <strong>gras</strong> par exemple. ';
infobulle($texte);
 */
?>