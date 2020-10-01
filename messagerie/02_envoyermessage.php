<?php
$destinataires = '';
// Menu déroulant en fonction des autres joueurs :    
$reponse = $bd->prepare('SELECT id, pseudo FROM c_utilisateurs WHERE NOT id = ?');
$reponse->execute(array($_SESSION['id']));
while ($donnees = $reponse->fetch())
  {
  $destinataires .= '<option value="'.$donnees['id'].'">'. $donnees['pseudo'].'</option>';
  }

echo '<form method="post" action="script/envoyermessage.php"><p>';
echo '<input type="text" name="titre" id="titre" placeholder="titre du message"';
if (isset($_SESSION['titre']))
    {
    echo 'value="'.$_SESSION['titre'].'"';
    }
echo 'size="25" maxlength="80" />';
echo ' <select name="destinataire" id="destinataire"><option value="0" selected disabled> Destinataire</option>';
echo $destinataires;
echo '</select> <input type="submit" value="Envoyer" /></br>';
echo '<textarea rows="4" cols="50" name="textemessage" placeholder="Composer votre message ici.">';
if (isset($_SESSION['message']))
    {
    echo $_SESSION['message'];
    }
echo '</textarea></p></form>';
?>