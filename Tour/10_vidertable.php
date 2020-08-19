<?php
/* session_start();
include("../include/BDDconnection.php");
*/

$reqcreerlimite = $bdg->prepare('INSERT INTO limiteplanete(idlimiteplanete) VALUES(?)');
$reqplanetesanslimite = $bdg->query('SELECT p.idplanete FROM planete p LEFT JOIN limiteplanete l ON p.idplanete = l.idlimiteplanete WHERE l.idlimiteplanete IS NULL');
while ($repplanetesanslimite = $reqplanetesanslimite->fetch())
    {
    $reqcreerlimite->execute(array($repplanetesanslimite['idplanete']));
    }

// Vider la table de messages du tour.
$bdg->exec('DELETE FROM messagetour');

// Vider la table de variation du tour.
$bdg->exec('DELETE FROM variationstour');

// Vider la table des évènements en cours
$bdg->exec('DELETE FROM choixevents');

// Vider la table des évènements en cours
$bdg->exec('DELETE FROM rapportcombat');

?>