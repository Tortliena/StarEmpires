<?php

$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES ( ? , ? , 'Capitale')" ); 

// Chercher les joueurs en crise économique.
$reponse = $bdg->query('SELECT id FROM utilisateurs WHERE biens = 0 ORDER BY id');
while ($donnees = $reponse->fetch())
    {
    $message ->execute(array($donnees['id'] ,'Crise éconimique ! Bon, c\'est pas encore codé, mais cela va venir !' , )); 
    }

?>