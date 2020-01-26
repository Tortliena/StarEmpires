<?php
/* session_start();
include("../script/BDDconnection.php");
*/

// Vider la table de messages du tour.
$bdg->exec('DELETE FROM messagetour');

// Vider la table de variation du tour.
$bdg->exec('DELETE FROM variationstour');

// Vider la table des évènements en cours
$bdg->exec('DELETE FROM choixevents');

?>