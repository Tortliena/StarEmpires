<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$reqcompterpop = $bd->prepare('SELECT COUNT(*) AS nbpopulation FROM c_population WHERE idplanetepop = ?');
$creationpop = $bd->prepare('INSERT INTO c_population(idplanetepop) VALUES (?)');
$message = $bd->prepare("INSERT INTO c_messagetour(idjoumess, message, domainemess, numspemessage) VALUES (?, ?, ?, ?)") ; 
                               
if ($tourrestraint == 'non')
    {     // Gerer les planetes une par une.
    $reqgestionplanete = $bd->query('   SELECT l.popmax, pl.idjoueurplanete, p.idplanetepop, pl.efficacite, COUNT(*) AS population
    FROM c_population AS p
    INNER JOIN c_limiteplanete AS l ON p.idplanetepop = l.idlimiteplanete
    INNER JOIN c_planete AS pl ON p.idplanetepop = pl.idplanete
    GROUP BY p.idplanetepop');
    }
else
    {
    $reqgestionplanete = $bd->query('   SELECT l.popmax, pl.idjoueurplanete, p.idplanetepop, pl.efficacite, COUNT(*) AS population
    FROM c_population AS p
    INNER JOIN c_limiteplanete AS l ON p.idplanetepop = l.idlimiteplanete
    INNER JOIN c_planete AS pl ON p.idplanetepop = pl.idplanete
    WHERE p.idplanetepop IN ('.$idplanetes.') GROUP BY p.idplanetepop');
    }
while ($repgestionplanete = $reqgestionplanete->fetch())
    {
    if ($repgestionplanete['popmax'] > $repgestionplanete['population'])
        {
        $popenplus = rand(1, 100) ;
        
        $probagraceauxplaceslibres = 2*($repgestionplanete['popmax']  - $repgestionplanete['population']); //+1 par place libre.
        $probdiminueeacausedepopactuelle = round($repgestionplanete['population']/4); // -1 toutes les 4 de pop.
        $probalieealorganisation = $repgestionplanete['efficacite']/20- 5; //+1 par tranche au dessus de 50 d'orga, -1 en dessous.
        
        $probapop = ROUND($probagraceauxplaceslibres - $probdiminueeacausedepopactuelle + $probalieealorganisation) ;
        
        // echo 'La planete '.$repgestionplanete['idplanetepop'].' a une probabilite de croissance de '.$probapop.' et le tirage a donne '.$popenplus.'.<br>';
        if ($popenplus < $probapop) // change d'avoir une pop de plus : 10% de chance d'avoir une pop de plus !
            {
            $creationpop ->execute(array($repgestionplanete['idplanetepop']));
            $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Une nouvelle population vient d\'apparaitre sur votre planète.', 'planete', $repgestionplanete['idplanetepop']));
            // echo 'La planete '.$repgestionplanete['idplanetepop'].' a donc gagne une pop.<br>';
            }
        elseif ($probapop < 0 )
            {
            $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Cette planete n\'a pas la structure pour gagner plus de population. Laissez l\'organisation de ce monde monter ou construisez plus d\'habitations.', 'planete', $repgestionplanete['idplanetepop']));
            // echo 'La planete '.$repgestionplanete['idplanetepop'].' ne peut pas gagner de pop.<br>';
            }
        else
            {
            $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement. (proba : '.$probapop.'%)', 'planete', $repgestionplanete['idplanetepop']));
            // echo 'La planete '.$repgestionplanete['idplanetepop'].' na donc pas gagne de pop.<br>';
            }
        }
    else
        {
        $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Votre population ne pouvait pas grandir faute de place.', 'planete', $repgestionplanete['idplanetepop']));
        }
    }
?>