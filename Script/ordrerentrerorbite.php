<?php
session_start();
include("BDDconnection.php");

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdd->prepare('SELECT x, y, univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
        {
        header('Location: Accueil.php');
        exit();
        }

    else
        {
        // supprimer ordre précédent.
        $reqsupprimerordreprecedent = $bdd->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        // créer nouvel ordre.
        $req = $bdd->prepare('INSERT INTO ordredeplacement (idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], 0, 0, $_SESSION['id'], $_SESSION['id'], 3));
        }

header("Location: ../hangars.php?id={$_POST['idvaisseau']}");
?>