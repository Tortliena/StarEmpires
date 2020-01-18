<?php

$reqinfoutilisateur = $bdd->query('SELECT id, ideventsuivant FROM utilisateurs WHERE ideventsuivant != 0 ORDER BY id');
$reqmajeventencours = $bdd->prepare('UPDATE utilisateurs SET idevent = ? WHERE id = ?');

$message = $bdd->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES (?, ?, 'capitale')") ; 
$reqmajeventprochain = $bdd->prepare('UPDATE utilisateurs SET ideventsuivant = ? WHERE id = ?');

$creerchoixevent = $bdd->prepare("INSERT INTO choixevents (idjoueurevent, texteevent, Eventsuite1, Textechoix1, Eventsuite2, Textechoix2, Eventsuite3, Textechoix3) VALUES (?, ?, ?, ?, ?, ?, ?, ?)") ; 

$reqtuerpop = $bdd->prepare("DELETE FROM population WHERE joueurpop = ? LIMIT 1") ; 


while ($repinfoutilisateur = $reqinfoutilisateur->fetch())
{
    $a = 0; // valeur par défaut pour le prochain évent.
    if ($repinfoutilisateur['ideventsuivant'] > 0)
        {$reqmajeventencours->execute(array(-$repinfoutilisateur['ideventsuivant'], $repinfoutilisateur['id']));}
    switch ($repinfoutilisateur['ideventsuivant'])
    {
        case $repinfoutilisateur['ideventsuivant'] < 0; // Si inf à 0, c'est parce que les évent initiateur donne des évents négatifs.
            $a = -$repinfoutilisateur['ideventsuivant']; // Cela permet d'éviter d'exécuter l'évent suivant dans le même tour.
        break; 

        case 1: // Choix event 7
            $creerchoixevent->execute(array($repinfoutilisateur['id'], 'Le pégu qui râlait hier s\'est fatigué et est rentré chez lui', NULL, NULL, NULL, NULL, NULL, NULL));
        break;
        
        case 2: // Choix event 7
            $creerchoixevent->execute(array($repinfoutilisateur['id'], 'Vous avez organisé une exécution publique et le reste de la population est effrayée. Vous devriez avoir la paix pendant quelques temps.', NULL, NULL, NULL, NULL, NULL, NULL));
            $reqtuerpop->execute(array($repinfoutilisateur['id']));
        break;

        case 3: // Choix event 7
            $creerchoixevent->execute(array($repinfoutilisateur['id'], 'Vous avez attaché le pégu qui ralait hier à une fusée géante remplie de feux d\'artifices. Les médias saluent votre sens artistique', NULL, NULL, NULL, NULL, NULL, NULL));
            $reqtuerpop->execute(array($repinfoutilisateur['id']));
        break;

    }
    $reqmajeventprochain->execute(array($a, $repinfoutilisateur['id']));
}
?>