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
    header('Location: ../conception.php?message=56');
    exit();
    }

// Créer design global.
$reqcreerdesign = $bdg->prepare('INSERT INTO vaisseau (idjoueurvaisseau, nomvaisseau, univers, x, y) VALUES (?, ?, ?, ?, ?)'); 
$reqcreerdesign->execute(array(-$_SESSION['id'], $_POST['nom'], 0, 0, 0));
$dernierID = $bdg->lastInsertId();

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

$reqdeplacementbloque = $bdg->prepare('INSERT INTO ordredeplacement (idvaisseaudeplacement, xdestination, ydestination, universdestination, idjoueurduvaisseau, typeordre, bloque) VALUES(?, ?, ?, ?, ?, ?, ?)');
// 9 = ordre spécial pour les design. bloque = 2 = impossible de supprimer/modifier.
$reqdeplacementbloque->execute(array($dernierID, -1, -1, -1, $_SESSION['id'], 9, 2));

include("../function/caracteristiquesvaisseau.php");
caracteristiquesvaisesau ($dernierID, $_SESSION['id']);
>>>>>>> master

header('Location: ../conception.php?message=55');
?>