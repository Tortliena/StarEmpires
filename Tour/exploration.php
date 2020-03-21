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
$reqcreerplanete = $bdg->prepare('INSERT INTO planete(xplanete, yplanete, universplanete, taille, lune, biens) VALUES(?, ?, ?, ?, ?)'); 
 
// Créer vaisseau 
$reqcreervaiseau = $bdg->prepare('INSERT INTO vaisseau(idjoueurvaisseau, x, y, univers, nomvaisseau, HPmaxvaisseau, HPvaisseau) VALUES(?, ?, ?, ?, ?, ?, ?)'); 
$reqinfovaisseau = $bdg->prepare('SELECT idvaisseau FROM vaisseau ORDER BY idvaisseau DESC LIMIT 1'); 
$reqcreercomposant = $bdg->prepare('INSERT INTO composantvaisseau(idvaisseaucompo, iditemcomposant, typecomposant) VALUES(?, ?, ?)'); 
$reqcreerordredeplacement = $bdg->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement, xdestination, ydestination, universdestination, idjoueurduvaisseau, typeordre, bloque) VALUES(?, ?, ?, ?, ?, ?, ?)'); 
$reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?'); 
 
$reqinfovaisseauexplorateur = $bdg->prepare('SELECT idvaisseau FROM vaisseau WHERE x = ? AND y = ? AND univers = ?'); 
  
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
              $reqcreerplanete->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 4, 1, 10)); 
                $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Planète habitable', 'Nous venons de trouver une nouvelle planète. Nous allons pouvoir la coloniser. Elle dispose aussi d\'une lune sur laquelle nous allons pouvoir installer une base en déployant d\'énormes ressources. Nous devrions commencer les recherches pour développer l\'équipement nécessaire.'));    
            break; 
 
            case 10: 
                $reqmessageinterne->execute(array('Vaisseau d\'exploration', $repexplorationexistante['idexplorateur'], 0, 'Vaisseau inconnu détecté', 'Nous venons de trouver un vaisseau inconnu. Nous avons tenté de communiquer avec lui, mais aucune réaction de sa part. Il est en très mauvais état et semble abandonné depuis des siècles. Nous allons tenter de l\'aborder.')); 
                 
                $reqinfovaisseauexplorateur->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'])); 
                $repinfovaisseauexplorateur = $reqinfovaisseauexplorateur->fetch(); 
 
                $reqsupprimerordreprecedent->execute(array($repinfovaisseauexplorateur['idvaisseau'])); 
                $reqcreerordredeplacement->execute(array($repinfovaisseauexplorateur['idvaisseau'], $repexplorationexistante['x'], $repexplorationexistante['y'], 0, $repexplorationexistante['idexplorateur'], 8 ,2)); 
 
                // Type vaisseau 2 = vaisseau spécifique qui lache un noyau transdimentionnel. 
                $reqcreervaiseau->execute(array(0, 2, $repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 'Épave spatiale', 20, 20)); 
                $reqinfovaisseau->execute(array()); 
                $repinfovaisseau = $reqinfovaisseau->fetch(); 
 
                $reqcreercomposant->execute(array($repinfovaisseau['idvaisseau'], 13, 'arme')); 
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
   /* // Supprimer cette partie ?
   else 
        { // Exploration hors univers initial. 
        $ValeurPoid = array(1=>80, 2=>10, 3=>10, 4=>5); 
        $tructrouve = nombrealeatoireavecpoid($ValeurPoid); 
        switch ($tructrouve) 
            {  
            case 1: // Chance de trouver rien. 
            break; 
            
            case 2: // Chance de trouver plein de biens. 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 10)); 
            break; 
             
            case 3: // Chance de trouver un peu de biens et de titane. 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 2)); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 8, 3)); 
            break; 
 
            case 4: // Chance de trouver beaucoup de titane et un peu de biens. 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 6, 4)); 
                $reqcreerasteroides->execute(array($repexplorationexistante['x'], $repexplorationexistante['y'], $repexplorationexistante['univers'], 8, 10)); 
            break; 
            } 
        } */
    }