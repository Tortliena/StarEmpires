<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idvaisseau'] . '</br>' ;
*/

//Vérifier propriétaire du vaisseau.  
$reqvaisseau = $bdg->prepare('SELECT x, y, univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));
$repvaisseau = $reqvaisseau->fetch();

if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    {
    header('Location: ../accueil.php?message=31');
    exit();
    }

// Vérifier localisation du vaisseau
if  ( $repvaisseau['univers'] == $_SESSION['id'] AND
    // Cas du vaisseau proche de la planète :
    (($repvaisseau['x'] == 3 OR $repvaisseau['y'] == 3 )
    OR
    // Cas du vaisseau en orbite de la planète :
    ($repvaisseau['x'] == 0 OR $repvaisseau['y'] == 0)
    ))
    {    
    // Vérifier qu'il y a quelque chose dans le vaisseau.
    $reqverifcargo = $bdg->prepare(" SELECT quantiteitems FROM cargovaisseau WHERE idvaisseaucargo = ?") ;
    $reqverifcargo ->execute(array($_POST['idvaisseau']));
    $repverifcargo  = $reqverifcargo ->fetch();
    if (isset($repverifcargo['quantiteitems']))
        {
        $reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        // créer nouvel ordre.
        $req = $bdg->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], 3, 3, $_SESSION['id'], $_SESSION['id'], 2));
        }
    }

else
    {
    header('Location: ../accueil.php?message=31');
    exit();
    }
    
header("Location: ../hangars.php?id=" . urlencode($_POST['idvaisseau']));
?>