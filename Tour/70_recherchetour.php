<?php
/*
session_start();
include("../include/bddconnection.php");
include("../function/consommercreeritemsplanetemultiple.php");
include("fonctionsdutour.php");
*/

$avancement = $bd->prepare(" UPDATE c_rech_joueur
                              SET avrech =  avrech + ? , rechposs = ?
                              WHERE idrechprinc = ? AND rechposs = 0 LIMIT 1");

$reqdeleterecherche = $bd->prepare("DELETE FROM c_rech_joueur WHERE idrechprinc = ? LIMIT 1");

$message = $bd->prepare("  INSERT INTO c_messagetour (idjoumess , message , domainemess)
                            VALUES (?, ?, ?)");

$reqtrouverplaneteavecitem = $bd->prepare(" SELECT s.idplanetesilo, i.itemnecessaire FROM c_silo s
                                            INNER JOIN c_planete p ON p.idplanete = s.idplanetesilo
                                            INNER JOIN a_items i ON s.iditems = i.iditem
                                            WHERE s.iditems = ? AND p.idjoueurplanete = ? LIMIT 1");

$reqarbretechno = $bd->prepare('SELECT idrecherche FROM a_recherche WHERE recherchenecessaire = ? AND niveauminimal <= ?'); 

if ($tourrestraint == 'non')
    {
    $reqrecherchejoueur = $bd->query('SELECT u.id, u.recherche, u.lvl, rj.avrech, rj.rechnesc, rj.idrech, rj.idrechprinc, r.itemnecessaire, r.niveauminimal
    FROM (SELECT min(ordrerecherche) AS min, avrech, rechnesc, idrech FROM c_rech_joueur WHERE rechposs = 0 GROUP BY idjoueurrecherche) AS x
    INNER JOIN c_rech_joueur as rj ON rj.idjoueurrecherche = idjoueurrecherche AND rj.ordrerecherche = x.min
    INNER JOIN c_utilisateurs u ON u.id = rj.idjoueurrecherche
    INNER JOIN a_recherche r ON rj.idrech = r.idrecherche ');  // O putain c'est quoi cette requete de dingue !?
    }
else
    {
    $reqrecherchejoueur = $bd->prepare('SELECT u.id, u.recherche, u.lvl, rj.avrech, rj.rechnesc, rj.idrech, rj.idrechprinc, r.itemnecessaire, r.niveauminimal
    FROM (SELECT min(ordrerecherche) AS min, avrech, rechnesc, idrech FROM c_rech_joueur WHERE rechposs = 0 GROUP BY idjoueurrecherche) AS x
    INNER JOIN c_rech_joueur as rj ON rj.idjoueurrecherche = idjoueurrecherche AND rj.ordrerecherche = x.min
    INNER JOIN c_utilisateurs u ON u.id = rj.idjoueurrecherche
    INNER JOIN a_recherche r ON rj.idrech = r.idrecherche
    WHERE u.id = ? ');  // O putain c'est quoi cette requete de dingue !?
    $reqrecherchejoueur->execute(array($_SESSION['id']));
    }
while ($reprecherchejoueur = $reqrecherchejoueur->fetch())
    {
    // echo '<br>Id du joueur : '.$reprecherchejoueur['id'].'. Id de la recherche : '.$reprecherchejoueur['idrech'];
    if ($reprecherchejoueur['recherche'] + $reprecherchejoueur['avrech'] < $reprecherchejoueur['rechnesc'])
        {
        $avancement->execute(array($reprecherchejoueur['recherche'], 0, $reprecherchejoueur['idrechprinc']));
        } 
       
    // Si assez de recherche, alors avancer la rechercher + la marquée comme possédée. 
    else
        {
        $message->execute(array($reprecherchejoueur['id'], 'Vous venez de finir une recherche', 'recherche'));          
        if ($reprecherchejoueur['itemnecessaire'] == 0)
          { // Cas d'une recherche ne nécessitant rien (recherche classique)
          $avancement->execute(array($reprecherchejoueur['recherche'], 1, $reprecherchejoueur['idrechprinc']));
          }
        else
          { // Cas d'une recherche consommant un débris alien et donnant un composant.
          $reqdeleterecherche->execute(array($reprecherchejoueur['idrechprinc']));
          $reqtrouverplaneteavecitem->execute(array($reprecherchejoueur['itemnecessaire'], $reprecherchejoueur['id']));
          $reptrouverplaneteavecitem = $reqtrouverplaneteavecitem->fetch();
          consommercreeritemsplanetemultiple($reprecherchejoueur['itemnecessaire'], $reptrouverplaneteavecitem['itemnecessaire'], $reptrouverplaneteavecitem['idplanetesilo'], 1);
          }

        // Si la recherche donne accès à une autre recherche, alors on va créer une nouvelle recherche.
        $reqarbretechno->execute(array($reprecherchejoueur['idrech'], $reprecherchejoueur['lvl']));
        while ($reparbretechno = $reqarbretechno->fetch())
          {
          creerrecherche($reparbretechno['idrecherche'], $reprecherchejoueur['id']);
          }
        }
    }

// Permet de créer une recherche lorsqu'on a un artefact en stock.
$reqinfoartefact = $bd->query(" SELECT i.technescessaire, p.idjoueurplanete FROM c_silo AS s
                                INNER JOIN a_items AS i ON s.iditems = i.iditem
                                INNER JOIN c_planete p ON p.idplanete = s.idplanetesilo
                                WHERE i.typeitem = 'artefact'");
$reqinfoartefact->execute(array());
while ($repinfoartefact = $reqinfoartefact->fetch())
    {
    creerrecherche($repinfoartefact['technescessaire'], $repinfoartefact['idjoueurplanete']); 
    }
?>