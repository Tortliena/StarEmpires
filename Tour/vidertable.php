<?php
/* session_start();
include("../include/BDDconnection.php");
*/

$reqcreervariation = $bdg->prepare('INSERT INTO limiteplanete(idlimiteplanete) VALUES(?)');
$reqplanetesansvariation = $bdg->query('SELECT p.idplanete FROM planete p LEFT JOIN limiteplanete l ON p.idplanete = l.idlimiteplanete WHERE l.idlimiteplanete IS NULL');
while ($repplanetesansvariation = $reqplanetesansvariation->fetch())
    {
    $reqcreervariation->execute(array($repplanetesansvariation['idplanete']));
    }

// Vider la table de messages du tour.
$bdg->exec('DELETE FROM messagetour');

// Vider la table de variation du tour.
$bdg->exec('DELETE FROM variationstour');

// Vider la table des évènements en cours
$bdg->exec('DELETE FROM choixevents');

?>