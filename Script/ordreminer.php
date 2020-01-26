<?php
session_start();
include("../include/BDDconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['univers'] . '</br>';
echo $_POST['xdepart'] . '</br>';
echo $_POST['ydepart'] . '</br>';
*/

//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdg->prepare('SELECT x, y, univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();

    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
        {
        header('Location: Accueil.php');
        exit();
        }

// Vérifier qu'il y a un champs d'asteroides près du vaisseau. 
    $reqasteroide = $bda->prepare('SELECT idasteroide FROM champsasteroides WHERE xaste = ? AND yaste = ? AND uniaste = ? LIMIT 1');
    $reqasteroide->execute(array($repvaisseau['x'] , $repvaisseau['y'], $repvaisseau['univers']));
    $repasteroide = $reqasteroide->fetch();

    if (isset($repasteroide['idasteroide']))
        {
        // supprimer ordre précédent.
        $reqsupprimerordreprecedent = $bdg->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        // créer nouvel ordre.
        $req = $bdg->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau, typeordre) VALUES(?, ?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], $_POST['xdepart'], $_POST['ydepart'], $_POST['univers'], $_SESSION['id'], 1));
        }

header("Location: ../hangars.php?id={$_POST['idvaisseau']}");
?>