<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$valeurpopdansprestige = variable(13);
$prestigetiredechaqueplanete = variable(14);
$partduprestigeenvoyeverslesuzerain = variable(15);

// Liste des requêtes pour gérer le prestige et le niveau des planètes :
$reqgestionplanete = $bd->prepare(' SELECT COUNT(*) AS population
                                    FROM c_population AS p
                                    INNER JOIN c_planete AS pl ON p.idplanetepop = pl.idplanete
                                    WHERE pl.idplanete = ?');

$reqMAJplanete = $bd->prepare('UPDATE c_planete SET prestige = ? , prestigeobjectif = ? WHERE idplanete = ?');

$reqplanetesvassales = $bd->prepare('SELECT COUNT(*) AS nbdeplanete, SUM(prestige) AS prestigevassaux FROM c_planete WHERE idplanetesuzerain = ?');

$reqprestigeetniveau = $bd->query('SELECT * FROM c_planete ORDER BY niveauplanete ASC');
while ($repprestigeetniveau= $reqprestigeetniveau->fetch())
    { // Boucle qui permet de gérer les planètes une par une.
    $prestigeobjectif = 0;

    $reqgestionplanete->execute(array($repprestigeetniveau['idplanete']));
    $repgestionplanete = $reqgestionplanete->fetch();
    
    // Chaque pop apporte un gain de prestige selon une variable définie dans la table des variables du jeu (13).
    $prestigeobjectif = $prestigeobjectif + $valeurpopdansprestige*$repgestionplanete['population'];

    // Mettre un bonus pour les pop spéciales ? ABCDE

    $reqplanetesvassales->execute(array($repprestigeetniveau['idplanete']));
    $repplanetesvassales = $reqplanetesvassales->fetch();

    if($repplanetesvassales['nbdeplanete'] > 0)
        {
        echo 'Valeur du prestige des planètes vassales : '.$repplanetesvassales['prestigevassaux'].'<br>';
        //Chaque planete vassale apporte une valeur fixe de prestige + une part de son prestige.
        $prestigeobjectif = $prestigeobjectif + $repplanetesvassales['nbdeplanete']*$prestigetiredechaqueplanete + $repplanetesvassales['prestigevassaux']*$partduprestigeenvoyeverslesuzerain/100;
        }
    
    //Le fait d'avoir un suzerain fait chuter le prestige maximal de quelque %. Voir variable 15.
    if ($repprestigeetniveau['idplanetesuzerain'] > 0)
        {
        $prestigeobjectif = (100-$partduprestigeenvoyeverslesuzerain)*$prestigeobjectif/100;
        }

    $nouveauprestige = $repprestigeetniveau['prestige'] + ($prestigeobjectif - $repprestigeetniveau['prestige'])/40;
    $reqMAJplanete->execute(array($nouveauprestige, $prestigeobjectif, $repprestigeetniveau['idplanete'])); 
    }
?>