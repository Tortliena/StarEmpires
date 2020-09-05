<?php
/* session_start();
include("../include/bddconnection.php");
*/

$reqcreerlimite = $bd->prepare('INSERT INTO c_limiteplanete(idlimiteplanete) VALUES(?)');
$reqplanetesanslimite = $bd->query('SELECT p.idplanete FROM c_planete p LEFT JOIN c_limiteplanete l ON p.idplanete = l.idlimiteplanete WHERE l.idlimiteplanete IS NULL');
while ($repplanetesanslimite = $reqplanetesanslimite->fetch())
    {
    $reqcreerlimite->execute(array($repplanetesanslimite['idplanete']));
    }

// Vider la table de messages du tour.
$bd->exec('DELETE FROM c_messagetour');

// Vider la table de variation du tour.
$bd->exec('DELETE FROM c_variationstour');

// Vider la table des rapport de combat
$bd->exec('DELETE FROM c_rapportcombat');
?>