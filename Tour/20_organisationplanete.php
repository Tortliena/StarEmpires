<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$Commentairestour .= '<br>Début de la gestion des planètes.<br>';

$reqorganisationactuelle = $bd->prepare('SELECT SUM(organisation) AS orga FROM c_planete WHERE idjoueurplanete = ? ');

$reqplanetebesoinorga = $bd->prepare('SELECT COUNT(*) AS besoinorga FROM c_planete WHERE idjoueurplanete = ? AND efficacite < 110');

$reqaugmentationorganisation = $bd->prepare('UPDATE c_planete SET organisation = organisation + ? WHERE idplanete = ?');
$reqaugmentationefficacite = $bd->prepare('UPDATE c_planete SET efficacite = ? WHERE idplanete = ?');

if ($tourrestraint == 'non')
    {
    $reqjoueur = $bd->query('SELECT id FROM c_utilisateurs ORDER BY id ASC');
    }
else
    {
    $reqjoueur = $bd->prepare('SELECT id FROM c_utilisateurs WHERE id = ?');
    $reqjoueur->execute(array($_SESSION['id']));
    }
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
    $augmentation = array();
    $gain[-1] = 0;
    $gain[0] = $orgagenere;
    for ($i = 1; $i < $repplanetebesoinorga['besoinorga']; $i++)
        { // fonction donnant la division du gain entre les planete possedees et ayant besoin d'orga de maniere aleatoire.
        $gain[$i] = rand(0, $orgagenere);
        }

    sort($gain); // On a gain0 = 0, des valeurs intermediaires et gainX = au total de lorganisation a gagner par le joueur.
    
    for ($i = 0; $i < $repplanetebesoinorga['besoinorga']; $i++)
        {
        $reqidplanetebesoinorga = $bd->query('SELECT idplanete FROM c_planete WHERE idjoueurplanete ='.$repjoueur['id'].' AND efficacite < 110 ORDER BY organisation ASC LIMIT '.$i.', 1'); // Je ne peux pas faire de preparation car j'ai une limite avec une variable ?!
        $repidplanetebesoinorga = $reqidplanetebesoinorga->fetch();
        
        $idplanete[$i] = $repidplanetebesoinorga['idplanete'];
        $augmentation[$i] = $gain[$i+1] - $gain[$i];
        }

    sort($augmentation); // Permet de faire gagner plus d'organisation sur les planetes biens organisees.
    
    for ($i = 0; $i < $repplanetebesoinorga['besoinorga']; $i++)
        { // fonction permettant de distribuer les gains entre les planetes.
        $reqorganisationplanete = $bd->query('SELECT organisation FROM c_planete WHERE idplanete ='.$idplanete[$i].'');
        $reporganisationplanete  = $reqorganisationplanete ->fetch();
        
        $organisation = $reporganisationplanete['organisation'] + $augmentation[$i];
        $reqaugmentationorganisation->execute(array($augmentation[$i], $idplanete[$i]));

        }
    
    $Commentairestour .= 'joueur '.$repjoueur['id'].' possede une orga de '.$reporganisationactuelle['orga'].' et son gain dorga est de '.$orgagenere.' et il y a '.$repplanetebesoinorga['besoinorga'].' planete ayant besoin dorga.<br>';
    }
    
// Gerer les planetes une par une pour calculer l'efficacite. Faire update efficacite sur les planete (= orga / (pop*10))
if ($tourrestraint == 'non')
    {
    $reqgestionplanete = $bd->query('   SELECT pl.idplanete, pl.organisation, COUNT(*) AS population
                                        FROM c_population AS p
                                        INNER JOIN c_planete AS pl ON p.idplanetepop = pl.idplanete
                                        GROUP BY p.idplanetepop');
    }
else
    {
    $reqgestionplanete = $bd->query('   SELECT pl.idplanete, pl.organisation, COUNT(*) AS population
                                        FROM c_population AS p
                                        INNER JOIN c_planete AS pl ON p.idplanetepop = pl.idplanete
                                        WHERE p.idplanetepop IN ('.$idplanetes.')
                                        GROUP BY p.idplanetepop ');
    }
while ($repgestionplanete = $reqgestionplanete->fetch())
    {
    $efficacite = ROUND($repgestionplanete['organisation'] / $repgestionplanete['population'] / 10);
    $reqaugmentationefficacite->execute(array($efficacite, $repgestionplanete['idplanete']));
    $Commentairestour .= 'La nouvelle efficacite de la planete '.$repgestionplanete['idplanete'].' est de '.$efficacite.'.<br>';
    }
?>