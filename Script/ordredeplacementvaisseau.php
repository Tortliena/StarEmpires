<?php
session_start();
include("BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['xobjectif'] . '</br>';
echo $_POST['yobjectif'] . '</br>';
echo $_POST['idvaisseau'] . '</br>';
echo $_POST['univers'] . '</br>';
echo $_POST['xdepart'] . '</br>';
echo $_POST['ydepart'] . '</br>';


//Vérifier propriétaire du vaisseau.  
    $reqvaisseau = $bdd->prepare('SELECT univers, idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
    $reqvaisseau->execute(array($_POST['idvaisseau']));
    $repvaisseau = $reqvaisseau->fetch();
    
    if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    { header('Location: Accueil.php'); exit(); }

//Vérifier que les coordonnées sont différentes. 
    if ($_POST['xdepart'] == $_POST['xobjectif'] AND $_POST['ydepart'] == $_POST['yobjectif'])
        {
        header("location: ../hangars.php?message=19&" . "id=" . urlencode($_POST['idvaisseau'])); 
        exit();  
        }

// Création d'un ordre de déplacement.
    else
        {
        // supprimer ordre précédent.
        $reqsupprimerordreprecedent = $bdd->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
        $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
        
        // créer nouvel ordre.
        $req = $bdd->prepare('INSERT INTO ordredeplacement(idvaisseaudeplacement , xdestination , ydestination , universdestination, idjoueurduvaisseau) VALUES(?, ?, ?, ?, ?)');
        $req->execute(array($_POST['idvaisseau'], $_POST['xobjectif'], $_POST['yobjectif'], $repvaisseau['univers'], $_SESSION['id']));
        }

header("Location: ../hangars.php?id={$_POST['idvaisseau']}");
?>