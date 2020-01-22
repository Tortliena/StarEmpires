<?php
// Dans chacun des autres includes, nous avons des commentaires ajoutés dans $Commentairestour. Ici, nous introduisons le tour dans la bdd.
$reponse = $bdd->query('SELECT MAX(id) FROM tour');
$donnees = $reponse->fetch(); 

$req = $bdd->prepare('UPDATE tour SET resume = :commentaire where id = :numdutour');
$req->execute(array(
	'commentaire' => $Commentairestour,
	'numdutour' => $donnees[0],
	));
?>