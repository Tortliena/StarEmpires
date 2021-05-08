<?php
echo '</br><h2>Messages envoyés :</h2>';

$reqmessageenvoye = $bd->prepare('SELECT * FROM c_messagerie WHERE idjoueuremetteur = ? AND supprimeemetteur = 0'); 
$reqmessageenvoye ->execute(array($_SESSION['id']));
while ($repmessageenvoye  = $reqmessageenvoye ->fetch())
    {
    $reqpseudo ->execute(array($repmessageenvoye['idjoueurrecepteur']));
    $reppseudo  = $reqpseudo ->fetch();
    echo '<form method="post" action="script/supprimermessage.php">';
    echo '<span class="nonlu">';
    if ($repmessageenvoye['lu']==0)
        {echo 'non lu' ; }
    else
        {echo 'lu' ; }  
    echo '</span>';
    echo '<span class="messagerie">Destinataire</span> : '.$reppseudo['pseudo'];
    echo ' <span class="messagerie">Titre</span> : '.$repmessageenvoye['titremessage'];
    echo ' <span class="messagerie">Date</span> : '.$repmessageenvoye['datemessage'];
    echo '<input type="hidden" name="idmessage" value="'.$repmessageenvoye['idmessagerie'].'">';
    echo '&nbsp;<input type="submit" value="Supprimer" /></form>';
    
    if (isset($_GET["ide"]) AND $_GET["ide"] == $repmessageenvoye['idmessagerie'])
        {
        echo '<br><div class="messagemessagerie">'.$repmessageenvoye['textemessagerie'].'</div><br>';
        }
    else
        {
        echo '&nbsp;<form method="post" action="messagerie.php?ide='.$repmessageenvoye['idmessagerie'].'"> <input type="submit" value="Voir" /></form><br>';
        }
    }
?>