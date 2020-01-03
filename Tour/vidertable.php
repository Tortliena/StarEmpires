<?php
/* session_start();
include("../script/BDDconnection.php");
*/

// Vider la table de messages du tour.
$bdd->exec('DELETE FROM messagetour');

// Vider la table de variation du tour.
$bdd->exec('DELETE FROM variationstour');

// Vider la table des évènements en cours
$bdd->exec('DELETE FROM choixevents');

?>