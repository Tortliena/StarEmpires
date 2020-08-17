<?php
// Dans chacun des autres includes, nous avons des commentaires ajoutés dans $Commentairestour. Ici, nous introduisons le tour dans la bdd.
$reponse = $bda->query('SELECT MAX(id) FROM tour');
$donnees = $reponse->fetch();

$Commentairestour .= '<br>Fin du tour.';

$req = $bda->prepare('UPDATE tour SET resume = ? where id = ?');
$req->execute(array($Commentairestour, $donnees[0]));
?>