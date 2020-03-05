<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

function commentairecroissancedelapopdebut(&$Commentairestour)
    {
    $Commentairestour .= '</br> Début de la croissance des pop';
    }
commentairecroissancedelapopdebut($Commentairestour);

$reqcompterpop = $bdg->prepare('SELECT COUNT(*) AS nbpopulation FROM population WHERE idplanetepop = ?');
$creationpop = $bdg->prepare('INSERT INTO population (idplanetepop) VALUES (?)');
$message = $bdg->prepare("INSERT INTO messagetour (idjoumess , message , domainemess, numspemessage) VALUES (?, ?, ?, ?)") ; 

// Gerer les planetes une par une.
$reqgestionplanete = $bdg->query('SELECT    l.popmax, pl.idjoueurplanete, p.idplanetepop,
                                            COUNT(*) AS population
                                            FROM population AS p
                                            INNER JOIN limiteplanete AS l ON p.idplanetepop = l.idlimiteplanete
                                            INNER JOIN planete AS pl ON p.idplanetepop = pl.idplanete
                                            GROUP BY p.idplanetepop');
while ($repgestionplanete = $reqgestionplanete->fetch())
    {
    if ($repgestionplanete['popmax'] > $repgestionplanete['population'])
        {
        $popenplus = rand(1, 100) ;
        if ($popenplus > 90) // change d'avoir une pop de plus : 10% de chance d'avoir une pop de plus !
            {
            $creationpop ->execute(array($repgestionplanete['idplanetepop']));
            $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Une nouvelle population vient d\'apparaitre sur votre planète.', 'planete', $repgestionplanete['idplanetepop']));
            }
        else
            {
            $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Vous disposez de la place nécessaire pour accueillir une nouvelle population qui devrait arriver prochainement.', 'planete', $repgestionplanete['idplanetepop']));
            }
        }
    elseif ($repgestionplanete['tailleeffective'] > $nbdepopulation['population'])
        {
        $message ->execute(array($repgestionplanete['idjoueurplanete'], 'Votre population ne pouvait pas grandir faute de place.', 'planete', $repgestionplanete['idplanetepop']));
        }

    }

function commentairecroissancedelapopfin(&$Commentairestour)
    {
    $Commentairestour .= '</br> Fin de la croissance des pop';
    }
commentairecroissancedelapopfin($Commentairestour);
?>