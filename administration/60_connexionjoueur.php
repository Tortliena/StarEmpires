<?php

$destinataires = '';
// Menu déroulant en fonction des autres joueurs :    
$reponse = $bd->prepare('SELECT id, pseudo FROM c_utilisateurs WHERE niveauadmin < ?');
$reponse->execute(array($replvl['niveauadmin']));
while ($donnees = $reponse->fetch())
  {
  $destinataires .= '<option value="'.$donnees['id'].'">'. $donnees['pseudo'].'</option>';
  }

echo '<h3>Se connecter en tant que :</h3>';
echo '<form action="script\connectionjoueur.php" method="post"><p>';
echo '<select name="destinataire" id="destinataire"><option value="0" selected disabled> Destinataire</option>';
echo $destinataires;
echo '</select> <input type="submit" value="Se connecter" /></p></form>';
?>