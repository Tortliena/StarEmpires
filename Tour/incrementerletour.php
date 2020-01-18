<?php
/* session_start();
include("../script/BDDconnection.php");
*/

$bdd->exec("INSERT INTO tour (datetour) VALUES (CURRENT_TIMESTAMP)");
// Trouver un moyen d'éditer le texte pour voir si tout s'est bien passé. Avec de multiples tables ?

// echo 'le dernier tour est le tour ' . $donnees['id'] . ' et s\'est passé le ' . $donnees['datetour']  ;
// echo ' <br />  ' . $donnees['resume'] ;

function add_some_extra1(&$Commentairestour)
{
    $Commentairestour .= '</br> le numéro du tour a été augmenté';
}
add_some_extra1($Commentairestour);

?>