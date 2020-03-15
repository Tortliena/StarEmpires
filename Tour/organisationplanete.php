<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqorganisationactuelle = $bdg->prepare('SELECT SUM(organisation) AS orga FROM planete WHERE idjoueurplanete = ? ');

$reqplanetebesoinorga = $bdg->prepare('SELECT COUNT(*) AS besoinorga FROM planete WHERE idjoueurplanete = ? AND efficacite < 110');

$reqaugmentationorganisation = $bdg->prepare('UPDATE planete SET organisation = organisation + ? WHERE idplanete = ?');
$reqaugmentationefficacite = $bdg->prepare('UPDATE planete SET efficacite = ? WHERE idplanete = ?');

$reqjoueur = $bdg->query('SELECT id FROM utilisateurs ORDER BY id ASC');
while ($repjoueur= $reqjoueur->fetch())
    { // Gestion des joueurs un par un.
    
    // Permet d'avoir l'organisation totale d'un joueur.
    $reqorganisationactuelle->execute(array($repjoueur['id']));
    $reporganisationactuelle = $reqorganisationactuelle->fetch();
    
    // Permet de connaitre combien de planete on besoin d'organisaton.
    $reqplanetebesoinorga->execute(array($repjoueur['id']));
    $repplanetebesoinorga = $reqplanetebesoinorga->fetch();
    
    // Formule calculant le gain d'orga. Plus le joueur a d'orga, moins il en gagne. Formule de type logarythique avec asymptote vers 0. (1 d'orga donne 1000 points, 1000 d'orga donne 950, 5000 donne 780, 50 000 donne 80 points.)
    $orgagenere = 1000 - ROUND(1000*(1-EXP((-$reporganisationactuelle['orga']/20000))));
    
    $gain = array();
    $gain[-1] = 0;
    $gain[0] = $orgagenere;
    for ($i = 1; $i < $repplanetebesoinorga['besoinorga']; $i++)
        { // fonction donnant la division du gain entre les planete possedees et ayant besoin d'orga de maniere aleatoire.
        $gain[$i] = rand(0, $orgagenere);
        }

    sort($gain);
    
    for ($i = 1; $i <= $repplanetebesoinorga['besoinorga']; $i++)
        { // fonction permettant de distribuer les gains entre les planetes.
        $ligne = $i-1;
        $reqidplanetebesoinorga = $bdg->query('SELECT idplanete, organisation FROM planete WHERE idjoueurplanete ='.$repjoueur['id'].' AND efficacite < 110 LIMIT '.$ligne.', 1');
        $repidplanetebesoinorga = $reqidplanetebesoinorga->fetch();
        $augmentation = $gain[$i] - $gain[$i-1];
        $organisation = $repidplanetebesoinorga['organisation'] + $augmentation;
        
        $reqaugmentationorganisation->execute(array($augmentation, $repidplanetebesoinorga['idplanete']));
        // echo $augmentation.' gain sur la planete '.$repidplanetebesoinorga['idplanete'].' ; vakeur de i : '.$i.'<br>';
        }
    
    // echo 'joueur '.$repjoueur['id'].' possede une orga de '.$reporganisationactuelle['orga'].' et son gain dorga est de '.$orgagenere.' et il y a '.$repplanetebesoinorga['besoinorga'].' planete ayant besoin dorga.<br>';
    }

// Gerer les planetes une par une pour calculer l'efficacite. Faire update efficacite sur les planete (= orga / (pop*10))
$reqgestionplanete = $bdg->query('SELECT    pl.idplanete, pl.organisation,
                                            COUNT(*) AS population
                                            FROM population AS p
                                            INNER JOIN planete AS pl ON p.idplanetepop = pl.idplanete
                                            GROUP BY p.idplanetepop');
while ($repgestionplanete = $reqgestionplanete->fetch())
    {
    $efficacite = ROUND($repgestionplanete['organisation'] / $repgestionplanete['population'] / 10);
    $reqaugmentationefficacite->execute(array($efficacite, $repgestionplanete['idplanete']));
    // echo 'La nouvelle efficacite de la planete '.$repgestionplanete['idplanete'].' est de '.$efficacite.'.<br>';
    }
?>