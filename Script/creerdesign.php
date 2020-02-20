<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['id'] . ' id du joueur </br>';
echo $_POST['nom'] . ' nom du design </br>';
echo $_POST['arme'] . ' id du composant arme </br>';
echo $_POST['soute'] . ' id du composant soute </br>';
echo $_POST['coque'] . ' id du composant coque </br>';
echo $_POST['moteur'] . ' id du composant moteur </br>';
*/

if (is_numeric($_POST['nom']) OR empty($_POST['nom']))
    {
    header('Location: ../design.php?message=56');
    exit();    
    }

// Créer design global.
$reqcreerdesign = $bdg->prepare('INSERT INTO vaisseau (idjoueurbat, nomvaisseau, univers, x, y, typevaisseau) VALUES (?, ?, ?, ?, ?, ?)'); 
$reqcreerdesign->execute(array($_SESSION['id'], $_POST['nom'], -1, -1, -1, 1));
// -ID pour que je puisse garder une trace des joueurs qui tentent de créer un design et que cela bug sans que eux puissent le voir.
// Type vaisseau = 5 = vrai vaisseau, type vaisseau = 1 = designvaisseau.

$dernierID = $bdg->lastInsertId() ;

$reqcreercomposantdesign = $bdg->prepare('INSERT INTO composantvaisseau (idvaisseaucompo, iditemcomposant, typecomposant) VALUES (?, ?, ?)');  

// Permet d'introduire les composants dans le plan du vaisseau fictif.
$reqcomposant = $bdd ->prepare('SELECT i.souscategorie, i.typeitem
                                FROM datawebsite.composant c
                                INNER JOIN datawebsite.items i ON c.idcomposant = i.iditem
                                WHERE c.idcomposant = ?');
foreach($_POST as $value)
    {
    if ($value > 0)
        {
        $reqcomposant->execute(array($value));
        $repcomposant = $reqcomposant->fetch();
        if ($repcomposant['typeitem'] != 'composant')
            {
            header('Location: ../accueil.php?message=31');
            exit();
            }
        $reqcreercomposantdesign->execute(array($dernierID, $value, $repcomposant['souscategorie']));
        }
    }

$requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET idjoueurbat = ? WHERE idvaisseau = ?'); 
// Updater le design du vaisseau avec les prix et l'ID du joueur.
$requpdatedesignvaisseau->execute(array($_SESSION['id'], $dernierID));

$reqdeplacementbloque = $bdg->prepare('INSERT INTO ordredeplacement (idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre, bloque) VALUES(?, ?, ?, ?, ?, ?, ?)');
// 9 = ordre spécial pour les design. bloque = 2 = impossible de supprimer/modifier.
$reqdeplacementbloque->execute(array($dernierID, -1, -1, -1, $_SESSION['id'], 9, 2));

include("../tour/fonctionsdutour.php");
caracteristiquesvaisesau ($dernierID, $_SESSION['id']);

header('Location: ../design.php?message=55');
?>