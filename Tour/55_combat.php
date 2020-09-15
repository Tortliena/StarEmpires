<?php
/*
session_start();
require __DIR__ . '/../include/bddconnection.php';
require __DIR__ . '/../tour/01_fonctionsdutour.php';
*/

// Toutes les batailles sont actives :
$reqactivertouteslesbatailles = $bd->query('UPDATE c_bataille SET active = 1');

// Recharge des armes :
$reqrechargearmes = $bd->prepare('UPDATE c_composantvaisseau SET tirrestant = ? WHERE iditemcomposant = ?');
$reqcomposantinfo = $bd->prepare('SELECT nbtir, idcomposant FROM a_composant');
$reqcomposantinfo->execute(); 
while ($repcomposantinfo = $reqcomposantinfo->fetch())
    {
    $reqrechargearmes ->execute(array($repcomposantinfo['nbtir'], $repcomposantinfo['idcomposant'])); 
    }

// récupération des batailles en cours :
$reqbatailleencours = $bd->prepare('SELECT idbataille, idflotteoffensive, idflottedefensive FROM c_bataille WHERE active = 1 ORDER BY RAND()');

// Sélectionner une arme avec un tir.
$reqinfopvvaisseau = $bd->prepare("     SELECT cv.idtable, c.degatpartir, cv.tirrestant, v.idvaisseau, v.HPvaisseau, v.idflottevaisseau
                                        FROM c_vaisseau v
                                        LEFT JOIN c_composantvaisseau cv ON v.idvaisseau = cv.idvaisseaucompo
                                        LEFT JOIN a_composant c ON cv.iditemcomposant = c.idcomposant
                                        WHERE v.idflottevaisseau = ? ORDER BY cv.tirrestant DESC, c.degatpartir, RAND() DESC LIMIT 1");

$reqdesactiverbataille = $bd->prepare('UPDATE c_bataille SET active = 0 WHERE idbataille = ?');

for($a = 1 ; $a != 0 ; )
    {
    $a = 0; // Si on arrive pas à trouver une bataille, alors on arrête.
    $reqbatailleencours->execute(); // Sélectionne une bataille au hasard.
    $repbatailleencours = $reqbatailleencours->fetch();
    if (isset($repbatailleencours[0]))
        {
        $Commentairestour .= 'Bataille avec l\'ID '.$repbatailleencours['idbataille'].'. Attaquant : '.$repbatailleencours['idflotteoffensive'].'. Défenseur : '.$repbatailleencours['idflottedefensive'].'.</br>';
        $a++;
        $reparmeoffensive['degatpartir'] = 0 ;
        $reparmedefensive['degatpartir'] = 0 ;

        // On récupère les infos sur le défenseur (dont ses PV et en priorité le vaisseau avec des armes chargées puis l'arme la plus puissante)
        $reqinfopvvaisseau->execute(array($repbatailleencours['idflottedefensive']));
        $repinfopvvaisseaudefensif = $reqinfopvvaisseau->fetch();

        // On récupère les infos sur l'attaquant (dont ses PV et en priorité le vaisseau avec des armes chargées puis l'arme la plus puissante)
        $reqinfopvvaisseau->execute(array($repbatailleencours['idflotteoffensive']));
        $repinfopvvaisseauattaquant = $reqinfopvvaisseau->fetch();

        // $Commentairestour .= 'Est ce quon a une reponse du vaisseau defenseur ? '.$repinfopvvaisseaudefensif['tirrestant']; 
        // Si les deux dernières requetes ne donnent aucune réponse : 
        if  (   !isset($repinfopvvaisseaudefensif['idvaisseau']) OR !isset($repinfopvvaisseauattaquant['idvaisseau'])
                OR ($repinfopvvaisseaudefensif['tirrestant'] < 1 AND $repinfopvvaisseauattaquant['tirrestant'] < 1) )
            { // On désactive la bataille.
            $Commentairestour .= 'Désactivation de la bataille avec l\'ID '.$repbatailleencours['idbataille'] ; 
            $reqdesactiverbataille->execute(array($repbatailleencours['idbataille']));
            }
        else
            {
            if ($repinfopvvaisseauattaquant['tirrestant'] > 0)
                { // Si on a une arme de l'attaquant, on gère le tir sur le défenseur.
                $Commentairestour .= gestiondegats($repinfopvvaisseaudefensif['idvaisseau'], $repinfopvvaisseaudefensif['HPvaisseau'], $repinfopvvaisseauattaquant['degatpartir'], $repinfopvvaisseauattaquant['idtable'], $repinfopvvaisseauattaquant['idvaisseau'], $repinfopvvaisseauattaquant['idflottevaisseau'], $repinfopvvaisseaudefensif['idflottevaisseau'], 1);
                }
    
            if ($repinfopvvaisseaudefensif['tirrestant'] > 0)
                { // Si on a une arme du défenseur, on gère le tir sur l'attaquant.
                $Commentairestour .= gestiondegats($repinfopvvaisseauattaquant['idvaisseau'], $repinfopvvaisseauattaquant['HPvaisseau'], $repinfopvvaisseaudefensif['degatpartir'], $repinfopvvaisseaudefensif['idtable'], $repinfopvvaisseaudefensif['idvaisseau'], $repinfopvvaisseauattaquant['idflottevaisseau'], $repinfopvvaisseaudefensif['idflottevaisseau'], 2);
                }
            }
        }
    }
?>