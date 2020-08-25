<?php 
/* 
session_start(); 
include("../include/BDDconnection.php"); 
*/ 
 
// Tour en cours : $touractuel['id'] 
$reponse = $bda->query('SELECT id FROM tour ORDER BY id DESC LIMIT 1'); 
$touractuel = $reponse->fetch(); 
 
// Compter le nombre de case explorées et seulement celles AVANT et du joueur. 
$reqexploration = $bdg->prepare('SELECT idexplore , x , y, univers, idexplorateur FROM explore WHERE tourexploration = ?'); 
$reqcompterexplo = $bdg->prepare('SELECT COUNT(*) AS nbcaseexplo  FROM explore WHERE idexplorateur = ? AND idexplore <= ? AND univers > 0') ; 
 
$reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)'); 
$reqcreerasteroides = $bda->prepare('INSERT INTO champsasteroides (xaste , yaste , uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)');
$reqcreerplanete = $bdg->prepare('INSERT INTO planete(xplanete, yplanete, universplanete, taille, lune, biens, environnement) VALUES(?, ?, ?, ?, ?, ?, ?)'); 

// Créer vaisseau 
$reqcreervaisseau = $bdg->prepare('INSERT INTO vaisseau(idflottevaisseau, nomvaisseau, HPmaxvaisseau, HPvaisseau) VALUES(?, ?, ?, ?)');
$reqcreerflotte = $bdg->prepare('INSERT INTO flotte (idplaneteflotte, universflotte, xflotte, yflotte, nomflotte) VALUES(?, ?, ?, ?, ?)');          
$reqinfovaisseau = $bdg->prepare('SELECT idvaisseau FROM vaisseau ORDER BY idvaisseau DESC LIMIT 1'); 
$reqcreercargo = $bdg->prepare('INSERT INTO cargovaisseau(idvaisseaucargo, typeitems, quantiteitems) VALUES(?, ?, ?)');

$reqcreerordredeplacement = $bdg->prepare('UPDATE flotte SET xdestination = ?, ydestination = ?, typeordre = ?, bloque = ? WHERE idflotte = ? '); 
$reqcreercomposant = $bdg->prepare('INSERT INTO composantvaisseau(idvaisseaucompo, iditemcomposant, typecomposant) VALUES(?, ?, ?)');

$reqinfoflotteexplorateur = $bdg->prepare('SELECT idflotte FROM flotte WHERE xflotte = ? AND yflotte = ? AND universflotte = ?'); 

// Permet de traiter les explorations du tour. 
$reqexploration->execute(array($touractuel['id'])); 
while ($repexplorationexistante = $reqexploration->fetch()) 
    { 
    if ($repexplorationexistante['univers'] > 0) 
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
            case 3: 
                $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.')); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 5)); 
            break; 
 
            case 6:      
                $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Champ d\'astéroides exploitables', 'Nous venons de détecter un champs d\'astéroides et il semble qu\'il est possible d\'exploiter ces ressources. Ils regorge de ressources précieuses et nous pourrions en tirer un grand bénéfice.')); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 8, 1)); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 2)); 
            break; 
 
            case 7:
                $reqcreerplanete->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 4, 1, 10, -1500)); 
                $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Planète habitable', 'Nous venons de trouver une nouvelle planète. Nous allons pouvoir la coloniser. Elle dispose d\'astre dans son orbite que nous appellons lune en astronomie. De plus, il semble que cette planète ait subit une destruction massive suite à l\'impact d\'un asteroide il y a des siècles. Si nous voulons la coloniser, nous allons devoir déployer d\'énormes ressources. Nous devrions commencer les recherches pour développer l\'équipement nécessaire.'));    
            break;
 
            case 10:
                $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Vaisseau inconnu détecté', 'Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder.'));
                
                // Permet de recupere l'ID de la flotte.
                $reqinfoflotteexplorateur->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'])); 
                $repinfoflotteexplorateur = $reqinfoflotteexplorateur->fetch();

				// On supprime ses ordres a la place on met un ordre bloque.
                $reqcreerordredeplacement->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], 8 ,2, $repinfoflotteexplorateur['idflotte']));

                // On cree un vaisseau alien.
                $reqcreerflotte->execute(array(0, $repexplorationexistante['univers'], $repexplorationexistante['x'], $repexplorationexistante['y'], 'Épave spatiale'));
                $IDflottealien = $bdg->lastInsertId();
                $reqcreervaisseau->execute(array($IDflottealien, 'Épave spatiale', 20, 20));
                $IDduvaisseaualien = $bdg->lastInsertId();
                $reqcreercomposant->execute(array($IDduvaisseaualien, 13, 'arme'));
                $reqcreercargo->execute(array($IDduvaisseaualien, 18, 1));
                $reqcreercargo->execute(array($IDduvaisseaualien, 16, 1));
            break; 
 
            case 11: 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 5)); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 8, 1)); 
            break; 
 
            case 15: 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 2)); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 8, 4)); 
            break; 
 
            case 18: 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 10)); 
            break; 
 
            case 23: 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 10)); 
            break; 
            } 
        } 
    }