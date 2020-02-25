<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

$applicationvariationdutour = $bdg->prepare("	UPDATE utilisateurs SET biens = 
												(CASE WHEN (biens < ?) THEN 0 ELSE (biens - ?) END)
												where id = ? ");
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess) VALUES ( ? , ? , ?)" ); 

$reqcounterpoppouvantchanger = $bdg->prepare("COUNT (*) AS nb FROM population
                                WHERE joueurpop = ?
                                AND
                                ((typepop <> 1 AND typepoparrivee <> 1)
                                OR
                                typepoparrivee > 1)
                                ");
                                             
$requpdatepop = $bdg->prepare(" UPDATE population SET typepoparrivee = 1
                                WHERE joueurpop = ?
                                AND
                                ((typepop <> 1 AND typepoparrivee <> 1)
                                OR
                                typepoparrivee > 1)
                                ORDER BY RAND()
                                LIMIT ?"); 

// Ajout au stock actuel.
$reqinfojoueur = $bdg->query('SELECT idjoueur, prodbiens, consobiens FROM variationstour');
while ($repinfojoueur = $reqinfojoueur->fetch())
    {
    $gain = 0;
    $nombredepopaconvertir = 0;
    $nombredepopconverti = 0;
    
    $variation = $repinfojoueur['consobiens'] - $repinfojoueur['prodbiens'] ; 
    if ($variation <= 0) 
        { //  Cas d'une crise economique :
        $nombredepopaconvertir = floor(-$variation/50) + 1;
        
        $reqcounterpoppouvantchanger->execute(array($repinfojoueur['idjoueur']));
        $repcounterpoppouvantchanger = $reqcounterpoppouvantchanger->fetch();
        
        $nombredepopconverti = floor(min($nombredepopaconvertir, $repcounterpoppouvantchanger['nb']));
        
        $gain = $nombredepopconverti * 50;
        $variation = $variation - $gain; // negatif voulu. La variation s'applique en soustraction.
        
        // Changer des pops dans les cas :
        // 1) la pop de depart nest pas citoyenne et la pop darrivee n'est pas citoyen aussi
        // 2) La pop darrivee n'est pas citoyen ou rien.
        $requpdatepop->execute(array($repinfojoueur['idjoueur'], $nombredepopconverti));
        
        // Envoyer un message explicatif
        $mess = 'Crise éconimique ! Une partie de votre population redevient citoyenne et vous gagnez ' . $gain . ' de biens en compensation.' ; 
        $message ->execute(array($repinfojoueur['idjoueur'], $mess, 'capitale')); 
        }
    $applicationvariationdutour->execute(array($variation, $variation, $repinfojoueur['idjoueur']));
    }
$reponse->closeCursor();
?>