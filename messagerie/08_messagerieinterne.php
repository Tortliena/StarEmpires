<?php
$reqmessagerecusinterne = $bd->prepare('SELECT * FROM c_messagerieinterne
                                        WHERE destinataire = ?');

$a = 0; // Permet de faire apparaitre une seule fois <h2>Messages internes :</h2>
$reqmessagerecusinterne->execute(array($_SESSION['id']));
while ($repmessagerecusinterne  = $reqmessagerecusinterne ->fetch())
  {
  if ($a == 0)
    {
    echo '<h2>Messages internes :</h2>';
    }
  $a++;
  echo '<form method="post" action="script/supprimermessageinterne.php">';
  if ($repmessagerecusinterne['lu']==0)
    {
    echo '<span class = "nvmessage">Nouveau</span>';
    }
  echo '<span class="messagerie">Expéditeur</span> :';
  echo $repmessagerecusinterne['expediteur'].' <span class="messagerie">Titre</span> : '.$repmessagerecusinterne['titre'];
  echo '<input type="hidden" name="idmessage" value="'.$repmessagerecusinterne['idmessagerieinterne'].'">';
  echo ' <input type="submit" value="Supprimer" /></form>';

  if (isset($_GET["idi"]) AND $_GET["idi"] == $repmessagerecusinterne['idmessagerieinterne'])
    {
    echo '<br><div class="messagemessagerie">'.$repmessagerecusinterne['texte'].'</div><br>';
    if ($repmessagerecusinterne['lu'] == 0)
      {
      $reqmarquercommelu = $bd->prepare('UPDATE c_messagerieinterne SET lu = ? WHERE idmessagerieinterne = ?');
      $reqmarquercommelu->execute(array(1, $_GET["idi"]));
      }
    }
  else
    {
    echo '<form method="post" action="messagerie.php?idi='.$repmessagerecusinterne['idmessagerieinterne'].'"> <input type="submit" value="Voir" /></form><br>';
    }
  }

  
?>