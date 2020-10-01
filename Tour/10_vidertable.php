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

if ($tourrestraint == 'non')
    {
    // Vider la table de messages du tour.
    $reqdeletemessagetour = $bd->query('DELETE FROM c_messagetour');

    // Vider la table de variation du tour.
    $reqdeletevariations = $bd->query('DELETE FROM c_variationstour');

    // Vider la table des rapport de combat
    $reqdeleterapportcombat = $bd->query('DELETE FROM c_rapportcombat');
    }
else
    {
    // Vider la table de messages du tour.
    $reqdeletemessagetour = $bd->prepare('DELETE FROM c_messagetour WHERE idjoumess = ?');
    $reqdeletemessagetour->execute(array($_SESSION['id']));

    // Vider la table de variation du tour.
    $reqdeletevariations = $bd->query('DELETE FROM c_variationstour WHERE idplanetevariation IN ('.$idplanetes.')');

    // Vider la table des rapport de combat
    $reqdeleterapportcombat = $bd->prepare('DELETE FROM c_rapportcombat WHERE texteattaquant = ? OR textedefenseur = ?');
    $reqdeleterapportcombat->execute(array($_SESSION['id'], $_SESSION['id']));
    }
?>