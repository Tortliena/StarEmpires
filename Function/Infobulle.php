<?php 
function infobulle($texteinfobulle) 
	{ 
	echo '<a class="infobulle"><img src="imagecarte/infobulle.png" alt=" ? " height="25" width="25" /><span>';
	echo $texteinfobulle ;
	echo '</span></a>';
	}

 /*
include("Function/infobulle.php");
$texte = 'avec des mots en <strong>gras</strong> par exemple. ';
infobulle($texte);
 */
?>