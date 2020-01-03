<?php
session_start();
include("BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
// echo $_POST['perdreressources'] . '</br>' ;
echo $_POST['idvaisseau'] . '</br>' ;

//Vérifier propriétaire du vaisseau.  
$reqvaisseau = $bdd->prepare('SELECT idjoueurbat FROM vaisseau WHERE idvaisseau = ?');
$reqvaisseau->execute(array($_POST['idvaisseau']));
$repvaisseau = $reqvaisseau->fetch();
    
if ($repvaisseau['idjoueurbat'] != $_SESSION['id'])
    { header('Location: Accueil.php'); exit(); }

else
    {
    $reqsupprimerordreprecedent = $bdd->prepare('DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?');
    $reqsupprimerordreprecedent->execute(array($_POST['idvaisseau']));
    }

header("location: ../hangars.php?message=20&" . "id=" . urlencode($_POST['idvaisseau'])); 
    ?>