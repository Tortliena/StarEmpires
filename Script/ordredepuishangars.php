<?php
session_start();
include("BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['ordredepuishangars'] . '</br>';
echo $_POST['idvaisseau'] . '</br>';
*/

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdd->prepare('SELECT idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();
    
    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    { header('Location: Accueil.php'); exit(); }

// Création d'un ordre de déplacement.
    else
        {
        // supprimer ordre précédent.
        $reqsupprimerordreprecedent = $bdd->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        // créer nouvel ordre.
        $req = $bdd->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau ) VALUES(?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], 3, 3, $_SESSION['id'], $_SESSION['id']));
        }

header("Location: ../hangars.php?id={$_POST['idvaisseau']}");
?>