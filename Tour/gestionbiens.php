<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$applicationvariationdutour = $bdg->prepare("   UPDATE planete SET biens = 
                                                (CASE WHEN (biens < ?) THEN 0 ELSE (biens - ?) END)
                                                where id = ? ");

$reqbien = $bdg->prepare("SELECT biens FROM planete WHERE idplanete = ?");

$message = $bdg->prepare("INSERT INTO messagetour (idjoumess, message, domainemess, numspemessage) VALUES ( ? , ? , ?, ?)"); 

// Changer des pops dans les cas :
// 1) la pop de depart nest pas citoyenne et la pop darrivee n'est pas citoyen aussi
// 2) La pop darrivee n'est pas citoyen ou rien.
$reqcounterpoppouvantchanger = $bdg->prepare("SELECT COUNT(*) AS nb FROM population
                                WHERE idplanetepop = ?
                                AND ((typepop <> 1 AND typepoparrivee <> 1)
                                    OR typepoparrivee > 1 ) ");
                                             
$requpdatepop = $bdg->prepare(" UPDATE population SET typepoparrivee = 1
                                WHERE idplanetepop = ?
                                AND ((typepop <> 1 AND typepoparrivee <> 1)
                                    OR typepoparrivee > 1)
                                ORDER BY RAND() LIMIT 1"); 

// Ajout au stock actuel.
$reqinfoplanete = $bdg->query('SELECT idplanetevariation, prodbiens, consobiens FROM variationstour');
while ($repinfoplanete = $reqinfoplanete->fetch())
    {
    $gain = 0;
    $nombredepopaconvertir = 0;
    $nombredepopconverti = 0;
    
    $reqbienutilisateur->execute(array($repinfoplanete['idplanetevariation']));
    $repbienutilisateur = $reqbienutilisateur->fetch(); 

    $variation = $repinfoplanete['consobiens'] - $repinfoplanete['prodbiens'] ; 
     
    if ($repbien['biens'] - $variation <= 0) 
        { //  Cas d'une crise economique :
        $nombredepopaconvertir = floor(-($repbien['biens'] - $variation)/50) + 2;
        
        $reqcounterpoppouvantchanger->execute(array($repinfoplanete['idplanetevariation']));
        $repcounterpoppouvantchanger = $reqcounterpoppouvantchanger->fetch();
        
        $nombredepopconverti = floor(min($nombredepopaconvertir, $repcounterpoppouvantchanger['nb']));
        $gain = $nombredepopconverti * 50;
        $variation = $variation - $gain; // negatif voulu. La variation s'applique en soustraction.

        for ($ndfois = 1; $ndfois < $nombredepopconverti; $ndfois++)
            {
            $requpdatepop->execute(array($repinfoplanete['idplanetevariation']));
            }
 
        // Envoyer un message explicatif
        $mess = 'Crise éconimique ! Une partie de votre population redevient citoyenne et vous gagnez ' . $gain . ' de biens en compensation.' ; 
        $message ->execute(array($repinfojoueur['idplanetevariation'], $mess, 'planete', $repinfojoueur['idplanetevariation'])); 
        }
    $applicationvariationdutour->execute(array($variation, $variation, $repinfojoueur['idplanetevariation']));
    }
?>