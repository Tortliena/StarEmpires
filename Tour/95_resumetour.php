<?php
// Dans chacun des autres includes, nous avons des commentaires ajoutés dans $Commentairestour. Ici, nous introduisons le tour dans la bdd.
$reponse = $bd->query('SELECT MAX(id) FROM c_tour');
$donnees = $reponse->fetch();

$Commentairestour .= '<br>Fin du tour.';

$req = $bd->prepare('UPDATE c_tour SET resume = ? where id = ?');
$req->execute(array($Commentairestour, $donnees[0]));
?>