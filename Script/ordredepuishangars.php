<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['ordredepuishangars'] . '</br>';
echo $_POST['idvaisseau'] . '</br>';
*/

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdg->prepare('SELECT idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();
    
    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    { header('Location: ../accueil.php?message=31'); exit(); }

// Création d'un ordre de déplacement.
    else
        {
        // supprimer ordre précédent.
        $reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        // créer nouvel ordre.
        $req = $bdg->prepare('INSERT INTO ordredeplacement (idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], 3, 3, $_SESSION['id'], $_SESSION['id'], 4));
        }

header("Location: ../hangars.php?id={$_POST['idvaisseau']}");
?>