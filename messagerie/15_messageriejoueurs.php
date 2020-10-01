<?php
$reqpseudo = $bd->prepare('SELECT pseudo FROM c_utilisateurs WHERE id = ?');

echo '<h2>Messages recus :</h2>';
$reqmessagerecus = $bd->prepare('   SELECT * FROM c_messagerie
                                    WHERE idjoueurrecepteur = ? AND supprimerecepteur = 0');
$reqmessagerecus ->execute(array($_SESSION['id']));
while ($repmessagerecus  = $reqmessagerecus ->fetch())
    {
    $reqpseudo ->execute(array($repmessagerecus['idjoueuremetteur']));
    $reppseudo  = $reqpseudo ->fetch();

    echo '<form method="post" action="script/supprimermessage.php">';
    if ($repmessagerecus['lu']==0)
        {
        echo '<span class = "nvmessage">Nouveau</span>';
        }
    echo '<span class="messagerie">Expéditeur</span> :'.$reppseudo['pseudo'];
    echo ' <span class="messagerie">Titre</span> : '.$repmessagerecus['titremessage'];
    echo '<span class="messagerie">Date</span> : '.$repmessagerecus['datemessage'];
    echo '<input type="hidden" name="idmessage" value="'.$repmessagerecus['idmessagerie'].'">';
    echo ' <input type="submit" value="Supprimer" /></form>';

    if (isset($_GET["ide"]) AND $_GET["ide"] == $repmessagerecus['idmessagerie'])
        {
        echo '<br><div class="messagemessagerie">'.$repmessagerecus['textemessagerie'].'</div><br>';
        if ($repmessagerecus['lu'] == 0)
            {
            $reqmarquercommelu = $bd->prepare('UPDATE c_messagerie SET lu = ? WHERE idmessagerie = ?');
            $reqmarquercommelu->execute(array(1, $_GET["ide"]));
            }
        }
    else
        {
        echo '<form method="post" action="messagerie.php?ide='.$repmessagerecus['idmessagerie'].'"> <input type="submit" value="Voir" /></form><br>';
        }
    }
?>