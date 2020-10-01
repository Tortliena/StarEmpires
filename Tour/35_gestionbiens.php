<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$applicationvariationdutour = $bd->prepare("UPDATE c_planete SET biens = 
                                            (CASE WHEN (biens < ?) THEN 0 ELSE (biens - ?) END)
                                            where idplanete = ? ");

$message = $bd->prepare("INSERT INTO c_messagetour(idjoumess, message, domainemess, numspemessage) VALUES ( ? , ? , ?, ?)"); 

// Changer des pops dans les cas :
// 1) la pop de depart nest pas citoyenne et la pop darrivee n'est pas citoyen aussi
// 2) La pop darrivee n'est pas citoyen ou rien.
$reqcounterpoppouvantchanger = $bd->prepare("   SELECT COUNT(*) AS nb FROM c_population
                                                WHERE idplanetepop = ? AND
                                                ((typepop <> 1 AND typepoparrivee <> 1) OR typepoparrivee > 1 )");
                                             
$requpdatepop = $bd->prepare("  UPDATE c_population SET typepoparrivee = 1
                                WHERE idplanetepop = ? AND
                                ((typepop <> 1 AND typepoparrivee <> 1) OR typepoparrivee > 1)
                                ORDER BY RAND() LIMIT 1");

$variationdutour = $bd->prepare('UPDATE c_variationstour SET coutstockage = ? where idplanetevariation = ?');

// Ajout au stock actuel.
if ($tourrestraint == 'non')
    {
    $reqinfoplanete = $bd->query('SELECT v.idplanetevariation, v.prodbiens, v.consobiens, v.entretien, p.biens, p.idjoueurplanete  
    FROM c_planete p INNER JOIN c_variationstour v ON v.idplanetevariation = p.idplanete ORDER BY p.idplanete');
    }
else
    {
    $reqinfoplanete = $bd->query('SELECT v.idplanetevariation, v.prodbiens, v.consobiens, v.entretien, p.biens, p.idjoueurplanete  
    FROM c_planete p INNER JOIN c_variationstour v ON v.idplanetevariation = p.idplanete WHERE p.idplanete IN ('.$idplanetes.') ORDER BY p.idplanete');
    }

while ($repinfoplanete = $reqinfoplanete->fetch())
    {      
    $gain = 0;
    $nombredepopaconvertir = 0;
    $nombredepopconverti = 0;

    $variation = $repinfoplanete['consobiens'] + $repinfoplanete['entretien'] - $repinfoplanete['prodbiens'] ; 
     
    if ($repinfoplanete['biens'] - $variation <= 0) 
        { //  Cas d'une crise economique :
        $nombredepopaconvertir = floor(-($repinfoplanete['biens'] - $variation)/50) + 2;
        
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
        $message ->execute(array($repinfoplanete['idjoueurplanete'], $mess, 'planete', $repinfoplanete['idplanetevariation'])); 
        }
    else
    	{ // On a assez de bien, donc on applique le cout de stockage. 
        $pourcentstockage = variable(1); // Permet de récupérer les couts de stockages en %.
        
        $coutstockage = ($repinfoplanete['biens'] - $variation) * $pourcentstockage[0] / 100 ;
        $coutstockage2 = floor($coutstockage);

		$variationdutour->execute(array($coutstockage, $repinfoplanete['idplanetevariation']));

        $variation = $variation + $coutstockage ;
        }

    $applicationvariationdutour->execute(array($variation, $variation, $repinfoplanete['idplanetevariation']));
    }
?>