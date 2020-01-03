<?php
$reqeventencours = $bdd->query('SELECT id FROM utilisateurs WHERE ideventsuivant = 0 ORDER BY id');
$reqmajeventencours = $bdd->prepare('UPDATE utilisateurs SET idevent = ? WHERE id = ?');

$message = $bdd->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES (?, ?, 'capitale')") ; 
$reqmajeventprochain = $bdd->prepare('UPDATE utilisateurs SET ideventsuivant = -? WHERE id = ?');

$creerchoixevent = $bdd->prepare("INSERT INTO choixevents (idjoueurevent, texteevent, Eventsuite1, Textechoix1, Eventsuite2, Textechoix2, Eventsuite3, Textechoix3) VALUES (?, ?, ?, ?, ?, ?, ?, ?)") ; 

while ($repeventencours = $reqeventencours->fetch())
{   // $repeventencours['id'] = id du joueur.
    $a = rand (1,10);
    $reqmajeventencours->execute(array($a, $repeventencours['id']));
    switch ($a)
    {
        case 1:
        	$creerchoixevent->execute(array($repeventencours['id'], 'Il fait beau aujourd\'hui', NULL, NULL, NULL, NULL, NULL, NULL));
        break;
        
        case 2:
        	$creerchoixevent->execute(array($repeventencours['id'], 'Ce soir, gros débat politique à la télé.', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 3:
           	$creerchoixevent->execute(array($repeventencours['id'], 'Il pleut !', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 4:
            $creerchoixevent->execute(array($repeventencours['id'], 'La journée a été longue', NULL, NULL, NULL, NULL, NULL, NULL));

        break;

        case 5:
            $creerchoixevent->execute(array($repeventencours['id'], 'Étoiles filantes prévues.', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 6:
            $creerchoixevent->execute(array($repeventencours['id'], 'On cherche des chercheurs qui trouvent ...', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 7:
            $reqmajeventprochain->execute(array(1, $repeventencours['id']));
            $creerchoixevent->execute(array($repeventencours['id'], 'Un pegu a été chiant. Que voulez-vous faire ?', 1, 'Ne rien faire', 2, 'L\'exécuter', 3, 'l\'exécuter de manière originale'));
        break;

        case 8:
            $creerchoixevent->execute(array($repeventencours['id'], 'event8', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 9:
            $creerchoixevent->execute(array($repeventencours['id'], 'event9', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 10:
            $creerchoixevent->execute(array($repeventencours['id'], 'event10', NULL, NULL, NULL, NULL, NULL, NULL));
        break;

        case 11:
            
        break;

        case 12:
            
        break;

        case 13:
            
        break;

        case 14:
            
        break;

        case 15:
            
        break;

        case 16:
            
        break;

        case 17:
            
        break;

        case 18:
            
        break;

        case 19:
            
        break;

        case 20:
            
        break;

        case 21:
            
        break;

        case 22:
            
        break;

        case 23:
            
        break;

        case 24:
            
        break;

        case 25:
            
        break;
    }
}
?>