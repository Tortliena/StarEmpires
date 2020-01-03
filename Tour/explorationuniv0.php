<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

// Tour en cours : $touractuel['id']
$reponse = $bdd->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1');
$touractuel = $reponse->fetch();
$reponse->closeCursor();
// echo $touractuel['id'] . '</br>'; 

// Compter le nombre de case explorées et seulement celles AVANT et du joueur.
$reqexploration = $bdd->prepare('SELECT idexplore , x , y, univers, idexplorateur FROM explore WHERE tourexploration = ?');
$reqcompterexplo = $bdd->prepare('SELECT COUNT(*) AS nbcaseexplo  FROM explore WHERE idexplorateur = ? AND idexplore <= ? ') ; 
$reqmessageinterne = $bdd->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
$reqcreerasteroides = $bdd->prepare('INSERT INTO champsasteroides (xaste , yaste , uniaste, biensaste, titaneaste) VALUES (?, ?, ?, ?, ?)');
$reqcreerplanete = $bdd->prepare('INSERT INTO planete(xplanete, yplanete, universplanete) VALUES(:xplanete, :yplanete, :universplanete)');


// Permet de traiter les explorations du tour.
$reqexploration->execute(array($touractuel['id']));
while ($repexplorationexistante = $reqexploration->fetch())
  {
    // Permet de compter le nombre d'exploration ayant eu lieu.
    $reqcompterexplo->execute(array($repexplorationexistante['idexplorateur'],  $repexplorationexistante['idexplore']));
    $repcompterexplo = $reqcompterexplo->fetch();
    
    // Impact en fonction du nb de case explorée.
    switch ($repcompterexplo['nbcaseexplo'])
    { 
        case 1:
            $reqmessageinterne->execute(array('Équipe scientifique', $repexplorationexistante['idexplorateur'], 0, 'Première sortir du système solaire', 'Notre premier vaisseau vient de sortir du système solaire. Il y a une grande quantité de poussière stellaire et on ne peut décerner des objets qu\'a une distance de quelques minutes\-lumière'));
        break;
        
        case 2:
        break;

        case 3:
            $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.'));
            $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 5, 0));
        break;

        case 4:
        break;

        case 5:
        break;

        case 6:     
            $reqcreerplanete->execute(array(
                'xplanete'=> $repexplorationexistante['x'],
                'yplanete'=> $repexplorationexistante['y'],
                'universplanete'=> $repexplorationexistante['univers']));
        break;

        case 7:
            $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.'));
            $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 0, 3));   
        break;

        case 8:
            
        break;

        case 9:
            
        break;

        case 10:
            
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