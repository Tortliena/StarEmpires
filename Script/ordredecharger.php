<?php
session_start();
include("BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idvaisseau'] . '</br>' ;

*/

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdd->prepare('SELECT x, y, univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
        {
        header('Location: Accueil.php');
        exit();
        }



// Vérifier localisation du vaisseau
    if ($repvaisseau['x'] != 3 OR $repvaisseau['y'] != 3 OR $repvaisseau['univers'] != $_SESSION['id'])
        {
        header('Location: Accueil.php');
        exit();
        }

// Vérifier qu'il y a quelque chose dans le vaisseau.
$reqverifcargo = $bdd->prepare(" SELECT quantiteitems FROM cargovaisseau WHERE idvaisseaucargo = ?") ;
$reqverifcargo ->execute(array($_POST['idvaisseau']));
$repverifcargo  = $reqverifcargo ->fetch();
if (isset($repverifcargo['quantiteitems']))
    {
    $reqsupprimerordreprecedent = $bdd->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
    $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
    
    // créer nouvel ordre.
    $req = $bdd->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
    $req->execute(array($_POST['idvaisseau'], 3, 3, $_SESSION['id'], $_SESSION['id'], 2));
    }

header("Location: ../hangars.php?id={$_POST['idvaisseau']}");
?>